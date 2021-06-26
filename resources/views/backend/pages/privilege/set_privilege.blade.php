@extends('backend.master')
@section('headerTitle', 'Privilage | '.((isset($site_name)) ? $site_name : ''))

@section('content')
	<!-- body container start -->
	<section class="content">
        <div class="heading">
			Privilage
		</div>

		@if(checkPrivalege())
			<div class="container_fluid">
				<div class="container-fluid">
					{!! msg() !!}

					{{-- read admins from database start --}}
					<?php
						$admins = \DB::table('admins')
									   ->where([['admin_type', '!=', 'president'],'status'=>1])
									   ->select('id','name','admin_type','path')
									   ->get();
					?>
					{{-- read admins from database end --}}

					@if(count($admins)>0)
						@foreach($admins as $key => $value)

						{{-- read prev value of privilege for single admin start --}}
						@php
							$single_admin_privilege = DB::table('admin_privileges')
									                    ->select('admin_id','aside_menu_id','aside_menu_dropdown_id','option_menu_id')
									                    ->where(['admin_id'=>$value->id])
									                    ->first();
		                @endphp
						{{-- read prev value of privilege for single admin end --}}


						<form action="{{ ($single_admin_privilege) ? route('admin.privilege_update') : route('admin.privilege_set') }}" method="post">
							@csrf()
							{{-- pass admin's id by hidden input field --}}
							<input type="hidden" name="admins_id" value="{{ $value->id }}">


							<div class="accordion" id="accordion_{{ $value->id }}">
								<div class="card mb-3">
								    <div class="card-header" id="heading_{{ $value->id }}">
								    	<h2 class="mb-0">
								    	  <button class="btn w-100" style="outline: none;box-shadow: none;" type="button" data-toggle="collapse" data-target="#collapse_{{ $value->id }}" aria-expanded="true" aria-controls="collapse_{{ $value->id }}">
										    <div style="display: flex;text-align: left;align-items: center;">
										    	<div class="privilege_img">
										    		@if(file_exists($value->path))
										    			<img src="{{ asset($value->path) }}" alt="Profile Image" draggable="false">
										    		@else
										    			<img src="{{ asset('public/backend/images/img_not_found.webp') }}" alt="Profile Image" draggable="false">
										    		@endif
										    	</div>
										    	<div>
										    		<strong class="d_block">Name: {{ isset($value->name) ? $value->name : '' }}</strong>
										    		<br>
										    		<span>Type: {{ isset($value->admin_type) ? ucwords(str_replace('_', ' ', $value->admin_type)).'.' : '' }}</span>
										    	</div>
										    </div>
								    	  </button>
								    	</h2>
								    </div>

								    <div id="collapse_{{ $value->id }}" class="collapse" aria-labelledby="heading_{{ $value->id }}" data-parent="#accordion_{{ $value->id }}">
								    	<div class="card-body">
								    	  {{-- read aside menue start --}}
											@php
												$menues = \DB::table('system_aside_menus')
														 ->orderBy('position', 'asc')
														 ->select('id','name')
														 ->where(['status'=>1])
														 ->get();
											@endphp
											{{-- read aside menue end --}}
											<div class="table_responsive">
												<table class="table table-bordered">
													<tr>
														<th width="60">SL</th>
														<th width="200">Aside's Menu</th>
														<th>Aside's Dropdown Menu</th>
														<th>Option's Menu</th>
													</tr>
													@if(count($menues)>0)
														@foreach($menues as $menues_key => $menues_value)
															<tr>
																<td>{{ $loop->index+1 }}</td>
																<td>
																	@php
																		$rand = rand(0,99999) ;
																	@endphp
																	<div class="row px-4 py-1">
																		<label class="switch purple mr-2">
																			{{-- {{ in_array($menues_value->id, json_decode($single_admin_privilege->aside_menu_id)) }} --}}
																			<input 
																				value="{{ isset($menues_value->id) ? $menues_value->id : '' }}" 
																				type="checkbox" 
																				name="aside_menu_id[]" 
																				@php
																					// if aside menu id available in single_admin_privilege variable then checked this
																					if(
																						$single_admin_privilege && 
																						is_safe($menues_value->id) && 
																						is_safe($single_admin_privilege->aside_menu_id) &&
																						in_array($menues_value->id, json_decode($single_admin_privilege->aside_menu_id))
																					){
																						echo 'checked'; 
																					}
																				@endphp
																			>
																			<span></span>
																			{{ $menues_value->name }}
																		</label>
																	</div>
																</td>

																<td>
																	{{-- read aside menue's dropdown start --}}
																	@php
																		$menue_dropdown = \DB::table('system_aside_menu_dropdowns')
																				 ->orderBy('position', 'asc')
																				 ->select('id','name')
																				 ->where(['aside_menu_id'=>$menues_value->id,'status'=>1])
																				 ->get();
																	@endphp
																	{{-- read aside menue's dropdown end --}}
																	@if(count($menue_dropdown)>0)
																		@foreach($menue_dropdown as $dropdown_key => $dropdown_value)
																			@php
																				$rand = rand(0,99999) ;
																			@endphp
																			<div class="row px-4 py-1">
																				<label class="switch purple mr-2">
																					<input 
																						value="<?php echo isset($dropdown_value->id) ? $dropdown_value->id : ''; ?>" 
																						type="checkbox" 
																						name="aside_menu_dropdown_id[]" 
																						@php
																							// if aside menu's dropdown id available in single_admin_privilege variable then checked this
																							if(
																								$single_admin_privilege && 
																								is_safe($dropdown_value->id) && 
																								is_safe($single_admin_privilege->aside_menu_dropdown_id) && 
																								in_array($dropdown_value->id, json_decode($single_admin_privilege->aside_menu_dropdown_id))
																							){
																								echo 'checked'; 
																							}
																						@endphp
																					>
																					<span></span>
																					{{ $dropdown_value->name }}
																				</label>
																			</div>
																		@endforeach
																	@endif
																</td>
																<td>
																	{{-- read aside menue's action start --}}
																	@php
																		$action_menue = \DB::table('system_option_menus')
																				 ->orderBy('position', 'asc')
																				 ->select('id','name')
																				 ->where(['aside_menu_id'=>$menues_value->id,'status'=>1])
																				 ->get();
																	@endphp
																	{{-- read aside menue's action end --}}
																	@if(count($action_menue)>0)
																		@foreach($action_menue as $action_menue_key => $action_menue_value)
																			@php
																				$rand = rand(0,99999) ;
																			@endphp
																			<div class="row px-4 py-1">
																				<label class="switch purple mr-2">
																					<input 
																						value="<?php echo isset($action_menue_value->id) ? $action_menue_value->id : ''; ?>" 
																						type="checkbox" 
																						name="option_menu_id[]" 

																						@php
																							// if action_menu_id available in single_admin_privilege variable then checked this
																							if(
																								$single_admin_privilege && 
																								is_safe($action_menue_value->id) && 
																								is_safe($single_admin_privilege->option_menu_id) && 
																								in_array($action_menue_value->id, json_decode($single_admin_privilege->option_menu_id))
																							){
																								echo 'checked'; 
																							}
																						@endphp
																					>
																					<span></span>
																					{{ $action_menue_value->name }}
																				</label>
																			</div>
																		@endforeach
																	@endif
																</td>
															</tr>
														@endforeach
													@endif
													<tr>
														<td colspan="4" class="text-right">
															<input type="submit" value="{{ ($single_admin_privilege) ? "Update" : "Save" }}" class="btn btn-primary">
														</td>
													</tr>
												</table>
											</div>
								    	</div>
								    </div>
								</div>
							</div>
						</form>
						@endforeach
					@else
						{{ alert('Data Not Available To Set Privilage !', 'warning') }}
					@endif

				</div>
			</div>
		@else
			<div class="alert alert-danger">
				<strong>Danger!</strong>
				<br>
				You don't have permission for this page
			</div>
		@endif
	</section>
	<!-- body container end -->
@endsection


@push('css')
	<style type="text/css">
		.accordion_button{
			display: flex !important;
			align-items: center;
			box-shadow: var(--shadow) !important;
			border-color: var(--grey) !important;
			border-radius: 0.25rem !important;
		}
		.privilege_img{
			width: 3rem;
		    height: 3rem;
		    border-radius: 50%;
		    border: 0.0625rem solid #ccc;
		    overflow: hidden;
		    position: relative;
		    margin-right: 1rem;
		}
		.privilege_img img{
			height: 100%;
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		}
	</style>
@endpush

@push('js')
@endpush