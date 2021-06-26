<div class="main_container">
	<div class="container">
		<div class="oops">
			<img src="{{ asset('public/frontend/images/svgicon/open-box.svg') }}">
		</div>
		<div class="msg">
			No Result Found
		</div>
	</div>
</div>


@push('css')
	<style>
		.main_container {
		  padding: 0;
		  background: #fff;
		}

		.oops{
			display: flex;
			align-items: center;
			justify-content: center;
			flex-wrap: wrap;
			padding: 100px 0 50px;
		}
		.oops img{
			display: block;
			max-width: 10rem;
			width: 100%;
		}
		.msg{
			color: #333;
			font-size: 1.5rem;
		    text-align: center;
		    padding-bottom: 70px;
		    line-height: 25px;
		    font-weight: bold;
		}
	</style>
@endpush