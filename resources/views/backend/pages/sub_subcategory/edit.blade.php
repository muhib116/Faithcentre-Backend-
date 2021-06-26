@extends('backend.master')
@section('headerTitle', 'Update Subcategory | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Update Subcategory
		</div>
		
		<div>
			{!! msg($name='msg') !!}
			@if ($errors->any())
				{{ validation_msg($errors->all()) }}
			@endif

			<form action="{{ route('admin.update_process_sub_subcategory', $result->id).get_system() }}" method="post" enctype="multipart/form-data">
				@csrf
				<div class="col-lg-7 col-12">
					<div class="form-group">
						<label class="label-control">Category Name <span class="req">*</span></label>
						<select name="category_id" required class="form-control">
							<option value="" selected>-Select Category-</option>
							@if(count($category))
								@foreach($category as $key => $value)
									<option {{ ($result->category_id==$value->id) ? 'selected' : '' }} value="{{ $value->id }}">{{ $value->name }}</option>
								@endforeach
							@endif
						</select>
					</div>

					<div class="form-group">
						<label class="label-control">Subcategory Name <span class="req">*</span></label>
						<input type="text" name="name" value="{{ ($result && is_safe($result->name)) ? $result->name : '' }}" Placeholder="Subcategory Name..." required class="form-control">
					</div>

					<div class="form-group">
						<label class="label-control">Subcategory Name (BN)<span class="req">*</span></label>
						<input type="text" name="name_bn" value="{{ ($result && is_safe($result->name_bn)) ? $result->name_bn : '' }}" Placeholder="Subcategory Name (BN)..." required class="form-control">
					</div>

					

					{{-- sub_subcategory logo start --}}
					<div>
						<br>
						<br>
						<h4>Subcategory Logo</h4>
						<label class="image_upload_zone" for="">
							<input type="file" accept=".jpg, .png"onchange="previewFile('logo_preview', this, 'logo_img', 'logo_img_width', 'logo_img_height')">
							
							<input type="hidden" name="old_logo_img_path" value="{{ $result->logo_name }}" >
							
							<input type="hidden" name="logo_img" id="logo_img">
							<input type="hidden" name="logo_img_width" id="logo_img_width">
							<input type="hidden" name="logo_img_height" id="logo_img_height">
							<img src="{{ asset('public/backend/images/svgicon/upload.svg') }}" alt="Upload">
							
							<div class="text">
								<span>Drag And drop Subcategory Logo</span>
								<strong>Or</strong>
								<br>
								<button>Select Subcategory Logo</button>
								<br>
								<span>
									File Type JPG,PNG 
									<br>
									Subcategory Logo Size Limit: 1MB
									<br>
									Subcategory Logo Ration: 400x400
								</span>
							</div>
						</label>
						<div class="image_preview_wrapper">
							<img src="{{ asset('public/backend/images/sub_subcategory/logo/l/'.$result->logo_name) }}" id="logo_preview">
						</div>
					</div>
					{{-- sub_subcategory logo end --}}


					{{-- sub_subcategory banner start --}}
						<div>
							<h4>Subcategory Banner</h4>
							<label class="image_upload_zone" for="">
								<input type="file" accept=".jpg, .png" onchange="previewFile('banner_preview', this, 'banner_img', 'banner_img_width', 'banner_img_height')">
								<input type="hidden" name="old_banner_img_path" value="{{ $result->banner_name }}" >
								<input type="hidden" name="banner_img" id="banner_img" >
								<input type="hidden" name="banner_img_width" id="banner_img_width" >
								<input type="hidden" name="banner_img_height" id="banner_img_height" >
								<img src="{{ asset('public/backend/images/svgicon/upload.svg') }}" alt="Upload">
								
								<div class="text">
									<span>Drag And drop Subcategory Banner</span>
									<strong>Or</strong>
									<br>
									<button>Select Subcategory Banner</button>
									<br>
									<span>
										File Type JPG,PNG 
										<br>
										Subcategory Banner Size Limit: 1MB
										<br>
										Subcategory Banner Ration: 1200x300
									</span>
								</div>
							</label>
							
							<div class="image_preview_wrapper">
								<img style="max-width: 100%;" src="{{ asset('public/backend/images/sub_subcategory/banner/'.$result->banner_name) }}" id="banner_preview">
							</div>
						</div>
						{{-- sub_subcategory banner end --}}
						
						<div>
							<input type="submit" class="btn btn-primary" value="Update">
						</div>
					</div>
				</div>
					
			</form>

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