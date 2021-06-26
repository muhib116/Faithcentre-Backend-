@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif

	<form action="{{ Route('user.password_update_process') }}" method="Post" class="form_wraper" id="password_change_form">
		@csrf
		<div class="row">
			<div class="col-12">
				<div class="form-group">
					<label class="label-control">Current Password</label>
					<input type="password" name="current_password" class="form-control" placeholder="Current Password..." required >
				</div>
			</div>

			<div class="col-12">		
				<div class="form-group">
					<label class="label-control">New Password</label>
					<input type="password" name="new_password" id="new_password" value="" class="form-control" placeholder="New Password..." required >
					<span id="alert_msg"></span>
				</div>
			</div>

			<div class="col-12">		
				<div class="form-group">
					<label class="label-control">Confirm Password</label>
					<input type="password" name="confirm_password" id="confirm_password" value="" class="form-control" placeholder="Confirm Password..." required >
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
	    let new_password         = document.getElementById('new_password'),
	        confirm_password     = document.getElementById('confirm_password'),
	        alert_msg            = document.getElementById('alert_msg'),
	        password_change_form = document.getElementById('password_change_form');
	        
	    console.log(new_password, confirm_password, alert_msg, password_change_form);

	    if(new_password && confirm_password && alert_msg && password_change_form)
	    {
	        /*password and confirm password check start*/
	            confirm_password.addEventListener('input', function(){
	            	console.log('woring');
	                if(new_password.value === confirm_password.value)
	                {
	                    alert_msg.style.cssText = '';
	                    alert_msg.innerHTML     = '';
	                }else{
	                    alert_msg.style.cssText = 'color: #FF5722;font-size: 15px;display: block;width: 100%;';
	                    alert_msg.innerHTML     = 'Password and confirm password not matched!';
	                }
	            });
	        /*password and confirm password check end*/
	        
	        
	        /*validate the form by javascript start*/
	        password_change_form.addEventListener('submit', function(event)
	        {
	            if(new_password.value !== confirm_password.value){
	                event.preventDefault();
	                alert('Password and confirm password not matched!');
	            }
	        });
	        /*validate the form by javascript end*/
	    }
	});
</script>