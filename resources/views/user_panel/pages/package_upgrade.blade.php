@php	
	$current_package_price = \DB::table('package')->where(['user_id'=>\Auth::id()])->first();
@endphp

@extends('user_panel.master')
@section('content')
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif


    @if($current_package_price)
	    <div style="width: 100%;text-align: center;margin-top: 80px;">
	    	<h1>Our Plans</h1>
			<p>We have plans and prices that fit your business perfectly.</p>
	    </div>

		<div class="card_container">

			@if($current_package_price->price<25)
		        <!-- single card start   -->
		        <div class="single_card">
		            <div class="header">
		                {{-- <span class="slogan">Invision account for</span> --}}
		                <span class="package_name">BRONZE</span>
		            </div>
		        
		            <div class="body">
		                <span class="price">
		                    <sup>$</sup>
		                    {{(25-$current_package_price->price)}}
		                    {{-- <sub>/mo</sub> --}}
		                </span>
		        
		                <ul class="package_featur">
		                    <li><span class="txt">Daily max income 1 USD</span></li>
		                    <li><span class="txt">Minimum withdrawal amount 20 USD</span></li>
		                </ul>
		            </div>
		        
		            <div class="footer">
		                <a href="{{ route('user.package_upgrade_process', 'bronze') }}">
		                    <span class="text">Upgrade To This package</span>
		                    <span class="icon">
		                        <svg viewBox="0 0 451.846 451.847">
		                            <path
		                                d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744   L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284   c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z" />
		                        </svg>
		                    </span>
		                </a>
		            </div>
		        </div>
		        <!-- single card end   -->
	        @endif
	        


	        @if($current_package_price->price<50)
		        <!-- single card start   -->
		        <div class="single_card active">
		            <span class="popular">Popular</span>
		            <div class="header">
		                {{-- <span class="slogan">Invision account for</span> --}}
		                <span class="package_name">SILVER</span>
		            </div>
		        
		            <div class="body">
		                <span class="price">
		                    <sup>$</sup>
		                    {{(50-$current_package_price->price)}}
		                    {{-- <sub>/mo</sub> --}}
		                </span>
		        
		                <ul class="package_featur">
		                    <li><span class="txt">Daily max income 2 USD</span></li>
		                    <li><span class="txt">Minimum withdrawal amount 40 USD</span></li>
		                </ul>
		            </div>
		        
		            <div class="footer">
		                <a href="{{ route('user.package_upgrade_process', 'silver') }}">
		                    <span class="text">Upgrade To This package</span>
		                    <span class="icon">
		                        <svg viewBox="0 0 451.846 451.847">
		                            <path
		                                d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744   L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284   c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z" />
		                        </svg>
		                    </span>
		                </a>
		            </div>
		        </div>
		        <!-- single card end   -->
		    @endif


		    @if($current_package_price->price<150)
		        <!-- single card start   -->
		        <div class="single_card">
		            <div class="header">
		                {{-- <span class="slogan">Invision account for</span> --}}
		                <span class="package_name">GOLD</span>
		            </div>
		        
		            <div class="body">
		                <span class="price">
		                    <sup>$</sup>
		                    {{(150-$current_package_price->price)}}
		                    {{-- <sub>/mo</sub> --}}
		                </span>
		        
		                <ul class="package_featur">
		                    <li><span class="txt">Daily max income 5 USD</span></li>
		                    <li><span class="txt">Minimum withdrawal amount 100 USD</span></li>
		                </ul>
		            </div>
		        
		            <div class="footer">
		                <a href="{{ route('user.package_upgrade_process', 'gold') }}">
		                    <span class="text">Upgrade To This package</span>
		                    <span class="icon">
		                        <svg viewBox="0 0 451.846 451.847">
		                            <path
		                                d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744   L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284   c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z" />
		                        </svg>
		                    </span>
		                </a>
		            </div>
		        </div>
		        <!-- single card end   -->
		    @endif

	    </div>
	@else
		<div class="alert alert-warning">
			<a href="{{ Route('user.add_package') }}">
				Activate Your Account
			</a>
		</div>
	@endif
@endsection



