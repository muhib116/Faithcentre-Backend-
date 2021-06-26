// fixed nav bar in jquery
$(window).scroll(function() {
    if($(this).scrollTop() > 75) {
        $('.contact-nav, .navbar').addClass('active');
    } else {
        $('.contact-nav, .navbar').removeClass('active');
    };
});
