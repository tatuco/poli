@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.create') }} Tipos
                </div>
                <div class="panel-body">

                    <form action="{{ route("tipos.store") }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group {{ $errors->has('tipo') ? 'has-error' : '' }}">
                            <label for="tipo">Tipo*</label>
                            <input type="text" min="0" id="tipo" name="tipo" class="form-control" value="{{ old('tipo', isset($asignacion) ? $asignacion->tipo : '') }}">
                            @if($errors->has('tipo'))
                                <p class="help-block">
                                    {{ $errors->first('tipo') }}
                                </p>
                            @endif
                        </div>
                        <div>
                            <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>
@endsection
