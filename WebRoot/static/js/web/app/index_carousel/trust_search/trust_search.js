function checkMobile(a) {
    var b = /^(((13[0-9]{1})|145|147|(15[0-3]{1})|(15[5-9]{1})|170|173|(17[6-8]{1})|(18[0-9]{1}))+\d{8})$/;
    return b.test(a);
}
function checkChinese(b) {
    var a = /^[\u4e00-\u9fa5]+$/;
    return a.test(b);
}
function checkNameAndMobile(b, a) {
    var c = "good";
    if (!b) {
        c = "姓名不能为空";
        return c;
    }
    b = b.trim();
    if (b.length > 5 || b.length < 2) {
        c = "姓名长度为2-5个汉字！";
        return c;
    }
    if (!checkChinese(b)) {
        c = "请输入中文姓名！";
        return c;
    }
    if (!a) {
        c = "手机号不能为空";
        return c;
    }
    if (!checkMobile(a)) {
        c = "请输入正确的手机号";
        return c;
    }
    return c;
}
var canSubmitForUtil = true;
function submitConsult(d, c, e) {
    if (!canSubmitForUtil) {
        return;
    }
    if (!d) {
        return;
    }
    canSubmitForUtil = false;
    var b = e ? "环成" : d.name;
    var a = d.mobile;
    var f = checkNameAndMobile(b, a);
    if (f != "good") {
        alert(f);
        canSubmitForUtil = true;
        return;
    }
    $.ajax({
        url: "/zt/submitCommonConsult",
        type: "post",
        data: d,
        dataType: "json",
        success: function(g) {
            canSubmitForUtil = true;
            if (g.error == "0") {
                if (c && "function" == typeof c) {
                    c();
                }
            } else {
                alert(g.error);
            }
        }
    });
}



		$(function(){
$('.pt4 .gongsi_box').click(function() {
			var pngarr = $(this).children('.jiantou').attr("src").split("/");
			var png = pngarr[pngarr.length-1];
			if(png=="jiantouDown.png"){
				$(this).next().toggleClass('current').siblings().removeClass('current');
				$(this).children('.jiantou').attr("src","../static/img/web/app/index_carousel/trust_search/jiantouUp.png");
				$(this).siblings().children('.jiantou').attr("src","../static/img/web/app/index_carousel/trust_search/jiantouDown.png");
			}else{
				$(this).next().removeClass('current');
				$(this).children('.jiantou').attr("src","../static/img/web/app/index_carousel/trust_search/jiantouDown.png");
			}
});
});









