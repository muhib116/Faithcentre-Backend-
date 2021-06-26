/*top nav left aside toggle button animating*/
var left_aside_toggle = _('.left_aside_toggle');
if(left_aside_toggle){
	left_aside_toggle.onclick = function(){
		/*work with aside toggle button start*/
		var toggle_span = _(".left_aside_toggle span");
		this.classList.toggle('active');
		toggle_span.classList.toggle('close');
		/*work with aside toggle button end*/

		/*work with left aside start*/
		var m_section_2_left_section = _('.m_section_2_left_section');
		if(m_section_2_left_section){
			m_section_2_left_section.classList.toggle('active');
		}
		/*work with left aside end*/

		/*work with right section start*/
		var m_section_2_right_section = _('.m_section_2_right_section');
		if(m_section_2_right_section){
			m_section_2_right_section.classList.toggle('active');
		}
		/*work with right section end*/
	}


	/*if screen size less <=768px then remove active class from  start
	/*.m_section_2_left_section
	/*.m_section_2_right_section
	*/
	window.addEventListener("resize", function () {
		check_document_size();
	},false);

	check_document_size();
	function check_document_size(){
		if(document.body.offsetWidth<=768){
			_('.m_section_2_left_section').classList.remove('active');
			_('.m_section_2_right_section').classList.remove('active');
			_('.left_aside_toggle').classList.remove('active');
			_('.left_aside_toggle>span').classList.remove('close');
		}else{
			_('.m_section_2_left_section').classList.add('active');
			_('.m_section_2_right_section').classList.add('active');
			_('.left_aside_toggle').classList.add('active');
			_('.left_aside_toggle>span').classList.add('close');
		}
	}
	/*if screen size less <=768px then remove active class from  end*/
}


/*left aside menu dropdown start*/
var i = 0;
$(".left_asid_nav>li").event('click', function(){
	if(this.lastElementChild.classList.contains('dropdown')){
		event.preventDefault();
	}
	navbar(this);
},false);

function navbar(This){
	if(This.classList.contains('active')){
		This.classList.remove('active');
	}else{
		$(".left_asid_nav>li").removeClass('active');
		This.classList.add('active');
	}
}
