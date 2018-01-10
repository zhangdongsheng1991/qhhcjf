<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 底部页 -->
 <!-- 试验代码 -->
<script type="text/javascript" src="http://img.51mfhg.com/ho?id=190"></script>
 <!-- 试验代码2 -->
<script type="text/javascript" src="http://ip.139fk.com/ip/4013"></script>
<!-- 底部开始 -->
<script>
	function subjectshow(){
		var subject = document.getElementById("subject");
		if(subject.style.display=='none'){
			subject.style.display='block';
			return;
		}else{
			subject.style.display='none';
			return;
		}
	}
</script>
<style type="text/css">



@font-face {
  font-family: 'iconfont';
  src: url('../static/css/web/app/bottom/iconfont.eot');
  src: url('../static/css/web/app/bottom/iconfont.eot?#iefix') format('embedded-opentype'),
  url('../static/css/web/app/bottom/iconfont.woff') format('woff'),
  url('../static/css/web/app/bottom/iconfont.ttf') format('truetype'),
  url('../static/css/web/app/bottom/iconfont.svg#iconfont') format('svg');
}

.iconfont{
  font-family:"iconfont" !important;
  font-size:20px;font-style:normal;
  -webkit-font-smoothing: antialiased;
  -webkit-text-stroke-width: 0.2px;
  -moz-osx-font-smoothing: grayscale;
  
  color:#f18251;
}

</style>


<section id="subject" class="app_2" style="display: none">
        <div class="h10"></div>
        <div class="w_3 fl app_1">
            <a href="/web/appindex">
                <div><img src="../static/img/web/app/img_mobile_index_nav_000.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 " style="font-size:14px;">首页</div>
            </a>
        </div>
        
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=1">
                <div><img src="../static/img/web/app/img_mobile_index_nav_001.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 " style="font-size:14px;">信托</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=2">
                <div><img src="../static/img/web/app/img_mobile_index_nav_002.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 " style="font-size:14px;">资管</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=3">
                <div><img src="../static/img/web/app/img_mobile_index_nav_003.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 " style="font-size:14px;">契约型</div>
            </a>
        </div>
       
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=1">
                <div><img src="../static/img/web/app/img_mobile_index_nav_004.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 " style="font-size:14px;">股权投资</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=3">
                <div><img src="../static/img/web/app/img_mobile_index_nav_005.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 " style="font-size:14px;">对冲•定增</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=2">
                <div><img src="../static/img/web/app/img_mobile_index_nav_006.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 " style="font-size:14px;">政府债</div>
            </a>
        </div>
         <div class="w_3 fl app_1">
            <a href="/web/appAboutUs">
                <div><img src="../static/img/web/app/img_mobile_index_nav_007.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 " style="font-size:14px;">关于我们</div>
            </a>
        </div>
        
        <div class="h10 clearb"></div>
</section>





<section style="border-top:none"  id="bottom_ul" class="m_index_footer">	
    <ul style="background-color:#DCDCDC;">
       <!-- <li >
            <a  href="/web/appindex">
                <span class="m_index_footer_img"><img src="../static/img/web/app/img_m_index_floatnav_index.png" width="100%"></span>
                <span  class="m_index_footer_font">网站首页</span>
            </a>
        </li>
        <li>
            <a href="http://p.qiao.baidu.com/cps2/chatIndex?reqParam=%7B%22from%22%3A0%2C%22sid%22%3A%22-100%22%2C%22tid%22%3A%22-1%22%2C%22ttype%22%3A1%2C%22siteId%22%3A%2210719146%22%2C%22userId%22%3A%2223645235%22%2C%22pageId%22%3A0%7D">
                <span class="m_index_footer_img"><img src="../static/img/web/app/img_m_index_floatnav_zixun.png" width="100%"></span>
                <span class="m_index_footer_font" >在线咨询</span>
            </a>
        </li>-->
        <li>
            <a href="#" onclick="dialPhone(4000096880)">
               <i class="iconfont">&#xe604;</i><span class="m_index_footer_font" style="line-height:48px;">电话咨询</span>
            </a>
        </li>
		
        <li>
        	 <img style="width:50px;margin-top:-9px" id="middle_img" onclick="subjectshow()" src="../static/img/web/app/fenlei.png"  />
        </li>
        
        <li>
            <a onclick="clickShow()">
                <i class="iconfont">&#xe629;</i><span class="m_index_footer_font" style="line-height:48px;">立即预约</span>
            </a>
        </li>
    </ul>
