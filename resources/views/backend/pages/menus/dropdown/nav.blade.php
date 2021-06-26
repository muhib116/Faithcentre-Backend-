<div class="top_bar">
    <a href="{{ route('admin.new_aside_menu_dropdown') }}" class="{{ isset($nav_active) && $aside_dropdown_active == 'aside_dropdown_create' ? 'active' : '' }}" title="New Aside Dropdown">New Aside Dropdown</a>
    <a href="{{ route('admin.all_aside_menu_dropdown') }}" class="{{ isset($nav_active) && $aside_dropdown_active == 'aside_dropdown_list' ? 'active' : '' }}" title="Aside Dropdown List">Aside Dropdown List</a>
    <a href="{{ route('admin.all_aside_menu_trash_dropdown') }}" class="{{ isset($nav_active) && $aside_dropdown_active == 'aside_dropdown_trash' ? 'active' : '' }}" title="Trash">Trash</a>
</div>