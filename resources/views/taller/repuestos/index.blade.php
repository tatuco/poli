@extends('layouts.admin')
@section('content')
<div class="content">
        <div style="margin-bottom: 10px;" class="row">
            <div class="col-lg-12">
                <a class="btn btn-success" href="{{ route("repuestos.create") }}">
                    {{ trans('global.add') }} Repuesto
                </a>
            </div>
        </div>
    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    {{ trans('global.list') }} Repuestos
                </div>
                <div class="panel-body">

                    <div class="table-responsive">
                        <table class=" table table-bordered table-striped table-hover datatable">
                            <thead>
                                <tr>
                                    <th width="10">

                                    </th>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        Repuesto
                                    </th>
                                    <th>
                                        Cantidad
                                    </th>
                                    <th>
                                        Descripcion
                                    </th>
                                    <th>
                                        Tipo Unidad
                                    </th>
                                    <th>
                                        Modelo
                                    </th>
                                    <th>
                                        &nbsp;
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($data as $it)
                                    <tr data-entry-id="{{ $it->id }}">
                                        <td>

                                        </td>
                                        <td>
                                            {{ $it->id ?? '' }}
                                        </td>
                                        <td>
                                            {{ $it->repuesto ?? '' }}
                                        </td>
                                        <td>
                                            {{ $it->cantidad ?? '' }}
                                        </td>
                                        <td>
                                            {{$it->descripcion}}
                                        </td>
                                        <td>
                                            {{$it->tipo_unidad}}
                                        </td>
                                        <td>
                                            {{$it->modelo}}
                                        </td>
                                        <td>
                                               <!--- <a class="btn btn-xs btn-primary" href="{{ route('repuestos.show', $it->id) }}">
                                                    {{ trans('global.view') }}
                                                </a>--->
                                                <a class="btn btn-xs btn-info" href="{{ route('repuestos.edit', $it->id) }}">
                                                    {{ trans('global.edit') }}
                                                </a>
                                           <!--     <form action="{{ route('repuestos.destroy', $it->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                                    <input type="hidden" name="_method" value="DELETE">
                                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                                    <input type="submit" class="btn btn-xs btn-danger" value="{{ trans('global.delete') }}">
                                                </form>--->
                                        </td>

                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
@endsection
@section('scripts')
@parent
<script>
    $(function () {
  let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
  let deleteButton = {
    text: deleteButtonTrans,
    url: "{{ route('admin.users.massDestroy') }}",
    className: 'btn-danger',
    action: function (e, dt, node, config) {
      var ids = $.map(dt.rows({ selected: true }).nodes(), function (entry) {
          return $(entry).data('entry-id')
      });

      if (ids.length === 0) {
        alert('{{ trans('global.datatables.zero_selected') }}')

        return
      }

      if (confirm('{{ trans('global.areYouSure') }}')) {
        $.ajax({
          headers: {'x-csrf-token': _token},
          method: 'POST',
          url: config.url,
          data: { ids: ids, _method: 'DELETE' }})
          .done(function () { location.reload() })
      }
    }
  }


  $('.datatable:not(.ajaxTable)').DataTable({ buttons: dtButtons })
})

</script>
@endsection
