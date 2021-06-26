@php
	// get user activated package
	$package 		= \DB::table('package')->where(['user_id'=>\Auth::id()])->first();
	$withdraw_limit = 0;

	if($package)
	{
		switch ($package->package_name) {
	        case 'bronze':
	            $withdraw_limit = 20;
	            break;
	        case 'silver':
	            $withdraw_limit = 40;
	            break;
	        case 'gold':
	            $withdraw_limit = 100;
	            break;
	        
	        default:
	            set_msg('Your Selected Package is Not Valid!', 'danger');
	            break;
	    }
	}


	// get user account balance
	$balance = \DB::table('balance')->where(['user_id'=>\Auth::id()])->first();
@endphp

@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif
    
    <h1 class="title">Withdraw Balance</h1>

    @if($withdraw_limit && $balance && $balance->amount>=$withdraw_limit)
		<form action="{{ route('user.balance_withdraw_process') }}" method="post" class="form_wraper">
			@csrf

			<div class="alert alert-warning">
				<strong>Minimum Withdraw Limit: {{ $withdraw_limit }}USD</strong>
			</div>

			<div class="form-group">
				<label class="label-control">Withdrawable Balance (USD)</label>
				<input type="number" min="{{ $withdraw_limit }}" value="{{ ($balance) ? $balance->amount : 0 }}" step="any" name="withdrawable_balance" class="form-control" placeholder="Withdrawable Balance" readonly required>
			</div>

			<div class="form-group">
				<label class="label-control">Withdrawable Type</label>
				<select name="withdraw_type" class="form-control" required>
					<option value="regular">Regular</option>
					<option value="fast">Fast</option>
					<option value="instant">Instant</option>
				</select>
			</div>

			<div class="form-group">
				<label class="label-control">Amount To Withdraw (USD)</label>
				<input type="number" min="{{ $withdraw_limit }}" step="any" value="0" name="amount_to_widthdraw" class="form-control" placeholder="Amount To Withdraw" required>
			</div>

			<div class="form-group">
				<label class="label-control">Coinbase Email/BTC Address</label>
				<input name="wallet_address" class="form-control" placeholder="Your Coinbase Email/BTC Address" required>
			</div>

			<div class="form-group">		
				<button class="btn btn-warning pull-right">
					Withdraw <i class="fa fa-angle-right"></i>
				</button>
			</div>
		</form>
	@else
		<div class="alert alert-warning">
			You are not eligible for withdrawals.
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
	.form_wraper{
		width: 50%;
		padding: 15px;
	}

	.alert-successfully{
		background: #e8f5e9;
	}

	@media(max-width: 700px)
	{
		.form_wraper{
			width: 100%;
		}
	}
</style>