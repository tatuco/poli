<?php

namespace App\Http\Controllers;

use App\Modelo;
use App\Repuestos;
use App\TipoUnidad;
use Illuminate\Http\Request;

class RepuestosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Repuestos::all();
        $repuestos_unidad = Repuestos::selectRaw('tipo_unidad, COUNT(tipo_unidad) AS count_unidad')
                                ->groupBy( 'tipo_unidad')
                                ->get();
        $repuestos_modelo = Repuestos::selectRaw('modelo, COUNT(modelo) AS count_modelo')
            ->groupBy('modelo')
            ->get();


        return view("taller.repuestos.index", compact("data", "repuestos_modelo", "repuestos_unidad"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tipos_unidad = TipoUnidad::all()->pluck('tipo', 'id');
        $modelos = Modelo::all()->pluck('modelo', 'id');
        return view("taller.repuestos.create", compact("tipos_unidad", "modelos"));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = new Repuestos;
        $data->repuesto = $request->input("repuesto");
        $data->cantidad = $request->input("cantidad");
        $data->descripcion = $request->input("descripcion");
        $data->tipo_unidad = $request->input("tipo_unidad");
        $data->modelo = $request->input("modelo");
        $data->save();
        return redirect()->route("repuestos.index");
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
        $repuesto = Repuestos::find($id);
        $tipos_unidad = TipoUnidad::all();
        $modelos = Modelo::all()->pluck('modelo', 'id');
        return view("taller.repuestos.edit", compact("tipos_unidad", "modelos", "repuesto"));
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
        $data = Repuestos::find($id);
        $data->repuesto = $request->input("repuesto");
        $data->cantidad = $request->input("cantidad");
        $data->descripcion = $request->input("descripcion");
        $data->tipo_unidad = $request->input("unidad");
        $data->save();
        return redirect()->route("repuestos.index");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
