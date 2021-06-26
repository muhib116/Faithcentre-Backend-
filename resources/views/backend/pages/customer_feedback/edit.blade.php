@extends('backend.master')
@section('headerTitle', 'Update Feedback | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Update Feedback
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				@if($result)
					<form action="{{ route('admin.update_process_customer_feedback', $result->id).get_system() }}" method="post" enctype="multipart/form-data">
						@csrf
						<div class="col-lg-7 col-12">
							<div class="form-group">
								<label class="label-control">Name</label>
								<input type="text" name="name" Placeholder="Name... *" value="{{ ($result && is_safe($result->name)) ? $result->name : '' }}" required class="form-control">
							</div>

							<div class="form-group">
								<label class="label-control">Country</label>
								<input type="text" name="country" Placeholder="Country... *" value="{{ ($result && is_safe($result->country)) ? $result->country : '' }}" required class="form-control">
							</div>

							<div class="form-group">
								<label class="label-control">Review</label>
								<textarea name="details" Placeholder="Write Review... *" required rows="4" class="form-control">{{ ($result && is_safe($result->details)) ? $result->details : '' }}</textarea>
							</div>
							<br>


							<input type="hidden" name="old_path"  value="{{ $result->path }}">


							{{-- customer_feedback banner start --}}
							<div>
								<strong>Feedback</strong>
								<label class="image_upload_zone" for="">
									<input type="file" accept=".jpg, .png" onchange="previewFile('preview', this, 'img', 'img_width', 'img_height')">
									<input type="hidden" name="img" id="img">
									<input type="hidden" name="img_width" id="img_width" >
									<input type="hidden" name="img_height" id="img_height" >
									<img src="{{ asset('public/backend/images/svgicon/upload.svg') }}" alt="Upload">
									
									<div class="text">
										<span>Drag And drop Feedback</span>
										<strong>Or</strong>
										<br>
										<button>Select Feedback</button>
										<br>
										<span>
											File Type JPG,PNG 
											<br>
											Feedback Size Limit: 1MB
											<br>
											Feedback Ration: 1200x300
										</span>
									</div>
								</label>
								
								<div class="image_preview_wrapper">
									<img style="max-width: 100%;" src="{{ asset('public/backend/img/customer_feedback/l/'.$result->path) }}" id="preview">
								</div>
							</div>
								
								<input type="submit" class="btn btn-primary" value="Update">
							</div>
							{{-- customer_feedback banner end --}}

						</div>
						
					</form>
				@else
					<div class="alert alert-warning">
						No result found !
					</div>
				@endif

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