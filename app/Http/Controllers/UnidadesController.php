<?php

namespace App\Http\Controllers;

use App\Color;
use App\Estado;
use App\Http\Requests\MassDestroyPermissionRequest;
use App\Modelo;
use App\Repuestos;
use App\TipoUnidad;
use App\Unidades;
use Illuminate\Http\Request;
use DB;
class UnidadesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = DB::table('unidades')
            ->join('modelo', 'unidades.id_modelo', '=', 'modelo.id')
            ->join('estado', 'unidades.id_estado', '=', 'estado.id')
            ->join('color', 'unidades.id_color', '=', 'color.id')
            ->join('tipo_unidad', 'unidades.id_tipo', '=', 'tipo_unidad.id')
            ->select(
                'unidades.*',
                'modelo.modelo',
                'estado.estado',
                'color.color',
                'tipo_unidad.tipo'
            )
            ->get();
        return view("taller.unidades.index", compact("data"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $modelos = Modelo::all()->pluck('modelo', 'id');
        $estados = Estado::all()->pluck('estado', 'id');
        $colores = Color::all()->pluck('color', 'id');
        $tipos = TipoUnidad::all()->pluck('tipo', 'id');
        return view("taller.unidades.create", compact("modelos",'estados','colores','tipos'));

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = new Unidades;
        $data->placa = $request->input("placa");
        $data->id_modelo = $request->input("modelo");
        $data->id_estado = $request->input("estado");
        $data->id_color = $request->input("color");
        $data->id_tipo = $request->input("tipo");
        $data->save();
        return redirect()->route("unidades.index");

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
        $unidad = Unidades::find($id);
        $modelos = Modelo::all()->pluck('modelo', 'id');
        $estados = Estado::all()->pluck('estado', 'id');
        $colores = Color::all()->pluck('color', 'id');
        $tipos = TipoUnidad::all()->pluck('tipo', 'id');
        return view("taller.unidades.edit", compact("modelos",'estados','colores','tipos','unidad'));
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
        $data = Unidades::find($id);
        $data->placa = $request->input("placa");
        $data->id_modelo = $request->input("id_modelo");
        $data->id_estado = $request->input("id_estado");
        $data->id_color = $request->input("id_color");
        $data->id_tipo = $request->input("id_tipo");
        $data->update();

        return redirect()->route("unidades.index");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Unidades::find($id);
        $data->delete();
        return redirect()->route("unidades.index");

    }
}
