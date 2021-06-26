@extends('backend.master')
@section('headerTitle', 'Update Admin\'s Profile | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
        <div class="heading">
            Update Admin's Profile
		</div>
		
		<div>
			{!! msg($name='msg') !!}
			@if ($errors->any())
				{{ validation_msg($errors->all()) }}
			@endif
			<form action="{{ route('admin.admin_edit_process', $result->id) }}" method="post" enctype="multipart/form-data">
				@csrf
				<div class="row">
					<div class="col-md-7 form-group">
						<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#passwordChangeModal">
							Change Password
						</button>
					</div>
					
					<div class="col-md-7 form-group">
						<input type="text" name="name" value="{{ ($result && $result->name) ? $result->name : '' }}" Placeholder="User's Name... *"  class="form-control" required>
					</div>

					<div class="col-md-7 form-group">
						<input type="text" name="phone" value="{{ ($result && $result->phone) ? $result->phone : '' }}" Placeholder="User's Phone... *"  class="form-control" required>
					</div>

					<div class="col-md-7 form-group">
						<input type="email" name="email" value="{{ ($result && $result->email) ? $result->email : '' }}" Placeholder="User's E-mail... *" class="form-control" required>
					</div>

					<div class="col-md-7 form-group">
						<select name="admin_type" class="form-control" required>
							<option value="">--Select Admin Type-- *</option>

							@if(Auth::user()['admin_type']=='president' || Auth::user()['admin_type']=='super_admin')
								<option {{ ($result && $result->admin_type == "super_admin") ? 'selected' : '' }} value="super_admin">Superadmin</option>
							@endif

							<option {{ ($result && $result->admin_type == "admin") ? 'selected' : '' }} value="admin">Admin</option>
						</select>
					</div>

					<div class="col-md-7 form-group">
						<textarea class="form-control" rows="6" name="address"  placeholder="User's Address(Optional)">{{ ($result && $result->address) ? $result->address : '' }}</textarea>
					</div>

					<div class="col-md-7 mb-4">
						<input type="file" name="img" preview_img="img_preview" id="img_upload">
					</div>

					<div class="col-md-7" style="margin-right: 15px;">
						<input type="submit" class="btn btn-primary pull-right" value="Update">
					</div>
					
					
					{{-- image previewing of input field --}}
					<div class="col-md-7 img_preview">
						@if($result && !empty($result->path) && file_exists($result->path))
							<img src="{{asset($result->path)}}" alt="Profile Image" draggable="false" style="width:180px !important;"></td>
						@else
							<img src="{{ asset('public/backend/images/img_not_found.webp') }}" alt="Profile Image" draggable="false" style="width:80px !important;"></td>
						@endif
					</div>

				</div>
			</form>
		</div>
    </section>


    <!-- Modal -->
	<div class="modal fade" id="passwordChangeModal" tabindex="-1" role="dialog" aria-labelledby="passwordChangeModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="passwordChangeModalLabel">Change Password</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<form action="{{ route('admin.password_change') }}" id="password_change_form" method="post">
	      		@csrf
	      		<input type="hidden" name="id" value="{{ \Auth::id() }}">
	      		<div class="form-group">
				    <label for="exampleInputPassword1">Current Password</label>
				    <input type="password" name="current_password" class="form-control" placeholder="Current Password">
				</div>
	      		<div class="form-group">
				    <label for="exampleInputPassword1">New Password</label>
				    <input type="password" name="password" class="form-control" placeholder="New Password">
				</div>
	      		<div class="form-group">
				    <label for="exampleInputPassword1">Confirm Password</label>
				    <input type="password" name="password_confirmation" class="form-control" placeholder="Confirm Password">
				</div>
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="submit" form="password_change_form" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
@endsection


@push('css')  
@endpush

@push('js')
@endpush