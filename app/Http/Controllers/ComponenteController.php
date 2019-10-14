<?php

namespace App\Http\Controllers;

use App\Componente;
use App\Mando;
use Illuminate\Http\Request;
use DB;
class ComponenteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = DB::table('componente')
            ->join('mando', 'componente.id_mando', '=', 'mando.id')
            ->select('componente.*',
                'mando.mando')
            ->where("mando.activo","1")
            ->get();

        return view('taller.componentes.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $mandos = Mando::where('activo', 1)->get();
        return view('taller.componentes.create', compact('mandos'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = new Componente;
        $data->nombres = $request->input("nombres");
        $data->apellidos = $request->input("apellidos");
        $data->ci = $request->input("ci");
        $data->serial = $request->input("serial");
        $data->id_mando = $request->input("mando");
        $data->save();
        return redirect()->route('componentes.index');
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
        $componente = Componente::find($id);
        $mandos = Mando::where('activo', 1)->get();

        return view('taller.componentes.edit', compact('componente','mandos'));
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
        $data = Componente::find($id);
        $data->nombres = $request->input("nombres");
        $data->apellidos = $request->input("apellidos");
        $data->ci = $request->input("ci");
        $data->serial = $request->input("serial");
        $data->id_mando = $request->input("mando");
        $data->save();
        return redirect()->route('componentes.index');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Componente::find($id);
        $data->delete();
        return redirect()->route('componentes.index');
    }
}
