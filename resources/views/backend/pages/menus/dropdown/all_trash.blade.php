@extends('backend.master')
@section('headerTitle', 'All Trashed Aside Dropdown | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.pages.menus.dropdown.nav')
        <div class="heading">
            All Trashed Aside Dropdown
			<small class="items_found"> {{ count($rows) }} item(s) found</small>
			@include('backend.inc.table_filter')
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif
				
				@if(count($rows)>0)
				<table class="table table-bordered table_filter">
					<tr>
						<th width="30px">SL</th>
						<th>Parent Name</th>
						<th>Name</th>
						<th style="width:25px;">Icon</th>
						<th>Route Name</th>
						<th width="110px">Options</th>
					</tr>

					@foreach($rows as $key => $row)
						<tr>
							<td>{{ $key+1 }}</td>
							<td>{{ $row->parent_name }}</td>
							<td>{{ $row->name }}</td>
							<td class="text_center">
								<img style="display:block;width:25px;" src="{{ asset('public/backend/images/svgicon/'.$row->icon) }}">
							</td>
							<td>{{ $row->route_name }}</td>
							<td>
								<div class="btn-group">
									<a href="{{ route('admin.restore_aside_menu_dropdown', [$row->id]) }}" class="btn btn-primary">
										<i class="fa fa-undo"></i>
									</a>
									<button 
										class="btn btn-danger"
										onclick="if(confirm('Are you sure to delete this ?')){document.querySelector('#delete_form_{{ $row->id }}').submit();}else{return false;}" 
									>
										<i class="fa fa-trash"></i>
									</button>
									<form id="delete_form_{{ $row->id }}" action="{{ route('admin.aside_menu_dropdown_parmanently_delete', [$row->id]) }}" method="post" style="display: none;">
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
		</div>
    </section>
@endsection


@push('css')  
@endpush

@push('js')
@endpush