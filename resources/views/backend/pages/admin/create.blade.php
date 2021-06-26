@extends('backend.master')
@section('headerTitle', 'Create Admin | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.pages.admin.nav')
        <div class="heading">
            Create Admin
		</div>
		
		<div>
			{!! msg($name='msg') !!}
			@if ($errors->any())
				{{ validation_msg($errors->all()) }}
			@endif

			<form action="{{ route('admin.admin_create_process') }}" method="post" enctype="multipart/form-data">
				@csrf
				
				<div class="row">
					<div class="col-md-7 form-group">
						<input type="text" name="name" Placeholder="Enter Name... *"  class="form-control" required autocomplete='off'>
					</div>

					<div class="col-md-7 form-group">
						<input type="text" name="phone" Placeholder="User's Phone... *"  class="form-control" required autocomplete='off'>
					</div>

					<div class="col-md-7 form-group">
						<input type="email" name="email" Placeholder="User's E-mail... *" class="form-control" required autocomplete='off'>
					</div>

					<div class="col-md-7 form-group">
						<input type="password" name="password" Placeholder="Password... *"  id="password" class="form-control" required autocomplete='off'>
					</div>

					<div class="col-md-7 form-group">
						<input type="password" name="password_confirmation" Placeholder="Confirm Password... *"  id="confirm_password" class="form-control" required autocomplete='off'>
					</div>
					
					<div class="col-md-7 form-group">
						<select name="admin_type" class="form-control" required>
							<option value="">--Select Admin Type-- *</option>
							<option {{ (old('type') == "super_admin") ? 'selected' : '' }} value="super_admin">Super Admin</option>
							<option {{ (old('type') == "admin") ? 'selected' : '' }} value="admin">Admin</option>
						</select>
					</div>

					<div class="col-md-7 form-group">
						<textarea class="form-control" rows="6" name="address"  placeholder="User's Address (Optional)"></textarea>
					</div>

					<div class="col-md-7">
						<input type="file" name="img" preview_img="img_preview" id="img_upload">
					</div>
					<br>

					<div class="col-md-7 mt-4">
						<input type="submit" class="btn btn-primary pull-right" value="Create">
					</div>
					
					{{-- image previewing of input field --}}
					<div class="img_preview px_md-1"></div>
				</div>
			</form>

		</div>
    </section>
@endsection


@push('css')  
@endpush

@push('js')
@endpush