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

                    <form action="{{ route("tipos.update", [$tipo->id]) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group {{ $errors->has('tipo') ? 'has-error' : '' }}">
                            <label for="tipo">Color*</label>
                            <input type="text" min="0" id="tipo" name="tipo" class="form-control" value="{{ $tipo->tipo }}">
                            @if($errors->has('tipo'))
                                <p class="help-block">
                                    {{ $errors->first('tipo') }}
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
