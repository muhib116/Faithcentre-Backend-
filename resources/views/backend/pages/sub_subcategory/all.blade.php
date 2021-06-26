@extends('backend.master')
@section('headerTitle', 'All Sub-subcategory | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
			All Sub-subcategory
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
							<th style="width: 400px">Category Name</th>
							<th style="width: 400px">Subcategory Name</th>
							<th style="width: 400px">Sub-subcategory Name</th>
							<th style="width: 400px">Sub-subcategory Name (BN)</th>
							<th style="width: 60px;">Logo</th>
							<th>Banner</th>
							<th width="100px">Options</th>
						</tr>

						@foreach($rows as $key => $value)
							<tr>
								<td>{{ $key+1 }}</td>
								<td>{{ is_safe($value->category_name) ? $value->category_name : '' }}</td>
								<td>{{ is_safe($value->subcategory_name) ? $value->subcategory_name : '' }}</td>
								<td>{{ is_safe($value->sub_subcategory_name) ? $value->sub_subcategory_name : '' }}</td>
								<td>{{ is_safe($value->sub_subcategory_name_bn) ? $value->sub_subcategory_name_bn : '' }}</td>
								<td><img style="height: 60px;" src="{{ asset('public/backend/images/sub_subcategory/logo/m/'.$value->logo_name) }}" alt=""></td>
								<td><img style="height: 60px;" src="{{ asset('public/backend/images/sub_subcategory/banner/'.$value->banner_name) }}" alt=""></td>
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