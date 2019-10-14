@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.edit') }} Color
                </div>
                <div class="panel-body">

                    <form action="{{ route("estados.update", [$estado->id]) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group {{ $errors->has('estado') ? 'has-error' : '' }}">
                            <label for="estado">Estado*</label>
                            <input type="text"  id="estado" name="estado" class="form-control" value="{{ $estado->estado }}">
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
