<?php

namespace App\Http\Controllers\Admin;

use App\Audit;
use App\User;
use LaravelDaily\LaravelCharts\Classes\LaravelChart;

class HomeController
{
    public function index()
    {
        $number_blocks = [
            [
                'title' => 'Usuarios Logeados Hoy',
                'number' => User::whereDate('last_login_at', today())->count()
            ],
            [
                'title' => 'Usuarios Logeados los Ultimos 7 Dias',
                'number' => User::whereDate('last_login_at', '>', today()->subDays(7))->count()
            ],
            [
                'title' => 'Usuarios Logeados los ultimos 30 Dias',
                'number' => User::whereDate('last_login_at', '>', today()->subDays(30))->count()
            ],
        ];

        $list_blocks = [
            [
                'title' => 'Ultimos Usuarios Logeados',
                'entries' => User::orderBy('last_login_at', 'desc')
                    ->take(5)
                    ->get(),
            ],
            [
                'title' => 'Usuarios con mas de 30 dias sin Entrar al sistema',
                'entries' => User::where('last_login_at', '<', today()->subDays(30))
                    ->orwhere('last_login_at', null)
                    ->orderBy('last_login_at', 'desc')
                    ->take(5)
                    ->get()
            ],
        ];

        $list_audit = [
            [
                'title' => 'Actividad del Administrador',
                'entries' => Audit::orderBy('date', 'desc')
                    ->take(10)
                    ->get(),
            ],
        ];

        $chart_settings = [
            'chart_title'        => 'Usuarios por mes',
            'chart_type'         => 'line',
            'report_type'        => 'group_by_date',
            'model'              => 'App\\User',
            'group_by_field'     => 'last_login_at',
            'group_by_period'    => 'month',
            'aggregate_function' => 'count',
            'filter_field'       => 'last_login_at',
            'column_class'       => 'col-md-12',
            'entries_number'     => '5',
        ];
        $chart = new LaravelChart($chart_settings);

        return view('home', compact('number_blocks', 'list_blocks', 'chart', 'list_audit'));
    }
}