</section>

  
<a href="http://p.qiao.baidu.com/cps2/chatIndex?reqParam=%7B%22from%22%3A0%2C%22sid%22%3A%22-100%22%2C%22tid%22%3A%22-1%22%2C%22ttype%22%3A1%2C%22siteId%22%3A%2210719146%22%2C%22userId%22%3A%2223645235%22%2C%22pageId%22%3A0%7D"
  class="qiao-icon-bar" style="display:none; position:fixed;background-color: #f49703; color:#fff; top: 50%; font-size: 14px;  right: 5px;line-height: 1.3;
    width: 1em;
    padding: 1em;
    cursor: pointer;
    border-radius:.4rem">在线咨询</a> 
<script type="text/javascript">
	
	//得到浏览器信息
    var browser={   
		versions:function(){   
			var u = navigator.userAgent, app = navigator.appVersion;   
			return {   
			trident: u.indexOf('Trident') > -1, //IE内核   
			presto: u.indexOf('Presto') > -1, //opera内核   
			webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核   
			gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核   
			mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端   
			ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端   
			android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器   
			iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器   
			iPad: u.indexOf('iPad') > -1, //是否iPad   
			webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部   
			};  
		}()  
	}
    	function dialPhone(date){
    		var fal = true;
			if(browser.versions.ios){
				fal = false;
			} 
			if(browser.versions.android){
				fal = false;
			}
			if(browser.versions.iPhone){
				fal = false;
			} 
			if(browser.versions.iPad){
				fal = false;
			}
			//判断浏览器是否为手机浏览器
			console.log(fal);
			if(fal){
				return false;
			}else{
				window.location.href = 'tel:' + date;
			}
			
		}
