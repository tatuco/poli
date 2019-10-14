@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.edit') }} Asignacion
                </div>
                <div class="panel-body">

                    <form action="{{ route("asignaciones.update", [$asignacion->id]) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                            <label for="cantidad">Cantidad*</label>
                            <input type="number" min="0" id="cantidad" name="cantidad" class="form-control" value="{{ old('cantidad', isset($asignacion) ? $asignacion->cantidad : 0) }}">
                            @if($errors->has('cantidad'))
                                <p class="help-block">
                                    {{ $errors->first('cantidad') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.name_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('componentes') ? 'has-error' : '' }}">
                            <label for="roles">Componente*</label>
                            <select name="componente" id="componente" class="form-control select2">
                                @foreach($componentes as $id => $it)
                                    <option value="{{ $id }}" {{ (in_array($id, old('componentes', [])) || isset($asignacion) && $asignacion->id_componente == $id) ? 'selected' : '' }}>
                                        {{ $it }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('componentes'))
                                <p class="help-block">
                                    {{ $errors->first('componentes') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.roles_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('unidades') ? 'has-error' : '' }}">
                            <label for="roles">Unidades*</label>
                            <select name="unidad" id="unidad" class="form-control select2">
                                @foreach($unidades as $id => $it)
                                    <option value="{{ $id }}" {{ (in_array($id, old('unidades', [])) || isset($asignacion) && $asignacion->id_unidad == $id) ? 'selected' : '' }}>
                                        {{ $it }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('unidades'))
                                <p class="help-block">
                                    {{ $errors->first('unidades') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.roles_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('repuestos') ? 'has-error' : '' }}">
                            <label for="roles">Repuestos*</label>
                            <select name="repuesto" id="repuesto" class="form-control select2">
                                @foreach($repuestos as $id => $it)
                                    <option value="{{ $id }}" {{ (in_array($id, old('repuestos', [])) || isset($asignacion) && $asignacion->id_repuesto == $id) ? 'selected' : '' }}>
                                        {{ $it }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('repuestos'))
                                <p class="help-block">
                                    {{ $errors->first('repuestos') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.roles_helper') }}
                            </p>
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
