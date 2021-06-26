@extends('backend.master')
@section('headerTitle', 'Create New User | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Create New User
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				<form action="{{ route('admin.save_new_user').get_system() }}" method="post" enctype="multipart/form-data">
					@csrf
					<div class="col-lg-7 col-12">
						<div class="form-group">
							<label class="label-control">Username</label>
							<input type="text" name="username" Placeholder="Username... *" required class="form-control">
						</div>
						<div class="form-group">
							<label class="label-control">Email</label>
							<input type="email" name="email" Placeholder="Email... *" required class="form-control">
						</div>
						<div class="form-group">
							<label class="label-control">Password</label>
							<input type="text" name="password" Placeholder="Password... *" required class="form-control">
						</div>

						<br>
						<br>
						<div class="form-group">
							<label class="label-control">Your Email</label>
							<select class="form-control" name="send_from" required>
								<option value="" selected>-Select your email-</option>
								@foreach(admin_mail_list() as $key)
									<option value="{{ $key }}">{{ $key }}</option>
								@endforeach
							</select>
						</div>
						<div class="form-group">
							<label class="label-control">Subject</label>
							<input type="text" name="subject" Placeholder="Subject... *" required class="form-control">
						</div>
						<div class="form-group">
							<label class="label-control">Mail Text</label>
							<textarea class="form-control" rows="4" placeholder="Enter Your Mail..." name="mail_text" required></textarea>
						</div>
						<br>


						{{-- user banner start --}}
						{{-- <div>
							<strong>User's Image</strong>
							<label class="image_upload_zone" for="">
								<input type="file" accept=".jpg, .png" onchange="previewFile('preview', this, 'img', 'img_width', 'img_height')">
								<input type="hidden" name="img" id="img" required>
								<input type="hidden" name="img_width" id="img_width" >
								<input type="hidden" name="img_height" id="img_height" >
								<img src="{{ asset('public/backend/images/svgicon/upload.svg') }}" alt="Upload">
								
								<div class="text">
									<span>Drag And drop User's Image</span>
									<strong>Or</strong>
									<br>
									<button>Select User's Image</button>
									<br>
									<span>
										File Type JPG,PNG 
										<br>
										User's Image Size Limit: 1MB
										<br>
										User's Image Ration: 1200x300
									</span>
								</div>
							</label>
							
							<div class="image_preview_wrapper">
								<img style="max-width: 100%;" src="" id="preview">
							</div> --}}
						</div>
							
							<input type="submit" class="btn btn-primary" value="Create">
						</div>
						{{-- user banner end --}}

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
			max-width: 400px;
		}
	</style>
@endpush


@push('js')
	<script src="https://cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
	<script>CKEDITOR.replace( 'mail_text' );</script>

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