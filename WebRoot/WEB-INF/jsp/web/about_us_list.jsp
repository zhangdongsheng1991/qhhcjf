<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<link rel="Shortcut Icon" href="static/img/web/logo2.ico"> 
<title>公司简介_关于我们——环成金服</title>
<meta name="keywords" content="信托产品_资管产品_政府债券_股权投资_环成金服" />
<meta name="description" content=" 环成金服是国内一家专为高净值人群提供财富管理服务的综合性平台，位于国际金融中心深圳。专注于财富管理领域，致力于为单笔投资100万以上的个人客户及机构客户提供固定收益金融资产配置。成立至今，已为超过3.5万名高净值客户完成资产配置，总计配置资产规模达400亿。" />

<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css" href="static/css/web/gjf_index.css">

    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
 <script type="text/javascript">
        function ClickChangePlace(num) {
            var img = 'url(static/img/web/img_aboutusnew0' + num + '.png) no-repeat';
            $("#ChangeImg").css({ "background": img });
            location.hash="#href"+num;  
            history.replaceState(null,'',location.pathname+location.search);
        }
        $(document).ready(function () {
            var windowwidth = $(window).width();
            var height1 = 462;
            var height2 = 386;
            var height3 = 356;
            var height4 = 781;
            /* var height5 = 298;
            var height6 = 571;
            var height7 = 371;
            var height8 = 666;
            var height9 = 411;
            var height10 = 366; */
            $(window).scroll(function () {
                aa = parseInt($(document).height()); //获取文档的高度
                oo = parseInt($(document).scrollTop()); //获取滚动条到顶部的垂直高度
               /*  console.log("oo="+oo); */
                if (oo >= 4400 || 3381<=oo) {
                    $("#whyC").hide();
                }
                else if (oo >= 450 + height1 + height2 + height3 + height4) {
                    $("#whyC").show();
                    var img = 'url(static/img/web/img_aboutusnew05.png) no-repeat';
                    $("#ChangeImg").css({ "background": img });
                }
                else if (oo >= 450 + height1 + height2 + height3) {
                    $("#whyC").show();
                    var img = 'url(static/img/web/img_aboutusnew04.png) no-repeat';
                    $("#ChangeImg").css({ "background": img });
                }
                else if (oo >= 450 + height1 + height2) {
                    $("#whyC").show();
                    var img = 'url(static/img/web/img_aboutusnew03.png) no-repeat';
                    $("#ChangeImg").css({ "background": img });
                }
                else if (oo >= 450 + height1) {
                    $("#whyC").show();
                    var img = 'url(static/img/web/img_aboutusnew02.png) no-repeat';
                    $("#ChangeImg").css({ "background": img });
                }
                else if (oo >= 420) {
                    $("#whyC").show();
                    var img = 'url(static/img/web/img_aboutusnew01.png) no-repeat';
                    $("#ChangeImg").css({ "background": img });
                }
                else if (oo < 300) {
                    $("#whyC").hide();
                }
                else {
                }
            });
        });
	</script>  
	<%@include file="baidusq.jsp"%>
</head>

