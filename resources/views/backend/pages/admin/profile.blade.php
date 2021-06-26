@extends('backend.master')
@section('headerTitle', 'Admin\'s Profile | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.pages.admin.nav')
        <div class="heading">
            Admin's Profile
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				<div class="col-md-6 table_responsive">				
					@if(count($rows)==1)
						<img src="{{$rows[0]->path}}" alt="Profile Image" class="img-thumbnail" draggable="false" style="height: 100px;object-fit: cover;" />
						<br>
						<br>
						
						
						<table class="table table-bordered">
							<tr>
								<td width="150"><strong>Joyning Date</strong></td>
								<td>{{ date("Y-M-d h:i:s a",strtotime($rows[0]->created_at)) }}</td>
							</tr>

							<tr>
								<td width="150"><strong>Name</strong></td>
								<td>{{ $rows[0]->name }}</td>
							</tr>
							<tr>
							<tr>
								<td width="150"><strong>Admin Type</strong></td>
								<td>{{ $rows[0]->admin_type }}</td>
							</tr>
							<tr>
								<td width="150"><strong>Phone</strong></td>
								<td>{{ $rows[0]->phone }}</td>
							</tr>
							<tr>
								<td width="150"><strong>Email</strong></td>
								<td>{{ $rows[0]->email }}</td>
							</tr>
							<tr>
								<td width="150"><strong>Address</strong></td>
								<td>{{ $rows[0]->address }}</td>
							</tr>
						</table>
					@else
						<div class="alert">
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
									Data Not Found.
								</div>
							</div>
						</div>
					@endif

				</div>

			</div>
		</div>
    </section>
@endsection


@push('css')  
@endpush

@push('js')
@endpush