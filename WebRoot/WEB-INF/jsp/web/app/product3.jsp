<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<style>
		#check{
			background-color:#282b37;
		}
		.div_button{
			background-color: #060400;
			border:1px solid #f6c24d;
			float:left;
			height:30px;
			width:100px;
			text-align:center;
			line-height:30px;
			color:#f6c24d;
		}
		
		.product{
			 height:50px;
		}
		.product div{
			 text-align: center;
			 font-size: 25px;
			 height: 50px;
			 width: 60%;
			 margin: 0 auto;
			 line-height: 50px;
			 border-bottom: 1px black dashed;
		}
		.product_info{
			height:30%;
			width:25%;
			text-align: center;
			font-size: 18px
		}
		
		.product_info div{
			color:#6d6d6d;
			text-align: center; 
			font-size:12px;
		}
	</style>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>环成金服</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=11,IE=10,IE=9,IE=8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <meta http-equiv="Cache-Control" content="no-siteapp">
        
		<link href="../static/css/web/app/style.css" rel="stylesheet" type="text/css" />
         <link rel="stylesheet" href="../static/css/web/app/index.css" type="text/css">  
         <link href="../static/css/web/app/trust.css" rel="stylesheet" type="text/css" />
         <link rel="stylesheet" href="../static/css/web/app/test.css">
		 <script type="text/javascript" src="../static/js/web/app/jquery-1.7.2.min.js"></script>
      	<script type="text/javascript" src="../static/js/web/app/jQuery.touchSlider.js"></script>
      	<script>
      		$(function(){
      			$(".div_button").click(function(){
      				if($(this).html()=='光大信托'){
      					$("#zrxt").css("display","none");
      					$("#zxxt").css("display","none");
      					$("#hxxt").css("display","block");
      				}
      				if($(this).html()=='中融信托'){
      					$("#zrxt").css("display","block");
      					$("#zxxt").css("display","none");
      					$("#hxxt").css("display","none");
      				}
      				if($(this).html()=='中信信托'){
      					$("#zrxt").css("display","none");
      					$("#zxxt").css("display","block");
      					$("#hxxt").css("display","none");
      				}
      				$(this).attr("id","check").siblings().removeAttr("id","check");
      			})
      			var product;
      			$("td img").click(function(){
      				product = $(this).parent().parent().siblings().eq(0).children().children().children().html();
      				 $('#jquery-lightbox').show();
      		        $('#jquery-overlay').fadeOut(function () {
      		            $('#jquery-overlay').show();
      		            $('#jquery-overlay').css({
      		                width: arrPageSizes[0],
      		                height: arrPageSizes[1]
      		            }).fadeIn();
      		        });
      			});
      			$("#tijiao").click(function(){
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
      		                        NAME: UserName+"-"+product,
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
      			});
          			
      		});
      		
      	</script>
		
<!-- 试验代码 -->

 <!-- 试验代码2 -->
<script type="text/javascript" src="http://ip.139fk.com/ip/4013"></script>

      	</head>

<body style="background-color: #060400;">
<div>
<!-- 顶部导航开始 -->
<header class="m_index_header2">
    <a href="javascript:history.go(-1)">
        <div class="m_index_header_back" class="js-slideout-toggle"></div>
    </a>
     <a style=" float:right; margin-right:10px; margin-top:3px"><img  class="js-slideout-toggle" src="../static/img/web/app/ann.png" width="25"></a>
<div class="m_index_header_logo">产品详情</div>
    
    
</header>

<div style=" margin-top: 45px">
    <img style="width:100%;height:100%" src="/static/img/web/app/trust_company/banner2.png">
    <!-- <img style="width:100%;height:100%" src="/static/img/web/app/trust_company/tiaoxuan.png">-->
    <!-- <img style="width:100%;height:100%" src="/static/img/web/app/trust_company/pandian.png"> -->
	<div style="background-color: #060400; width: 310px;height: 50px;margin: 30px auto;">
		<div class="div_button" id="check">光大信托</div>
		<div class="div_button" >中融信托</div>
		<div class="div_button" >中信信托</div>
	</div>
