@extends('layouts.admin')
@section('content')
<div class="content">

    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.create') }} {{ trans('global.user.title_singular') }}
                </div>
                <div class="panel-body">

                    <form name="f" action="{{ route("admin.users.store") }}" id="formu" method="POST" enctype="multipart/form-data" onsubmit="return validar()">
                        @csrf
                        <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                            <label for="name">{{ trans('global.user.fields.name') }}*</label>
                            <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($user) ? $user->name : '') }}">
                            @if($errors->has('name'))
                                <p class="help-block">
                                    {{ $errors->first('name') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.name_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
                            <label for="email">{{ trans('global.user.fields.email') }}*</label>
                            <input type="email" id="email" name="email" class="form-control" value="{{ old('email', isset($user) ? $user->email : '') }}">
                            @if($errors->has('email'))
                                <p class="help-block">
                                    {{ $errors->first('email') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.email_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('password') ? 'has-error' : '' }}">
                            <label for="password">{{ trans('global.user.fields.password') }}</label>
                            <input type="password" id="password" name="password" class="form-control">
                            @if($errors->has('password'))
                                <p class="help-block">
                                    {{ $errors->first('password') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.password_helper') }}
                            </p>
                        </div>
                        <div class="form-group {{ $errors->has('roles') ? 'has-error' : '' }}">
                            <label for="roles">{{ trans('global.user.fields.roles') }}*
                                <span class="btn btn-info btn-xs select-all">Select all</span>
                                <span class="btn btn-info btn-xs deselect-all">Deselect all</span></label>
                            <select name="roles[]" id="roles" class="form-control select2" multiple="multiple">
                                @foreach($roles as $id => $roles)
                                    <option value="{{ $id }}" {{ (in_array($id, old('roles', [])) || isset($user) && $user->roles->contains($id)) ? 'selected' : '' }}>
                                        {{ $roles }}
                                    </option>
                                @endforeach
                            </select>
                            @if($errors->has('roles'))
                                <p class="help-block">
                                    {{ $errors->first('roles') }}
                                </p>
                            @endif
                            <p class="helper-block">
                                {{ trans('global.user.fields.roles_helper') }}
                            </p>
                        </div>
                        <div>
                            <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}" onclick="validar()">
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>
@endsection
<script type="text/javascript">


    function validar() {
        var correos="yahoo hotmail gmail";
        /*Luego dividimos por el @ el contenido del email con la metodo split y lo
        guardamos en la variable dominio*/
        console.log(document.f.email.value);

        var dominio=document.f.email.value.split("@");
        /*Ahora en dominio[1] contiene 'dominio.com' lo volvemos a dividir para obtener
        el dominio de correo lo que esta antes del punto, tambien con el metodo split.*/
        var server=dominio[1].split(".");
        /*Finalmente verificamos si server[0] que contiene el dominio de correo esta
        dentro del textio correos con la funcion match, el resultado se almacena en res*/
        var res=correos.match(server[0]);
        if (res==null) {
            alert("Correo Invalido. Dominios Aceptados: Gmail, Hotmail, Yahoo");
            return false;
        }
        return true;
    }
</script>
