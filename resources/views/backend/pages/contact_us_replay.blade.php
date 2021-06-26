@extends('backend.master')
@section('headerTitle', 'User Contact\'s Replay | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            User Contact's Replay
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				@if($result)
					<form action="{{ route('admin.contact_us_replay_process').get_system() }}" method="post" enctype="multipart/form-data">
						@csrf
						<div class="col-lg-7 col-12">
							<div class="form-group">
								<label class="label-control">User's Email</label>
								<input type="email" value="{{ $result->email }}" name="send_to" readonly required class="form-control">
							</div>

							<div class="form-group">
								<label class="label-control">Subject</label>
								<input type="text" value="{{ $result->subject }}" readonly required class="form-control">
							</div>

							<div class="form-group">
								<label class="label-control">Details</label>
								<textarea readonly required class="form-control" rows="5">{{ $result->details }}</textarea>
							</div>

							<div class="form-group">
								<label class="label-control">Your Subject</label>
								<input type="text" name="subject" required class="form-control">
							</div>

							<div class="form-group">
								<label class="label-control">Your Email</label>
								<select class="form-control" name="send_from">
									<option value="" selected>-Select your email-</option>
									@foreach(admin_mail_list() as $key)
										<option value="{{ $key }}">{{ $key }}</option>
									@endforeach
								</select>
							</div>

							<div class="form-group">
								<label class="label-control">Replay</label>
								<textarea name="replay" required class="form-control" rows="5" placeholder="Write Your Replay..."></textarea>
							</div>
							<br>
							
							<input type="submit" class="btn btn-primary" value="Replay">
						</div>
					</form>
				@else
					<div class="alert alert-warning">
						Result Not Found !
					</div>
				@endif

			</div>
		</div>
    </section>
@endsection



@push('css')
@endpush


@push('js')
	<script src="https://cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
	<script>CKEDITOR.replace( 'replay' );</script>
@endpush