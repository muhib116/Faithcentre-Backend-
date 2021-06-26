@extends('backend.master')
@section('headerTitle', 'Create New Page | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
            Create New Page
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				<form action="{{ route('admin.save_new_pages').get_system() }}" method="post" enctype="multipart/form-data">
					@csrf
					<div class="col-lg-8 col-12">

						<div class="form-group">
							<label class="label-control">Page Name</label>
							<input type="text" name="name" required class="form-control">
						</div>

						<div class="form-group">
							<label class="label-control">Page</label>
							<textarea name="page" required class="form-control" rows="5"></textarea>
						</div>

						<div class="form-group">
							<label class="label-control">Meta Description</label>
							<textarea name="meta_description" required class="form-control" rows="5"></textarea>
						</div>

						<input type="submit" class="btn btn-primary" value="Create">
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
        CKEDITOR.replace( 'page' );
    </script>
@endpush