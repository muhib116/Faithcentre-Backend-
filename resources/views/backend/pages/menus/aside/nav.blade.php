<div class="top_bar">
    <a href="{{ route('admin.new_aside_menu') }}" class="{{ isset($nav) && $nav == 'aside_create' ? 'active' : '' }}" title="New Menu">New Menu</a>
    <a href="{{ route('admin.all_aside_menu') }}" class="{{ isset($nav) && $nav == 'aside_list' ? 'active' : '' }}" title="All Aside Menu">All Aside Menu</a>
    <a href="{{ route('admin.all_trash_aside_menu') }}" class="{{ isset($nav) && $nav == 'aside_trash' ? 'active' : '' }}" title="All Trashed Aside Menu">All Trashed Aside Menu</a>
    <a href="{{ route('admin.sort_aside_menu') }}" class="{{ isset($nav) && $nav == 'sort_aside_menu' ? 'active' : '' }}" title="Sort Aside Menu">Sort Aside Menu</a>
</div>