@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif
    
    <h1 class="title">Conversion Transfered Report</h1>
	
	<div class="table_wraper table-responsive">
		<table class="table table-bordered">
			<tr>
				<th>SL</th>
				<th>Date</th>
				<th>Time</th>
				<th>User ID</th>
				<th>User Name</th>
				<th>User Country</th>
				<th>My Remark</th>
				<th>USD</th>
				<th>Bonus</th>
			</tr>
			<tr>
				<td>1</td>
				<td>20-12-20</td>
				<td>09:20:00</td>
				<td>125462</td>
				<td>Muhib116</td>
				<td>Bangladesh</td>
				<td>This test description for this balance transfar</td>
				<td>10</td>
				<td>2</td>
			</tr>
		</table>
	</div>
@endsection



<style>
	.title{
		font-size: 26px;
		margin-bottom: 15px;
		padding: 15px;
		padding-bottom: 10px;
		padding-left: 0px;
		border-bottom: 1px solid #fff2;
	}
	.table_wraper{
		width: 80%;
		overflow-x: auto;
	}

	.table-bordered td, .table-bordered th{
		border-color: #dee2e629 !important;
	}

	@media(max-width: 700px)
	{
		.table_wraper{
			width: 100%;
		}
	}
</style>