@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif
    
    <h1 class="title">Referral Balance</h1>

    @if(count($result))
    	<table>
    		<tr>
    			<th>SL</th>
    			<th>Date & Time</th>
    			<th>Amount</th>
    			<th>Activation Status</th>
    			<th>Action</th>
    		</tr>

    		@foreach($result as $key => $value)
	    		<tr>
	    			<td>{{ ++$key }}</td>
	    			<td>
	    				Date: {{ $value->date }}&nbsp;&nbsp;&nbsp;
	    				Time: <strong>{{ date("H:i:s", strtotime($value->time)) }}</strong>
	    			</td>
	    			<td>{{ $value->bonus_amount }}</td>
	    			<td>
	    				{!! ($value->activation_status==1) ? '<span style="color: #AED581;font-weight: bold;">Activated</span>' : '<span style="color: #FFC107;">Pending</span>' !!}
	    			</td>

	    			@if($value->activation_status == 1)
		    			<td>
		    				@if($value->activation_status && $value->main_balance_status == 0)
		    					<a href="{{ Route('user.refferal_balance_to_main_balance', $value->id) }}" class="transfar_link">
			    					Transfar To Main Balance
			    					<i class="fa fa-angle-right"></i>
			    				</a>
		    				@else
		    					Already Added To Main Balance
		    				@endif
		    			</td>
		    		@else
		    			<td>Your Referral Bonus Is Not Activated</td>
		    		@endif
	    		</tr>
    		@endforeach
    	</table>
	@else
		<div class="alert alert-warning">
			No Result Found!
		</div>
	@endif
@endsection



<style>
	.title{
		font-size: 26px;
		margin-bottom: 15px;
		padding: 15px;
		padding-bottom: 10px;
		border-bottom: 1px solid #fff2;
	}
	

	table{
		width: 100%;
	}

	table,tr,td,th{
		border: 1px solid #fff2;
	}

	td,th{
		padding: 10px;
	}

	.transfar_link{
		display: inline-block;
	    padding: 5px 15px;
	    background: #03A9F4;
	    color: #fff;
	    border-radius: 4px;
	    box-shadow: 0 2px 6px #000;
	    transition: 0.3s;
	}
	.transfar_link:hover{
	    color: #03A9F4;
	    background: #fff;
	}
</style>