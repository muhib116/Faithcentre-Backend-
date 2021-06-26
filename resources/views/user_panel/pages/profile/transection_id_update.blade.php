@php
	$user_info = \DB::table('users')->where(['id'=>\Auth::id()])->first();
@endphp


@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif

	<form action="{{ Route('user.transection_id_update_process') }}" method="Post" class="form_wraper" id="transection_id_change_form">
		@csrf
		<div class="row">
			<div class="col-12">
				<div class="form-group">
					<label class="label-control">Current Transection ID</label>
					<input type="transection_id" name="current_transection_id" value="{{ $user_info ? $user_info->trx_pin : '' }}" class="form-control" placeholder="Current Transection ID..." required >
				</div>
			</div>

			<div class="col-12">		
				<div class="form-group">
					<label class="label-control">New Transection ID</label>
					<input type="transection_id" name="new_transection_id" id="new_transection_id" value="" class="form-control" placeholder="New Transection ID..." required >
					<span id="alert_msg"></span>
				</div>
			</div>

			<div class="col-12">		
				<div class="form-group">
					<label class="label-control">Confirm Transection ID</label>
					<input type="transection_id" name="confirm_transection_id" id="confirm_transection_id" value="" class="form-control" placeholder="Confirm Transection ID..." required >
				</div>
			</div>

			<div class="col-12">		
				<button class="btn btn-warning pull-right">Update <i class="fa fa-angle-right"></i></button>
			</div>
		</div>
	</form>
@endsection



<style>
	.form_wraper{
		width: 60%;
		padding: 15px;
	}

	@media(max-width: 1000px)
	{
		.form_wraper{
			width: 100%;
		}
	}
</style>


<script>
	window.addEventListener('load', function()
	{
	    let new_transection_id         = document.getElementById('new_transection_id'),
	        confirm_transection_id     = document.getElementById('confirm_transection_id'),
	        alert_msg            = document.getElementById('alert_msg'),
	        transection_id_change_form = document.getElementById('transection_id_change_form');
	        
	    console.log(new_transection_id, confirm_transection_id, alert_msg, transection_id_change_form);

	    if(new_transection_id && confirm_transection_id && alert_msg && transection_id_change_form)
	    {
	        /*transection_id and confirm transection_id check start*/
	            confirm_transection_id.addEventListener('input', function(){
	            	console.log('woring');
	                if(new_transection_id.value === confirm_transection_id.value)
	                {
	                    alert_msg.style.cssText = '';
	                    alert_msg.innerHTML     = '';
	                }else{
	                    alert_msg.style.cssText = 'color: #FF5722;font-size: 15px;display: block;width: 100%;';
	                    alert_msg.innerHTML     = 'Transection ID and Confirm Transection ID not Matched!';
	                }
	            });
	        /*transection_id and confirm transection_id check end*/
	        
	        
	        /*validate the form by javascript start*/
	        transection_id_change_form.addEventListener('submit', function(event)
	        {
	            if(new_transection_id.value !== confirm_transection_id.value){
	                event.preventDefault();
	                alert('Transection ID and Confirm Transection ID not Matched!');
	            }
	        });
	        /*validate the form by javascript end*/
	    }
	});
</script>