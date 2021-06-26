@extends('user_panel.master')
@section('content')
	@if(count($result)>0)
		<div class="video_container">
			@foreach($result as $key => $value)
			<div class="video">
				<img src="https://i.ytimg.com/vi/{{ $value->video_code }}/hqdefault.jpg" data-videolink="https://www.youtube.com/embed/{{ $value->video_code }}" data-detail="{{ $value->details }}" data-videoid="{{ $value->id }}" alt="" data-toggle="modal" data-target="#videoModal">
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
                    Currently Video is Not Available.
                </div>
            </div>
        </div>
	@endif


	{{-- video modal start --}}
	<div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		    <div class="modal-content">
		    	<div class="modal-header" id="modal_header">
		    		<div class="d-flex align-items-center">
			    		<div id="modal_msg"></div>

			    		<div class="d-flex">
				    		<input type="number" id="verify_ad" class="form-control" style="border-color: #53535357 !important;">
				    		<button class="ml-4 btn btn-primary" id="verify_ad_btn">Verify Now</button>
				    	</div>
				    </div>

		    		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		    			<span aria-hidden="true">&times;</span>
		    		</button>
		    	</div>
		    	<div class="modal-body">
  					<div class="my_preloader"></div>
		    		<iframe src="" id="myIframe"></iframe>
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
		    grid-template-columns: repeat(auto-fit, minmax(300px,1fr));
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


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<script>
	window.addEventListener('click', function(event)
	{
		let video_verification_code = Math.floor(Math.random() * 100)+999,
			timeout_milisecond      = Math.floor(Math.random() * 9000)+9999,
			modal_msg 				= document.getElementById("modal_msg");
			modal_msg.innerHTML 	= '';

		if(event.target.matches('[data-videolink]'))
		{
			document.querySelector('.my_preloader').style.display = 'flex';
			myIframe.src = event.target.dataset.videolink+'?autoplay=1';

			document.getElementById("verify_ad_btn").setAttribute('data-id', event.target.dataset.videoid);

			myIframe.addEventListener('load', ()=>
			{
				let timeout_id = setTimeout(()=>
				{
					modal_msg.innerHTML = `<span class="alert alert-success">This Video Verification Code: ${video_verification_code}</span>`;
					setTimeout(()=>{
						modal_msg.innerHTML = '';
					}, timeout_milisecond+500);

					// set verification code to session for global access
					sessionStorage.video_verification_code = video_verification_code;


					clearTimeout(timeout_id);
				},timeout_milisecond);


				document.querySelector('.my_preloader').style.display = 'none';
			});
		}

	});
</script>


<script>
	document.addEventListener('visibilitychange', (event)=>{location.reload();});

	window.addEventListener('load', function()
	{
		let verify_ad_btn 	= document.getElementById("verify_ad_btn"),
			verify_ad_input = document.getElementById("verify_ad");

		if(verify_ad_btn && verify_ad_input)
		{
			verify_ad_btn.addEventListener('click', function(){
				if(verify_ad_input.value == sessionStorage.video_verification_code)
				{
					let id = this.dataset.id;

	                fetch(`{{ route('user.link_ad_hit_count') }}?user_id={{ \Auth::id() }}&video_id=${id}`)
	                .then(response => response.text())
	                .then(data => {
	                    /*if(data==0)
	                    {
	                        alert('Already Hited!');
	                    }else{
	                        alert('New Hited!');
	                    }*/

	                    location.reload();
	                });
				}else{
					alert("This code is not valid.");
				}
			});
		}
	})
</script>