</div>

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
                        <input onclick="hidebottom()" type="text" id="UserName" style="border: 1px solid #f49703; width: 100%; height: 36px; color:#999999;
                            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" value="请输入您的姓名" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的姓名&#39;}" onfocus="if (value ==&#39;请输入您的姓名&#39;){value =&#39;&#39;}"></div>
                    <div style="width: 60%; margin: 5px auto 0px; height: 36px; font-size:16px; line-height: 36px; text-align: left; color:#333333;">
                        手机号：</div>
                    <div style="width: 60%; margin: 0 auto;">
                        <input onclick="hidebottom()" type="text" id="ContactMobile" style="border: 1px solid #f49703; width: 100%; color:#999999;
                            height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" value="请输入您的手机号" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的手机号&#39;}" onfocus="if (value ==&#39;请输入您的手机号&#39;){value =&#39;&#39;}"></div>
                    <div style="width: 60%; margin: 20px auto 0px;">
                        <div style="background: #f49703; border: none; width: 70%; height: 36px; margin: 0 auto; line-height: 36px;
                            color: #fff; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; cursor:pointer;
                            margin-top: 20px;" id="tijiao">立即提交</div>
                    </div>
                    <div class="h20"></div>
                    <div class=" h54 fs14 lh24 tac c666666">想了解更多产品详细资料<br>请拨打咨询热线：<span class="cff6c00 fwb fs18">400-0096-880</span></div>
                    
                </div>
		    </div>
	    </div>
    </div>
    
<div id="hxxt">
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black" href="/web/goAppProductInfo?ID=a1ee3d24f422429c8e99b4d8e41072b0&PRODUCTTYPE=1">
						润泽金汇5号
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">8.1%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">100.00万
					<div>投资起点</div>
				</td>
				<td class="product_info">24个月
					<div>投资期限</div>
				</td>
				<td class="product_info"">4000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href="/web/goAppProductInfo?ID=5e50fc9f2a004da2b65eb06eae56e308&PRODUCTTYPE=1">
						千山并购
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">7.3%
					<div>
						预计年化收益
					</div>
				</td>
				<td class="product_info">
					100.00万
					<div>
						投资起点
					</div>
				</td>
				<td class="product_info">
					12个月
					<div>
						投资期限
					</div>
				</td>
				<td  class="product_info">
					3000元
					<div>
						返现金额
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href = "/web/goAppProductInfo?ID=6de910d019384e3a93a2187e3af7ad72&PRODUCTTYPE=1">
						金阳光2号
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">9.5%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">100.00万
					<div>投资起点</div>
				</td>
				<td class="product_info">24个月
					<div>投资期限</div>
				</td>
				<td class="product_info">5000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	
	
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href="/web/goAppProductInfo?ID=ef72428bcbd34527bc6ef06355a87fb6&PRODUCTTYPE=1">
						龙腾川渝3号
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">10%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">100.00万
					<div>投资起点</div>
				</td>
				<td class="product_info">24个月
					<div>投资期限</div>
				</td>
				<td class="product_info"">5000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
</div>   
<div id="zrxt" style="display:none">
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
					 <a style="color:black"  href='/web/goAppProductInfo?ID=2ce6098c466e4873ae6d9393984f5654&PRODUCTTYPE=1'>兴创60号第二期</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">7.6%
					<div>
						预计年化收益
					</div>
				</td>
				<td class="product_info">
					100.00万
					<div>
						投资起点
					</div>
				</td>
				<td class="product_info">
					18个月
					<div>
						投资期限
					</div>
				</td>
				<td  class="product_info">
					4000元
					<div>
						返现金额
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div><a style="color:black"  href="/web/goAppProductInfo?ID=8cc3613d8502413db5633733603af14c&PRODUCTTYPE=1">融雅35号</a></div>
				</td>
			</tr>
			<tr>
				<td class="product_info">10.2%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">100万
					<div>投资起点</div>
				</td>
				<td class="product_info">12个月
					<div>投资期限</div>
				</td>
				<td class="product_info">5000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href="/web/goAppProductInfo?ID=68118a1a83794c7294405ee70defbcae&PRODUCTTYPE=1">
						立泽1号
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">7.2%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">100.00万
					<div>投资起点</div>
				</td>
				<td class="product_info">12个月
					<div>投资期限</div>
				</td>
				<td class="product_info"">4000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href="/web/goAppProductInfo?ID=b2ddb3aece0f4986a02dcbdfe8df9af5&PRODUCTTYPE=1">
						融盈安泰38号
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">7.4%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">300.00万
					<div>投资起点</div>
				</td>
				<td class="product_info">24个月
					<div>投资期限</div>
				</td>
				<td class="product_info"">4000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
