@extends('layouts.admin')
@section('content')
<div class="content">
    <div class="row">
        @foreach ($number_blocks as $block)
            <div class="col-md-3 ">
                <div class="info-box">
                        <span class="info-box-icon bg-red"
                              style="display:flex; flex-direction: column; justify-content: center;">
                            <i class="fa fa-chart-line"></i>
                        </span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ $block['title'] }}</span>
                        <span class="info-box-number">{{ $block['number'] }}</span>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
        <div style="margin-bottom: 10px;" class="row">
            <div class="col-lg-12">
                <a class="btn btn-success" href="{{ route("asignaciones.create") }}">
                    {{ trans('global.add') }} Asignacion
                </a>
            </div>
        </div>
    <div class="row">
        <div class="col-lg-12">

            <div class="panel panel-default">
                <div class="panel-heading">
                    Asignacion {{ trans('global.list') }}
                </div>
                <div class="panel-body">

                    <div class="table-responsive">
                        <table class=" table table-bordered table-striped table-hover datatable">
                            <thead>
                                <tr>
                                    <th width="10">

                                    </th>
                                    <th>
                                        Asignaciones
                                    </th>
                                    <th>
                                        Fecha
                                    </th>
                                    <th>
                                        Repuesto
                                    </th>
                                    <th>
                                        Placa
                                    </th>
                                    <th>
                                        Serial
                                    </th>
                                    <th>
                                        Usuario
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
                                            {{ $it->cantidad ?? '' }}
                                        </td>
                                        <td>
                                            {{ $it->fecha_asignacion ?? '' }}
                                        </td>
                                        <td>
                                            {{ $it->repuesto ?? '' }}
                                        </td>
                                        <td>
                                            {{$it->placa}}
                                        </td>
                                        <td>
                                            {{$it->serial}}
                                        </td>
                                        <td>
                                            {{$it->user}}
                                        </td>
                                        <td>
                                               <!--- <a class="btn btn-xs btn-primary" href="{{ route('asignaciones.show', $it->id) }}">
                                                    {{ trans('global.view') }}
                                                </a>--->
                                                <a class="btn btn-xs btn-info" href="{{ route('asignaciones.edit', $it->id) }}">
                                                    {{ trans('global.edit') }}
                                                </a>
                                           <!--     <form action="{{ route('asignaciones.destroy', $it->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
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
