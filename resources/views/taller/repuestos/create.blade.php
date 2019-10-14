@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.create') }} Repuesto
                </div>
                <div class="panel-body">

                    <form action="{{ route("repuestos.store") }}" method="POST" enctype="multipart/form-data">
                        @csrf
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
                            <label for="repuesto">Repuesto*</label>
                            <input type="text"  id="repuesto" name="repuesto" class="form-control" value="{{ old('repuesto', isset($repuesto) ? $repuesto->repuesto : '') }}">
                            @if($errors->has('repuesto'))
                                <p class="help-block">
                                    {{ $errors->first('repuesto') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('descripcion') ? 'has-error' : '' }}">
                            <label for="descripcion">Descripcion*</label>
                            <input type="text"  id="descripcion" name="descripcion" class="form-control" value="{{ old('descripcion', isset($repuesto) ? $repuesto->descripcion : '') }}">
                            @if($errors->has('descripcion'))
                                <p class="help-block">
                                    {{ $errors->first('descripcion') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('modelos') ? 'has-error' : '' }}">
                            <label for="modelos">Modelos*</label>
                            <select name="modelo" id="modelo" class="form-control select2">
                                @foreach($modelos as $id => $it)
                                    <option value="{{ $it }}" >
                                        {{ $it }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('modelos'))
                                <p class="help-block">
                                    {{ $errors->first('modelos') }}
                                </p>
                            @endif

                        </div>
                        <div class="form-group {{ $errors->has('tipos_unidad') ? 'has-error' : '' }}">
                            <label for="tipos_unidad">Componente*</label>
                            <select name="tipo_unidad" id="tipo_unidad" class="form-control select2">
                                @foreach($tipos_unidad as $id => $it)
                                    <option value="{{ $it }}" {{ (in_array($id, old('tipos_unidad', [])) || isset($repuesto) && $repuesto->tipo_unidad == $id) ? 'selected' : '' }}>
                                        {{ $it }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('tipos_unidad'))
                                <p class="help-block">
                                    {{ $errors->first('tipos_unidad') }}
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
