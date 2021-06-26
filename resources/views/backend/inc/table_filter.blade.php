{{-- this man js filter --}}

@push('css')
	<style>
		.inputFilter{
			display: inline-block;
			padding: 6px 12px;
			border: 1px solid #e2dddd;
			font-size: 1rem;
			margin-left: 1rem;
			max-width: 400px;
			width: 100%;
			font-weight: 100;
		}
		@media all and (max-width: 768px){
			.inputFilter{
				margin-left: 0rem;
				margin-top: 1rem;
				width: 100%;
			}
		}
	</style>
@endpush
<input type="search" oninput="man_table_data_filter(this,'.table_filter')" placeholder="Search..." class="inputFilter">