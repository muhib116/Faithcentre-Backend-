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
					<form action="{{ route('admin.text_and_image_store') }}" method="post" enctype="multipart/form-data">
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

								<div class="form-group">
									<input type="color" name="theme_color" value="{{ (count($rows) && isset($rows['theme_color'])) ? $rows['theme_color'] : '' }}" Placeholder="Theme Color... *" required style="width: 160px; height: 100px;margin-bottom: 5px;">
									<br>
									<h5>Set Theme Color</h5>
								</div>

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Site Name</label>
									<input type="text" name="site_name" value="{{ (count($rows) && isset($rows['site_name'])) ? $rows['site_name'] : '' }}" Placeholder="Website Name... *" required class="form-control">
								</div>

								{{-- <div class="form-group">
									<label class="label-control col-md-4 p-0">About Us</label>
									<textarea name="about_us" rows="6" Placeholder="About Us..." class="form-control">{{ (count($rows) && isset($rows['about_us'])) ? $rows['about_us'] : '' }}</textarea>
								</div> --}}

								{{-- <div class="form-group">
									<label class="label-control col-md-4 p-0">Services</label>
									<textarea name="services" rows="6" Placeholder="Services..." class="form-control">{{ (count($rows) && isset($rows['services'])) ? $rows['services'] : '' }}</textarea>
								</div> --}}

								{{-- <div class="form-group">
									<label class="label-control col-md-4 p-0">Header Text</label>
									<textarea name="header_text" rows="6" Placeholder="Header Text..." class="form-control">{{ (count($rows) && isset($rows['header_text'])) ? $rows['header_text'] : '' }}</textarea>
								</div> --}}

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Address</label>
									<textarea name="address" rows="6" Placeholder="Address..." class="form-control">{{ (count($rows) && isset($rows['address'])) ? $rows['address'] : '' }}</textarea>
								</div>

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Email</label>
									<input  type="text" name="email" value="{{ (count($rows) && isset($rows['email'])) ? $rows['email'] : '' }}" Placeholder="Email... *" required class="form-control">
								</div>

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Phone</label>
									<input  type="text" name="phone" value="{{ (count($rows) && isset($rows['phone'])) ? $rows['phone'] : '' }}" Placeholder="Phone... *" required class="form-control">
								</div>

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Map Embed URL</label>
									<input  type="text" name="map_url" value="{{ (count($rows) && isset($rows['map_url'])) ? $rows['map_url'] : '' }}" Placeholder="Map Embed URL... *" required class="form-control">
								</div>

								{{-- <div class="form-group">
									<label class="label-control col-md-4 p-0">About Text</label>
									<textarea name="about_text" rows="6" Placeholder="About Text..." class="form-control">{{ (count($rows) && isset($rows['about_text'])) ? $rows['about_text'] : '' }}</textarea>
								</div> --}}

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Contact Text</label>
									<textarea name="contact_text" rows="6" Placeholder="Contact Text..." class="form-control">{{ (count($rows) && isset($rows['contact_text'])) ? $rows['contact_text'] : '' }}</textarea>
								</div>

								<div class="form-group">
									<label class="label-control col-md-4 p-0">Footer Text</label>
									<textarea name="footer_text" rows="6" Placeholder="Footer Text..." class="form-control">{{ (count($rows) && isset($rows['footer_text'])) ? $rows['footer_text'] : '' }}</textarea>
								</div>



								<div class="form-group">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Social Media</th>
												<th>Link</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th width="150">Facebook</th>
												<td>
													<input type="url" name="facebook" value="{{ (count($rows) && isset($rows['facebook'])) ? $rows['facebook'] : '' }}" placeholder="http://www.facebook.com" class="form-control">
												</td>
											</tr>
											<tr>
												<th width="150">Twitter</th>
												<td>
													<input type="url" name="twitter" value="{{ (count($rows) && isset($rows['twitter'])) ? $rows['twitter'] : '' }}" placeholder="http://www.twitter.com" class="form-control">
												</td>
											</tr>
											<tr>
												<th width="150">Instagram</th>
												<td>
													<input type="url" name="instagram" value="{{ (count($rows) && isset($rows['instagram'])) ? $rows['instagram'] : '' }}" placeholder="http://www.instagram.com" class="form-control">
												</td>
											</tr>
											<tr>
												<th width="150">Youtube</th>
												<td>
													<input type="url" name="youtube" value="{{ (count($rows) && isset($rows['youtube'])) ? $rows['youtube'] : '' }}" placeholder="http://www.youtube.com" class="form-control">
												</td>
											</tr>
										</tbody>
									</table>
								</div>



								<br>
								<br>
								<div class="row">
									<div class="col-md-4 col-sm-6">
										<input type="hidden" name="header_old_path" value="{{ (count($rows) && isset($rows['header_logo'])) ? $rows['header_logo'] : '' }}">
										<label class="btn btn-info block text-center">Header Logo <i class="fa fa-upload"></i>
											<input type="file" accept="image/png, image/jpg, image/jpeg, image/webp" name="header_logo" style="overflow: hidden;width: 0;height: 0;" data-preview_img="header_logo">
										</label>
										<div class="header_logo">
											<img style="width: 100%;border: 1px solid #0002;margin: 20px 0;" src="{{ asset($rows['header_logo']) }}" alt="header logo">
										</div>
									</div>

									<div class="col-md-4 col-sm-6">
										<input type="hidden" name="footer_old_path" value="{{ (count($rows) && isset($rows['footer_logo'])) ? $rows['footer_logo'] : '' }}">
										<label class="btn btn-info block text-center">Footer Logo <i class="fa fa-upload"></i>
											<input type="file" accept="image/png, image/jpg, image/jpeg, image/webp" name="footer_logo" style="overflow: hidden;width: 0;height: 0;" data-preview_img="footer_logo">
										</label>
										<div class="footer_logo">
											<img style="width: 100%;border: 1px solid #0002;margin: 20px 0;" src="{{ asset($rows['footer_logo']) }}" alt="footer logo">
										</div>
									</div>

									<div class="col-md-4 col-sm-6">
										<input type="hidden" name="favicon_old_path" value="{{ (count($rows) && isset($rows['favicon'])) ? $rows['favicon'] : '' }}">
										<label class="btn btn-info block text-center">Favicon <i class="fa fa-upload"></i>
											<input type="file" accept="image/png, image/jpg, image/jpeg, image/webp" name="favicon" style="overflow: hidden;width: 0;height: 0;" data-preview_img="favicon">
										</label>
										<div class="favicon" style="max-width: 150px;">
											<img style="width: 100%;border: 1px solid #0002;margin: 20px 0;" src="{{ asset($rows['favicon']) }}" alt="Favicon">
										</div>
									</div>
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