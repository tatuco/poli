@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.edit') }} Tipo
                </div>
                <div class="panel-body">

                    <form action="{{ route("unidades.update", [$unidad->id]) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group {{ $errors->has('placa') ? 'has-error' : '' }}">
                            <label for="placa">Placa*</label>
                            <input type="text" min="0" id="placa" name="placa" class="form-control" value="{{ old('placa', isset($unidad) ? $unidad->placa : '') }}">
                            @if($errors->has('placa'))
                                <p class="help-block">
                                    {{ $errors->first('placa') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('modelos') ? 'has-error' : '' }}">
                            <label for="modelos">Modelos*</label>
                            <select name="modelo" id="modelo" class="form-control select2">
                                @foreach($modelos as $id => $it)
                                    <option value="{{ $id }}" {{ (in_array($id, old('modelos', [])) || isset($unidad) && $unidad->id_modelo == $id) ? 'selected' : '' }}>
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
                        <div class="form-group {{ $errors->has('estados') ? 'has-error' : '' }}">
                            <label for="estados">Estados*</label>
                            <select name="estado" id="estado" class="form-control select2">
                                @foreach($estados as $id => $it)
                                    <option value="{{ $id }}" {{ (in_array($id, old('estados', [])) || isset($unidad) && $unidad->id_estado == $id) ? 'selected' : '' }}>
                                        {{ $it }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('estados'))
                                <p class="help-block">
                                    {{ $errors->first('estados') }}
                                </p>
                            @endif

                        </div>
                        <div class="form-group {{ $errors->has('colores') ? 'has-error' : '' }}">
                            <label for="colores">Colores*</label>
                            <select name="color" id="color" class="form-control select2">
                                @foreach($colores as $id => $it)
                                    <option value="{{ $id }}" {{ (in_array($id, old('colores', [])) || isset($unidad) && $unidad->id_color == $id) ? 'selected' : '' }}>
                                        {{ $it }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('colores'))
                                <p class="help-block">
                                    {{ $errors->first('colores') }}
                                </p>
                            @endif

                        </div>
                        <div class="form-group {{ $errors->has('tipos') ? 'has-error' : '' }}">
                            <label for="tipos">Tipo*</label>
                            <select name="tipo" id="tipo" class="form-control select2">
                                @foreach($tipos as $id => $it)
                                    <option value="{{ $id }}" {{ (in_array($id, old('tipos', [])) || isset($unidad) && $unidad->id_tipo == $id) ? 'selected' : '' }}>
                                        {{ $it }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('tipos'))
                                <p class="help-block">
                                    {{ $errors->first('tipos') }}
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
