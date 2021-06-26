    <!-- footer section start here -->
    <footer class="footer_container" style="background-image: url({{asset('public/frontend/img/footer-background.jpg')}});">
        <div class="container">
            <div class="part_one">
                <div class="footer_logo">
                    <img src="img/logo-footer.png" alt="">
                </div>
                <div class="img">
                    <img src="{{ asset($footer_logo) }}" alt="">
                </div>
                <div class="text">
                    <h4 class="address_title">Address</h4>
                    <p>
                        {{ $address }}
                    </p>
                    <p>
                        E: <a href="mailto:{{ $email }}">{{ $email }}</a>
                        <br>
                        P: <a href="tel:{{ $phone }}">{{ $phone }}</a>
                    </p>
                </div>
            </div>

            <div class="part_two">
                <h5 class="section_title">Recent Posts</h5>
                <div class="post">
                    <div class="img">
                        <img src="img/news/1.jpg" alt="">
                    </div>
                    <div class="right">
                        <a href="#" class="news_title">Coup will worsen their plight: UN</a>
                        <span class="date">
                            <i class="icon fa fa-calendar-o"></i>
                            February 19, 2021
                        </span>
                    </div>
                </div>
                <div class="post">
                    <div class="img">
                        <img src="img/news/2.jpg" alt="">
                    </div>
                    <div class="right">
                        <a href="#" class="news_title">Coup will worsen their plight: UN</a>
                        <span class="date">
                            <i class="icon fa fa-calendar-o"></i>
                            February 19, 2021
                        </span>
                    </div>
                </div>
                <div class="post">
                    <div class="img">
                        <img src="img/news/3.jpg" alt="">
                    </div>
                    <div class="right">
                        <a href="#" class="news_title">Coup will worsen their plight: UN</a>
                        <span class="date">
                            <i class="icon fa fa-calendar-o"></i>
                            February 19, 2021
                        </span>
                    </div>
                </div>
            </div>
            
            <div class="part_three">
                <h5 class="section_title">Recent Comments</h5>
                <div class="recent_comment">
                    <i class="icon fa fa-comments-o"></i>
                    <span class="text">
                        Digital Watch
                    </span>
                </div>
                <div class="recent_comment">
                    <i class="icon fa fa-comments-o"></i>
                    <span class="text">
                        Leather Shoes
                    </span>
                </div>
                <div class="recent_comment">
                    <i class="icon fa fa-comments-o"></i>
                    <span class="text">
                        Summer Shirt
                    </span>
                </div>

                <div class="subscribe_box">
                    <h5 class="section_title">Newsletter</h5>
                    <span class="text">Get in touch with us right now.</span>

                    <form action="#" class="subscribe_form">
                       <input type="email" placeholder="Enter your email"> 
                       <button type="submit"><i class="fa fa-angle-right"></i></button>
                    </form>
                </div>
            </div>
            <div class="part_four">
                <h5 class="section_title">Important Link</h5>
                <a href="#">
                    <i class="fa fa-angle-double-right"></i>
                    Privacy Policy
                </a>
                <a href="#">
                    <i class="fa fa-angle-double-right"></i>
                    Terms & Conditions
                </a>
                <a href="#">
                    <i class="fa fa-angle-double-right"></i>
                    FAQ
                </a>
                <a href="#">
                    <i class="fa fa-angle-double-right"></i>
                    Contact
                </a>
                <a href="#">
                    <i class="fa fa-angle-double-right"></i>
                    About Us
                </a>

                <br>

                <h5 class="section_title">Important Link</h5>
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
    </footer>
    <!-- footer section end here -->
























    <!-- Footer Section -->
    {{-- <footer>
        <div class="footer-main">
            <div class="container">
                 <div class="row">
                     <div class="col-md-4">
                         <div class="footer-widget">
                             <img src="{{ asset($footer_logo) }}" alt="">
                             <p>{{ $footer_text }}</p>
                         </div>
                     </div>
                     <div class="col-md-4">
                         <div class="footer-widget text-center">
                            <h4 class="f-title">Menu</h4>
                            <ul>
                                <li><a href="{{ url('/') }}">Home</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                         </div>
                     </div>
                     <div class="col-md-4">
                        <div class="footer-end">
                            <h4 class="f-title">Newsletter</h4>
                            <form action="" method="POST">
                                <input type="text" placeholder="Name">
                                <input type="email" placeholder="Email">
                                <button class="custom-btn btn-business fb">Submit</button>
                            </form>
                        </div>
                     </div>
                 </div>
            </div>
        </div>
        <div class="copyright">
            <p>Copyright 2020, All Rights Reserved</p>
        </div>
    </footer> --}}
    <!-- End Footer Section -->





    <!-- All JS Here -->
    <script src="{{ asset('public/frontend/js/app.js') }}"></script>


    <script>
        /*check device is mobile or not start -----------------*/
        let isMobile = function() {
            if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
                return true;
            }else{
                return false;
            }
        }
        /*check device is mobile or not end -------------------*/



        /*lazy loader start here----------------------------------*/

            if(document.querySelector(".man_lazy"))
            {
                window.addEventListener('load', function(){
                    lazyLoad();
                });


                /*for use of this two event tack action to download image again and again when  user scroll
                for this i comment out this code*/
                /*for computer*/
                /*window.addEventListener('scroll',function(){
                    lazyLoad();
                });*/


                /*for mobile*/
                /*window.addEventListener('touchmove',function(){
                    lazyLoad();
                });*/


                function lazyLoad()
                {
                    let mLazyLoad = document.querySelectorAll(".man_lazy");
                        mLazyLoad = Array.isArray(mLazyLoad) ? mLazyLoad : Object.values(mLazyLoad);

                    mLazyLoad.forEach((_mLazyLoad)=>
                    {
                        let data = _mLazyLoad.dataset.src;
                        displayImage(data, _mLazyLoad);
                    });

                    function displayImage(data, element)
                    {
                        data = data.split(",");
                        data.forEach((_data, index) => {
                            // if(element.getBoundingClientRect().top<(window.innerHeight*2) && element.getBoundingClientRect().top>(-1*window.innerHeight))
                            // {
                                // (isMobile()) ? ((index<1) ? loadImage(_data, element) : '') : loadImage(_data, element);
                                loadImage(_data, element);
                            // }
                        });
                    };

                    function loadImage(img,element)
                    {
                        let imgObj = new Image();
                        imgObj.src = img;

                        /*remove the 'man_lazy' class*/
                        // element.classList.remove('man_lazy');
                        /*remove the 'man_lazy' class*/

                        imgObj.addEventListener('load', ()=>
                        {
                            /*check file available or not*/
                            element.src=img;
                            /*check file available or end*/
                        })
                    }
                }
            }
        /*lazy loader end here------------------------------------*/
    </script>
	{{-- footer script end --}}
	

	{{-- /****
	 /* this method for pushing js from other page.
	 /* donot delete this, this indicate that where to push the js
	 /*****/ --}}
	@stack('js')
</body>
</html>
