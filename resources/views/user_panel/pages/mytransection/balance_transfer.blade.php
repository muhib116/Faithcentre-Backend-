@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif
    
    <h1 class="title">Balance Transfer</h1>
	<form action="{{ route('user.balance_transfer_process') }}" method="post" class="form_wraper">
		@csrf
		<div class="form-group">
			<label class="label-control">Transferable Balance</label>
			<input type="number" min="0" value="0" name="transferable_balance" class="form-control" placeholder="Transferable Balance" readonly>
		</div>

		<div class="form-group">
			<label class="label-control">Amount To Transfer</label>
			<input type="number" min="0" value="0" name="amount_to_transfer" class="form-control" placeholder="Amount To Transfer">
		</div>

		<div class="form-group">		
			<button class="btn btn-warning pull-right">
				Transfer <i class="fa fa-angle-right"></i>
			</button>
		</div>
	</form>
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

	@media(max-width: 700px)
	{
		.form_wraper{
			width: 100%;
		}
	}
</style>