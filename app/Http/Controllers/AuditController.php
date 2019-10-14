<?php

namespace App\Http\Controllers;

use App\Audit;
use Carbon\Carbon;
use Illuminate\Http\Request;

class AuditController extends Controller
{
    static function store($entity, $action)
    {

            $audit = new Audit();
            $audit->entity = $entity;
            $audit->action = $action;
            $audit->date = Carbon::now()->format('Y-m-d h:m:s');
            $audit->save();
            if ($audit)
                return true;
            else
                return false;
    }

    public function index()
    {
        return Audit::orderBy('date', 'desc')
            ->take(10)
            ->get();
    }
}
