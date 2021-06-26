{{-- main right start --}}
<div class="right_side" id="right_side">
    <nav class="top_nav print_hide">
        <div class="left">
            <div class="side_bar_toggle" id="side_bar_toggle">
                <span></span>
            </div>

            <div class="full_screen_toggle">
                <img src="{{ asset('public/backend/images/svgicon/fullscreen.svg') }}" class="icon" id="window_maximize"  alt="Window Maximize" title="Window Maximize" >
                <img src="{{ asset('public/backend/images/svgicon/exit_fullscreen.svg') }}" class="icon" id="window_minimize"  alt="Window Minimize" title="Window Minimize" >
            </div>
        </div>

        <div class="right">
            <ul>
                <!--<li>
                    <a target="_blank" href="{{ url('/') }}">
                        Visite Site
                    </a>
                </li>-->
                <li  id="profile_settings_toggle">
                    <a href="javascript:void(0)">
                        <img src="{{ asset('public/backend/images/svgicon/settings.svg') }}" alt="">
                    </a>
                    <ul id="profile_settings">
                        <li class="profile">
                            <div class="img">
                                <img src="{{ asset(Auth::user()->path) }}" alt="">
                            </div>
                            <div class="name">
                                {{Auth::user()->name}}
                            </div>
                        </li>
                        <li>
                            <a onclick="event.preventDefault();
                               document.getElementById('edit_user_form').submit();"
                               href="javascript:void(0)"
                            >
                                <span class="icon">
                                    <img src="{{ asset('public/backend/images/svgicon/user1.svg') }}" alt="">
                                </span>
                                <span>My Profile</span>
                            </a>
                        </li>
                        <form id="edit_user_form" action="{{ route('admin.admin_view') }}" method="POST" style="display: none;">
                            @csrf
                            <input type="" value="{{ Auth::id() }}" name="id">
                        </form>

                        <li>
                            <a href="{{ route("admin.admin_create") }}">
                                <span class="icon">
                                    <img src="{{ asset('public/backend/images/svgicon/plus.svg') }}" alt="">
                                </span>
                                <span>Create New Admin</span>
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('admin.admin_all') }}">
                                <span class="icon">
                                    <img src="{{ asset('public/backend/images/svgicon/users.svg') }}" alt="">
                                </span>
                                <span>All Admin</span>
                            </a>
                        </li>
                        {{-- <li>
                            <a href="#">
                                <span class="icon">
                                    <img src="{{ asset('public/backend/images/svgicon/settings1.svg') }}" alt="">
                                </span>
                                <span>Settings</span>
                            </a>
                        </li> --}}
                        <li>
                            <a href="javascript:void(0)" onclick="form_submitter('Logout_form')">
                                <span class="icon">
                                    <img src="{{ asset('public/backend/images/svgicon/signout.svg') }}" alt="">
                                </span>
                                <span>Logout</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    {{-- logout form start --}}
    <form action="{{ route('admin.logout') }}" id="Logout_form" method="post">
        @csrf
    </form>
    {{--  logout form end --}}





    @push('js')
        <script>
            var window_maximize = document.querySelector("#window_maximize"),
                window_minimize = document.querySelector("#window_minimize");

            window_maximize.addEventListener('click', function(){
                document.body.requestFullscreen();
                window_maximize.style.display = "none";
                window_minimize.style.display = "block";
            });

            window_minimize.addEventListener('click', function(){
                document.exitFullscreen();
                window_maximize.style.display = "block";
                window_minimize.style.display = "none";
            });
        </script>


        <script>
            // side bar toggle start-------------------
            var right_side      = document.querySelector('#right_side'),
                left_side       = document.querySelector('#left_side'),
                side_bar_toggle = document.querySelector('#side_bar_toggle');

            if(right_side && left_side && side_bar_toggle){
                side_bar_toggle.addEventListener('click', function()
                {
                    side_bar_toggle.classList.toggle('active');

                    if(left_side.classList.contains('active'))
                    {
                        left_side.classList.remove('active');
                    }else{
                        left_side.classList.add('active');
                    }

                    if(right_side.classList.contains('active'))
                    {
                        right_side.classList.remove('active');
                    }else{
                        right_side.classList.add('active');
                    }
                });
            }
            // side bar toggle end---------------------


            // profile settings dropdown start--------------
            var profile_settings_toggle = document.querySelector("#profile_settings_toggle"),
                profile_settings        = document.querySelector("#profile_settings");
            if(profile_settings_toggle){
                profile_settings_toggle.addEventListener('click', function(){
                    if(profile_settings.classList.contains('active'))
                    {
                        profile_settings.classList.remove('active');
                    }else
                    {
                        profile_settings.classList.add('active');
                    }
                });
            }

                // when user click out side of dropdown close the dropdown start
                window.addEventListener('click', function(){
                    if(!event.target.closest("#profile_settings_toggle")){
                        if(profile_settings.classList.contains('active'))
                        {
                            profile_settings.classList.remove('active');
                        }
                    }
                });
                // when user click out side of dropdown close the dropdown end
            // profile settings dropdown end----------------
        </script>
    @endpush