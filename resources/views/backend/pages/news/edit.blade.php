@extends('backend.master')
@section('headerTitle', 'Update News | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Update News
		</div>
		
		<div>
			{!! msg($name='msg') !!}
			@if ($errors->any())
				{{ validation_msg($errors->all()) }}
			@endif

			@if($result)
				<form action="{{ route('admin.update_process_news', $result->id).get_system() }}" method="post" enctype="multipart/form-data">
					@csrf


					<div class="col-lg-7 col-12">

						<div class="form-group">
							<label class="label-control">Date *</label>
							<input type="date" value="{{ $result->date }}" name="date" required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Publisher *</label>
							<input type="text" name="publisher" value="{{ $result->publisher }}" Placeholder="Publisher... *" required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Post Type *</label>
							<select class="form-control" name="post_type" id="post_type">
								<option {{ ($result->post_type == 'news') ? 'selected' : '' }} value="news" selected>News</option>
								<option {{ ($result->post_type == 'video') ? 'selected' : '' }} value="video">Video</option>
							</select>
						</div>

						<div class="form-group" id="video_wraper">
							<label class="label-control">Video</label>
							<input type="text" name="video" value="{{ $result->video }}" Placeholder="Enter Video Link or Code..." class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Category</label>
							<select class="form-control" name="category_id" onchange="get_subcategory(this)">
								<option value="">-select-</option>
								@if(count($category))
									@foreach($category as $key => $value)
										<option {{ ($result->category_id == $value->id) ? 'selected' : '' }} value="{{ $value->id }}">{{ $value->name }}</option>
									@endforeach
								@endif
							</select>
						</div>

						<div class="form-group">
							<label class="label-control">Subcategory</label>
							<select class="form-control" name="subcategory_id" id="subcategory">
								<option value="{{ $result->subcategory_id }}" selected>{{ $result->subcategory }}</option>
							</select>
						</div>

						<div class="form-group">
							<label class="label-control">Title</label>
							<input type="text" name="title" value="{{ $result->title }}" Placeholder="Title... *" id="title" required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Slug *</label>
							<input type="text" name="slug" value="{{ $result->slug }}" Placeholder="Slug... *" id="title_slug" required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Description</label>
							<textarea name="details" Placeholder="Description... *" required class="form-control" rows="5">{{ $result->description }}</textarea>
						</div>
							
						{{-- news banner start --}}
						<div class="form-group">
							<h4>News Banner</h4>
							<label class="image_upload_zone" for="">
								<input type="file" accept=".jpg, .png" onchange="previewFile('banner_preview', this, 'banner_img', 'banner_img_width', 'banner_img_height')">
								<input type="hidden" name="old_banner_path" value="{{ $result->banner_img_name }}" >
								<input type="hidden" name="banner_img" id="banner_img" >
								<input type="hidden" name="banner_img_width" id="banner_img_width" >
								<input type="hidden" name="banner_img_height" id="banner_img_height" >
								<img src="{{ asset('public/backend/images/svgicon/upload.svg') }}" alt="Upload">
								
								<div class="text">
									<span>Drag And drop News Banner</span>
									<strong>Or</strong>
									<br>
									<button>Select News Banner</button>
									<br>
									<span>
										File Type JPG,PNG 
										<br>
										News Banner Size Limit: 1MB
										<br>
										News Banner Ration: 1200x300
									</span>
								</div>
							</label>
							
							<div class="image_preview_wrapper">
								<img style="max-width: 100%;" src="{{ asset('public/backend/images/news/l/'.$result->banner_img_name) }}" id="banner_preview">
							</div>
						</div>
						{{-- news banner end --}}


						<div class="form-group">
							<label class="label-control">Image Caption</label>
							<input type="text" name="image_caption" value="{{ $result->image_caption }}" Placeholder="Image Caption..." required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Meta Tags *</label>
							<input type="text" name="meta_tag" value="{{ $result->meta_tag }}" Placeholder="Enter Meta Tags Separated by Comma(,)" required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Meta Description *</label>
							<textarea name="meta_description" Placeholder="Enter a Sort Description..." required class="form-control">{{ $result->meta_description }}</textarea>
						</div>

						<div class="form-group">
							<label class="label-control">
								<input type="checkbox"  {{ ($result->status == 1) ? 'checked' : '' }} value="1" name="status">
								Publish
							</label>
						</div>

						<div class="text-right">
							<button class="btn btn-primary">
								Submit <i class="fa fa-angle-right"></i>
							</button>
						</div>
					</div>
						
				</form>
			@else
				<div class="alert alert-warning">
					<strong>Warning!</strong>
					<p>No result found.</p>
				</div>
			@endif
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

		.cke_contents.cke_reset{
			height: 400px !important;
		}
	</style>
@endpush


@push('js')
	
	<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
	<script>
        CKEDITOR.replace( 'details' );
    </script>

	<script>
		window.addEventListener('load', ()=>{
			let title 	   = document.querySelector('#title'),
				title_slug = document.querySelector('#title_slug');

			if(title && title_slug)
			{
				title.addEventListener('input', function(){
					title_slug.value = this.value.trim().replaceAll(" ", "-").toLowerCase();
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
	

    <script>
    	/*-- get subcategory by ajax start --*/
		function get_subcategory(x){
			let subcategory = document.getElementById('subcategory'),
				category_id = x.value,
				xhttp = new XMLHttpRequest();

			xhttp.onreadystatechange = function()
			{
				if (this.readyState == 4 && this.status == 200)
				{
					var options		= '<option value="" selected>-select-</option>',
						subcategoryData = this.responseText;

					if(subcategoryData!=0)
					{
						subcategoryData = JSON.parse(subcategoryData);
						subcategoryData = Array.isArray(subcategoryData) ? subcategoryData : Object.values(subcategoryData);
						subcategoryData.forEach((single_subcategory)=>{
							options += `<option value="${single_subcategory.id}">${single_subcategory.name}</option>`;
						});
						subcategory.innerHTML = options;
					}else
					{
						subcategory.innerHTML = options;
					}
				}
			}
			xhttp.open("GET", `{{route('admin.getsubcategoryByAjaxForNews')}}?category_id=${+category_id}`, true);
			xhttp.send();
		}
		/*-- get subcategory by ajax end --*/
    </script>
@endpush