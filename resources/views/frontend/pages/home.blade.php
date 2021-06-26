@extends('frontend.master')
@section('content')
    
    {!! msg() !!}

 	@include('frontend.inc.top_header')

    <!-- main body section start -->
    <main class="main_body_section">
        <!-- card news section start -->
        <div class="card_news_section">
            <div class="container">
                <div class="section_devider" style="background-image: url('img/title_pattern.png');">
                    <div class="left">
                        <span>Lifestyle</span>
                    </div>
                    <div class="right">
                        <button class="left">
                            <i class="fa fa-angle-left"></i>
                        </button>
                        <button class="right">
                            <i class="fa fa-angle-right"></i>
                        </button>
                    </div>
                </div>

                <div class="content">

                    <div class="single_content">
                        <div class="category">
                            <a href="#" rel="Category Tag">
                                World
                            </a>
                        </div>
                        <div class="image">
                            <img src="img/news/m/2.jpg" alt="">
                        </div>

                        <div class="news_caption">
                            <h4 class="news_title">
                                <a href="#">
                                    Mustang Teases With A New Promo
                                </a>
                            </h4>
                            <a class="date" href="#">
                                <i class="icon fa fa-calendar-o"></i>
                                18, February 2021
                            </a>
                        </div>

                        <a href="#" class="positioned_link"></a>
                    </div>

                    <div class="single_content">
                        <div class="category">
                            <a href="#" rel="Category Tag">
                                Sport
                            </a>
                        </div>
                        <div class="image">
                            <img src="img/news/m/1.jpg" alt="">
                        </div>

                        <div class="news_caption">
                            <h4 class="news_title">
                                <a href="#">
                                    Surfs Up - Places For Killer Waves
                                </a>
                            </h4>
                            <a class="date" href="#">
                                <i class="icon fa fa-calendar-o"></i>
                                18, February 2021
                            </a>
                        </div>

                        <a href="#" class="positioned_link"></a>
                    </div>

                    <div class="single_content">
                        <div class="category">
                            <a href="#" rel="Category Tag">
                                Fashion
                            </a>
                        </div>
                        <div class="image">
                            <img src="img/news/m/3.jpg" alt="">
                        </div>

                        <div class="news_caption">
                            <h4 class="news_title">
                                <a href="#">
                                    Learn How To Nail Your Favorite Look
                                </a>
                            </h4>
                            <a class="date" href="#">
                                <i class="icon fa fa-calendar-o"></i>
                                18, February 2021
                            </a>
                            </div>
                            
                            <a href="#" class="positioned_link"></a>
                    </div>

                    <div class="single_content">
                        <div class="category">
                            <a href="#" rel="Category Tag">
                                Fun
                            </a>
                        </div>

                        <div class="image">
                            <img src="img/news/m/4.jpg" alt="">
                        </div>

                        <div class="news_caption">
                            <h4 class="news_title">
                                <a href="#">
                                    Music Playing On R&B Stations
                                </a>
                            </h4>
                            <a class="date" href="#">
                                <i class="icon fa fa-calendar-o"></i>
                                18, February 2021
                            </a>
                        </div>

                        <a href="#" class="positioned_link"></a>
                    </div>

                </div>
            </div>
        </div>
        <!-- card news section end -->

        <!-- popular section start -->
        <div class="popular_section_start">
            <div class="container">

                <div class="left_section">
                    <div class="section_devider" style="background-image: url('img/title_pattern.png');">
                        <div class="left">
                            <span>Lifestyle</span>
                        </div>
                        <div class="right">
                            <button>Music</button>
                            <button>Health</button>
                            <button>Gaming</button>
                            <button>Fashion</button>
                        </div>
                    </div>

                    <div class="popular_news_section">
                        <div class="left_part">
                            <div class="single_content">
                                <div class="category">
                                    <a href="#" rel="Category Tag">
                                        World
                                    </a>
                                </div>
                                <div class="image">
                                    <img src="https://discussion.qodeinteractive.com/wp-content/uploads/2016/02/what-we-should-really-be-playing-on-rnb-stations-767x337.jpg" alt="">
                                </div>
                            
                                <div class="news_caption">
                                    <h4 class="news_title">
                                        <a href="#">
                                            Mustang Teases With A New Promo
                                        </a>
                                    </h4>
                                    <a class="date" href="#">
                                        <i class="icon fa fa-calendar-o"></i>
                                        18, February 2021
                                    </a>
    
                                    <p class="news">
                                        Lorem ipsum dolor sit amet, consec adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis Theme
                                        natoque penatibus et magnis dis...
                                    </p>
                                </div>
                                
                                <div class="footer_part">
                                    <span>
                                        <span class="icon">
                                            <i class="fa fa-share-square-o"></i>
                                        </span>
                                        <span class="text">Share</span>
                                    </span>
                                    <span>
                                        <span class="icon">
                                            <i class="fa fa-comments"></i>
                                        </span>
                                        <span class="text">0 Comments</span>
                                    </span>
                                    <span>
                                        <span class="icon">
                                            <i class="fa fa-eye"></i>
                                        </span>
                                        <span class="text">956245 Views</span>
                                    </span>
                                </div>

                                <a href="#" class="positioned_link"></a>
                            </div>
                        </div>

                        <div class="right_part">
                            <div class="single_content">
                                <div class="image">
                                    <img src="https://discussion.qodeinteractive.com/wp-content/uploads/2016/02/how-to-organize-the-best-bridal-party-ever-117x84.jpg" alt="">
                                </div>
                            
                                <div class="news_caption">
                                    <h4 class="news_title">
                                        <a href="#">
                                            Mustang Teases With A New Promo
                                        </a>
                                    </h4>
                                    <a class="date" href="#">
                                        <i class="icon fa fa-calendar-o"></i>
                                        18, February 2021
                                    </a>
                                </div>
                            
                                <a href="#" class="positioned_link"></a>
                            </div>

                            <div class="single_content">
                                <div class="image">
                                    <img src="https://discussion.qodeinteractive.com/wp-content/uploads/2016/02/proof-that-beauty-is-in-the-eye-of-the-beholder-117x84.jpg" alt="">
                                </div>
                            
                                <div class="news_caption">
                                    <h4 class="news_title">
                                        <a href="#">
                                            Mustang Teases With A New Promo
                                        </a>
                                    </h4>
                                    <a class="date" href="#">
                                        <i class="icon fa fa-calendar-o"></i>
                                        18, February 2021
                                    </a>
                                </div>
                            
                                <a href="#" class="positioned_link"></a>
                            </div>

                            <div class="single_content">
                                <div class="image">
                                    <img src="https://discussion.qodeinteractive.com/wp-content/uploads/2016/02/the-music-festivals-you-dont-want-to-miss-117x84.jpg" alt="">
                                </div>
                            
                                <div class="news_caption">
                                    <h4 class="news_title">
                                        <a href="#">
                                            Mustang Teases With A New Promo
                                        </a>
                                    </h4>
                                    <a class="date" href="#">
                                        <i class="icon fa fa-calendar-o"></i>
                                        18, February 2021
                                    </a>
                                </div>
                            
                                <a href="#" class="positioned_link"></a>
                            </div>

                            <div class="single_content">
                                <div class="image">
                                    <img src="https://discussion.qodeinteractive.com/wp-content/uploads/2016/02/vote-for-the-top-tracks-of-the-month-117x84.jpg" alt="">
                                </div>
                            
                                <div class="news_caption">
                                    <h4 class="news_title">
                                        <a href="#">
                                            Mustang Teases With A New Promo
                                        </a>
                                    </h4>
                                    <a class="date" href="#">
                                        <i class="icon fa fa-calendar-o"></i>
                                        18, February 2021
                                    </a>
                                </div>
                            
                                <a href="#" class="positioned_link"></a>
                            </div>
                            <div class="single_content">
                                <div class="image">
                                    <img src="https://discussion.qodeinteractive.com/wp-content/uploads/2016/02/natural-sunlight-can-boost-your-immune-system-117x84.jpg" alt="">
                                </div>
                            
                                <div class="news_caption">
                                    <h4 class="news_title">
                                        <a href="#">
                                            Mustang Teases With A New Promo
                                        </a>
                                    </h4>
                                    <a class="date" href="#">
                                        <i class="icon fa fa-calendar-o"></i>
                                        18, February 2021
                                    </a>
                                </div>
                            
                                <a href="#" class="positioned_link"></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="right_section">

                    <!-- social section start -->
                    <div class="section_devider" style="background-image: url({{asset('public/frontend/img/title_pattern.png')}});">
                        <div class="left">
                            <span>Stay Connected</span>
                        </div>
                    </div>

                    <div class="social_box">
                        <a href="#" class="facebook">
                            <i class="fa fa-facebook"></i>
                        </a>
                        <a href="#" class="twitter">
                            <i class="fa fa-twitter"></i>
                        </a>
                        <a href="#" class="youtube">
                            <i class="fa fa-youtube"></i>
                        </a>
                        <a href="#" class="instagram">
                            <i class="fa fa-instagram"></i>
                        </a>
                        <a href="#" class="linkedin">
                            <i class="fa fa-linkedin"></i>
                        </a>
                        <a href="#" class="copy">
                            <i class="fa fa-copy"></i>
                        </a>
                    </div>
                    <!-- social section start -->

                    <!-- most views section start -->
                    <div class="section_devider" style="background-image: url('img/title_pattern.png');">
                        <div class="left">
                            <span>Most Views</span>
                        </div>
                    </div>

                    <div>
                        <div class="single_content">
                            <div class="category">
                                <a href="#" rel="Category Tag">
                                    World
                                </a>
                            </div>
                            <div class="image">
                                <img src="img/news/m/2.jpg" alt="">
                            </div>
                        
                            <div class="news_caption">
                                <h4 class="news_title">
                                    <a href="#">
                                        Mustang Teases With A New Promo
                                    </a>
                                </h4>
                                <a class="date" href="#">
                                    <i class="icon fa fa-calendar-o"></i>
                                    18, February 2021
                                </a>
                            </div>
                        
                            <a href="#" class="positioned_link"></a>
                        </div>
                    </div>
                    <!-- most views section end -->

                </div>

            </div>
        </div>
        <!-- popular section end -->

    </main>
    <!-- main body section end -->






