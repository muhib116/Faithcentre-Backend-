@extends('backend.master')
@section('headerTitle', 'All Admin | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.pages.admin.nav')
        <div class="heading">
            All Admin
			<small class="items_found"> {{ count($rows) }} item(s) found</small>
			@include('backend.inc.table_filter')
		</div>
		
		<div>
			<div class="container_fluid">
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif
				<div class="table-responsive">
					{!! msg($name='msg') !!}
					
					@if(count($rows)>0)
					<table class="table table-bordered">
						<tr>
							<th width="30px">SL</th>
							<th width="80">Photo</th>
							<th>Name</th>
							<th>Email</th>
							<th>Admin Type</th>
							<th>Phone</th>
							<th width="{{ (Auth::user()['admin_type']==='president') ? '155' : '112' }}">Options</th>
						</tr>

						@foreach($rows as $key => $row)
							@if($row->admin_type!='president')
								<tr>
									<td>{{ $key+1 }}</td>
									<td>
										@if($row && !empty($row->path) && file_exists($row->path))
											<img src="{{$row->path}}" alt="Profile Image" draggable="false" style="height:50px !important;"></td>
										@else
											<img src="{{ asset('public/backend/images/img_not_found.webp') }}" alt="Profile Image" draggable="false" style="width:80px !important;"></td>
										@endif
									<td>{{ $row->name }}</td>
									<td>{{ $row->email }}</td>
									<td>{{ ucfirst(str_replace('_', ' ', $row->admin_type)) }}</td>
									<td>{{ $row->phone }}</td>
									<td>
										<div class="m_0">
											<a 
												class="btn btn-success" 
												onclick="event.preventDefault();
												document.getElementById('admin_profile_{{ $row->id }}').submit();"
											>
												<i class="fa fa-eye"></i>
											</a>
											<form id="admin_profile_{{ $row->id }}" action="{{ route('admin.admin_view') }}" method="POST" style="display: none;">
												@csrf
												<input type="" value="{{ $row->id }}" name="id">
											</form>

											@if(Auth::user()['admin_type']==='president' or Auth::user()['email']===$row->email)
												<a href="{{ route('admin.admin_edit', [$row->id]) }}" class="btn btn-warning">
													<i class="fa fa-pencil"></i>
												</a>
											@endif

											@if(Auth::user()['admin_type']==='president')
												<button 
													class="btn btn-danger"
													onclick="if(confirm('Are you sure to delete this ?')){this.nextElementSibling.submit();}else{return false;}" 
												>
													<i class="fa fa-trash"></i>
												</button>
												<form action="{{ route('admin.admin_delete', [$row->id]) }}" method="post" style="display: none;">
													@csrf
												</form>
											@endif
										</div>
									</td>
								</tr>
							@endif
						@endforeach
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