/**
 * Created by Administrator on 2017/2/20 0020.
 */
/**
 * 注册频道tab切换事件
 * @param className 类名字符串
 */
function registerChannelEvent( className ) {
    if (window.attachEvent) { //  ie6/7/8
        $('.' + className + ' .channel-tab').each(function (index, item) {
            if ($(this).hasClass('channel-tab-active')) return; //  当前tab已激活状态
            item.attachEvent('onclick', function () {
                channelTabsMouseover(className, index)
            })
        })
    }else if (window.addEventListener) {
        $('.' + className + ' .channel-tab').each(function (index, item) {
            item.addEventListener('click', function () {
                if ($(this).hasClass('channel-tab-active')) return; //  当前tab已激活状态
                channelTabsMouseover(className, index)
            })
        })
    }
}
/**
 * 做事件监听的兼容处理合并方法
 * @param className
 * @param index
 */
function channelTabsMouseover(className , index) {
    $('.' + className + ' .channel-tab').each(function () {
        $(this).removeClass('channel-tab-active')
    })
    $('.' + className + ' .channel-tab-content').each(function () {
        $(this).removeClass('channel-tab-content-active')
    })
    $('.' + className + ' .channel-tab-content').eq(index).addClass('channel-tab-content-active')
    $('.' + className + ' .channel-tab').eq(index).addClass('channel-tab-active')
    //  动态数字效果
    /*var span = $('.' + className + ' .channel-tab-content').eq(index).find('.count-down-number')
    span.each(function (i) {
        var self = $(this)
        var target = { number: $(this).attr('data-value') }; //  target must be a Number
        var start = { number: 0 };
        var tween = new TWEEN.Tween(start);
        tween.to(target, 500);
        tween.start();
        tween.onUpdate(function() {
            if (i !== 2){
                self.html(this.number.toFixed())
            }else {
                self.html(this.number.toFixed(1))
            }
        });
        function animate() {
            if (start.number !== target.number) requestAnimationFrame(animate);
            TWEEN.update();
        }
        animate(); //  开始递增过渡
    })*/
}




var arrPageSizes;
$(function () {
    //列表HOVER效果
    //var pwidth = 229;
    var pwidth = $(".core_team_list_every").parent().outerWidth(true);
    var ptop = $(".core_team_list_every").parent().outerHeight(true);
    var len = $(".core_team_list_ul").find(".core_team_list_every").length;
    $(".core_team_list_ul").find(".core_team_list_every").each(function (index) {
        var pid = $(this).attr("id");
        var left = pwidth;
        //第1个
        if (index % 4 == 0)
        { left = pwidth - 4; }
        //第2个
        if (index % 4 == 1)
        { left = 2 * pwidth + 18; }
        //第3个
        if (index % 4 == 2)
        { left = 3 * pwidth + 42; }
        //第4个
        if (index % 4 == 3)
        { left = 2 * pwidth + 40; }

        var top = Math.floor(index / 4) * ptop;


        $(this).hover(
                    function () {
                        $(pid).css({ "left": (left + 7.5), "top": (top + 10) }).show();
                    },
                    function () {
                        $(pid).hide();
                    }
                );
    });

    //鼠标滑过图片，图片慢慢放大缩小
    var imgWid = 0;
    var imgHei = 0; //变量初始化
    var big = 1.2; //放大倍数
    $(".core_team_list_ul .core_team_list_headpic").hover(function () {
        $(this).find("img").stop(true, true);
        var imgWid2 = 0; var imgHei2 = 0; //局部变量
        imgWid = $(this).find("img").width();
        imgHei = $(this).find("img").height();
        imgWid2 = imgWid * big;
        imgHei2 = imgHei * big;
        $(this).find("img").css({ "z-index": 2 });
        $(this).find("img").animate({ "width": imgWid2, "height": imgHei2, "margin-left": -28, "margin-top": -39.5 });
    }, function () {
        $(this).find("img").stop().animate({ "width": imgWid, "height": imgHei, "margin-left": 0, "margin-top": 0, "z-index": 1 });
    });

    //滑过每个图片的边框线的显示隐藏
    $(".core_team_list_every").hover(
              function () {
                  $(this).css("border", "1px solid #b2bfcc");
                  $(this).parents(".core_team_list_li").css("background", "#f4f6f8");
              },
              function () {
                  $(this).css("border", "1px solid #efefef");
                  $(this).parents(".core_team_list_li").css("background", "#fff");
              }
            );

    //弹出层显示隐藏
    arrPageSizes = ___getPageSize();
    $('#jquery-overlay,#lightbox-secNav-btnClose').click(function () {
        $('#jquery-lightbox').hide();
        $('#jquery-overlay').fadeOut(function () { $('#jquery-overlay').hide(); });
    });
})
//点击显示隐藏弹出层
function clickShow(ordername) {
    $("#OrderPlanner").val(ordername);
    $('#jquery-lightbox').show();
    $('#jquery-overlay').fadeOut(function () {
        $('#jquery-overlay').show();
        $('#jquery-overlay').css({
            width: arrPageSizes[0],
            height: arrPageSizes[1]
        }).fadeIn();
    });
}
//计算弹出层的默认宽高
function ___getPageSize() {
    var xScroll, yScroll;
    if (window.innerHeight && window.scrollMaxY) {
        xScroll = window.innerWidth + window.scrollMaxX;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
        xScroll = document.body.scrollWidth;
        yScroll = document.body.scrollHeight;
    } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
        xScroll = document.body.offsetWidth;
        yScroll = document.body.offsetHeight;
    }
    var windowWidth, windowHeight;
    if (self.innerHeight) {	// all except Explorer
        if (document.documentElement.clientWidth) {
            windowWidth = document.documentElement.clientWidth;
        } else {
            windowWidth = self.innerWidth;
        }
        windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
        windowWidth = document.documentElement.clientWidth;
        windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers
        windowWidth = document.body.clientWidth;
        windowHeight = document.body.clientHeight;
    }
    // for small pages with total height less then height of the viewport
    if (yScroll < windowHeight) {
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    // for small pages with total width less then width of the viewport
    if (xScroll < windowWidth) {
        pageWidth = xScroll;
    } else {
        pageWidth = windowWidth;
    }
    arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);
    return arrayPageSize;
};

