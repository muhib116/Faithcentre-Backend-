@extends('backend.master')
@section('headerTitle', 'Sort Aside Menu | '.((isset($site_name)) ? $site_name : ''))


@section('content')
	<section class="content">
        <div class="heading">
            Sort Aside Menu
		</div>
		
		<div>
			<div class="container_fluid">
				{!! msg($name='msg') !!}
				@if ($errors->any())
					{{ validation_msg($errors->all()) }}
				@endif

				<div id="sort_msg" class="" style="display: inline-block !important;min-width: 300px;margin-bottom: 10px;"></div>

				<div class="aside_menu_items_container drag-sort-enable">
					@if($rows)
						@foreach($rows as $key => $value)
							<div class="aside_menu_item" data-id="{{ $value->id }}" draggable>
								<span class="sl">{{ (($key+1)<=9) ? "0".($key+1) : ($key+1) }}</span>
								<div class="name">{{ $value->name }}</div>
							</div>
						@endforeach
					@endif
				</div>
			</div>
		</div>
    </section>
@endsection





@push('css')
	<style>
		.aside_menu_items_container{
			width: 300px;
		}
		.aside_menu_items_container>.aside_menu_item{
			display: flex;
			align-items: center;
			border: 1px solid coral;
			cursor: move;
			transition: all 0.2s ease-in;
			margin-bottom: 10px;
		}
		.aside_menu_items_container>.aside_menu_item:hover{
			box-shadow: 0 1px 10px #0002;
			transform: scale(1.01);
		}
		.aside_menu_items_container>.aside_menu_item>.sl{
			user-select: none;
			padding: 0 15px;
			line-height: 50px;
			color: coral;
			margin-right: 10px;
			font-weight: bold;
			border-right: 1px solid coral;
		}
		.aside_menu_items_container>.aside_menu_item>.name{
			user-select: none;
			padding-right: 20px;
			line-height: 50px;
		}

		.aside_menu_items_container>.aside_menu_item.drag-sort-active {
			background: transparent;
			opacity: 0;
		}
	</style>
@endpush


@push('js')
	<script>
		function enableDragSort(listClass) {
		  const sortableLists = document.getElementsByClassName(listClass);
		  Array.prototype.map.call(sortableLists, (list) => {enableDragList(list)});
		}

		function enableDragList(list) {
		  Array.prototype.map.call(list.children, (item) => {enableDragItem(item)});
		}

		function enableDragItem(item) {
		  item.setAttribute('draggable', true)
		  item.ondrag    = handleDrag;
		  item.ondragend = handleDrop;
		}

		function handleDrag(item) {
		  const selectedItem = item.target,
		        list = selectedItem.parentNode,
		        x = event.clientX,
		        y = event.clientY;
		  
		  selectedItem.classList.add('drag-sort-active');
		  let swapItem = document.elementFromPoint(x, y) === null ? selectedItem : document.elementFromPoint(x, y);
		  if (list === swapItem.parentNode) {
		    swapItem = swapItem !== selectedItem.nextSibling ? swapItem : swapItem.nextSibling;
		    list.insertBefore(selectedItem, swapItem);
		  }
		}

		function handleDrop(item) {
		  item.target.classList.remove('drag-sort-active');
		  let dragSortEnable         = document.querySelector(".drag-sort-enable"),
		      dragSortEnableChildren = dragSortEnable.children,
		      i                      = 0;

		  for(i; i<dragSortEnableChildren.length; i++){
		    dragSortEnableChildren[i].setAttribute('data-position', i);
		  }


		  /*update database position for aside menu item start*/
		  update_position();
		  /*update database position for aside menu item end*/
		}

		(()=> {enableDragSort('drag-sort-enable')})();



		// update aside menu position start
		function update_position(){
			var id_position = {};

			var aside_menu_item = document.querySelectorAll('.aside_menu_item');
			aside_menu_item = Array.isArray(aside_menu_item) ? aside_menu_item : Object.values(aside_menu_item);
			aside_menu_item.forEach(function(single_aside_menu_item){
				id_position[single_aside_menu_item.dataset.id] = single_aside_menu_item.dataset.position;
				id_position[single_aside_menu_item.dataset.id] = single_aside_menu_item.dataset.position;
			});
			
			id_position = JSON.stringify(id_position);

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					location.reload();
				}else{
					document.body.style.cssText = "pointer-events:none;";
				}
			};
			xhttp.open("GET", "{{ route('admin.sort_aside_menu.sortByAjax') }}?id_position="+id_position, true);
			xhttp.send();
		}
		// update aside menu position end
	</script>
@endpush