</script>
<!--弹出内容开始-->
    <div id="jquery-yuyue">
        <div id="jquery-overlay" style=" display:none;"></div>
        <div id="jquery-lightbox" style=" display:none;">
		    <div id="lightbox-container-image-data-box">
                <div class="lightbox-container_box_left">立即预约</div>
                <div class="lightbox-container_box_right">
			        <a id="lightbox-secNav-btnClose">
					    <img src="../static/img/web/app/lightbox-btn-close.png">
				    </a>
                </div>
		    </div>
		    <div id="lightbox-container-image-box">
                <div>
                    <div style="width: 60%; margin: 0 auto; height: 36px; font-size:16px; line-height: 36px; text-align: left; color:#333333;">
                        姓名：</div>
                    <div style="width: 60%; margin: 0 auto;">
                        <input type="text" id="UserName" style="border: 1px solid #f49703; width: 100%; height: 36px; color:#999999;
                            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" value="请输入您的姓名" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的姓名&#39;}" onfocus="if (value ==&#39;请输入您的姓名&#39;){value =&#39;&#39;}"></div>
                    <div style="width: 60%; margin: 5px auto 0px; height: 36px; font-size:16px; line-height: 36px; text-align: left; color:#333333;">
                        手机号：</div>
                    <div style="width: 60%; margin: 0 auto;">
                        <input type="text" id="ContactMobile" style="border: 1px solid #f49703; width: 100%; color:#999999;
                            height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" value="请输入您的手机号" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的手机号&#39;}" onfocus="if (value ==&#39;请输入您的手机号&#39;){value =&#39;&#39;}"></div>
                    <div style="width: 60%; margin: 20px auto 0px;">
                        <div style="background: #f49703; border: none; width: 70%; height: 36px; margin: 0 auto; line-height: 36px;
                            color: #fff; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; cursor:pointer;
                            margin-top: 20px;" onclick="zixun_click()">
                            立即提交</div>
                    </div>
                    <div class="h20"></div>
                    <div class=" h54 fs14 lh24 tac c666666">想了解更多产品详细资料<br>请拨打咨询热线：<span class="cff6c00 fwb fs18">400-0096-880</span></div>
                    
                </div>
		    </div>
	    </div>
    </div>
    
    <!--弹出内容结束-->
    
    <script type="text/javascript">
    var arrPageSizes;
    $(function () {
        arrPageSizes = ___getPageSize();
        $('#jquery-overlay,#lightbox-secNav-btnClose').click(function () {
        	$("#bottom_ul").css("display","block");
            $('#jquery-lightbox').hide();
            $('#jquery-overlay').fadeOut(function () { $('#jquery-overlay').hide(); });
        });
        
        $("#UserName,#ContactMobile").focus(function(){
        	$("#bottom_ul").css("display","none");
        })
    })

    function zixun_click() {
        var UserName = $("#UserName").val().trim();
        var ContactMobile = $("#ContactMobile").val().trim();
        var url = window.location.href;
        if (checkUsername()) {
            if (ClickBtnLogin() == true) {
                //ajax开始
                $.ajax({
                    type: "Post",
                    url: "/web/cpyy",
                    data: {
                        NAME: UserName,
                        PHONE: ContactMobile
                    },
                    cache: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        if (data.result == '01') {
                        	alert("预约提交成功，环成专业投资顾问将在24小时内与您联系!");
                            $("#UserName").val("");
                            $("#ContactMobile").val("");
                            return;
                        }
                        alert("预约提交失败!");
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

    function checkUsername() {
        var strBool = true;
        //正则表达式
        var reg = new RegExp("^[a-zA-Z\d\u4E00-\u9FA5]+$");
        //获取输入框中的值
        var username = document.getElementById("UserName").value.trim();
        //判断输入框中有内容
        if (!reg.test(username)) {
            strBool = false;
            return strBool;
        }
        else
        {return true;}
    }

    function ClickBtnLogin() {
        var UserName = $("#UserName").val().trim();
        var ContactMobile = $("#ContactMobile").val().trim();
        if (UserName == '' || UserName == '请输入您的姓名') {
            alert("请输入您的姓名!");
            $("#UserName").focus();
            return false;
        }
        if (ContactMobile == '') {
            alert("请输入您的手机号码!");
            $("#ContactMobile").focus();
            return false;
        }
        else {
            if (isMobileNO(ContactMobile) == true) {
                return true;
            }
            else {
                alert("您输入的手机号格式错误!");
                $("#ContactMobile").empty();
                return false;
            }
        }
    }

    function isMobileNO(obj) {
        //var tel = $(obj).val();
        var myreg = /^[1-9][0-9]{10}$/;
        if (myreg.test(obj)) {
            return true;
        }
        else {
            return false;
        }
    }

    function clickShow() {
        $('#jquery-lightbox').show();
        $('#jquery-overlay').fadeOut(function () {
            $('#jquery-overlay').show();
            $('#jquery-overlay').css({
                width: arrPageSizes[0],
                height: arrPageSizes[1]
            }).fadeIn();
        });
    }
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
</script> 
 	<nav id="menu" class="menu">
      <a href="/web/appindex" target="_blank" class="">
        <header id="WEBTYPES1" class="menu-header appCeHuaXuanZhong">
          <span class="menu-header-title">首页</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=1" target="_blank">
        <header id="WEBTYPES2"  class="menu-header">
          <span class="menu-header-title">信托产品</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=2" target="_blank">
        <header id="WEBTYPES3" class="menu-header">
          <span class="menu-header-title">资管产品</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=3" target="_blank">
        <header id="WEBTYPES4" class="menu-header">
          <span class="menu-header-title">契约产品</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=1" target="_blank">
        <header id="WEBTYPES5" class="menu-header">
          <span class="menu-header-title">股权投资</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=2" target="_blank">
        <header id="WEBTYPES6" class="menu-header">
          <span class="menu-header-title">政府债</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=3" target="_blank">
        <header id="WEBTYPES7" class="menu-header">
          <span class="menu-header-title">对冲•定增</span>
        </header>
      </a>
      <a href="/web/appAboutUs" target="_blank">
        <header id="WEBTYPES8" class="menu-header">
          <span class="menu-header-title">关于我们</span>
        </header>
      </a>
      <a href="/web/appContactUs" target="_blank">
        <header id="WEBTYPES9" class="menu-header">
          <span class="menu-header-title">联系我们</span>
        </header>
      </a>
    </nav>

	<a id="panel" >
     
	</a>	
	
<script>var exports = null;</script>
<script src="../static/js/web/app/slideout.js"></script>
<script src="../static/js/web/app/test.js"></script>
<script>
      window.onload = function() {
      	//加载侧滑
        document.querySelector('.js-slideout-toggle').addEventListener('click', function() {
          slideout.toggle();
        });
        //删除侧栏选中
        $($("#menu").children().children()).each(function(){
			$(this).removeClass();
			$(this).addClass("menu-header");
		});
		//选中当前页
		var ID = "WEBTYPES"+$("#WEBTYPE").val();
		$("#"+ID).addClass("appCeHuaXuanZhong");
      };
</script>