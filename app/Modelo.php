<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Modelo extends Model
{
    protected $table = "modelo";
    protected $primaryKey = "id";
    public $timestamps = false;
}