{{--     <!-- Contact Section -->
    <section class="contact-section" id="contact">
        <div class="container">
            <div class="contact-title">
                <h2>Contact Us</h2>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="contact-form">
                        <form action="{{ route('contact_us_process') }}" method="POST">
                            @csrf
                            <input type="text" name="name" placeholder="Name" required>
                            <input type="text" name="subject" placeholder="Subject" required>
                            <input type="text" name="phone" placeholder="Phone" required>
                            <input type="email" name="email" placeholder="Email" required>
                            <textarea name="details" placeholder="Message" cols="30" rows="5" required></textarea>
                            <input type="submit" class="custom-btn btn-business text-center" value="Send">
                        </form>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="contact-content">
                        <p>Storm Agency</p>
                        <h2>Our Country Agency</h2>
                        <span>{{ $contact_text }}</span>

                        <ul>
                            <li><img src="{{ asset('public/frontend/img/phone-call.png') }}" width="20" height="20" alt="Image not found"> {{ $phone }}</li>
                            <li><img src="{{ asset('public/frontend/img/at.png') }}" width="20" height="20" alt="Image not found"> {{ $email }}</li>
                            <li><img src="{{ asset('public/frontend/img/address.png') }}" width="20" height="20" alt="Image not found">{{ $address }}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Contact Section --> --}}


@endsection



{{-- css start here --}}
@push('css')
@endpush
{{-- css end here --}}


{{-- js start here --}}
@push('js')
@endpush
{{-- js end here --}}