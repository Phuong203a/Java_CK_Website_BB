
$( window ).load(function() {
    render_size();
    var url = window.location.href;
    $('.menu-item  a[href="' + url + '"]').parent().addClass('active');
});

$( window ).resize(function() {
    render_size();
});


function render_size(){

    var prod_h_1 = $('.prod_h_1 img').width();
    $('.prod_h_1 img').height( 1 * parseInt(prod_h_1));

    var img_about_h1 = $('.img_about_h1 img').width();
    $('.img_about_h1 img').height( 1 * parseInt(img_about_h1));

    var prod_lq_h_1 = $('.prod_lq_h_1 img').width();
    $('.prod_lq_h_1 img').height( 1 * parseInt(prod_lq_h_1));

}


if (window.innerWidth > 768) {
    $(window).scroll(function () {
        if ($(window).scrollTop() >= 60) {
            $('.sticky-header').addClass('fixed');
        } else {
            $('.sticky-header').removeClass('fixed');
        }
    });
}
if (window.innerWidth > 320) {
    $(window).scroll(function () {
        if ($(window).scrollTop() >= 60) {
            $('.sticky-header').addClass('clearfix');
        } else {
            $('.sticky-header').removeClass('clearfix');
        }
    });
}


$(document).ready(function(e){
    $('.search-panel .dropdown-select').find('a').click(function(e) {
        e.preventDefault();
        var param = $(this).attr("href").replace("#","");
        var concept = $(this).text();
        $('.search-panel span#search_concept-top').text(concept);
        $('.input-group #search_param').val(param);
    });
});
$(document).ready(function(e){
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
        e.preventDefault();
        var param = $(this).attr("href").replace("#","");
        var concept = $(this).text();
        $('.search-panel span#search_concept').text(concept);
        $('.input-group #search_param').val(param);
    });
});

