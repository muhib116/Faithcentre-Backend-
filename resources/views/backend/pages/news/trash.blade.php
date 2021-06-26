@extends('backend.master')
@section('headerTitle', 'All Trashed News | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
			All Trashed News
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
							<th style="width: 200px">Category</th>
							<th style="width: 200px">Subcategory</th>
							<th style="width: 100px">Image</th>
							<th>Title</th>
							<th width="100px">Options</th>
						</tr>

						@foreach($rows as $key => $value)
							<tr>
								<td>{{ $key+1 }}</td>
								<td>{{ $value->category }}</td>
								<td>{{ $value->subcategory }}</td>
								<td>
									@php
										$url = $value->banner_img_name;
										if(empty($url))
										{
											$url = 'public/backend/images/svgicon/image.svg';
										}else{
											$url = 'public/backend/images/news/l/'.$url;
										}
									@endphp
									<img style="width: 100px" src="{{ asset($url) }}" alt="Image Not Found">
								</td>
								<td>{{ is_safe($value->title) ? $value->title : '' }}</td>
								<td>
									{{-- action menu start here --}}
									@php
										$userInfo 	  = get_action_menu()["userInfo"];
										$action_menue = get_action_menu()["action_menue"];
									@endphp

									<div class="btn-group">
										@if(count($action_menue)>0)
											@foreach($action_menue as $action_key => $action_value)
												@if($userInfo->admin_type==='president' xor ($userInfo->admin_type!=='president' && is_safe($action_value->id) && in_array($action_value->id, json_decode($userInfo->option_menu_id))))
													<a  style="width:35px;display:block; padding:6px;border: 1px solid #ddd;margin-left:-1px;"
														href="{{ is_safe($action_value->route_name) && Route::has($action_value->route_name) ? route($action_value->route_name, $value->id).get_system() : '' }}" 
														class="" 
														title="{{ is_safe($action_value->name) ? $action_value->name : '' }}"
														@if(is_safe($action_value->name) && strtolower($action_value->name) == 'trash')
															onclick="return confirm('Are Your Sure To Delete This Data ?')"
														@endif
														@if(is_safe($action_value->name) && strtolower($action_value->name) == 'delete')
															onclick="return confirm('Are Your Sure To Permanently Delete This Data ?')"
														@endif
													{{--  --}}
													>
														<img style="width:100%;display:block;" src='{{asset('public/backend/images/svgicon/'.$action_value->icon)}}' alt=''>
													</a>
												@endif
											@endforeach
										@endif
									</div>
									{{-- action menu end here --}}
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