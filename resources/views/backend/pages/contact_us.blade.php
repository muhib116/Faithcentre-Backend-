@extends('backend.master')
@section('headerTitle', 'All Contact request | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
			All Contact request
			<small class="items_found"> {{ count($contact_us) }} item(s) found</small>
			@include('backend.inc.table_filter')
		</div>
		
		<div>
			<div class="container_fluid table-responsive">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				
				@if(count($contact_us)>0)
					<table class="table table-bordered hover-primary table_filter">
						<tr>
							<th width="40">SL</th>
							<th>Date & Time</th>
							<th>Name</th>
							<th>Subject</th>
							<th>Email</th>
							{{-- <th>Phone</th> --}}
							<th>Details</th>
							<th style="width:100px">Options</th>
						</tr>
						@foreach($contact_us as $key => $value)
						<tr>
							<td>{{ ++$key }}</td>
							<td>
								{{ date('M-d-Y', strtotime($value->date)) }}
								<br>
								<strong>{{ date('h:i:s a', strtotime($value->time)) }}</strong>
							</td>
							<td>{{ ucwords($value->name) }}</td>
							<td>{{ ucwords($value->subject) }}</td>
							<td>{{ ucwords($value->email) }}</td>
							{{-- <td>{{ ucwords($value->phone) }}</td> --}}
							<td>{{ ucwords($value->details) }}</td>

							<td class="man_auto_width">
								
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
				<div class="alert alert-warning">
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