<div class="top_bar print_hide">
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

	@php
		// this system_id method calling from my_helper.php
		$aside_id 		   = system_id()["aside_id"];
		$aside_dropdown_id = system_id()["aside_dropdown_id"];

		$navList = \DB::table('system_aside_menu_dropdowns')
					->where(['aside_menu_id'=>$aside_id, 'status'=>1])
                    ->orderBy('position', 'asc')
                    ->get();
	@endphp


	@if(count($navList)>0)
		@foreach($navList as $key => $value)
		    @if(is_safe($userInfo->admin_type) && $userInfo->aside_menu_dropdown_id != "null")
		        @if($userInfo->admin_type === 'president' xor ($userInfo->admin_type !== 'president' && in_array($value->id,json_decode($userInfo->aside_menu_dropdown_id))))
		        	<a 
				    	href="{{ is_safe($value->route_name) && Route::has($value->route_name) ? route($value->route_name)."?system=".base64_encode($value->aside_menu_id."_".$value->id) : 'javascript:void(0)' }}" 
				    	class="{{ ($aside_dropdown_id==$value->id) ? 'active' : '' }}" 
				    	title="{{ is_safe($value->name) ? $value->name : '' }}"
				    >
				    {{ is_safe($value->name) ? $value->name : '' }}
				    </a>
		    	@endif
		    @endif
	    @endforeach
    @endif
</div>