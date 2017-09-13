/**
 * Created by gustinlau on 07/09/2017.
 */

    // 根据字典生成随机序列
var randomCode = function (len, dict) {

        for (var i = 0, rs = ''; i < len; i++)
            rs += dict.charAt(Math.floor(Math.random() * 100000000) % dict.length);
        return rs;
    };
// 生成随机手机号码
var randomPhoneNumber = function () {

    // 第1位是1 第2,3位是3458 第4-7位是* 最后四位随机
    return [1, randomCode(1, '358'), randomCode(1, '0123456789'), '****', randomCode(4, '0123456789')].join('');
};

function setText(flag) {
    var i = flag ? 1 : 2;
    //获取时间
    var date = new Date();
    var hours = date.getHours();//小时
    var minute = date.getMinutes();//分

    $('#time_' + i).text((hours < 10 ? "0" + hours : hours) + ":" + (minute < 10 ? "0" + minute : minute));
    $("#phone_" + i).text(randomPhoneNumber());
    //生成随机分数
    $("#point_" + i).text(parseInt(100 * Math.random() + 10) + "00");
}

//标识符
var flag = true;


var scrollH = 40;
var bodyW = document.body.clientWidth;
if (bodyW <= 992) {
    scrollH = 32;
}
if (bodyW <= 768) {
    scrollH = 24;
}

//上分栏向上滚动
function autoScroll(obj) {
    $(obj).find("ul").animate({
        marginTop: "-" + scrollH + "px"
    }, 500, function () {
        $(this).css({marginTop: "0px"}).find("li:first").appendTo(this);
        setText(flag);
        flag = !flag;
        setTimeout('autoScroll(".grade")', 2000);
    });
}

// var interval;
$(function () {
    setText(true);
    setText(false);
    setTimeout('autoScroll(".grade")', 2000);
});