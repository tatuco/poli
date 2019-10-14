<?php

namespace App\Http\Controllers;

use App\TipoUnidad;
use Illuminate\Http\Request;

class TipoUnidadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = TipoUnidad::all();
        return view("taller.tipos.index", compact("data"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("taller.tipos.create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = new TipoUnidad;
        $data->tipo = $request->input("tipo");
        $data->activo = 1;
        $data->save();
        return redirect()->route("tipos.index");
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
        $tipo = TipoUnidad::find($id);
        return view("taller.tipos.edit", compact("tipo"));
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
        $data = TipoUnidad::find($id);
        $data->tipo = $request->input("tipo");
        $data->save();
        return redirect()->route("tipos.index");

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = TipoUnidad::find($id);
        $data->delete();
        return redirect()->route("tipos.index");

    }
}
