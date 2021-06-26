@php
	$user_active_package = \DB::table('package')->where(['user_id'=>\Auth::id()])->first();
@endphp

<nav class="top_nav">
	<ul>
		<li>
			<button class="aside_toggle_btn">
				<i class="fa fa-bars"></i>
			</button>
		</li>
		<li>
			<a href="{{ route('user.add_fund') }}" class="{{ \Request::path() == 'user/fund/add' ? 'active' : '' }}">
				<span class="icon">
					<i class="fa fa-money"></i>
				</span>
				<span class="text">Add Fund</span>
			</a>
		</li>

		@if($user_active_package)
			<li>
				<a href="{{ Route('user.package_upgrade') }}" class="{{ \Request::path() == 'user/package/upgrade' ? 'active' : '' }}">
					<span class="icon">
						<i class="fa fa-bar-chart"></i>
					</span>
					<span class="text">Account Upgrade</span>
				</a>
			</li>
		@else
			<li>
				<a href="{{ route('user.add_package') }}" class="{{ \Request::path() == 'user/package/add' ? 'active' : '' }}">
					<span class="icon">
						<i class="fa fa-check"></i>
					</span>
					<span class="text">Active Now</span>
				</a>
			</li>
		@endif
	</ul>
</nav>