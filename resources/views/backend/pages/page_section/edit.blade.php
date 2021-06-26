@extends('backend.master')
@section('headerTitle', 'Update Section | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Update Section
		</div>
		
		@if($result)
			<div>
				<div class="container_fluid">
					{!! msg($name='msg') !!}
					@if ($errors->any())
						{{ validation_msg($errors->all()) }}
					@endif

					<form action="{{ route('admin.update_process_page_section', $result->id).get_system() }}" method="post" enctype="multipart/form-data">
						@csrf
						<div class="col-lg-7 col-12">
							<div class="form-group">
								<label class="label-control">Section Name *</label>
								<select name="section_name" required class="form-control">
									<option value="">-Select-</option>
									<option {{ ($result->section_name === "about-us") ? 'selected' : '' }} value="about-us">About Us</option>
									<option {{ ($result->section_name === "why-choose-us") ? 'selected' : '' }} value="why-choose-us">Ahy Choose Us</option>
									<option {{ ($result->section_name === "our-mission") ? 'selected' : '' }} value="our-mission">Our Mission</option>
									<option {{ ($result->section_name === "our-vision") ? 'selected' : '' }} value="our-vision">Our Vision</option>
								</select>
							</div>

							<div class="form-group">
								<label class="label-control">Title *</label>
								<input type="text" name="title" value="{{ $result->title }}" id="title" Placeholder="Title..." required class="form-control">
							</div>

							<div class="form-group">
								<label class="label-control">Slug *</label>
								<input type="text" name="slug" value="{{ $result->slug }}" id="title_slug" Placeholder="Slug..." required class="form-control">
							</div>

							<div class="form-group">
								<label class="label-control">Short Detail *</label>
								<textarea name="short_detail" Placeholder="Short Detail..." required class="form-control">{{ $result->short_detail }}</textarea>
							</div>

							<div class="form-group">
								<label class="label-control">Detail *</label>
								<textarea name="detail" Placeholder="Detail..." required class="form-control">{{ $result->detail }}</textarea>
							</div>

							<div class="form-group">
								<label class="label-control">Note (optional)</label>
								<textarea name="note" Placeholder="Note..." class="form-control">{{ $result->note }}</textarea>
							</div>


							@php
								/*get meta data of page section start*/
								$meta_data = \DB::table('page_section_meta')->where(["section_id"=>$result->id])->get();
								/*get meta data of page section end*/
							@endphp
							<br>
							<label class="label-control">Add Meta Information (optional)</label>
							<div class="form-group">
								<table class="_table">
								    <thead>
								      <tr>
								        <th>Title</th>
								        <th>Details</th>
								        <th width="50px">
								          <div class="action_container">
								            <button class="success" type="button" onclick="create_tr('table_body')">
								              <i class="fa fa-plus"></i>
								            </button>
								          </div>
								        </th>
								      </tr>
								    </thead>
								    <tbody id="table_body">
								    	@if(count($meta_data))
								    		@foreach($meta_data as $key => $value)
											    <tr>
											        <td>
											          <input type="text" class="form_control" name="meta_key[]" value="{{ $value->meta_key }}" placeholder="Enter your title..">
											        </td>
											        <td>
											          <textarea class="form_control" name="meta_value[]" placeholder="Description...">{{ $value->meta_value }}</textarea>
											        </td>
											        <td>
											          <div class="action_container">
											            <button class="danger" onclick="remove_tr(this)" type="button">
											              <i class="fa fa-close"></i>
											            </button>
											          </div>
											        </td>
											    </tr>
											@endforeach
										@else
										    <tr>
										        <td>
										          <input type="text" class="form_control" name="meta_key[]" placeholder="Enter your title..">
										        </td>
										        <td>
										          <textarea class="form_control" name="meta_value[]" placeholder="Description..."></textarea>
										        </td>
										        <td>
										          <div class="action_container">
										            <button class="danger" onclick="remove_tr(this)" type="button">
										              <i class="fa fa-close"></i>
										            </button>
										          </div>
										        </td>
										    </tr>
										@endif
								    </tbody>
								  </table>
							</div>


							{{-- Page Section start --}}
							<div class="form-group">
								<br>
								<br>
								<label class="label-control">Section Image *</label>
								<label class="image_upload_zone" for="">
									<input type="file" accept=".jpg, .png, .webp" onchange="previewFile('image_preview', this, 'img', 'img_width', 'img_height')">
									<textarea hidden name="img" id="img"></textarea>
									
									<input type="hidden" name="old_img_path" value="{{ $result->image_name }}" >
							
									<input type="hidden" name="img_width" id="img_width">
									<input type="hidden" name="img_height" id="img_height">
									<img src="{{ asset('public/backend/images/svgicon/upload.svg') }}" alt="Upload">
									
									<div class="text">
										<span>Drag And drop Section Image</span>
										<strong>Or</strong>
										<br>
										<button>Select Section Image</button>
										<br>
										<span>
											File Type JPG,PNG,Webp
											<br>
											Section Image Size Limit: 300kb
											<br>
											Section Image Ration: 4/6 (Recomanded)
										</span>
									</div>
								</label>
								
								<div class="image_preview_wrapper">
									<img src="{{ asset("public/backend/images/page_section/l/".$result->image_name) }}" id="image_preview">
								</div>
							</div>
							{{-- Page Section end --}}

							<div class="form-group">
								<input type="submit" class="btn btn-primary" value="Update">
							</div>

						</div>
						
					</form>

				</div>
			</div>
		@else
			<div class="alert alert-warning">
				No Result Found !
			</div>
		@endif
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



		._table {
		    width: 100%;
		    border-collapse: collapse;
		}

		._table :is(th, td) {
		    border: 1px solid #0002;
		    padding: 8px 10px;
		}

		/* form field design start */
		.form_control {
		    border: 1px solid #0002;
		    background-color: transparent;
		    outline: none;
		    padding: 8px 12px;
		    font-family: 1.2rem;
		    width: 100%;
		    color: #333;
		    font-family: Arial, Helvetica, sans-serif;
		    transition: 0.3s ease-in-out;
		}

		.form_control::placeholder {
		    color: inherit;
		    opacity: 0.5;
		}

		.form_control:is(:focus, :hover) {
		    box-shadow: inset 0 1px 6px #0002;
		}

		/* form field design end */


		.success {
		    background-color: #24b96f !important;
		}

		.warning {
		    background-color: #ebba33 !important;
		}

		.primary {
		    background-color: #259dff !important;
		}

		.secondery {
		    background-color: #00bcd4 !important;
		}

		.danger {
		    background-color: #ff5722 !important;
		}

		.action_container {
		    display: inline-flex;
		}

		.action_container>* {
		    border: none;
		    outline: none;
		    color: #fff;
		    text-decoration: none;
		    display: inline-block;
		    padding: 8px 14px;
		    cursor: pointer;
		    transition: 0.3s ease-in-out;
		}

		.action_container>*+* {
		    border-left: 1px solid #fff5;
		}

		.action_container>*:hover {
		    filter: hue-rotate(-20deg) brightness(0.97);
		    transform: scale(1.05);
		    border-color: transparent;
		    box-shadow: 0 2px 10px #0004;
		    border-radius: 2px;
		}

		.action_container>*:active {
		    transition: unset;
		    transform: scale(.95);
		}
	</style>
@endpush


@push('js')
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<script>
		CKEDITOR.replace('short_detail');
		CKEDITOR.replace('detail');
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
    	function create_tr(table_id) {
		    let table_body = document.getElementById(table_id),
		        first_tr   = table_body.firstElementChild
		        tr_clone   = first_tr.cloneNode(true);

		    table_body.append(tr_clone);

		    clean_first_tr(table_body.firstElementChild);
		}

		function clean_first_tr(firstTr) {
		    let children = firstTr.children;
		    
		    children = Array.isArray(children) ? children : Object.values(children);
		    children.forEach(x=>{
		        if(x !== firstTr.lastElementChild)
		        {
		            x.firstElementChild.value = '';
		        }
		    });
		}

		function remove_tr(This) {
		    if(This.closest('tbody').childElementCount == 1)
		    {
		        alert("You Don't have Permission to Delete This ?");
		    }else{
		        This.closest('tr').remove();
		    }
		}
    </script>
@endpush