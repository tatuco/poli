<?php

namespace App\Http\Middleware;

use App\Bitacora;
use Carbon\Carbon;
use Closure;
use http\Client\Curl\User;
use Illuminate\Support\Facades\Log;
use function Psy\debug;

class Audit
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $endpoint = $request->path();
        $method = $request->getMethod();

        $entity = $this->getEntity($endpoint);
        Log::info($endpoint.' '.$method.' '.$entity);

        switch ($entity) {
            case 'login':
              if ($method == 'POST') {
                  $user = \App\User::where('email', $request->email)->first();
                  $bitacora = new Bitacora();
                  $bitacora->user = $user->name;
                  $bitacora->email = $user->email;
                  $bitacora->entity = "login";
                  $bitacora->action = "Inicio de Sesion.";
                  $bitacora->date = Carbon::now('America/Caracas')->format('Y-m-d h:m:s');
                  $bitacora->save();
                  return $next($request);
                  break;
              }
            case 'logout':
                if ($method == 'POST') {
                    $user = \Auth::user();
                    $bitacora = new Bitacora();
                    $bitacora->user = $user->name;
                    $bitacora->email = $user->email;
                    $bitacora->entity = "logout";
                    $bitacora->action = "Saliendo del sistema.";
                    $bitacora->date = Carbon::now('America/Caracas')->format('Y-m-d h:m:s');
                    $bitacora->save();
                    return $next($request);
                    break;
                }
             default:
                 if ($endpoint != 'login' && $endpoint != 'logout' && $endpoint != "/")
                 {
                     $user = \Auth::user();

                     $bitacora = new Bitacora();
                     $bitacora->user = $user->name;
                     $bitacora->email = $user->email;
                     $bitacora->entity = $this->getEntity($endpoint);
                     $bitacora->action = $this->getAction($method);
                     $bitacora->date = Carbon::now('America/Caracas')->format('Y-m-d h:m:s');
                     $bitacora->save();
                     return $next($request);

                 }
                 break;

        }




        return $next($request);
    }

    public function getEntity($endpoint)
    {
        $porciones = explode("/", $endpoint);
        return $porciones[0];
    }

    public function getAction($method)
    {
        switch ($method)
        {
            case 'POST':
                return 'creando';
                break;
            case 'GET':
                return 'listando';
                break;
            case 'PUT':
                return 'editando';
                break;
            case 'DELETE':
                return 'eliminando';
                break;
            default:
                return 'listando';
                break;
        }
    }
}
