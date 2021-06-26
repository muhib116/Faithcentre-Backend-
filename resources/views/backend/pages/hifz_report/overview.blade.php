@extends('backend.master')
@section('headerTitle', 'Report Overview | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
		@include('backend.nav')
        <div class="heading">
			Report Overview
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				@include('backend.pages.report.inc.chart')
				@include('backend.pages.report.inc.all_teacher_student')

			</div>
		</div>
    </section>
@endsection


@push('css')
<style>
	th{
		white-space: nowrap;
	}
	ul,ol{
		padding-left: 25px;
	}
</style>
@endpush