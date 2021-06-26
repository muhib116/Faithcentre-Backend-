@extends('backend.master')
@section('headerTitle', 'Edit FAQ | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Edit FAQ
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				<form action="{{ route('admin.update_process_faq', $result->id).get_system() }}" method="post" enctype="multipart/form-data">
					@csrf
					<div class="col-lg-8 col-12">

						<div class="form-group">
							<label class="label-control">Title *</label>
							<input type="text" name="name" value="{{ $result->name }}" required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Detail *</label>
							<textarea name="detail" required class="form-control" rows="5">{{ $result->detail }}</textarea>
						</div>

						<input type="submit" class="btn btn-primary" value="Update">
					</div>
					
				</form>

			</div>
		</div>
    </section>
@endsection



@push('css')
	<style>
		.cke_contents.cke_reset{
			height: 400px !important;
		}
	</style>
@endpush


@push('js')
	<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
	<script>
        CKEDITOR.replace( 'detail' );
    </script>
@endpush