function licaishi_click() {
    var OrderPlanner = $("#OrderPlanner").val();
    var UserName = $("#UserName").val();
    var ContactMobile = $("#ContactMobile").val();
    var YourRequest = $("#YourRequest").val();
    var url = window.location.href;
    if (checkUsername_licaishi()) {
        if (ClickBtnLogin_licaishi() == true) {
            //ajax开始
            $.ajax({
                type: "Post",
                url: "Ajax/Trust/TrustList.ashx",
                data: {
                    op: "5",
                    UserName: UserName,
                    ContactMobile: ContactMobile,
                    OrderPlanner: OrderPlanner,
                    YourRequest: YourRequest,
                    url: url
                },
                cache: false,
                async: false,
                dataType: "json",
                success: function (data) {
                    if (data == '-1') {
                        alert("预约提交失败!");
                    }
                    else if (data == '1') {
                        alert("预约提交成功，招财专业投资顾问将在24小时内与您联系!");
                        $("#UserName").val("");
                        $("#ContactMobile").val("");
                        $('#jquery-lightbox').hide();
                        $('#jquery-overlay').fadeOut(function () { $('#jquery-overlay').hide(); });
                    }
                },
                error: function () {

                }
            })//end ajax
        }
        else {
        }
    }
    else {
        alert("请输入中文、数字和英文!");
    }
}
function checkUsername_licaishi() {
    var strBool = true;
    //正则表达式
    var reg = new RegExp("^[a-zA-Z\d\u4E00-\u9FA5]+$");
    //获取输入框中的值
    var username = document.getElementById("UserName").value;
    //判断输入框中有内容
    if (!reg.test(username)) {
        strBool = false;
        return strBool;
    }
    else
    { return true; }
}

function ClickBtnLogin_licaishi() {
    var UserName = $("#UserName").val();
    var ContactMobile = $("#ContactMobile").val();
    if (UserName == '请输入您的姓名') {
        alert("请输入您的姓名!");
        $("#UserName").focus();
        return false;
    }
    if (ContactMobile == '请输入您的手机号') {
        alert("请输入您的手机号!");
        $("#ContactMobile").focus();
        return false;
    }
    else {
        if (isIndexMobileNO(ContactMobile) == true) {
            return true;
        }
        else {
            alert("您输入的手机号格式错误!");
            $("#ContactMobile").empty();
            return false;
        }
    }
}

function isIndexMobileNO(obj) {
    //var tel = $(obj).val();
    var myreg = /^0?1[3|4|5|8][0-9]\d{8}$/;
    if (myreg.test(obj)) {
        return true;
    }
    else {
        return false;
    }
}

