<div class="main_container">
  <div class="left_side">

    {{-- nav start --}}
    <ul class="aside_nav">
      <li>
        <a href="{{ Route('user.dashboard') }}" class="{{ \Request::path() == 'user/dashboard' ? 'active' : '' }}">
          <i class="fa fa-dashboard"></i>
          <span class="text">Dashboards</span>
        </a>
      </li>

      <li class="dropdown {{ str_contains(url()->current(), '/user/profile') ? "active" : '' }}">
        <a href="javascript:void(0)">
          <i class="fa fa-user"></i>
          <span class="text">Profile</span>
          <i class="fa fa-angle-right"></i>
        </a>
        <ul>

          <li>
            <a href="{{ route('user.profile_update') }}" class="{{ str_contains(url()->current(), 'user/profile/profile-update') ? "active" : '' }}">
              <i class="fa fa-pencil-square-o"></i>
              <span class="text">Profile Update</span>
            </a>
          </li>

          <li>
            <a href="{{ route('user.profile_img_update') }}" class="{{ str_contains(url()->current(), 'user/profile/profile-img-update') ? "active" : '' }}" class="{{ (\Request::path() == 'user/profile-img-update') ? 'active' : '' }}">
              <i class="fa fa-upload"></i>
              <span class="text">Photo Upload</span>
            </a>
          </li>
          <li>
            <a href="{{ route('user.password_update') }}" class="{{ str_contains(url()->current(), 'user/profile/profile/password-change') ? "active" : '' }}">
              <i class="fa fa-key"></i>
              <span class="text">Password Change</span>
            </a>
          </li>
          {{-- <li>
            <a href="{{ route('user.transection_id_update') }}" class="{{ str_contains(url()->current(), 'user/profile/transection-change') ? "active" : '' }}">
              <i class="fa fa-key"></i>
              <span class="text">Transection Pin Change</span>
            </a>
          </li> --}}
        </ul>
      </li>

      <li>
        <a href="#">
          <i class="fa fa-gift"></i>
          <span class="text">Offer</span>
        </a>
      </li>

      <li class="dropdown {{ str_contains(url()->current(), '/ads') ? "active" : '' }}">
        <a href="javascript:void(0)">
          <i class="fa fa-address-card-o"></i>
          <span class="text">Ads Center</span>
          <i class="fa fa-angle-right"></i>
        </a>
        <ul>
          <li>
            <a href="{{ route('user.video_ads') }}" class="{{ str_contains(url()->current(), 'ads/video-ads') ? "active" : '' }}">
              <i class="fa fa-image"></i>
              <span class="text">Video Ads</span>
            </a>
          </li>
          <li>
            <a href="{{ route('user.link_ads') }}" class="{{ str_contains(url()->current(), 'ads/link-ads') ? "active" : '' }}">
              <i class="fa fa-link"></i>
              <span class="text">Link Ads</span>
            </a>
          </li>
        </ul>
      </li>

      <li class="dropdown {{ str_contains(url()->current(), '/user/my-transection/') ? "active" : '' }}">
        <a href="javascript:void(0)">
          <i class="fa fa-exchange"></i>
          <span class="text">My Transection</span>
          <i class="fa fa-angle-right"></i>
        </a>
        <ul>
          <li>
            <a href="{{ route('user.balance_withdraw') }}" class="{{ str_contains(url()->current(), 'user/my-transection/balance-withdraw') ? "active" : '' }}">
              <i class="fa fa-sign-out"></i>
              <span class="text">Balance Withdraw</span>
            </a>
          </li>
          <li>
            <a href="{{ route('user.refferal_balance') }}" class="{{ str_contains(url()->current(), '/user/my-transection/my-refferal/balance') ? "active" : '' }}">
              <i class="fa fa-money"></i>
              <span class="text">Referal Balance</span>
            </a>
          </li>
          {{-- <li>
            <a href="{{ route('user.balance_transfer') }}" class="{{ str_contains(url()->current(), 'user/my-transection/balance-transfer') ? "active" : '' }}">
              <i class="fa fa-rocket"></i>
              <span class="text">Balance Transfer</span>
            </a>
          </li> --}}
        </ul>
      </li>

      <li class="dropdown {{ str_contains(url()->current(), '/user/statement') ? "active" : '' }}">
        <a href="javascript:void(0)">
          <i class="fa fa-list"></i>
          <span class="text">Statement</span>
          <i class="fa fa-angle-right"></i>
        </a>
        <ul>
          <li>
            <a href="{{ route('user.notification_view') }}" class="{{ str_contains(url()->current(), 'user/statement/notification-view') ? "active" : '' }}">
              <i class="fa fa-bell-o"></i>
              <span class="text">Notification View</span>
            </a>
          </li>
          <li>
            <a href="{{ route('user.transfered_report') }}" class="{{ str_contains(url()->current(), 'user/statement/transfered-report') ? "active" : '' }}">
              <i class="fa fa-list"></i>
              <span class="text">Transfered Report</span>
            </a>
          </li>
          <li>
            <a href="{{ route('user.received_report') }}" class="{{ str_contains(url()->current(), 'user/statement/received-report') ? "active" : '' }}">
              <i class="fa fa-list"></i>
              <span class="text">Received Report</span>
            </a>
          </li>
          <li>
            <a href="{{ route('user.withdraw_report') }}" class="{{ str_contains(url()->current(), 'user/statement/withdraw-report') ? "active" : '' }}">
              <i class="fa fa-list"></i>
              <span class="text">Withdrew Report</span>
            </a>
          </li>
          <li>
            <a href="{{ route('user.conversion_received_report') }}" class="{{ str_contains(url()->current(), 'user/statement/conversion-received-report') ? "active" : '' }}">
              <i class="fa fa-list"></i>
              <span class="text">Conversion Received Report</span>
            </a>
          </li>
          <li>
            <a href="{{ route('user.conversion_transfer_report') }}" class="{{ str_contains(url()->current(), 'user/statement/conversion-transfer-report') ? "active" : '' }}">
              <i class="fa fa-list"></i>
              <span class="text">Conversion Transfered Report</span>
            </a>
          </li>
        </ul>
      </li>

      <li class="dropdown">
        <a href="#">
          <i class="fa fa-users"></i>
          <span class="text">Team View</span>
          <i class="fa fa-angle-right"></i>
        </a>
        <ul>
          <li>
            <a href="#" class="active">
              <i class="fa fa-credit-card"></i>
              <span class="text">Sponsor Details</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fa fa-tree"></i>
              <span class="text">Tree View</span>
            </a>
          </li>
        </ul>
      </li>

      <li>
        <a href="{{ route('user.logout') }}">
            <i class="fa fa-sign-out"></i>
            <span>Logout</span>
        </a>
      </li>

    </ul>
    {{-- nav start --}}


  </div>

  <div class="right_side">