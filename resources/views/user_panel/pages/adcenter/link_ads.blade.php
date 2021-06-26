@extends('user_panel.master')
@section('content')
	@if(count($result)>0)
		<div class="link_container">
			@foreach($result as $key => $value)
			<a target="_blank" class="ads_link" href="{{$value->link}}" data-link_id="{{ $value->id }}">Visit: {{$value->link}}</a>
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
                    Currently Link is Not Available.
                </div>
            </div>
        </div>
	@endif
@endsection



@push('css')
	<style>
		.link_container a{
			border: 1px solid #ffac009c;
		    display: block;
		    width: 100%;
		    padding: 8px 15px;
		    color: #fff;
		    background: #fff1;
		    margin-bottom: 25px;
		    border-radius: 4px;
		    box-shadow: 0 2px 10px #000;
		    transition: 0.3s ease-in-out;
		    cursor: pointer;
		}
		.link_container a:hover{
			color: white;
		    background: #03A9F4;
		    border-color: #fff;
		}
	</style>
@endpush

<script>
	window.addEventListener('load', ()=>{
		let links = document.querySelectorAll('a.ads_link');
	    if(links)
	    {
	        links.forEach(link=>{
	            link.addEventListener('click', (event)=>
	            {
	                let link_id = link.dataset.link_id;

	                fetch(`{{ route('user.link_ad_hit_count') }}?user_id={{ \Auth::id() }}&link_id=${link_id}`)
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
	            });
	        })
	    }
	})
</script>
