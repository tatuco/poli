<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Audit extends Model
{
    protected $table = 'audit_admin';
    protected $fillable = [
        'entity',
        'action',
        'date'
    ];
}
