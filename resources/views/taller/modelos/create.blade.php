@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.create') }} Modelo
                </div>
                <div class="panel-body">

                    <form action="{{ route("modelos.store") }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group {{ $errors->has('modelo') ? 'has-error' : '' }}">
                            <label for="color">Modelo*</label>
                            <input type="text" id="modelo" name="modelo" class="form-control" value="{{ old('modelo', isset($modelo) ? $modelo->modelo : '') }}">
                            @if($errors->has('modelo'))
                                <p class="help-block">
                                    {{ $errors->first('modelo') }}
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
