@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif
    
	<form action="{{ route('user.profile_img_update_process') }}" method="post" class="form_wraper" enctype="multipart/form-data">
		@csrf
		<div class="prev_img">
			@if(\Auth::user()->img_name)
				<img src="{{ asset(\Auth::user()->img_name) }}" alt="">
			@else
				<img src="{{ asset('public/backend/images/svgicon/user1.svg') }}" alt="">
			@endif
		</div>

		<div class="row">
			<div class="col-12">
				<input type="file" name="profile_img" class="form-control">
			</div>
			<div class="col-12 mt-3">		
				<button class="btn btn-warning pull-right">
					Update <i class="fa fa-angle-right"></i>
				</button>
			</div>
		</div>
	</form>
@endsection



<style>
	.form_wraper{
		width: 50%;
		padding: 15px;
	}

	@media(max-width: 700px)
	{
		.form_wraper{
			width: 100%;
		}
	}

	.prev_img{
		max-width: 220px;
	    margin-bottom: 20px;
	    border: 4px solid #fff2;
	    padding: 10px;
	    background: #fff5;
	    box-shadow: 0 3px 8px #000;
	    border-radius: 5px;
	}
	.prev_img img{
		width: 100%;
	}
</style>