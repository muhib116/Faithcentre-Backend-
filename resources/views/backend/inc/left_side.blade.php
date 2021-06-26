{{-- left_side start --}}
<div class="left_side print_hide" id="left_side">
    <div class="header">
        <div class="logo">
            {{-- <img src="{{ asset('public/backend/images/logo.png') }}" alt=""> --}}
            <img src="{{ asset($header_logo) }}" alt="">
        </div>
    </div>
    <ul class="aside_menu">


        {{-- deshboard section start========================================================= --}}
        {{-- <li class="{{ isset($aside_active) && $aside_active == 'dashboard' ? 'active' : '' }}">
            <a href="{{ route('admin.dashboard') }}" title="Dashboard">
                <span class="icon">
                    <img src="{{ asset('public/backend/images/svgicon/dashboard.svg') }}" alt="">
                </span>
                <span class="text">Dashboard</span>
            </a>
        <li> --}}
        {{-- deshboard section end ========================================================= --}}



        {{-- developer section start========================================================= --}}
            @if(Auth::user()->admin_type==="president")
              {{-- aside menu start --}}
              <li class="dropdown_container {{ isset($aside_active) && $aside_active == 'aside_menu' ? 'active' : '' }}">{{-- active --}}
                  <a href="javascript:void(0)" title="Aside Menu">
                      <span class="icon">
                          <img src="{{ asset('public/backend/images/svgicon/list2.svg') }}" alt="">
                      </span>
                      <span class="text">Aside Menu</span>
                      <span class="dropdown_indicatior"></span>
                  </a>

                  {{-- dropdown start --}}
                  <ul>
                      <li class=" {{ isset($aside_dropdown_active) && $aside_dropdown_active == 'aside_create' ? 'active' : '' }}">
                          <a href="{{ route('admin.new_aside_menu') }}" title="New Aside" >
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">New Aside</span>
                          </a>
                      </li>
                      <li class=" {{ isset($aside_dropdown_active) && $aside_dropdown_active == 'aside_list' ? 'active' : '' }}">
                          <a href="{{ route('admin.all_aside_menu') }}" title="Aside List">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Aside List</span>
                          </a>
                      </li>
                      <li class=" {{ isset($aside_dropdown_active) && $aside_dropdown_active == 'aside_trash' ? 'active' : '' }}">
                          <a href="{{ route('admin.all_trash_aside_menu') }}" title="Trash">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Trash</span>
                          </a>
                      </li>
                      <li>
                          <a href="{{ route('admin.sort_aside_menu') }}" title="Aside Alignment">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Aside Alignment</span>
                          </a>
                      </li>
                  </ul>
                  {{-- dropdown end --}}

              <li>
              {{-- aside menu end --}}

              {{-- aside dropdown start --}}
              <li class="dropdown_container {{ isset($aside_active) && $aside_active == 'aside_dropdown_menu' ? 'active' : '' }}">{{-- active --}}
                  <a href="javascript:void(0)" title="Aside Dropdown">
                      <span class="icon">
                          <img src="{{ asset('public/backend/images/svgicon/child.svg') }}" alt="">
                      </span>
                      <span class="text">Aside Dropdown</span>
                      <span class="dropdown_indicatior"></span>
                  </a>

                  {{-- dropdown start --}}
                  <ul>
                      <li class="{{ isset($aside_dropdown_active) && $aside_dropdown_active == 'aside_dropdown_create' ? 'active' : '' }}">
                          <a href="{{ route('admin.new_aside_menu_dropdown') }}" title="New Aside Dropdown" >
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">New Aside Dropdown</span>
                          </a>
                      </li>
                      <li class="{{ isset($aside_dropdown_active) && $aside_dropdown_active == 'aside_dropdown_list' ? 'active' : '' }}">
                          <a href="{{ route('admin.all_aside_menu_dropdown') }}" title="Aside Dropdown List">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Aside Dropdown List</span>
                          </a>
                      </li>
                      <li class="{{ isset($aside_dropdown_active) && $aside_dropdown_active == 'aside_dropdown_trash' ? 'active' : '' }}">
                          <a href="{{ route('admin.all_aside_menu_trash_dropdown') }}" title="Trash">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Trash</span>
                          </a>
                      </li>
                      <li>
                          <a href="#" title="Aside Dropdown Alignment">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Aside Dropdown Alignment</span>
                          </a>
                      </li>
                  </ul>
                  {{-- dropdown end --}}

              <li>
              {{-- aside dropdown end --}}
              

              {{-- option menu start --}}
              <li class="dropdown_container {{ isset($aside_active) && $aside_active == 'option_menu' ? 'active' : '' }}">{{-- active --}}
                  <a href="javascript:void(0)" title="Aside Dropdown">
                      <span class="icon">
                          <img src="{{ asset('public/backend/images/svgicon/settings2.svg') }}" alt="">
                      </span>
                      <span class="text">Option Menu</span>
                      <span class="dropdown_indicatior"></span>
                  </a>

                  {{-- dropdown start --}}
                  <ul>
                      <li class="{{ isset($aside_dropdown_active) && $aside_dropdown_active == 'option_create' ? 'active' : '' }}">
                          <a href="{{ route('admin.new_option_menu') }}" title="New Option" >
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">New Option</span>
                          </a>
                      </li>
                      <li class="{{ isset($aside_dropdown_active) && $aside_dropdown_active == 'option_list' ? 'active' : '' }}">
                          <a href="{{ route('admin.all_option_menu') }}" title="Option List">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Option List</span>
                          </a>
                      </li>
                      <li class="{{ isset($aside_dropdown_active) && $aside_dropdown_active == 'option_trash' ? 'active' : '' }}">
                          <a href="{{ route('admin.all_trash_option_menu') }}" title="Trash">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Trash</span>
                          </a>
                      </li>
                      <li>
                          <a href="#" title="Aside Alignment">
                              <span class="icon">
                                  <img src="{{ asset('public/backend/images/svgicon/arrow_right.svg') }}" alt="">
                              </span>
                              <span class="text">Option Alignment</span>
                          </a>
                      </li>
                  </ul>
                  {{-- dropdown end --}}

              <li>
              {{-- option end --}}
              
            @endif
        {{-- developer section end========================================================= --}}



        


        {{-- get user information from session and database start --}}
            @php
                $logedInUserId = Auth::id();
                $userInfo = \DB::table('admins')
                            ->leftJoin('admin_privileges', 'admins.id','=','admin_privileges.admin_id')
                            ->select(
                                'admins.path as path', 
                                'admins.name as name', 
                                'admins.admin_type as admin_type', 
                                'admins.designation as designation', 
                                'admin_privileges.aside_menu_id as aside_menu_id',
                                'admin_privileges.aside_menu_dropdown_id as aside_menu_dropdown_id'
                            )
                            ->where(['admins.id'=>$logedInUserId])
                            ->first();
            @endphp
        {{-- get user information from session and database end --}}


        {{-- get all aside menu list from database 'system_aside_menus' table start --}}
        @php
            /**
            /* this system_id method calling from my_helper.php
            /* this help us to activate aside menu and dropdown menu
            **/

            $aside_id          = system_id() ? system_id()["aside_id"] : null;
            $aside_dropdown_id = system_id() ? system_id()["aside_dropdown_id"] : null;
            // -------------------------------------------------------------------------

            $aside_menu = \DB::table('system_aside_menus')
                            ->select(
                                'system_aside_menus.id as aside_menu_id',
                                'system_aside_menus.name as aside_menu_name',
                                'system_aside_menus.route_name as aside_menu_route_name',
                                'system_aside_menus.icon as aside_menu_icon',
                                'system_aside_menus.has_sub_menu as aside_menu_has_sub_menu'
                            )
                            ->where(['status'=>1])
                            ->orderBy('position', 'asc')
                            ->get();
        @endphp
        {{-- get all aside menu list from database 'system_aside_menus' table end --}}



        {{-- dynamic aside menu from database start --}}
            @if(count($aside_menu)>0)
                @foreach($aside_menu as $key => $value)
                    {{-- check asidemenu's privilege of admin start --}}
                    @if($userInfo->admin_type === 'president' xor ($userInfo->admin_type !== 'president' && !empty($userInfo->aside_menu_id) && in_array($value->aside_menu_id,json_decode($userInfo->aside_menu_id))))
                        <li class="dropdown_container {{ ($value->aside_menu_id == $aside_id) ? 'active' : '' }}">{{-- active --}}
                            <a href="{{ ($value->aside_menu_route_name !== null && Route::has($value->aside_menu_route_name)) ? route($value->aside_menu_route_name)."?system=".base64_encode($value->aside_menu_id) : 'javascript:void(0)' }}" title="{{ $value->aside_menu_name }}">
                                <span class="icon">
                                    <img src="{{ asset('public/backend/images/svgicon/'.$value->aside_menu_icon) }}" alt="">
                                </span>
                                <span class="text">{{ $value->aside_menu_name }}</span>

                                @if($value->aside_menu_has_sub_menu !== 0 &&  $value->aside_menu_icon !== null)
                                    <span class="dropdown_indicatior"></span>
                                @endif
                            </a>

                            {{-- dropdown start --}}
                            @php
                                $aside_menu_dropdown = \DB::table('system_aside_menu_dropdowns')
                                        ->select(
                                            'system_aside_menu_dropdowns.id as aside_menu_dropdown_id',
                                            'system_aside_menu_dropdowns.name as aside_menu_dropdown_name',
                                            'system_aside_menu_dropdowns.route_name as aside_menu_dropdown_route_name',
                                            'system_aside_menu_dropdowns.icon as aside_menu_dropdown_icon'
                                        )
                                        ->where(['aside_menu_id'=>$value->aside_menu_id, 'status'=>1])
                                        ->orderBy('position', 'asc')
                                        ->get();
                            @endphp

                            @if(count($aside_menu_dropdown)>0)
                            <ul>
                                {{-- get aside menu dropdown from system_aside_menu_dropdowns start --}}
                                @foreach($aside_menu_dropdown as $key1 => $value1)
                                    {{-- check asidemenu dropdown's privilege of admin start --}}
                                    @if(is_safe($userInfo->admin_type) && $userInfo->aside_menu_dropdown_id != "null")
                                        @if($userInfo->admin_type === 'president' xor ($userInfo->admin_type !== 'president' && !empty($userInfo->aside_menu_dropdown_id) && in_array($value1->aside_menu_dropdown_id,json_decode($userInfo->aside_menu_dropdown_id))))
                                            <li class="{{ ($value1->aside_menu_dropdown_id == $aside_dropdown_id) ? 'active' : '' }}">
                                                <a href="{{ ($value1->aside_menu_dropdown_route_name !== null && Route::has($value1->aside_menu_dropdown_route_name)) ? route($value1->aside_menu_dropdown_route_name)."?system=".base64_encode($value->aside_menu_id."_".$value1->aside_menu_dropdown_id) : '' }}" title="{{ $value1->aside_menu_dropdown_name }}" >
                                                    <span class="icon">
                                                        <img src="{{ asset('public/backend/images/svgicon/'.$value1->aside_menu_dropdown_icon) }}" alt="">
                                                    </span>
                                                    <span class="text">{{ $value1->aside_menu_dropdown_name }}</span>
                                                </a>
                                            </li>
                                        @endif
                                    @endif
                                @endforeach
                            </ul>
                            @endif
                            {{-- dropdown end --}}

                        <li>
                    @endif
                @endforeach
            @endif

    </ul>

</div>
{{-- left_side end --}}




<style>
  .main_container>.left_side{
    display: grid;
    grid-template-rows: 58px 1fr 150px;
  }

  .main_container>.left_side>.header .logo{
    height: 58px !important;
  }
  .main_container>.left_side>.header .logo img{
    height: 100%  !important;
    object-fit: contain !important;
  }
</style>