<header>
    <!-- top bar start here -->
    <div class="top_bar">
        <div class="container">
            <div class="left">
                <a href="#">Copyright <?php echo Date('Y'); ?></a>
                <a href="#">World</a>
                <a href="#">Latest News</a>
                <a href="#">Contact</a>
            </div>
            
            <div class="right">
                {{-- <span class="lang">
                    <span>English</span>
                </span> --}}

                <div class="social_link">
                    <a href="#">
                        <span class="icon">
                            <i class="fa fa-facebook"></i>
                        </span>
                    </a>
                    <a href="#">
                        <span class="icon">
                            <i class="fa fa-twitter"></i>
                        </span>
                    </a>
                    <a href="#">
                        <span class="icon">
                            <i class="fa fa-linkedin"></i>
                        </span>
                    </a>
                    <a href="#">
                        <span class="icon">
                            <i class="fa fa-youtube"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- top bar end here -->
    
    <!-- middle bar start here -->
    <div class="middle_bar">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}">
                <img src="{{ asset($header_logo) }}" width="39%" alt="Image not found">
            </a>

            <div class="top_right_ad">
                <img src="https://discussion.qodeinteractive.com/wp-content/uploads/2016/03/header-banner.jpg" alt="">
            </div>
        </div>
    </div>
    <!-- middle bar end here -->

    <!-- main navigation bar start -->
    <nav class="navigation_bar">
        <div class="container">
            <div class="left">
                <a href="{{ url('/') }}">Home</a>

                @if(count($categories))
                    @foreach($categories as $key => $value)
                        <a href="#">{{ $value->name }}</a>
                    @endforeach
                @endif
            </div>

            <div class="right">
                <button class="search_toggle">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
    </nav>
    <!-- main navigation bar end -->




























{{-- <header class="header-section">
    <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}">
                <img src="{{ asset($header_logo) }}" width="39%" alt="Image not found">
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
      
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="{{ url('/') }}">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about_us">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#pricing">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>


                    @if(\Auth::id())
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('user.dashboard') }}">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('user.logout') }}">Logout</a>
                        </li>
                    @else
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('user.register') }}">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('user.login') }}">Login</a>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>
</header> --}}














<?php /*
    <!-- Start Main Menu Area -->
    <nav class="navbar">
        <div class="max-width">
            <div class="logo">
                <a href="{{ url('/') }}">
                    {{-- <img src="{{ asset($header_logo) }}" alt=""> --}}
                    <span>247 BTC.</span>
                </a>
            </div>
            <ul class="menu">
                <li><a href="#home" class="menu-btn">Home</a></li>
                <li><a href="#about" class="menu-btn">About</a></li>
                <li><a href="#faq" class="menu-btn">FAQ</a></li>
                <li><a href="#contact" class="menu-btn">Spport</a></li>
                @if(!\Auth::id())
                    <li><a href="{{ Route('user.login') }}" class="menu-btn">Login</a></li>
                @else
                    <li>
                        <a
                            onclick="event.preventDefault();
                            document.getElementById('user_side_logout_form').submit();">
                            <span>Logout</span>
                        </a>
                        <form id="user_side_logout_form" action="{{ route('user.logout') }}" method="POST" style="display: none;">@csrf</form>
                    </li>
                @endif

                {{-- <li><a href="#services" class="menu-btn">Services</a></li>
                <li><a href="#skills" class="menu-btn">Skills</a></li>
                <li><a href="#testimonials" class="menu-btn">Testimonials</a></li> --}}
            </ul>

            <!-- Menu Toggler Button -->
            <div class="menu-btn">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </div>
        </div>
    </nav>
    <!-- End Main Menu Area -->

*/ ?>