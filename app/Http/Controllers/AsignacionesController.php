<?php

namespace App\Http\Controllers;

use App\Asignaciones;
use App\Componente;
use App\Repuestos;
use App\Role;
use App\Unidades;
use App\User;
use Carbon\Carbon;
use http\Exception;
use Illuminate\Http\Request;
use DB;
class AsignacionesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Exception|\Exception
     */
    public function index()
    {
        try {
            $averiados = Unidades::where("id_estado",1)->count();
            $espera = Unidades::where("id_estado",2)->count();
            $reparacion = Unidades::where("id_estado",3)->count();
            $disponibles = Unidades::where("id_estado",4)->count();
            $number_blocks = [
                [
                    'title' => 'Averiados',
                    'number' => $averiados
                ],
                [
                    'title' => 'Espera',
                    'number' => $espera
                ],
                [
                    'title' => 'Reparacion',
                    'number' => $reparacion
                ],
                [
                    'title' => 'Disponibles',
                    'number' => $disponibles
                ]
            ];

            $data = DB::table('asignaciones')
                ->join('repuestos', 'asignaciones.id_repuesto', '=', 'repuestos.id')
                ->join('unidades', 'asignaciones.id_unidad', '=', 'unidades.id')
                ->join('componente', 'asignaciones.id_componente', '=', 'componente.id')
                ->join('usuarios', 'asignaciones.id_usuario', '=', 'usuarios.id')
                ->select(
                    'asignaciones.*',
                    'repuestos.repuesto',
                    'unidades.placa',
                    'componente.serial',
                    'usuarios.user'
                )
                ->get();

            return view('taller.asignaciones.index', compact('averiados','espera', 'reparacion','disponibles','data', 'number_blocks'));
        } catch (Exception $e) {
            return $e;
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $repuestos = Repuestos::all()->pluck('repuesto', 'id');
        $unidades = Unidades::all()->pluck("placa", "id");
        $componentes = Componente::all()->pluck("ci", "id");


        return view('taller.asignaciones.create', compact('repuestos','unidades','componentes'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $now = new \DateTime();
        $user = \Auth::user();
        $data = new Asignaciones;
        $data->id_repuesto = $request->input("repuesto");
        $data->id_unidad = $request->input("unidad");
        $data->id_componente = $request->input("componente");
        $data->id_usuario = $user->id;//$request->input("id_usuario");
        $data->cantidad = $request->input("cantidad");
        $data->fecha_asignacion = Carbon::now('America/Caracas')->format('Y-m-d h:m:s');//$now->format('H:i:s d-m-Y');//$request->input("id_unidad");
        if($data->save()){
        /*    $rep = Repuestos::find($request->input("repuesto"));
            $rep->cantidad = $rep->cantidad - $request->input("cantidad");
            $rep->save();*/
            return redirect()->route('asignaciones.index');
        }
        else {
            return redirect()->route('asignaciones.create');
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $repuestos = Repuestos::all()->pluck('repuesto', 'id');
        $unidades = Unidades::all()->pluck("placa", "id");
        $componentes = Componente::all()->pluck("ci", "id");
       // $usuarios = User::all()->pluck("id", "name");
        $asignacion = DB::table('asignaciones')
            ->join('repuestos', 'asignaciones.id_repuesto', '=', 'repuestos.id')
            ->join('unidades', 'asignaciones.id_unidad', '=', 'unidades.id')
            ->join('componente', 'asignaciones.id_componente', '=', 'componente.id')
            ->join('usuarios', 'asignaciones.id_usuario', '=', 'usuarios.id')
            ->select(
                'asignaciones.*',
                'repuestos.repuesto',
                'unidades.placa',
                'componente.serial',
                'usuarios.user'
            )
            ->where("asignaciones.id", $id)
            ->first();
        return view('taller.asignaciones.edit', compact('repuestos', 'unidades','componentes', 'asignacion'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $now = new \DateTime();
        $data = Asignaciones::find($id);
        $data->id_repuesto = $request->input("repuesto");
        $data->id_unidad = $request->input("unidad");
        $data->id_componente = $request->input("componente");
        $data->cantidad = $request->input("cantidad");
        $data->fecha_asignacion = $now->format('H:i:s d-m-Y');
        $data->save();
        //AuditController::store('Usuario', 'Actualizando con id: '.$id);

        return redirect()->route('asignaciones.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

    }
}
