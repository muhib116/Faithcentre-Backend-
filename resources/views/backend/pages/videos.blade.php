@extends('backend.master')
@section('headerTitle', 'Videos | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
			{!! msg($name='msg') !!}
			@if ($errors->any())
				{{ validation_msg($errors->all()) }}
			@endif
			<br>
			Videos
			<small class="items_found"> {{ count($result) }} item(s) found</small>
			{{-- @include('backend.inc.table_filter') --}}
		</div>
		
		<div>
			<div class="container_fluid">
				<form method="post" action="{{Route('admin.video_process')}}">
					@csrf
					<div class="form-group">
						<input type="url" name="video_code" class="form-control" placeholder="Enter video url or video code..." required>
					</div>

					<div class="form-group">
						<textarea class="form-control" name="details" placeholder="Enter Detail..." rows="5" required></textarea>
					</div>
					<button type="submit" class="btn btn-primary">Save</button>
				</form>
			</div>

			<div class="container_fluid">

				
				@if(count($result)>0)
					<div class="video_container">
						@foreach($result as $key => $value)
						<div class="video">
							<img src="https://i.ytimg.com/vi/{{ $value->video_code }}/hqdefault.jpg" data-videolink="https://www.youtube.com/embed/{{ $value->video_code }}" data-detail="{{ $value->details }}"  alt="" data-toggle="modal" data-target="#videoModal">
							<a href="{{ route('admin.video_delete', $value->id) }}" class="video_delete" onclick="return confirm('Are you sure to delete this?');">Delete</a>
						</div>
						@endforeach
					</div>
				@else
					<div class="alert alert-warning mt-4">
	                    <div class="icon">
	                        <i class="fa fa-info-circle" aria-hidden="true"></i>
	                    </div>
	                    <div>
	                        <div>
	                            <strong>
	                                Alert !
	                            </strong> <br>
	                        </div>
	                        <div>
	                            Data Not Found.
	                        </div>
	                    </div>
	                </div>
				@endif

			</div>
		</div>
    	<div class="footer"></div>
	</div>



	{{-- video modal start --}}
	<div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		    			<span aria-hidden="true">&times;</span>
		    		</button>
		    	</div>
		    	<div class="modal-body">
  					<div class="my_preloader"></div>
		    		<iframe src="" id="myIframe"></iframe>
		    	</div>
	    		<div class="col-12">
	    			<br>
	    			<p id="detail_box"></p>
	    		</div>
		    </div>
		</div>
	</div>
	{{-- video modal end --}}
@endsection

@push('css')
	<style>
		.video_container {
			margin-top: 30px;
		    display: grid;
		    grid-template-columns: repeat(auto-fit, minmax(200px,1fr));
		    gap: 1rem;
		}
		.video_container .video{
			position: relative;
			padding-bottom: 56%;
			box-shadow: 3px 5px 9px #00000061;
			cursor: pointer;
			overflow: hidden;
			transition: all 0.3s ease-in-out;
		}
		.video_container .video:hover{
			box-shadow: 3px 5px 15px #00000061;
			transform: scale(1.1);
		}
		.video_container .video img{
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			object-fit: cover;
			display: block;
		}
		.video_container .video .video_delete{
			position: absolute;
		    top: 0;
		    left: 0;
		    background: #ffffff9e;
		    display: block;
		    width: 85px;
		    color: #ff5522;
		    font-weight: bold;
		    padding: 5px;
		    font-size: 1.2rem;
		    backdrop-filter: blur(6px);
		    text-align: center;
		    border-radius: 0 0 5px 0;
		    box-shadow: 1px 1px 6px #0005;
		    z-index: 10;
		    text-decoration: none;
		    transition: all 0.2s ease-in-out;
		}
		.video_container .video .video_delete:hover{
			letter-spacing: 2px;
		}


		.modal-body{
			position: relative;
			padding-bottom: 53%;
		}
		#myIframe{
			border: none;
		    width: 100%;
		    height: 100%;
		    position: absolute;
		    top: 0;
		    left: 0;
		}


		.my_preloader{
		  position: absolute;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background: #0004;
		  backdrop-filter: blur(5px);
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}


		.my_preloader::after{
		    content: '';
		    width: 40px;
		    height: 40px;
		    display: block;
		    box-shadow: 0 2px 0 2px #fff, 0 0 0 4px #00a1ff;
		    border-radius: 50%;
		    animation: my_preloader 1s infinite linear both;
		}



		@keyframes my_preloader{
		  0%{
		    transform: rotate(0deg);
		  }
		  100%{
		    transform: rotate(360deg);
		  }
		}
	</style>
@endpush


@push('js')
	<script>
		window.addEventListener('click', function(event){
			if(event.target.matches('[data-videolink]'))
			{
				document.querySelector('.my_preloader').style.display = 'flex';
				myIframe.src = event.target.dataset.videolink;
				detail_box.innerHTML = event.target.dataset.detail;
				myIframe.addEventListener('load', ()=>{
					document.querySelector('.my_preloader').style.display = 'none';
				});
			}
		});
	</script>
@endpush