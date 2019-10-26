<?php

namespace App\Http\Controllers;

use App\Bitacora;
use Illuminate\Http\Request;

class BitacoraController extends Controller
{
    public function index()
    {
        $data = Bitacora::all();
        return view("taller.bitacora.index", compact("data"));
    }
}
