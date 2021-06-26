    <!-- tranding news div start -->
    <div class="tranding_news">
        <div class="container">
            <span class="tranding_text">
                Trending News
            </span>
            <div class="tranding_news text_wrapper">
                <div class="inside_news inner_text">
                    <a href="#">Are we losing touch because of technology?</a>
                    <a href="#">Two Are we losing touch because of technology?</a>
                    <a href="#">Three Are we losing touch because of technology?</a>
                    <a href="#">Four Are we losing touch because of technology?</a>
                    <a href="#">Five Are we losing touch because of technology?</a>
                </div>
            </div>
        </div>
    </div>
    <!-- tranding news div end -->


    <!-- header part start -->
    <div class="container">
        <div class="left header_post">
            <div class="category">
                <a href="#" rel="Category Tag">
                    {{ $last_three_news[0]->category_name }}
                </a>
            </div>

            <div class="img">
                <img src="{{ asset('public/backend/images/news/m/'.$last_three_news[0]->banner_img_name) }}" data-src="{{ asset('public/backend/images/news/l/'.$last_three_news[0]->banner_img_name) }},{{ asset('public/backend/images/news/xl/'.$last_three_news[0]->banner_img_name) }}" class="man_lazy" alt="" >
            </div>
            <div class="footer">
                <div class="top">
                    <h1 class="news_heading">
                        {{ $last_three_news[0]->title }}
                    </h1>
                    <span class="date">
                        <i class="icon fa fa-calendar-o"></i>
                        {{ date('d-M-Y', strtotime($last_three_news[0]->date)) }}
                    </span>
                </div>
                <div class="bottom">
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
                        <span class="text">245 Views</span>
                    </span>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="top header_post">
                <div class="category">
                    <a href="#" rel="Category Tag">
                        {{ $last_three_news[1]->category_name }}
                    </a>
                </div>
            
                <div class="img">
                    <img src="{{ asset('public/backend/images/news/m/'.$last_three_news[1]->banner_img_name) }}" data-src="{{ asset('public/backend/images/news/l/'.$last_three_news[1]->banner_img_name) }},{{ asset('public/backend/images/news/xl/'.$last_three_news[1]->banner_img_name) }}" class="man_lazy" alt="" >
                </div>
                <div class="footer">
                    <div class="top">
                        <h2 class="news_heading">
                            {{ $last_three_news[1]->title }}
                        </h2>
                        <span class="date">
                            <i class="icon fa fa-calendar-o"></i>
                            {{ date('d-M-Y', strtotime($last_three_news[1]->date)) }}
                        </span>
                    </div>
                    <div class="bottom">
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
                            <span class="text">95 Views</span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="bottom header_post">
                <div class="category">
                    <a href="#" rel="Category Tag">
                        {{ $last_three_news[2]->category_name }}
                    </a>
                </div>
            
                <div class="img">
                    <img src="{{ asset('public/backend/images/news/m/'.$last_three_news[2]->banner_img_name) }}" data-src="{{ asset('public/backend/images/news/l/'.$last_three_news[2]->banner_img_name) }},{{ asset('public/backend/images/news/xl/'.$last_three_news[2]->banner_img_name) }}" class="man_lazy" alt="" >
                </div>
                <div class="footer">
                    <div class="top">
                        <h2 class="news_heading">
                            {{ $last_three_news[2]->title }}
                        </h2>
                        <span class="date">
                            <i class="icon fa fa-calendar-o"></i>
                            {{ date('d-M-Y', strtotime($last_three_news[2]->date)) }}
                        </span>
                    </div>
                    <div class="bottom">
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
                            <span class="text">95 Views</span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- header part end -->
</header>
