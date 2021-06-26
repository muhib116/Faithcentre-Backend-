@extends('user_panel.master')
@section('content')
	
	<div class="dashboard_box_container">
	   <!------------------------------------------------------------>
	   <div class="db-box">
	      <div class="icon">
	         <i class="fa fa-university"></i>
	      </div>
	      <div>
	         <h3>${{ $balance }}</h3>
	         <small>Current Balance</small>
	      </div>
	   </div>
	   <!------------------------------------------------------------>
	   <!------------------------------------------------------------>
	   <div class="db-box">
	      <div class="icon">
	        <i class="fa fa-money"></i>
	      </div>
	      <div>
	         <h3>${{ $diposit }}</h3>
	         <small>Diposit</small>
	      </div>
	   </div>
	   <!------------------------------------------------------------>
	   <!------------------------------------------------------------>
	   <div class="db-box">
	      <div class="icon">
	         <i class="fa fa-paper-plane"></i>
	      </div>
	      <div>
	      	@php
	      		$package = \DB::table('package')->where(['user_id'=>\Auth::id()])->first();
	      	@endphp
			<h3>{{ $package ? ucwords($package->package_name) : 'N/A' }}</h3>
			<small>Activated Package</small>
	      </div>
	   </div>
	   <!------------------------------------------------------------>
	   <!------------------------------------------------------------>
	   <div class="db-box">
	      <div class="icon">
	         <i class="fa fa-money"></i>
	      </div>
	      <div>

	      	@php
	      		$ads_income = \DB::table('ads_earning')->where(['user_id'=>\Auth::id()])->first();
	      	@endphp
	        <h3>{{ ($ads_income) ? $ads_income->amount : 0 }} USD</h3>
	        <small>Ads Income</small>

	        <a href="{{ Route('user.ad_blance_to_main_balance') }}">Add To Main Balance</a>
	      </div>
	   </div>
	   <!------------------------------------------------------------>
	</div>

	<br>
	<div class="refferal_link">
		<strong>Referral Link</strong>&nbsp; &nbsp;
		<input type="url" value="{{ url('user/register') }}?sponsore_id={{ \Auth::user()->user_id }}" id="input_for_copy" onfocus="copyToClipBoard()">
	</div>


	



	{{-- modal box start here --}}
	@php
		$modal_offer = \DB::table('modal_offer')->first();
	@endphp
	@if($modal_offer)
		<!-- Modal -->
		<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">{{ $modal_offer->title }}</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        {!! $modal_offer->description !!}
		      </div>
		    </div>
		  </div>
		</div>
	@endif
	{{-- modal box end here --}}
@endsection


<style>
	.refferal_link{
		display: flex;
		align-items: center;
	}
	input[type="url"] {
	    padding: 10px 15px;
	    display: block;
	    width: 100%;
	    max-width: 600px;
	    border-radius: 3px;
	}
</style>



<link rel="stylesheet" href="{{ asset('public/userpanel/css/dashboard.css') }}">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(window).on('load',function(){
        $('#myModal').modal('show');
    });
</script>

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