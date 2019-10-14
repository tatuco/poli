@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.edit') }} Repuesto
                </div>
                <div class="panel-body">

                    <form action="{{ route("repuestos.update", [$repuesto->id]) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                            <label for="cantidad">Cantidad*</label>
                            <input type="number" min="0" id="cantidad" name="cantidad" class="form-control" value="{{ old('cantidad', isset($repuesto) ? $repuesto->cantidad : 0) }}">
                            @if($errors->has('cantidad'))
                                <p class="help-block">
                                    {{ $errors->first('cantidad') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.name_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('repuesto') ? 'has-error' : '' }}">
                            <label for="roles">Repuesto*</label>
                            <input type="text" id="repuesto" name="repuesto" class="form-control" value="{{ old('repuesto', isset($repuesto) ? $repuesto->repuesto : 0) }}">
                        @if($errors->has('repuesto'))
                                <p class="help-block">
                                    {{ $errors->first('repuesto') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.roles_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('descripcion') ? 'has-error' : '' }}">
                            <label for="roles">Descripcion*</label>
                            <input type="text" id="descripcion" name="descripcion" class="form-control" value="{{ old('descripcion', isset($repuesto) ? $repuesto->descripcion : 0) }}">
                            @if($errors->has('descripcion'))
                                <p class="help-block">
                                    {{ $errors->first('descripcion') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.roles_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('tipos_unidad') ? 'has-error' : '' }}">
                            <label for="roles">Tipo de Unidad*</label>
                            <select name="unidad" id="unidad" class="form-control select2">
                                @foreach($tipos_unidad as $it)
                                    <option value="{{ $it->tipo }}" {{ (in_array($it->id, old('tipos_unidad', [])) || isset($repuesto) && $repuesto->tipo_unidad == $it->id) ? 'selected' : '' }}>
                                        {{ $it->tipo }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('tipos_unidad'))
                                <p class="help-block">
                                    {{ $errors->first('tipos_unidad') }}
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