<body style=" background-color:#fcfcfc;">
 <%@include file="head.jsp"%>
    
        <!-- 内容部分 -->
    <div id="container" style="border: none; background: none;">
        <!-- banner -->
        <div id="trust_index_banner" class="clearb" style="width:100%; height:350px; background:url(static/img/web/img_index_banner_joinus.jpg) no-repeat top center;"></div>
            <div id="common_currentlocation" class=" clearb">
       			<div id="ctl00_ContentPlaceHolder1_Location_common_currentlocation_list" class=" w1200 mauto h48 lh48 fs14 c666666">
                    <div class=" fl">当前位置：</div>
                    <div class=" fl ml10"><a href="web/index">首页</a></div>
                    <div class=" fl ml10">&gt;</div>
                    <div class=" fl ml10"><a href="javascript:{location.reload();}">关于我们</a></div>
				</div>
    		</div>
            
            <div id="whyC" class=" w220 fl" style="display: none;margin-top: 200px;">
                <div id="topcontrol" style="position: fixed; bottom: -120px; opacity: 1; left:80px">
                <div id="ChangeImg" style="background: url(&quot;static/img/web/img_aboutusnew01.png&quot;) no-repeat; width: 130px; height: 500px;">
                <div id="Hei1"></div>
                <div id="Hei2"></div>
                <div id="Hei3"></div>
                <div id="Hei"></div>
                <div style="width:130px;height:44px;"><a style="width:130px;height:44px; display:block;" onclick="ClickChangePlace(1)" ></a></div>
                <div style="width:130px;height:44px;"><a style="width:130px;height:44px; display:block;" onclick="ClickChangePlace(2)" ></a></div>
                <div style="width:130px;height:44px;"><a style="width:130px;height:44px; display:block;" onclick="ClickChangePlace(3)" ></a></div>
                <div style="width:130px;height:44px;"><a style="width:130px;height:44px; display:block;" onclick="ClickChangePlace(4)" ></a></div>
                <div style="width:130px;height:44px;"><a style="width:130px;height:44px; display:block;" onclick="ClickChangePlace(5)" ></a></div>
                </div></div></div>
            <!-- 公司简介开始 -->
             <div class="core_team">
             	<a id="href1"></a>
                <div class=" w1160 mauto"><img src="static/img/web/img_coreteam_toptitlepic1.png"></div>
                <div class="h10">
                </div>
                <div class=" fs16 lh32 c999999">
                	<p class=" tindent2">	环成金服隶属于深圳前海环成投资咨询有限公司</p>
                    <p class=" tindent2">环成金服是国内一家专为高净值人群提供财富管理服务的综合性平台，位于国际金融中心深圳。</p>
                    <p class=" tindent2">环成金服专注于财富管理领域，致力于为单笔投资100万以上的个人客户及机构客户提供固定收益金融资产配置。</p>
<!-- 、阳光私募基金、房地产基金、PE股权投资基金、高端保险、海外基金等 -->
                    <p class=" tindent2">作为独立的第三方理财平台，我们始终坚持以客户为中心，根据客户财务状况和风险偏好，为客户量身提供个性化的理财方案，帮助客户实现稳定、安全的财富增值。</p>
                    <p class=" tindent2">成立至今，已有超过3.5万名高净值客户在环成金服成功完成资产配置，总计配置资产规模达400亿。</p>
					
                </div>
                <div class="h10">
                </div>
                    <!-- 公司简介结束 -->
                    <a id="href2"></a>
            	<div class=" w910 mauto"><img src="static/img/web/img_coreteam_toptitlepic8.png"></div>
                <div class="h10">
                </div>
               
            	<div class=" w910 mauto"><img src="static/img/web/img_aboutusnew_pic_05.jpg"></div>
                <a id="href3"></a>
               <div class=" w910 mauto"><img src="static/img/web/img_coreteam_toptitlepic4.png"></div>
                <div class="h10">
                </div>
                
            	<div class=" w910 mauto"><img src="static/img/web/img_aboutusnew_pic_06.jpg"></div>
               <div class="h10">
                </div>
                <a id="href4"></a>
               <div class=" w910 mauto"><img src="static/img/web/img_coreteam_toptitlepic5.png"></div>
                <div class="h10">
                </div>
                
            	<div class=" w910 mauto"><img src="static/img/web/img_aboutusnew_pic_08.jpg"></div>
               <div class="h10">
                </div>
               <a id="href5"></a>
               <div class=" w910 mauto"><img src="static/img/web/img_coreteam_toptitlepic6.png"></div>
                <div class="h10">
                </div>
            	<div class=" w910 mauto"><img src="static/img/web/img_aboutusnew_pic_09.jpg"></div>
               <a id="href7"></a>
               <div class="h10">
                </div>
                
               <div class=" w910 mauto"><img src="static/img/web/img_coreteam_toptitlepic3.png"></div>
                <div class="h10">
                </div>
            	<div class=" w910 mauto"><img src="static/img/web/img_aboutusnew_pic_07.png"></div>
                </div></div>
                 
                <!-- footer -->
<%@include file="bottom.jsp"%>
</body>
</html>
