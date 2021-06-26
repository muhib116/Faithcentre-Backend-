@php
	$user_info = \DB::table('users')->where(['id'=>\Auth::id()])->first();
@endphp

@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif
    
	<form action="{{ Route('user.profile_update_process') }}" method="Post" class="form_wraper">
		@csrf
		<div class="row">
			<div class="col-12 col-lg-6">
				<div class="form-group">
					<label class="label-control">Full Name</label>
					<input type="text" name="name" value="{{ $user_info ? $user_info->name : '' }}" class="form-control" placeholder="Full Name..." required >
				</div>
			</div>
			<div class="col-12 col-lg-6">		
				<div class="form-group">
					<label class="label-control">Contact Number</label>
					<input type="text" name="phone" value="{{ $user_info ? $user_info->phone : '' }}" class="form-control" placeholder="Contact Number..." required >
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12 col-lg-6">
				<div class="form-group">
					<label class="label-control">Email</label>
					<input type="text" name="email" value="{{ $user_info ? $user_info->email : '' }}" class="form-control" placeholder="Email..." required >
				</div>
			</div>
			<div class="col-12 col-lg-6">
				<div class="form-group">
					<label class="label-control">Date Of Birth</label>
					<input type="date" name="date_of_birth" value="{{ $user_info ? $user_info->date_of_birth : '' }}" class="form-control" placeholder="Date Of Birth..." required >
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-12 col-lg-6">
				<div class="form-group">
					<label class="label-control">Address</label>
					<textarea name="address" class="form-control" placeholder="Address..." required rows="5" >{{ $user_info ? $user_info->address : '' }}</textarea>
				</div>
			</div>
			
			<div class="col-12 col-lg-6">
				<div class="form-group">
					<label class="label-control">Zip/Post Code</label>
					<input type="text" name="zip_code" value="{{ $user_info ? $user_info->zip_code : '' }}" class="form-control" placeholder="Zip/Post Code..." required >
				</div>

				<div class="form-group">
					<label class="label-control">Passport No</label>
					<input type="text" name="passport_no" value="{{ $user_info ? $user_info->passport_no : '' }}" class="form-control" placeholder="Passport No..." required >
				</div>
			</div>
		</div>



		<div class="row">
			<div class="col-12 col-lg-6">
				<div class="form-group">
					<label class="label-control">Blood Group</label>
					<select name="blood_group" class="form-control" required>
						<option value="">-Select-</option>
						<option {{ $user_info && $user_info->blood_group == 'o+' ? 'selected' : '' }} value="o+">O+</option>
						<option {{ $user_info && $user_info->blood_group == 'o-' ? 'selected' : '' }} value="o-">O-</option>
						<option {{ $user_info && $user_info->blood_group == 'a+' ? 'selected' : '' }} value="a+">A+</option>
						<option {{ $user_info && $user_info->blood_group == 'a-' ? 'selected' : '' }} value="a-">A-</option>
						<option {{ $user_info && $user_info->blood_group == 'b+' ? 'selected' : '' }} value="b+">B+</option>
						<option {{ $user_info && $user_info->blood_group == 'b-' ? 'selected' : '' }} value="b-">B-</option>
						<option {{ $user_info && $user_info->blood_group == 'ab+' ? 'selected' : '' }} value="ab+">AB+</option>
						<option {{ $user_info && $user_info->blood_group == 'ab-' ? 'selected' : '' }} value="ab-">AB-</option>
					</select>
				</div>
			</div>

			<div class="col-12 col-lg-6">
				<div class="form-group">
					<label class="label-control">Country</label>
					@php
						$country = \DB::table('countries')->where(['status'=>1])->get();
					@endphp
					<select name="country_code" class="form-control" required>
						<option value="">-Select-</option>
						@if($country)
							@foreach($country as $key => $value)
								<option {{ $user_info && $user_info->country_id == $value->id ? 'selected' : '' }} value="{{ $value->id }}">{{ $value->name }}</option>
							@endforeach
						@endif
					</select>
				</div>
			</div>

			<div class="col-12 mt-3">		
				<button class="btn btn-warning pull-right">
					Update <i class="fa fa-angle-right"></i>
				</button>
			</div>
		</div>
	</form>
@endsection



<style>
	.form_wraper{
		width: 80%;
		padding: 15px;
	}

	@media(max-width: 1300px)
	{
		.form_wraper{
			width: 100%;
		}
	}
</style>