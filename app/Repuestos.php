<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Repuestos extends Model
{
    protected $table = "repuestos";
    protected $primaryKey = "id";
    public $timestamps = false;
}
