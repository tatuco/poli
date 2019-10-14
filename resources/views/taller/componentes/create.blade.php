@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.create') }} Componente
                </div>
                <div class="panel-body">

                    <form action="{{ route("componentes.store") }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group {{ $errors->has('nombres') ? 'has-error' : '' }}">
                            <label for="nombres">Nombres*</label>
                            <input type="text" id="nombres" name="nombres" class="form-control" value="{{ old('nombres', isset($component) ? $component->nombres : '') }}">
                            @if($errors->has('nombres'))
                                <p class="help-block">
                                    {{ $errors->first('nombres') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('apellidos') ? 'has-error' : '' }}">
                            <label for="apellidos">Apellidos*</label>
                            <input type="text" id="apellidos" name="apellidos" class="form-control" value="{{ old('apellidos', isset($component) ? $component->apellidos : '') }}">
                            @if($errors->has('apellidos'))
                                <p class="help-block">
                                    {{ $errors->first('apellidos') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('ci') ? 'has-error' : '' }}">
                            <label for="ci">CI*</label>
                            <input type="number" min="4" id="ci" name="ci" class="form-control" value="{{ old('ci', isset($component) ? $component->ci : '') }}">
                            @if($errors->has('ci'))
                                <p class="help-block">
                                    {{ $errors->first('ci') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('serial') ? 'has-error' : '' }}">
                            <label for="serial">Serial*</label>
                            <input type="text" id="serial" name="serial" class="form-control" value="{{ old('serial', isset($component) ? $component->serial : '') }}">
                            @if($errors->has('serial'))
                                <p class="help-block">
                                    {{ $errors->first('serial') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('mandos') ? 'has-error' : '' }}">
                            <label for="mandos">Mandos*</label>
                            <select name="mando" id="mando" class="form-control select2">
                                @foreach($mandos as $it)
                                    <option value="{{ $it->id }}" >
                                        {{ $it->mando }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('mandos'))
                                <p class="help-block">
                                    {{ $errors->first('mandos') }}
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
