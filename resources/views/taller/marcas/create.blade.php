@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.create') }} Estado
                </div>
                <div class="panel-body">

                    <form action="{{ route("estados.store") }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group {{ $errors->has('estado') ? 'has-error' : '' }}">
                            <label for="color">Estado*</label>
                            <input type="text" id="estado" name="estado" class="form-control" value="{{ old('estado', isset($estado) ? $estado->estado : '') }}">
                            @if($errors->has('estado'))
                                <p class="help-block">
                                    {{ $errors->first('estado') }}
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
