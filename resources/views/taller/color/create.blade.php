@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.create') }} Color
                </div>
                <div class="panel-body">

                    <form action="{{ route("colores.store") }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group {{ $errors->has('color') ? 'has-error' : '' }}">
                            <label for="color">Color*</label>
                            <input type="text" min="0" id="color" name="color" class="form-control" value="{{ old('color', isset($asignacion) ? $asignacion->color : '') }}">
                            @if($errors->has('color'))
                                <p class="help-block">
                                    {{ $errors->first('color') }}
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
