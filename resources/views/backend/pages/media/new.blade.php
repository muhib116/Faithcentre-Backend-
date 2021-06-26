@extends('backend.master')
@section('headerTitle', 'Create New Media | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Create New Media
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				<div class="alert"></div>
				<div>
					<div class="progress">
						<div class="progress-bar progress-bar-striped bg-warning" id="my_progress_bar" role="progressbar" style="width: 0%"></div>
					</div>


					<div class="form-group d-none">
						<label class="label-control">Category</label>
						<select name="category_id" id="category_id" required class="form-control">
							<option value="" selected>-Select-</option>
							@if($categories)
								@foreach($categories as $key => $value)
									<option {{ ($key == 0) ? 'selected' : '' }} value="{{ $value->id }}" >{{ $value->name }}</option>
								@endforeach
							@endif
						</select>
					</div>

					<label class="image_upload_zone">
						<input type="file" accept=".jpg, .png, .gif" name="file" id="inpFile" multiple>
						<img src="{{ asset('public/backend/images/svgicon/upload.svg') }}" alt="Upload">
						
						<div class="text">
							<span>Drag And drop Image File</span>
							<strong>Or</strong>
							<br>
							<button>Select Image</button>
							<br>
							<span>
								File Type JPG,PNG, GIF
							</span>
						</div>
					</label>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-warning" id="btnUpload" value="Upload">
				</div>
			</div>



			{{-- image container start --}}
				<br>
				<br>

				{{-- filter start --}}
					{{-- <div class="row">
						<div class="img_filter col-md-6">
							<form action="{{ Route('admin.add_new_media') }}" method="get">
								<div class="form-group">
									<label class="label-control">Category</label>
									<select name="category_id" class="form-control">
										<option value="" selected>-Select-</option>
										@if($categories)
											@foreach($categories as $key => $value)
												<option value="{{ $value->id }}" {{ (isset($_REQUEST['category_id']) && !empty($_REQUEST['category_id']) && $_REQUEST['category_id'] == $value->id) ? "selected" : '' }} >{{ $value->name }}</option>
											@endforeach
										@endif
									</select>
								</div>
								<div class="form-group">
									<input type="submit" value="Filter" class="btn btn-info">
								</div>
							</form>
						</div>
					</div> --}}
				{{-- filter end --}}

				<br>
				<br>
				<div  class="container_fluid image_container">
					@if(count($files))
						@foreach($files as $key => $value)
							<div data-toggle="modal" data-target=".bd-example-modal-xl" data-info="{{ json_encode($value) }}" class="single_media_file">
								<img src="{{ asset("public/backend/media/m/".$value->file_name) }}" alt="{{ $value->alt_text }}" title="{{ $value->title }}">
							</div>
						@endforeach
					@else
					<div class="alert alert-warning">
						<h3>No Result Found !</h3>
					</div>
					@endif
				</div>
			{{-- image container end --}}
		</div>
    </section>


    {{-- image details viewer modal start --}}
		<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="media_detail_container">
					  <div class="left d-flex align-items-center">
					    <img src="{{ asset("public/backend/images/svgicon/picture.svg") }}" id="big_image" alt="">
					  </div>
					  <div class="right">
					    <table>
					        <tr>
					          <th>File</th>
					          <td id="file_name"></td>
					        </tr>
					      <tr>
					        <th>File Type</th>
					        <td id="file_type"></td>
					      </tr>
					      <tr>
					        <th>File Size</th>
					        <td id="file_size"></td>
					      </tr>
					      <tr>
					        <th>Upload Date</th>
					        <td id="upload_date"></td>
					      </tr>
					      <tr>
					        <th>Dimensions</th>
					        <td id="dimensions"></td>
					      </tr>
					    </table>
					    <hr>
					    <table class="table_for_input">
					      <tr class="d-none">
					        <th>Category</th>
					        <td>
					        	<select id="category" required class="form-control">
									<option value="" selected>-Select-</option>
									@if($categories)
										@foreach($categories as $key => $value)
											<option value="{{ $value->id }}" >{{ $value->name }}</option>
										@endforeach
									@endif
								</select>
					        </td>
					      </tr>
					      <tr>
					        <th>Alternative Text</th>
					        <td>
					          <input type="hidden" id="media_id">
					          <input type="text" name="alternative_text" id="alt_text">
					        </td>
					      </tr>
					      <tr>
					        <th>Title</th>
					        <td>
					          <input type="text" name="title" id="title">
					        </td>
					      </tr>
					      <tr>
					        <th>Caption</th>
					        <td>
					          <input type="text" name="caption" id="caption">
					        </td>
					      </tr>
					      <tr>
					        <th>Description</th>
					        <td>
					          <textarea name="description" rows="4" id="description"></textarea>
					        </td>
					      </tr>
					      <tr>
					        <th>Meta Description</th>
					        <td>
					          <textarea name="meta_description" rows="4" id="meta_description"></textarea>
					        </td>
					      </tr>
					      <tr>
					        <th>Meta Tages</th>
					        <td>
					          <input type="text" value="" id="meta_tages" name="meta_tages">
					        </td>
					      </tr>
					      <tr>
					        <th>Copy Link</th>
					        <td>
					          <input type="url" value="" id="input_for_copy" onfocus="copyToClipBoard()">
					        </td>
					      </tr>
					    </table>
					    
					    <div class="mt-3 mb-4">
		    				<a href="" id="visit_link" target="_blank" class="btn btn-success">Visit File</a>
		    				<button id="delete_media_info_btn" class="btn btn-danger">Delete Permanently</button>
		    				<button class="btn btn-primary pull-right" id="save_data">Save</button>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	{{-- image details viewer modal end --}}
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


		/*image section start*/
		.image_container{
		  margin-top: 35px 0;
		  display: grid;
		  grid-template-columns: repeat(auto-fit, minmax(200px, 300px));
		  gap: 15px;
		}


		.image_container div{
		  border: 1px solid red;
		  position: relative;
		  padding-bottom: 100%;
		  overflow: hidden;
		}

		.image_container div img{
		  position: absolute;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  object-fit: cover;
		}


		/*modal start*/
		.media_detail_container {
			 min-height: 40vh;
			 display: grid;
			 grid-template-columns: minmax(300px, 450px) 1fr;
		}
		 .media_detail_container .left {
			 padding: 15px;
		}
		 .media_detail_container .left img{
		 	width: 100%;
		 }
		 .media_detail_container .right {
			 padding: 15px;
			 background: #fffbf6;
			 border-left: 2px solid orange;
			 box-shadow: -2px 0px 7px #0000001f;
		}
		 .media_detail_container .right hr {
			 border: none;
			 border-bottom: 1px dashed #000 3;
			 margin: 15px 0;
		}
		 .media_detail_container .right table {
			 width: 100%;
		}
		 .media_detail_container .right table, .media_detail_container .right table th, .media_detail_container .right table td {
			 border: 1px solid #0002;
			 border-collapse: collapse;
		}
		 .media_detail_container .right table th {
			 width: 120px;
			 vertical-align: top;
			 font-size: 12px;
		}
		 .media_detail_container .right table td {
			 font-size: 11px;
			 color: #666;
		}
		 .media_detail_container .right table td input, .media_detail_container .right table td textarea {
			 padding: 8px;
			 border: 1px solid #ddd;
			 width: 100%;
			 background: #fff 4;
			 outline: none;
			 border-radius: 4px;
			 transition: 0.3s ease-in-out;
		}
		 .media_detail_container .right table td input:focus, .media_detail_container .right table td textarea:focus, .media_detail_container .right table td input:hover, .media_detail_container .right table td textarea:hover {
			 box-shadow: 0 0 6px #000 1 inset;
		}
		 .media_detail_container .right table td input:focus, .media_detail_container .right table td textarea:focus {
			 box-shadow: 0 0 6px #000 1 inset;
			 border-color: orange;
		}
		 .media_detail_container .right table th, .media_detail_container .right table td {
			 padding: 10px;
			 text-align: left;
		}
		 .media_detail_container .right .table_for_input th {
			 text-align: right;
		}
		 .media_detail_container .right a.delete_this_file{
		 	color: red;
		 	text-decoration: none;
		 }
		 
	</style>
@endpush



	
@push('js')
	<script>
		let single_media_files = document.querySelectorAll('.single_media_file'),
			big_image		   = document.getElementById("big_image"),
			category		   = document.getElementById("category"),
			alt_text		   = document.getElementById("alt_text"),
			media_id		   = document.getElementById("media_id"),
			title		   	   = document.getElementById("title"),
			caption		   	   = document.getElementById("caption"),
			description		   = document.getElementById("description"),
			meta_description   = document.getElementById("meta_description"),
			meta_tages		   = document.getElementById("meta_tages"),
			file_name		   = document.getElementById("file_name"),
			file_type		   = document.getElementById("file_type"),
			file_size		   = document.getElementById("file_size"),
			upload_date		   = document.getElementById("upload_date"),
			dimensions		   = document.getElementById("dimensions"),
			visit_link		   = document.getElementById("visit_link");

		{{-- push data from single image to modal start --}}
			if(single_media_files)
			{
				single_media_files.forEach(single_media_file=>{
					single_media_file.addEventListener("click", function()
					{
						let info = single_media_file.dataset.info;
							info = JSON.parse(info);
						
						// now push data to modal
						big_image.src 	   	 = "{{ asset('public/backend/media/l') }}/"+info.file_name;
						input_for_copy.value = "{{ asset('public/backend/media/original') }}/"+info.file_name;
						visit_link.href 	 = "{{ asset('public/backend/media/original') }}/"+info.file_name;
						
						alt_text.value 	  = info.alt_text;
						title.value 	  = info.title;
						media_id.value 	  = info.id;
						caption.value 	  = info.caption;
						description.value = info.description;

						meta_description.value = info.meta_description;
						meta_tages.value 	   = info.meta_tages;

						file_name.innerText   = info.file_name;
						file_type.innerText   = info.mime_type;
						file_size.innerText   = (+info.file_size).toFixed(2)+"Mb";
						upload_date.innerText = info.updated_at;
						dimensions.innerText  = info.dimensions;
						
						select_category(info.category_id);
					});
				});
			}

			function select_category(category_id)
			{
				let cat_option = '<option value="">-Select Category-</option>';

				return fetch("{{ Route('admin.catAsJson') }}")
				.then(response => response.json())
				.then(data => {
					if(data != 0)
					{
						data.forEach(value=>
						{
							cat_option += `<option ${category_id == value.id ? 'selected' : ''} value="${value.id}">${value.name}</option>`;
						});

						// push data to modal category
						category.innerHTML = cat_option;
					}else{
						return 0;
					}
				});

			}
		{{-- push data from single image to modal end --}}


		let save_data = document.getElementById("save_data");
		if(save_data)
		{
			save_data.addEventListener('click', function()
			{
				let data = {
					media_id:media_id.value,
					category:category.value,
					alt_text:alt_text.value,
					title:title.value,
					caption:caption.value,
					description:description.value,
					meta_description:meta_description.value,
					meta_tages:meta_tages.value
				};

				let xhr = new XMLHttpRequest();

				xhr.onreadystatechange = function()
				{
					if(this.readyState==4 && this.status==200)
					{
						if(this.responseText){
							alert("Information Updated Successfully!");
						}else{
							alert("Information Not Updated!");
						}
					}
				}


				data = JSON.stringify(data);
				xhr.open('post', "{{Route('admin.update_media_info')}}", true);

				xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('[name=csrf-token]').content);
				xhr.send(`info=${data}`);
			});
		}
	</script>


	{{-- file upload process start --}}
	<script>
		/*file upload start-----------------------------------*/
			const inpFIle 		  = document.getElementById('inpFile'),
				  category_id 	  = document.getElementById('category_id'),
				  btnUpload 	  = document.getElementById('btnUpload'),
				  my_progress_bar = document.getElementById("my_progress_bar");

			inpFIle.addEventListener('input', function(){
				const xhr 	   = new XMLHttpRequest(),
					  formData = new FormData();

				formData.append('category_id', category_id.value);
				for(file of inpFile.files)
				{
					formData.append('myFiles[]', file);
				}

				if(formData.get("category_id")=="")
				{
					alert("Category Must Not be Empty!");
					return;
				}


				xhr.onreadystatechange = function()
				{
					if (this.readyState == 4 && this.status == 200) {
						if(this.responseText)
						{
							location.reload();
						}else{
							alert("File Not Uploaded !");
						}
					}
				};


				xhr.upload.addEventListener('progress', (event)=>{
					let loaded 	   = event.loaded,
						total  	   = event.total,
						percantage = (loaded/total)*100;

					my_progress_bar.innerText 	= `${percantage.toFixed(1)}%`;
					my_progress_bar.style.width = `${percantage}%`;
				});

				xhr.open("post", '{{ url('/my_image_processor.php') }}');
				xhr.send(formData);
			});
		/*file upload end-------------------------------------*/
	</script>
	{{-- file upload process end --}}


	{{-- media file delete start --}}
	<script>
		let delete_media_info_btn = document.getElementById("delete_media_info_btn"),
			media_file_id		  = document.getElementById("media_id");

		if(delete_media_info_btn)
		{
			delete_media_info_btn.addEventListener('click',function()
			{
				let xhr = new XMLHttpRequest();
				xhr.onreadystatechange = function(){
					if(this.readyState == 4 && this.status == 200)
					{
						if(this.responseText)
						{
							location.reload();
						}else{
							alert("File Not Deleted, Something Went Wrong!");
						}
					}
				}


				xhr.open('post', '{{ route('admin.delete_media_info') }}');
				xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('[name=csrf-token]').content);
				xhr.send('media_id='+media_file_id.value);
			});
		}
	</script>
	{{-- media file delete end --}}


	<script>
		function copyToClipBoard()
		{
			var copyText = document.getElementById("input_for_copy");
			copyText.select();
			copyText.setSelectionRange(0, 99999);
			document.execCommand("copy");
			alert("Copied the text: " + copyText.value);
		}
    </script>
@endpush