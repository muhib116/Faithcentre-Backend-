var dropdown_container = document.querySelectorAll("li.dropdown_container>a");
if (dropdown_container){
    dropdown_container = Array.isArray(dropdown_container) ? dropdown_container : Object.values(dropdown_container);

    dropdown_container.forEach(function (single_dropdown_container){
        single_dropdown_container.addEventListener('click', function(){
            var dorpdown     = single_dropdown_container.nextElementSibling,
                offset_height = dorpdown.offsetHeight,
                scroll_height = dorpdown.scrollHeight;

            if(offset_height<=5){
                single_dropdown_container.parentElement.classList.add('active');
                dorpdown.style.cssText = `height:${scroll_height}px`;
            }
            if (offset_height >= scroll_height) {
                single_dropdown_container.parentElement.classList.remove('active');
                dorpdown.style.cssText = `height:0px`;
            }

        }, true);
    });
}

window.addEventListener('load', function(){
    var active_dropdown_container = document.querySelector("li.dropdown_container.active");
    if (active_dropdown_container){
        active_dropdown_container.lastElementChild.style.cssText = `height: ${active_dropdown_container.lastElementChild.scrollHeight}px`;
    }
});




// form submitter by javascript start----------------------
function form_submitter(form_id) {
    var form_id = document.querySelector(`#${form_id}`);
    if(form_id){
        form_id.submit();
    }
}
// form submitter by javascript end------------------------






/*table data search filter start------------------------------*/
/*
/* EX:
------------------
/* 
/*	<input type="search" oninput="man_table_data_filter(this,'.table_selector')" placeholder="Search...">
/* <table class="table_selector">...</table>
**/
function man_table_data_filter(itself,tableSelector) {
	var search_key = itself.value.toLowerCase();

	var table_data_filter = document.querySelectorAll('table'+tableSelector+' tr>td');
	if(table_data_filter){
		table_data_filter = Array.isArray(table_data_filter) ? table_data_filter : Object.values(table_data_filter);

		table_data_filter.forEach((single_table_data_filter)=>{
			single_table_data_filter.parentElement.style.display="none";
		});

		table_data_filter.forEach((single_table_data_filter)=>{
			var string = single_table_data_filter.innerText.toLowerCase();
			if(string.indexOf(search_key) > -1){
				single_table_data_filter.parentElement.style.display="";
			}
		});
	}
}
/*table data search filter end--------------------------------*/



function get_secret_number(number)
{
    console.log(number);
    var secret_number = {"1":"o","2":"t","3":"3","4":"f","5":"5","6":"s","7":"7","8":"e","9":"n","0":"z", ".":"."},
        x             = '';

    number = Array.isArray(number) ? number : Object.values(number);
    number.forEach(function(s)
    {
        x += secret_number[s];
    });
    
    return x;
}