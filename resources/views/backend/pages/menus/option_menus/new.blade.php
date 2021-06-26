@extends('backend.master')
@section('headerTitle', 'Create New Option | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.pages.menus.option_menus.nav')
        <div class="heading">
            Create New Option
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif


				<form action="{{ route('admin.store_option_menu') }}" method="post">
					@csrf
					<div>
						<div class="col-lg-4 col-md-6 px-md-1 form-group pl-md-0">
							<select name="aside_menu_id" required class="form-control" id="aside_menu" onchange="get_aside_dropdown(this)">
								<option selected value="">-Select Aside Menu-</option>
								@if(count($aside_menu)>0)
									@foreach($aside_menu as $key => $value)
										<option value="{{ $value->id }}">{{ $value->name }}</option>
									@endforeach
								@endif
							</select>
						</div>

						<div class="col-lg-4 col-md-6 px-md-1 form-group pl-md-0">
							<select name="asidedropdown_menu_id" required class="form-control" id="aside_dropdown">
								<option selected value="">-Select Dropdown Menu-</option>
							</select>
						</div>

						<div class="col-lg-4 col-md-6 px-md-1 form-group pl-md-0">
							<input type="text" name="name" Placeholder="Option Menu Name... *" required class="form-control">
						</div>
						<div class="col-lg-4 col-md-6 px-md-1 form-group pl-md-0">
							<select name="type" class="form-control" required>
								<option selected value >-Select Option's Type- *</option>
								<option value="success">Success</option>
								<option value="info">Info</option>
								<option value="warning">Warning</option>
								<option value="danger">Danger</option>
								<option value="primary">Primary</option>
								<option value="secondary">Secondary</option>
							</select>
						</div>
						<div class="col-lg-4 col-md-6 px-md-1 form-group pl-md-0">
							<input type="text" name="route_name" Placeholder="Option Menu's Route Name... *" required class="form-control">
						</div>
						
						<div class="col-lg-4 col-md-6 form-group pl-0">
							<?php
								$svg_icon_directory = 'public/backend/images/svgicon';
								$icons = scandir($svg_icon_directory);
							?>
							<div class="svg_icon_wrapper">
								<input type="hidden" name="icon" required class="icon_input form-control">
								<div class="selected_icon">-Select Icon-</div>
								<ul class="icon_list">
									<li style="background: #fff;">
										<input type="search" class="icon_search" placeholder="Search Icon...">
									</li>
									@if($icons)
										@foreach($icons as $key => $value)
											@if($key>=2)
												<li class="icon_li" data-icon_name="{{ $value }}">
													<span class="img">
														<img src="{{ asset('public/backend/images/svgicon/'.$value) }}" alt="">
													</span>
													<span class="name">{{ ucwords(str_replace('_',' ',str_replace('.svg', '', $value))) }}</span>
												</li>
											@endif
										@endforeach
									@endif
								</ul>
							</div>
							{{-- <input type="text" name="icon" Placeholder="Fontawesome Icon's Name (fa fa-*)... *" required class="form-control"> --}}
						</div>

						<div class="col_12 px-md-1">
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
		.svg_icon_wrapper{
			position: relative;
			perspective: 1200px;
			z-index: 5;
		}
		.svg_icon_wrapper .icon_search{
			border: 1px solid #efefef;
			display: block;
			width: 100%;
			padding: 7px 10px;
		}
		.svg_icon_wrapper .selected_icon{
			border: 1px solid red;
			border: 1px solid #efefef;
			display: block;
			width: 100%;
			padding: 7px 10px;
			
			display: flex;
    		align-items: center;
		}
		.svg_icon_wrapper .selected_icon .img,
		.svg_icon_wrapper .selected_icon .name{
			display: block;
		}
		.svg_icon_wrapper .selected_icon .img{
			margin-right: 12px;
			width: 25px;
		}
		.svg_icon_wrapper .selected_icon .img img{
			display: block;
    		width: 100%;
		}
		.svg_icon_wrapper .icon_list{
			background: #fff;
			box-shadow: 1px 3px 6px #3332;
			height: 40vh;
			overflow-y: auto;
			position: absolute;
			width: 100%;
			z-index: 5;
			margin-top: -1px;
			transform-origin: 50% 0;
			transform: rotateX(-90deg);
			backface-visibility: hidden;
			opacity: 0;
			transition: all 0.3s ease-in;
		}
		.svg_icon_wrapper .icon_list.active{
			opacity: 1;
			transform: rotateX(0deg);
		}
		.svg_icon_wrapper .icon_list li{
			display: flex;
			align-items: center;
			padding: 15px 8px;
			border: 1px solid #eee;
			margin-bottom: -1px;
			cursor: pointer;
			transition: all 0.2s ease-in;
		}
		.svg_icon_wrapper .icon_list li.active,
		.svg_icon_wrapper .icon_list li:hover{
			background: #efefef;
		}
		.svg_icon_wrapper .icon_list li .img{
			display: block;
			width: 25px;
    		margin-right: 12px;
		}
		.svg_icon_wrapper .icon_list li .img img{
			display: block;
			width: 100%;
		}
		.svg_icon_wrapper .icon_list li .name{
			color: #333;
			transition: all 0.2s ease;
		}
	</style>
@endpush


@push('js')
	<script>
		function get_aside_dropdown(x){
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange=function() {
				if (this.readyState == 4 && this.status == 200) {
					var aside_dropdown_result = this.responseText,
						options        = '<option selected value="">-Select Dropdown Menu-</option>';
					if(aside_dropdown_result!=0){
						aside_dropdown_result = JSON.parse(aside_dropdown_result);
						aside_dropdown_result = Array.isArray(aside_dropdown_result) ? aside_dropdown_result : Object.value(aside_dropdown_result);

						aside_dropdown_result.forEach(function(single_aside_dropdown_result){
							options += '<option value="'+single_aside_dropdown_result.id+'">'+single_aside_dropdown_result.name+'</option>';
						});
						aside_dropdown.innerHTML = options;
					}
				}
			};
			xhttp.open("GET", "{{ route('admin.getDropdownMenuByAjax') }}?aside_menu_id="+x.value, true);
			xhttp.send();
		}
	</script>


	<script>
		// icon selection start
		var selected_icon = document.querySelector('.selected_icon');
		if(selected_icon){
			selected_icon.addEventListener('click', function(){
				this.nextElementSibling.classList.toggle('active');
			});
		}


		var icon_search    = document.querySelector('.icon_search'),
			icon_input 	   = document.querySelector('.icon_input'),
			icon_li 	   = document.querySelectorAll('.icon_li');
		
		if(icon_li)
		{
			icon_li = Array.isArray(icon_li) ? icon_li : Object.values(icon_li);

			icon_li.forEach(function(_single_icon_li){
				_single_icon_li.addEventListener('click', function() 
				{
					remove_active_class_from_single_li();
					
					_single_icon_li.classList.add('active');
					selected_icon.innerHTML = _single_icon_li.innerHTML;
					icon_input.value = _single_icon_li.dataset.icon_name;
					selected_icon.nextElementSibling.classList.toggle('active');
				});
			});
		}


		function remove_active_class_from_single_li(){
			var icon_li_active = document.querySelectorAll('.icon_li.active');

			if(icon_li_active){
				icon_li_active = Array.isArray(icon_li_active) ? icon_li_active : Object.values(icon_li_active);
				icon_li_active.forEach(function(single_icon_li){
					single_icon_li.classList.remove('active');
				});
			}
		}


		if(icon_search){
			icon_search.addEventListener('input', function(){
				
			});
		}
	</script>
@endpush