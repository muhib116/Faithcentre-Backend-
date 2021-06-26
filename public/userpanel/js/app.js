/*left aside toggle start here*/
	let aside_toggle_btn = document.querySelector('.aside_toggle_btn'),
		main_container   = document.querySelector('.main_container');

	if(aside_toggle_btn && main_container)
	{
		aside_toggle_btn.addEventListener('click', function(){
			main_container.classList.toggle('active');
		});
	}
/*left aside toggle end here*/



/*aside dropdown startaside dropdown start*/
	let dropdowns = document.querySelectorAll('li.dropdown>a');
	if(dropdowns)
	{
		dropdowns = Array.isArray(dropdowns) ? dropdowns : Object.values(dropdowns);
		dropdowns.forEach(dropdown => {
			dropdown.addEventListener('click', function()
			{
				let dropdown_ul = this.nextElementSibling;
				if(dropdown_ul)
				{
					let parent_li = dropdown_ul.closest('li.dropdown');
					if(parent_li)
						parent_li.classList.toggle('active');

					let height = dropdown_ul.scrollHeight;

					if(dropdown_ul.offsetHeight>5)
					{
						dropdown_ul.style.height = `0px`;
					}else{
						dropdown_ul.style.height = `${height}px`;
					}
				}
			});
		});
	}

	window.addEventListener('load', function()
	{
		let active_dropdown = document.querySelector('li.dropdown.active>ul');
		if(active_dropdown)
		{
			active_dropdown.style.height = active_dropdown.scrollHeight+'px';
		}
	});
/*aside dropdown startaside dropdown end*/