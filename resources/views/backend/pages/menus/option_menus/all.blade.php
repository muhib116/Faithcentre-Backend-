@extends('backend.master')
@section('headerTitle', 'All Option Menu | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.pages.menus.option_menus.nav')
        <div class="heading">
            All Option Menu
			<small> {{ count($rows) }} item(s) found</small>
			@include('backend.inc.table_filter')
		</div>
		
		<div>
			{!! msg($name='msg') !!}
			@if ($errors->any())
				{{ validation_msg($errors->all()) }}
			@endif

			
			
			@if(count($rows)>0)
			<table class="table table-bordered table_filter">
				<tr>
					<th width="30px">SL</th>
					<th>Aside Menu Name</th>
					<th>Aside Dropdown Menu Name</th>
					<th>Name</th>
					<th>Type</th>
					<th style="width:25px;">Icon</th>
					<th>Route Name</th>
					<th width="110px">Options</th>
				</tr>

				@foreach($rows as $key => $row)
					<tr>
						<td>{{ $key+1 }}</td>
						<td>{{ $row->aside_menu_name }}</td>
						<td>{{ $row->dropdown_menu_name }}</td>
						<td>{{ $row->name }}</td>
						<td>{{ $row->type }}</td>
						<td class="text_center">
							<img style="display:block;width:25px;" src="{{ asset('public/backend/images/svgicon/'.$row->icon) }}">
						</td>
						<td>{{ $row->route_name }}</td>
						<td>
							<div class="btn-group">
								<a href="{{ route('admin.option_menu_edit', [$row->id]) }}" class="btn btn-warning">
									<i class="fa fa-pencil"></i>
								</a>
								<button 
									class="btn btn-danger cursot_pointer"
									onclick="if(confirm('Are you sure to delete this ?')){document.querySelector('#delete_form_{{ $row->id }}').submit();}else{return false;}" 
								>
									<i class="fa fa-trash"></i>
								</button>
								<form id="delete_form_{{ $row->id }}" action="{{ route('admin.option_menu_delete', [$row->id]) }}" method="post" style="display: none;">
									@csrf
								</form>
							</div>
						</td>
					</tr>
				@endforeach
			</table>
			@else
			<div class="alert alert-warning" style="display: flex;align-items: center;">
				<div class="icon" style="margin-right: 15px;">
					<i class="fa fa-info-circle" aria-hidden="true"></i>
				</div>
				<div>
					<div>
						<strong>
							Alert !
						</strong> <br>
					</div>
					<div>
						Data Not Found.
					</div>
				</div>
			</div>
			@endif
		</div>
    </section>
@endsection


@push('css')  
@endpush

@push('js')
@endpush