<div class="top_bar">
    <a href="{{ route('admin.new_option_menu') }}" class="{{ isset($nav_active) && $nav_active == 'option_create' ? 'active' : '' }}" title="New Option's Menu">New Option</a>
    <a href="{{ route('admin.all_option_menu') }}" class="{{ isset($nav_active) && $nav_active == 'option_list' ? 'active' : '' }}" title="All Option's Menu">All Option</a>
    <a href="{{ route('admin.all_trash_option_menu') }}" class="{{ isset($nav_active) && $nav_active == 'option_trash' ? 'active' : '' }}" title="All Trashed Option Menu">All Trashed</a>
</div>