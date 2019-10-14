@extends('layouts.admin')
@section('content')
<div class="content">
        <div style="margin-bottom: 10px;" class="row">
            <div class="col-lg-12">
                <a class="btn btn-success" href="{{ route("colores.create") }}">
                    {{ trans('global.add') }} Color
                </a>
            </div>
        </div>
    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    Listado de colores
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
                                        Color
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
                                            {{ $it->color ?? '' }}
                                        </td>
                                        <td>
                                               <!--- <a class="btn btn-xs btn-primary" href="{{ route('asignaciones.show', $it->id) }}">
                                                    {{ trans('global.view') }}
                                                </a>--->
                                                <a class="btn btn-xs btn-info" href="{{ route('colores.edit', $it->id) }}">
                                                    {{ trans('global.edit') }}
                                                </a>
                                                <form action="{{ route('colores.destroy', $it->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                                    <input type="hidden" name="_method" value="DELETE">
                                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                                    <input type="submit" class="btn btn-xs btn-danger" value="{{ trans('global.delete') }}">
                                                </form>
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