<style>
	/* load google fonts */
	@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap');

	* {
	    box-sizing: border-box;
	}

	.right_side {
	    padding: 0;
	    margin: 0;
	    font-family: 'Roboto', sans-serif;

	    /*background-image: linear-gradient(rgb(224 255 2208), rgb(255 217 259));*/
	    background-repeat: no-repeat;
	    min-height: 100vh;
	}

	.card_container {
		margin: auto;
		margin-top: 50px;
		width: 70%;
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		gap: 40px;
	}

	@media all and (max-width: 768px){
		.card_container {
        	width: 100%;
		}
	}

	.card_container .single_card {
	    margin-top: 30px;
	    border: 1px solid green;
	    box-shadow: 0 0 4px #0001, 0 1px 25px #0001;
	    padding: 20px;
	    border-radius: 10px;
	    position: relative;
	    background-color: #fff;
	    border: 2px solid transparent;
	    user-select: none;
	    transition: 0.3s ease-in-out;
	}

	.card_container .single_card .popular {
	    position: absolute;
	    top: -1px;
	    left: 50%;
	    transform: translateX(-50%);
	    background-image: linear-gradient(180deg, #f49228, #ff6a00);
	    color: #fff;
	    box-shadow: 0 2px 6px #0003;
	    border-radius: 0 0 15px 15px;
	    padding: 6px 20px;
	}

	.card_container .single_card.active,
	.card_container .single_card:hover {
	    box-shadow: 0 0 10px #0001, 0 1px 35px #0002;
	    /*transform: scale(1.06);*/
	    transform-origin: 50% 100%;
	    border-color: rgb(255, 123, 0);
	}


	.card_container .single_card .header {
	    text-align: center;
	    padding: 30px 0 20px;
	}

	.card_container .single_card .header .slogan {
	    font-size: 14px;
	    color: #777;
	    display: block;
	}

	.card_container .single_card .header .package_name {
	    font-size: 18px;
	    font-weight: bold;
	    text-transform: uppercase;
	    color: #ff6a00;
	    letter-spacing: 1px;
	    padding: 15px 0;
	    display: block;
	}

	.card_container .single_card .body {
	    text-align: center;
	}

	.card_container .single_card .body .price {
	    font-size: 55px;
	    display: block;
	    color: #444;
	    padding-bottom: 15px;
	    border-bottom: 2px solid #3331;
	}

	.card_container .single_card .body .price sup,
	.card_container .single_card .body .price sub {
	    color: #aaa;
	    font-size: 40px;
	}

	.card_container .single_card .body .price sub {
	    font-size: 14px;
	}

	.card_container .single_card .body .package_featur {
	    text-align: left;
	    list-style: none;
	    padding-left: 55px;
	}

	.card_container .single_card .body .package_featur li {
	    position: relative;
	    padding: 10px 0;
	    color: #333;
	    font-size: 15px;
	}

	.card_container .single_card .body .package_featur li::after {
	    content: '';
	    display: inline-block;
	    width: 15px;
	    height: 15px;
	    background: linear-gradient(45deg, #ff4500, rgb(255, 68, 0));
	    box-shadow: 0 0 4px rgba(255, 68, 0, 0.4), 0 0 8px rgba(255, 68, 0, 0.5);
	    border-radius: 50%;

	    position: absolute;
	    top: 50%;
	    left: -30px;
	    transform: translateY(-50%);
	}

	.card_container .single_card .footer {
	    padding: 15px 0;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}

	.card_container .single_card .footer a {
	    text-decoration: none;
	    display: block;
	    border: 1px solid red;
	    border-radius: 30px;
	    color: #fff;
	    background-image: linear-gradient(45deg, #ff4500, rgb(255, 68, 0));
	    box-shadow: 0 2px 14px #4443, 0 0 0 4px rgba(255, 68, 0, 0.15);
	    position: relative;
	    width: 100%;
	    padding: 12px 15px;
	    transition: 0.2s ease-in-out;
	}

	.card_container .single_card .footer a:hover {
	    border-radius: 6px;
	    transform: scale(1.05);
	    box-shadow: 0 1px 4px #4445, 0 2px 14px #0004;
	}

	.card_container .single_card .footer a:active {
	    transform: scale(1);
	}


	.card_container .single_card .footer .icon {
	    display: inline-block;
	    position: absolute;
	    right: 0;
	    top: 50%;
	    transform: translate(-10%, -50%);
	    width: 35px;
	    height: 35px;
	    border-radius: 50%;
	    padding: 8px;
	    border: 1px solid #fffc;
	    background-image: linear-gradient(45deg, rgb(255, 136, 0), #ff4500);
	    box-shadow: 0 2px 6px #4442;
	    transition: 0.2s ease-in-out;
	}

	.card_container .single_card .footer .icon svg {
	    fill: #fff;
	    width: 100%;
	    height: 100%;
	}

	.card_container .single_card .footer a:hover .icon{
	    transform: translate(-40%, -50%) scale(0.9);
	}	
</style>


<script>
</script>