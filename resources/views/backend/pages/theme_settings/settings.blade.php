@extends('backend.master')
@section('headerTitle', 'Text & Image | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@if(checkPrivalege())
			@include('backend.nav')
	        <div class="heading">
	            Text & Image
				<small class="items_found"> {{ count($rows) }} item(s) found</small>
				{{-- @include('backend.inc.table_filter') --}}
			</div>
			
			<div>
				<div class="container_fluid">
					{!! msg($name='msg') !!}
					@if ($errors->any())
						{{ validation_msg($errors->all()) }}
					@endif
					<form action="{{ route('admin.settings_process') }}" method="post" enctype="multipart/form-data">
						@csrf
						<div class="row">
							<div class="col-lg-10 col-12 px-md-2 px-0">
								{{-- <div class="form-group">
									<label class="label-control col-md-4 p-0">Console Disabling </label>
									<div class="w_100">
										<select name="console_disabling" class="form-control man_select" required>
											<option {{ (count($rows) && isset($rows['console_disabling']) && $rows['console_disabling']=="yes") ? "selected" : '' }} value="yes">Yes</option>
											<option {{ (count($rows) && isset($rows['console_disabling']) && $rows['console_disabling']=="no") ? "selected" : '' }} value="no">No</option>
										</select>
									</div>
								</div> --}}


								{{-- <div class="form-group">
									<label class="label-control col-md-4 p-0">Notification Limit</label>
									<input type="number" name="notification_limit" value="{{ (count($rows) && isset($rows['notification_limit'])) ? $rows['notification_limit'] : '' }}" Placeholder="Notification Limit... *" required class="form-control">
								</div>

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Expiration Notification Before * days</label>
									<input type="number" name="expiration_before" value="{{ (count($rows) && isset($rows['expiration_before'])) ? $rows['expiration_before'] : '' }}" Placeholder="Expiration Notice Before _days... *" required class="form-control">
								</div>
 --}}
								{{-- <div class="form-group">
									<label class="label-control col-md-4 p-0">Language</label>
									<select name="language" required class="form-control">
										<option value="">-Select Language-</option>
										<option {{ (count($rows) && isset($rows['language']) && $rows['language'] == 'bn') ? 'selected' : '' }} value="bn">Bangla</option>
										<option {{ (count($rows) && isset($rows['language']) && $rows['language'] == 'en') ? 'selected' : '' }} value="en">English</option>
									</select>
								</div> --}}

								{{-- <div class="form-group">
									<label class="label-control col-md-4 p-0">Software Type</label>
									<select name="soft_type" required class="form-control">
										<option value="">-Select Type-</option>
										<option {{ (count($rows) && isset($rows['soft_type']) && $rows['soft_type'] == 'whole_sale') ? 'selected' : '' }} value="whole_sale">Whole Sale</option>
										<option {{ (count($rows) && isset($rows['soft_type']) && $rows['soft_type'] == 'retail_sale') ? 'selected' : '' }} value="retail_sale">Retail Sale</option>
										<option {{ (count($rows) && isset($rows['soft_type']) && $rows['soft_type'] == 'both') ? 'selected' : '' }} value="both">Both</option>
									</select>
								</div> --}}

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Software Mode</label>
									<select name="soft_mode" required class="form-control">
										<option value="">-Select Mode-</option>
										<option {{ (count($rows) && isset($rows['soft_mode']) && $rows['soft_mode'] == 'light') ? 'selected' : '' }} value="light">Light</option>
										<option {{ (count($rows) && isset($rows['soft_mode']) && $rows['soft_mode'] == 'dark') ? 'selected' : '' }} value="dark">Dark</option>
									</select>
								</div>

								<div class="px-0 text_right">
									<input type="submit" class="btn btn-primary" value="{{ (count($rows)>0) ? 'Update' : 'Create' }}">
								</div>
							</div>
						</div>
					</form>

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
@endsection


@push('css')  
@endpush

@push('js')
@endpush