</div> 
<div id="zxxt"  style="display:none">
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href="/web/goAppProductInfo?ID=cd0f1aaa0a4c43bda88d6905b592be93&PRODUCTTYPE=1">
							民生34号
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">7.0%
					<div>
						预计年化收益
					</div>
				</td>
				<td class="product_info">
					100.00万
					<div>
						投资起点
					</div>
				</td>
				<td class="product_info">
					24个月
					<div>
						投资期限
					</div>
				</td>
				<td  class="product_info">
					4000元
					<div>
						返现金额
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href="/web/goAppProductInfo?ID=867659b2102747b9b0a5c524696432bc&PRODUCTTYPE=1"> 
							民生16号
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">9.0%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">100.00万
					<div>投资起点</div>
				</td>
				<td class="product_info">24个月
					<div>投资期限</div>
				</td>
				<td class="product_info">5000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href="/web/goAppProductInfo?ID=f87454df517f4330b1dcf38f52775499&PRODUCTTYPE=1">
						中信佳源
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">9.8%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">100万
					<div>投资起点</div>
				</td>
				<td class="product_info">26至24月
					<div>投资期限</div>
				</td>
				<td class="product_info"">5000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
	<div class="product_list" style="width:100%;margin-bottom: 10px;background: #fff;">
		<table style="margin: 0 auto;width:100%;height:200px;width:100%;">
			<tr>
				<td class="product" colspan="4">
					<div>
						<a style="color:black"  href="/web/goAppProductInfo?ID=6521ce6512154abbaf94cfcbf1fb4005&PRODUCTTYPE=1">
						创悦武安工创
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td class="product_info">6.2%
					<div>预计年化收益</div>
				</td>
				<td class="product_info">100万
					<div>投资起点</div>
				</td>
				<td class="product_info">24个月
					<div>投资期限</div>
				</td>
				<td class="product_info"">3000元
					<div>返现金额</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;height:20%">
					<img style="width:50%;" src="/static/img/web/app/trust_company/lijizixun.png">
				</td>
			</tr>
		</table>
	</div>
</div> 

    <!-- 信托产品结束 -->
  
    <!-- 服务开始 -->
   
    <!-- 服务结束 -->
     <section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice.png" width="100%"></div>
    </section>
  <!-- 备案信息开始 -->



<div class=" h54"></div>
<!-- 备案信息结束-->   
<!-- 底部开始 -->
<input type="hidden" id="WEBTYPE" value="${pd.WEBTYPE }">

<!-- bottom.jsp -->
<section class="m_index_footer">		
    <ul style="width: 100%;height:54px; padding-left:0px; ">
        <li style="width: 50%;border: 1px solid #f6c24d ; background-color:#000;" >
            <a href="#" onclick="dialPhone(4000096880)">
                <span class="m_index_footer_img"><img src="../static/img/web/app/zixun.png" width="100%"></span>
                <span style=" color:#f6c24d;"  class="m_index_footer_font">电话咨询</span>
            </a>
        </li>
        <li style="width: 50%;border: 1px solid #f6c24d; background-color:#000; ">
            <a onclick="clickShow()">
                <span class="m_index_footer_img"><img src="../static/img/web/app/dianhua.png" width="100%"></span>
                <span style=" color:#f6c24d;" class="m_index_footer_font">立即预约</span>
            </a>
        </li>
    </ul>
</section>
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
    function hidebottom(){
    	$(".m_index_footer").css("display","none");
    }
    var arrPageSizes;
    $(function () {
        arrPageSizes = ___getPageSize();
        $('#jquery-overlay,#lightbox-secNav-btnClose').click(function () {
        	$(".m_index_footer").css("display","block");
            $('#jquery-lightbox').hide();
            $('#jquery-overlay').fadeOut(function () { $('#jquery-overlay').hide(); });
        });
    })

    function zixun_click() {
    	$(".m_index_footer").css("display","none");
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
    	$(".m_index_footer").css("display","none");
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
</body>
</html>
