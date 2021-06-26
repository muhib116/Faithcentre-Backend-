@extends('backend.master')
@section('headerTitle', 'All Aside Menu | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.pages.menus.aside.nav')
        <div class="heading">
			All Aside Menu
			<small class="items_found"> {{ count($rows) }} item(s) found</small>
			@include('backend.inc.table_filter')
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				
				<div class="table-responsive">					
					@if(count($rows)>0)
					<table class="table table-bordered table_filter">
						<tr>
							<th width="30px">SL</th>
							<th>Name</th>
							<th style="width: 55px;">Icon</th>
							<th>Has Submenu ?</th>
							<th>Has Option menu ?</th>
							<th>Route Name</th>
							<th width="100px">Options</th>
						</tr>

						@foreach($rows as $key => $row)
							<tr>
								<td>{{ $key+1 }}</td>
								<td>{{ $row->name }}</td>
								<td class="text_center">
									<span style="display:inline-block;width: 30px;">
										<img style="display: block;width: 100%;" src="{{ asset('public/backend/images/svgicon/'.$row->icon) }}" alt="">
									</span>
								</td>
								<td>
									@if($row->has_sub_menu==1)
										Available
									@elseif($row->has_sub_menu==0)
										Not Available
									@endif
								</td>
								<td>
									@if($row->has_option_menu==1)
										Available
									@elseif($row->has_option_menu==0)
										Not Available
									@endif
								</td>
								<td>{{ $row->route_name }}</td>
								<td>
									<div class="btn-group m_0">
										<a href="{{ route('admin.aside_menu_edit', $row->id) }}" class="btn btn-warning">
											<i class="fa fa-pencil"></i>
										</a>
										<button 
											class="btn btn-danger cursot_pointer"
											onclick="if(confirm('Are you sure to delete this ?')){document.querySelector('#delete_form_{{ $row->id }}').submit();}else{return false;}" 
										>
											<i class="fa fa-trash"></i>
										</button>
										<form id="delete_form_{{ $row->id }}" action="{{ route('admin.aside_menu_delete', [$row->id,$row->has_sub_menu,$row->has_option_menu]) }}" method="post" style="display: none;">
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
		</div>
    </section>
@endsection


@push('css')  
@endpush