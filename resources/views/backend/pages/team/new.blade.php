@extends('backend.master')
@section('headerTitle', 'Create New Team | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Create New Team
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				<form action="{{ route('admin.save_new_team').get_system() }}" method="post" enctype="multipart/form-data">
					@csrf
					<div class="col-lg-7 col-12">
						<div class="form-group">
							<label class="label-control">Name *</label>
							<input type="text" name="name" id="name" Placeholder="Name..." required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Slug *</label>
							<input type="text" name="slug" id="name_slug" Placeholder="Slug..." required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Designation *</label>
							<input type="text" name="designation" Placeholder="Designation..." required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Detail *</label>
							<textarea name="detail" Placeholder="Detail..." required class="form-control"></textarea>
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
										<td>
											<select class="form-control" name="icon[]" readonly>
												<option value="">-Select-</option>
												<option value="ion-social-facebook" selected>Facebook</option>
												<option value="ion-social-twitter">Twitter</option>
												<option value="ion-social-linkedin">Linkedin</option>
												<option value="ion-social-instagram">Instagram</option>
											</select>
										</td>
										<td>
											<input type="url" name="link[]" placeholder="http://www.example.com/somthing" class="form-control">
										</td>
									</tr>
									<tr>
										<td>
											<select class="form-control" name="icon[]" readonly>
												<option value="">-Select-</option>
												<option value="ion-social-facebook">Facebook</option>
												<option value="ion-social-twitter" selected>Twitter</option>
												<option value="ion-social-linkedin">Linkedin</option>
												<option value="ion-social-instagram">Instagram</option>
											</select>
										</td>
										<td>
											<input type="url" name="link[]" placeholder="http://www.example.com/somthing" class="form-control">
										</td>
									</tr>
									<tr>
										<td>
											<select class="form-control" name="icon[]" readonly>
												<option value="">-Select-</option>
												<option value="ion-social-facebook">Facebook</option>
												<option value="ion-social-twitter">Twitter</option>
												<option value="ion-social-linkedin" selected>Linkedin</option>
												<option value="ion-social-instagram">Instagram</option>
											</select>
										</td>
										<td>
											<input type="url" name="link[]" placeholder="http://www.example.com/somthing" class="form-control">
										</td>
									</tr>
									<tr>
										<td>
											<select class="form-control" name="icon[]" readonly>
												<option value="">-Select-</option>
												<option value="ion-social-facebook">Facebook</option>
												<option value="ion-social-twitter">Twitter</option>
												<option value="ion-social-linkedin">Linkedin</option>
												<option value="ion-social-instagram" selected>Instagram</option>
											</select>
										</td>
										<td>
											<input type="url" name="link[]" placeholder="http://www.example.com/somthing" class="form-control">
										</td>
									</tr>
								</tbody>
							</table>
						</div>


						{{-- Page Team start --}}
						<div class="form-group">
							<br>
							<br>
							<label class="label-control">Team Image *</label>
							<label class="image_upload_zone" for="">
								<input type="file" required accept=".jpg, .png, .webp" onchange="previewFile('image_preview', this, 'img', 'img_width', 'img_height')">
								<textarea hidden name="img" id="img"></textarea>
								<input type="hidden" name="img_width" id="img_width">
								<input type="hidden" name="img_height" id="img_height">
								<img src="{{ asset('public/backend/images/svgicon/upload.svg') }}" alt="Upload">

								<div class="text">
									<span>Drag And drop Team Image</span>
									<strong>Or</strong>
									<br>
									<button>Select Team Image</button>
									<br>
									<span>
										File Type JPG,PNG,Webp
										<br>
										Team Image Size Limit: 300kb
									</span>
								</div>
							</label>
							
							<div class="image_preview_wrapper">
								<img src="" id="image_preview">
							</div>
						</div>
						{{-- Page Team end --}}

						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Create">
						</div>

					</div>
					
				</form>

			</div>
		</div>
    </section>
@endsection



@push('css')
	<style>
		.image_upload_zone{
			display: block;
			width: 100%;
			border: 2px dashed #ddd;
			position: relative;
			padding: 40px 10px;
			margin: 25px 0;
		}
		.image_upload_zone input[type=file]{
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			opacity: 0;
		}
		.image_upload_zone img{
			vertical-align: middle;
			border-style: none;
			width: 100px;
			margin: auto;
			display: block;
		}
		.image_upload_zone .text{
			text-align: center;
			font-size: 1.2rem;
		}
		.image_upload_zone .text button{
			background: #fff;
			padding: 10px 25px;
			margin: 15px 0;
			font-weight: bold;
			box-shadow: 0 1px 10px #0002;
			border: 1px solid #bcbcbc;
		}

		.image_preview_wrapper{
			margin: 15px 0;
			display: block;
			width: 100%;
		}
		.image_preview_wrapper img{
			display: block;
			max-width: 600px;
			width: 100%;
		}
	</style>
@endpush


@push('js')
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<script>
		CKEDITOR.replace('detail');
	</script>

	<script>
		window.addEventListener('load', ()=>{
			let name 	   = document.querySelector('#name'),
				name_slug = document.querySelector('#name_slug');

			if(name && name_slug)
			{
				name.addEventListener('input', function(){
					name_slug.value = this.value.trim().replaceAll(" ", "-").toLowerCase();
				});
			}
		});
	</script>

	<script>
      //this script for image file preview
      function previewFile(place,e, input_id, img_width, img_height) {
        var file 	   = e.files[0],
			preview    = document.getElementById(place),
			img_width  = document.getElementById(img_width),
			img_height = document.getElementById(img_height),
			fileReader = new FileReader();
			
	
		fileReader.addEventListener('load', function(){
			preview.src = fileReader.result;
			document.getElementById(input_id).value = btoa(fileReader.result);
			
			preview.addEventListener('load', function(){
				img_width.value	 = preview.naturalWidth;
				img_height.value = preview.naturalHeight;
			});
		});
		
		if(file){
			fileReader.readAsDataURL(file);
		}
      }
    </script>
@endpush