<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Componente extends Model
{
    protected $table = "componente";
    protected $primaryKey = "id";
    public $timestamps = false;
}
