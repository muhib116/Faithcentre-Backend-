<div class="top_bar">
	<a href="{{ route('admin.admin_create') }}" class="create_admin {{ (Route::currentRouteName() == 'admin.admin_create') ? 'active' : '' }}" title="Create Admin">Create Admin</a>
	<a href="{{ route('admin.admin_all') }}" class="all_admin {{ (Route::currentRouteName() == 'admin.admin_all') ? 'active' : '' }}" title="All Admin">All Admin</a>
</div>