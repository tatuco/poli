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

                    <form action="{{ route("mandos.update", [$mando->id]) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group {{ $errors->has('mando') ? 'has-error' : '' }}">
                            <label for="mando">Mando*</label>
                            <input type="text"  id="mando" name="mando" class="form-control" value="{{ $mando->mando }}">
                            @if($errors->has('mando'))
                                <p class="help-block">
                                    {{ $errors->first('mando') }}
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
