@extends('backend.master')
@section('headerTitle', 'Countries | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
			{!! msg($name='msg') !!}
			@if ($errors->any())
				{{ validation_msg($errors->all()) }}
			@endif
			<br>
			Countries
			<small class="items_found"> {{ count($result) }} item(s) found</small>
			{{-- @include('backend.inc.table_filter') --}}
		</div>
		
		<div>
			<div class="container_fluid">
				<form method="post" action="{{Route('admin.country_process')}}">
					@csrf
					<div class="form-group">
						<input type="text" name="name" class="form-control" placeholder="Enter Country Name..." required>
					</div>
					<button type="submit" class="btn btn-primary">Save</button>
				</form>
			</div>

			<div class="container_fluid mt-5">

				
				@if(count($result)>0)
					<table class="table table-bordered">
						<tr>
							<th>SL</th>
							<th>Name</th>
							<th>Action</th>
						</tr>

						@foreach($result as $key => $value)
						<tr>
							<td width="20">{{ ++$key }}</td>
							<td>{{ $value->name }}</td>
							<td width="15">
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
					<div class="alert alert-warning mt-4">
	                    <div class="icon">
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
    	<div class="footer"></div>
	</div>
@endsection

@push('css')
	<style>
		
	</style>
@endpush


@push('js')
	<script>
		
	</script>
@endpush