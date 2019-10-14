@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.edit') }} Componente
                </div>
                <div class="panel-body">

                    <form action="{{ route("componentes.update", [$componente->id]) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group {{ $errors->has('nombres') ? 'has-error' : '' }}">
                            <label for="nombres">Color*</label>
                            <input type="text" min="0" id="nombres" name="nombres" class="form-control" value="{{ $componente->nombres }}">
                            @if($errors->has('nombres'))
                                <p class="help-block">
                                    {{ $errors->first('nombres') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('apellidos') ? 'has-error' : '' }}">
                            <label for="apellidos">Color*</label>
                            <input type="text" min="0" id="apellidos" name="apellidos" class="form-control" value="{{ $componente->apellidos }}">
                            @if($errors->has('apellidos'))
                                <p class="help-block">
                                    {{ $errors->first('apellidos') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('ci') ? 'has-error' : '' }}">
                            <label for="ci">Color*</label>
                            <input type="text" min="0" id="ci" name="ci" class="form-control" value="{{ $componente->ci }}">
                            @if($errors->has('ci'))
                                <p class="help-block">
                                    {{ $errors->first('ci') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('serial') ? 'has-error' : '' }}">
                            <label for="serial">Color*</label>
                            <input type="text" min="0" id="serial" name="serial" class="form-control" value="{{ $componente->serial }}">
                            @if($errors->has('serial'))
                                <p class="help-block">
                                    {{ $errors->first('serial') }}
                                </p>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('mandos') ? 'has-error' : '' }}">
                            <label for="roles">Unidades*</label>
                            <select name="mando" id="mando" class="form-control select2">
                                @foreach($mandos as $it)
                                    <option value="{{ $it->id }}" {{ (in_array($it->id, old('mandos', [])) || isset($componente) && $componente->id_mando == $it->id) ? 'selected' : '' }}>
                                        {{ $it->mando }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('mandos'))
                                <p class="help-block">
                                    {{ $errors->first('mandos') }}
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
