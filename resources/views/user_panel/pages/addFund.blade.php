@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif

	<form action="{{ Route('user.add_fund_process') }}" method="Post" class="form_wraper" id="password_change_form">
		@csrf

		<div class="row">
			<div class="col-12">
				<div class="payment_rules">
					<h1>payment instructions</h1>
					<ol>
						<li>Scan The Code Or Copy The BTC Address From Below.</li>
						<li>Deposit From Your BTC Wallet.</li>
						<li>Transaction Charge (38148 Satoshi) Applicable.</li>
						<li>Submit Your Transection ID</li>
					</ol>
				</div>

				@if($result)
					<div class="qrCode">
						<img src="{{ asset('public/backend/img/btc/l/'.$result->path) }}" alt="">
					</div>
					<div class="btc_address">
						<input type="text" id="adminBTC" value="{{ $result->btc_address }}" class="form-control" >
						<span class="icon" onclick="copyToClipBoard()">
							<i class="fa fa-copy"></i>
						</span>
					</div>
				@endif
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<div class="form-group">
					<label class="label-control">Recharge Amount (USD)</label>
					<input type="number" min="1" name="amount" class="form-control" required >
				</div>
			</div>

			<div class="col-12">
				<div class="form-group">
					<label class="label-control">Your Transection ID</label>
					<input type="text" name="trx_id" class="form-control" placeholder="Your Transection ID..." required >
				</div>
			</div>

			<div class="col-12">		
				<button type="submit" class="btn btn-primary pull-right">Submit <i class="fa fa-angle-right"></i></button>
			</div>
		</div>
	</form>
@endsection



<style>
	.payment_rules{
		margin-bottom: 25px;
		padding: 15px;
	}
	.payment_rules h1{
		font-size: 22px;
	    color: #ffffffd9;
	    margin-bottom: 15px;
	    border-bottom: 1px solid #ffffff8a;
	    padding-bottom: 12px;
	    display: inline-block;
	}
	.payment_rules ol li{
		font-size: 16px !important;
		color: #fff9 !important;
	}

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

	.btc_address{
		display: flex;
		margin: 15px 0;
	}
	.btc_address input {
		border-radius: 0;
	}
	.btc_address .icon {
	    width: 47px;
	    color: #fff8;
	    font-size: 17px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    cursor: pointer;
	    border: 1px solid #fff5;
	    margin-left: 5px;
	}

	.qrCode{
		width: 200px;
		margin-bottom: 25px;
	}
	.qrCode img{
		width: 100%;
		box-shadow: 1px 2px 15px #ff4700;
    	border-radius: 10px;
	}
</style>


<script>
	function copyToClipBoard()
	{
		/* Get the text field */
		var copyText = document.getElementById("adminBTC");

		/* Select the text field */
		copyText.select();
		copyText.setSelectionRange(0, 99999); /* For mobile devices */

		/* Copy the text inside the text field */
		document.execCommand("copy");

		/* Alert the copied text */
		alert("Copied the text: " + copyText.value);
	}
</script>