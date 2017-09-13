/**
 * Created on 06/09/2017.
 */
function setFooter() {
    //当页面高度不足100%时执行的函数
    var containerHeight = $(".container-fluid")[0].scrollHeight;
    var footer = $("footer");
    var allHeight = document.documentElement.clientHeight;
    if (containerHeight < allHeight) {
        footer.css({position: "absolute", bottom: "0"});
    }
    else {
        footer.css({position: "", bottom: ""});
    }
}

$(function () {
    $(window).resize(function() {
        setFooter();
    });

    $('#closeContact').on('click', function () {
        $('.side-nav').hide();
        $('.small-side-nav').show();
    });
    $('.small-side-nav').on('click', function () {
        $('.side-nav').show();
        $('.small-side-nav').hide();
    });
});



