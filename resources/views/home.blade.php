@extends('layouts.admin')
@section('content')
    <div class="content">
        <div class="row">
            @foreach ($number_blocks as $block)
            <div class="col-md-4 ">
                <div class="info-box">
                        <span class="info-box-icon bg-red"
                              style="display:flex; flex-direction: column; justify-content: center;">
                            <i class="fa fa-chart-line"></i>
                        </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ $block['title'] }}</span>
                        <span class="info-box-number">{{ $block['number'] }}</span>
                    </div>
                </div>
            </div>
            @endforeach
        </div>

        <div class="row">
            @foreach ($list_blocks as $block)
                <div class="col-md-6">
                    <h3>{{ $block['title'] }}</h3>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th>Ultimo Login</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($block['entries'] as $entry)
                            <tr>
                                <td>{{ $entry->name }}</td>
                                <td>{{ $entry->email }}</td>
                                <td>{{ $entry->last_login_at }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="3">{{ __('No entries found') }}</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            @endforeach
        </div>

        <div class="row">
            @foreach ($list_audit as $it)
                <div class="col-md-12">
                    <h3>{{ $it['title'] }}</h3>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Modulo</th>
                            <th>Accion</th>
                            <th>Fecha y Hora</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($it['entries'] as $entry)
                            <tr>
                                <td>{{ $entry->entity }}</td>
                                <td>{{ $entry->action }}</td>
                                <td>{{ $entry->date }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="3">{{ __('No entries found') }}</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            @endforeach
        </div>

        <div class="row">
            <div class="{{ $chart->options['column_class'] }}">
                <h3>{!! $chart->options['chart_title'] !!}</h3>
                {!! $chart->renderHtml() !!}
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    @parent
    <script src="{{ asset('assets/js/Chart.min.js') }}"></script>
    {!! $chart->renderJs() !!}
@endsection
