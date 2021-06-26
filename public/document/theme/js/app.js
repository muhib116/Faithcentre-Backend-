$(document).ready(function() {
    // all the variables
    var developermode = false;
    var wrapper = $(".wrapper");
    var wrapperbg = $(".wrapper-background");

    // aside toggle, hide and show programm start
    function asideToggle() {
        if(wrapper.hasClass('aside-close')) {
            wrapper.removeClass("aside-close");
        } else {
            wrapper.addClass("aside-close");
        }
    }
    function asideHide() {
        wrapper.addClass("aside-close");
    }
    function asideShow() {
        wrapper.removeClass("aside-close");
    }

    function layer() {
        var display = false;
        // get the window width
        var winwidth = $(window).outerWidth(true);
        console.log(winwidth);

        if(winwidth <= 992) {
            if(wrapperbg.hasClass('none')) {
                wrapperbg.removeClass('none');
                display = false;
            } else {
                wrapperbg.addClass('none');
                display = true;
            }
        }
        return display;
    }


    // click on toggle button (toggle)
    $("#aside-toggle").on("click", function(event) {
        asideToggle();
        layer();

        event.preventDefault();
    });


    // click on the wrapper-background (close)
    $(".wrapper-background").on("click", function() {
        asideHide();
        layer();
    });


    // click on the aside-close (close)
    $('a#aside-close').on("click", function() {
        asideHide();
        layer();
    });


    // on resize event aside toggle (toggle, optional)
    $(window).on("resize", function() {
        if(developermode) {
            asideToggle();
            layer();
        }
    });

    // dropdown toggle programm start
    $(".dropdown > a").on("click", function(event) {
        var parent = $(this).closest("li.dropdown");

        if(parent.hasClass("active")) {
            parent.removeClass("active");
        } else {
            parent.addClass("active");
            $( "li.dropdown" ).not( parent ).removeClass( "active" );
        }
        event.preventDefault();
    });

    // user dropdown toggle programm start
    $(".user-dropdown > a").on("click", function(event) {
        var parent = $(this).closest("li.user-dropdown");

        if(parent.hasClass("active")) {
            parent.removeClass("active");
        } else {
            parent.addClass("active");
            $( "li.user-dropdown" ).not( parent ).removeClass( "active" );
        }
        event.preventDefault();
    });

    $(document).click(function(event){
        var value = $(event.target).closest('.user-dropdown > a, .user-dropdown .sub-menu').length;
        if (value == 0) {
            if ($('.user-dropdown').hasClass('active')) {
                $('.user-dropdown').removeClass('active');
            }
        }
    });



    // header nav script
    $(".header-title").on("click", function () {
        if($('.body-header nav, .header-title').hasClass('active')) {
            $('.body-header nav, .header-title').removeClass("active");
        } else {
            $('.body-header nav, .header-title').addClass("active");
        }
    });

    // rightbar script
    sidebarToggle('.settings','.right-bar', 'active');

	function sidebarToggle(clickElement, sidebarElement, sidebarClass, eventName='click') {
		$(clickElement).on(eventName, function(){
			var sidebar = $(sidebarElement);
			if (sidebar.hasClass(sidebarClass)) {
				sidebar.removeClass(sidebarClass);
			}else{
				sidebar.addClass(sidebarClass);
			}
		});

		$(document).on(eventName, function (event) {
			var value = $(event.target).closest(clickElement + ',' + sidebarElement).length;
			if (value == 0) {
				if ($(sidebarElement).hasClass(sidebarClass)) {
					$(sidebarElement).removeClass(sidebarClass);
				}
			}
		});
	}


    // nicescroll plugin
    $(".body-content, .aside-nav, .right-bar").niceScroll({
        cursorcolor: 'rgba(152, 166, 173, 0.5)',
        cursorwidth: '6px',
        cursorborderradius: '0px'
    });


    // list dropdown
    var menu = $('.wrapper').data('menu'),
        submenu = $('.wrapper').data('submenu');

    var li = '.aside-nav li#' + menu;

    $(li).addClass('active');
    $(li + ' ul li#' + submenu).addClass('active');


    // print media
    $('#print').click(function(){
        window.print();
    });


    // select checkbox
    $("#checkAll").click(function () {
        $('.delete-check input:checkbox').not(this).prop('checked', this.checked);

        if($('.list-header, .header-action-title, .header-action').hasClass('active')) {
            $('.list-header, .header-action-title, .header-action').removeClass("active");
        } else {
            $('.list-header, .header-action-title, .header-action').addClass("active");
        }
    });

    $('.list-table .delete-check input[type="checkbox"]').click(function (){
		var totalCheckbox = $(".list-table .delete-check input:checkbox").not('#checkAll').length;
		var check = $(".list-table .delete-check input:checkbox:checked").not('#checkAll').length;
        if(totalCheckbox == check){
            $('#checkAll').prop('checked', true);
        }else{
            $('#checkAll').prop('checked', false);
        }

        if(check > 0){
        	$('.list-header, .header-action-title, .header-action').addClass("active");
        }else{
        	$('.list-header, .header-action-title, .header-action').removeClass("active");
        }
    });

});
