﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?6a93be69174588430855a353187ddecc";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>
	
	<style>
		.core_team_list_headpic img{
		 	cursor:pointer;
		 }
		 #cpyy{ 
		    position: fixed;
			left: 36%;
			bottom: 163px;
			width: 309px;
			z-index: 9999;
			height: 351px;
			display: none;
			background-color: red
		} 
	</style>
    <base href="<%=basePath%>">
	<title>环成金服_信托产品_资管产品_信托理财投资咨询</title>
    <meta name="keywords" content="信托产品咨询_资管产品咨询_政府债券咨询_股权投资咨询_环成金服" />
    <meta name="description" content="环成金服为客户提供包括但不限于信托产品,资管产品,契约型基金,政府债产品,股权投资等理财产品的咨询服务,是国内一家专为高净值人群提供财富管理服务的综合性平台_专注于财富管理领域" />
	<!--360验证代码-->
	<meta name="360-site-verification" content="21b5b9b16dc1da54b15c645503a5637c" />
	<!--baidu yanzheng-->
	<meta name="baidu-site-verification" content="gTZeCE17bU" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
 	<meta name="sogou_site_verification" content="1iORNXGvMh"/>
    <link rel="stylesheet" type="text/css" href="static/css/web/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/index.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/common.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/gjf_index.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/owl.theme.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/slide.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/trust.css">
    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.cookie.js" type="text/javascript"></script>
    <script src="static/js/web/slide.js"></script> 
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
    <link rel="Shortcut Icon" href="static/img/web/logo2.ico">
<%@include file="baidusq.jsp"%>
</head>

<body style=" background-color:#f3f3f3;">

<script type="text/javascript">
    //  频道tab切换控制
    registerChannelEvent('channel-orange');
    registerChannelEvent('channel-blue');
	$(function(){
		if($.cookie('qhhcjf_index')!=null){
			$("#xinhuancontent_scroll").css("display","none");	
		}else{
			$("#xinhuancontent_scroll").css("display","block");
		}
		$(".core_team_list_headpic").click(
			function(){
				location.href='/web/teamList';
			}		
		)
		
	});
</script>


<%@include file="head.jsp"%>
<!--产品预约弹出框 -->
<%@include file="/WEB-INF/jsp/web/common/productreservation.jsp"%>
<input type="hidden" id="WEBTYPE" value="1">

<!-- banner -->

<div id="container" style="border: none; background: none;">
       <div>
        <div class="slider" id="slider">
		<div class="slider-inner">
			<!-- <div class="item">
				<img style="cursor: pointer;" onclick="" class="img" src='static/img/web/index_carousel/guoqing/guoqing_banner.jpg'>
			</div> -->
			
            <div class="item">
				<img style="cursor: pointer;"  class="img" src='static/img/web/banner-1.png'>
			</div>
            
			<div class="item">
				<!-- <img class="img" style="background: url('static/img/web/img_index_banner_joinus4.jpg');"> -->
				<!--<img class="img" src='static/img/web/img_index_banner_joinus4.jpg'>-->
				<img style="cursor: pointer;" onclick="goQuery('web/trust_searchpc')" class="img" src='static/img/web/index_carousel/trust_search/trust_searchpc.jpg'>
			</div>
			<div class="item">
				<!-- <img class="img" style="background: url('static/img/web/img_index_banner_joinus3.jpg');"> -->
				<img style="cursor: pointer;" onclick="goQuery('web/selected')" class="img" src='static/img/web/selected.jpg'>

			</div>
			
			<div class="item">
				<!-- <img class="img" style="background: url('static/img/web/img_index_banner_joinus2.jpg');"> -->
				<!--<img style="cursor: pointer;" onclick="goQuery('web/goquery')" class="img" src='static/img/web/trust_company.png'>-->
				<img style="cursor: pointer;" onclick="goQuery('web/trust_company')" class="img" src='static/img/web/trust_company.png'>
			</div>
			<!--<div class="item">-->
				<!--170919 <img class="img" style="background: url('static/img/web/img_index_banner_joinus1.jpg');"> -->
				<!--170919 <img class="img" src='static/img/web/img_index_banner_joinus1.jpg'>-->
				<!--<img style="cursor: pointer;" onclick="goQuery('web/wealth')" class="img" src='static/img/web/wealth.jpg'>-->
			<!--</div>-->
			<div class="item">
				<!-- <img class="img" style="background: url('static/img/web/img_index_banner_joinus4.jpg');"> -->
				<!--<img class="img" src='static/img/web/img_index_banner_joinus4.jpg'>-->
				<img style="cursor: pointer;" onclick="goQuery('web/soe')" class="img" src='static/img/web/soe.jpg'>
			</div>
			
		</div>
	</div>

        <%@include file="tixing.jsp"%>
        <div class="w1200 mauto main">
            <!--  最新上线与热门推荐-start  -->
            <div class="newest-and-hot clearfix">
                <div class="newest float-left">
                    <h3 class="newest-and-hot-title">最新上线</h3>
                    <div id="ctl00_ContentPlaceHolder1_index_new_online_product_server" class=" newest-slide">
                        <div id="owl-example" class="owl-carousel">
                            <div>
                                <ul>
                                    <c:choose>
                                        <c:when test="${not empty newProduct}">
                                            <c:forEach items="${newProduct}" var="var" varStatus="vs">
                                                <c:if test="${vs.index eq 0 || vs.index eq 1 || vs.index eq 2 || vs.index eq 3 }">
                                                    <li class="slide-list-item clearfix">
                                                        <div class="float-left icon-left">
                                                            <div class="icon-bg"
                                                                 style="background-image: url(static/img/web/crown_${vs.index+1}.png)">
                                                                ${vs.index+1}
                                                            </div>
                                                        </div>
                                                        <div class="float-left content-right">
                                                            <div class="content-right-div1">
                                                                <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                                   target="_blank" class="content-right-title">
                                                                    [${var.TYPENAME}]
                                                                    <c:if test="${fn:length(var.PRODUCTREFERRED) > 11 }">
                                                                        ${fn:substring(var.PRODUCTREFERRED,0,11)}...
                                                                    </c:if>
                                                                    <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 11 }">
                                                                        ${var.PRODUCTREFERRED}
                                                                    </c:if>
                                                                </a>
                                                            </div>
                                                            <div class="content-right-div2 clearfix">
                                                                <div class="float-left desc-left">
                                                                    <div class="desc-span1 c999999 fl">期限：</div>
                                                                    <div class="desc-span2 fs14 fl" style="">
                                                                        ${var.PRODUCTDEADLINE}
                                                                    </div>
                                                                    <div class="vertical-line ml10 fr"></div>
                                                                </div>
                                                                <div class="float-left desc-right">
                                                                    <div class="desc-span1 c999999 fl ml-4">预计收益：</div>
                                                                    <div class="desc-span2 fs14 fl fwb">
                                                                        ${var.RETURNSBENCHMARKMAX}
                                                                    </div>
                                                                </div>
                                                                <div class="clearb"></div>
                                                            </div>
                                                            <div class="content-right-div3"><span
                                                                    class="c999999">上线时间</span>：${var.YMH}
                                                            </div>
                                                        </div>
                                                        <div class="clearb"></div>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                </ul>
                            </div>
                            <c:if test="${ fn:length(newProduct) > 4 }">
                                <div>
	                                <ul>
	                                    <c:choose>
	                                        <c:when test="${not empty newProduct}">
	                                            <c:forEach items="${newProduct}" var="var" varStatus="vs">
	                                                <c:if test="${vs.index eq 4 || vs.index eq 5 || vs.index eq 6 || vs.index eq 7  }">
	                                                    <li class="slide-list-item clearfix">
	                                                        <div class="float-left icon-left">
	                                                            <div class="icon-bg"
	                                                                style="background-image: url(static/img/web/crown_4.png)">
	                                                                ${vs.index+1}
	                                                            </div>
	                                                        </div>
	                                                        <div class="float-left content-right">
	                                                            <div class="content-right-div1">
	                                                                <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
	                                                                   target="_blank" class="content-right-title">
	                                                                    [${var.TYPENAME}]
	                                                                    <c:if test="${fn:length(var.PRODUCTREFERRED) > 11 }">
	                                                                        ${fn:substring(var.PRODUCTREFERRED,0,11)}...
	                                                                    </c:if>
	                                                                    <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 11 }">
	                                                                        ${var.PRODUCTREFERRED}
	                                                                    </c:if>
	                                                                </a>
	                                                            </div>
	                                                            <div class="content-right-div2 clearfix">
	                                                                <div class="float-left desc-left">
	                                                                    <div class="desc-span1 c999999 fl">期限：</div>
	                                                                    <div class="desc-span2 fs14 fl">
	                                                                        ${var.PRODUCTDEADLINE}
	                                                                    </div>
	                                                                    <div class="vertical-line ml10 fr"></div>
	                                                                </div>
	                                                                <div class="float-left desc-right">
	                                                                    <div class="desc-span1 c999999 fl ml-4">预计收益：</div>
	                                                                    <div class="desc-span2 fs14 fl fwb">
	                                                                        ${var.RETURNSBENCHMARKMAX}
	                                                                    </div>
	                                                                </div>
	                                                                <div class="clearb"></div>
	                                                            </div>
	                                                            <div class="content-right-div3"><span
	                                                                    class="c999999">上线时间</span>：${var.YMH}
	                                                            </div>
	                                                        </div>
	                                                        <div class="clearb"></div>
	                                                    </li>
	                                                </c:if>
	                                            </c:forEach>
	                                        </c:when>
	                                    </c:choose>
	                                </ul>
	                            </div>
                            </c:if>
                            <c:if test="${ fn:length(newProduct) > 8 }">
                               <div>
	                                <ul>
	                                    <c:choose>
	                                        <c:when test="${not empty newProduct}">
	                                            <c:forEach items="${newProduct}" var="var" varStatus="vs">
	                                                <c:if test="${vs.index eq 8 || vs.index eq 9 || vs.index eq 10 || vs.index eq 11  }">
	                                                    <li class="slide-list-item clearfix">
	                                                        <div class="float-left icon-left">
	                                                            <div class="icon-bg"
	                                                                  style="background-image: url(static/img/web/crown_4.png)">
	                                                                ${vs.index+1}
	                                                            </div>
	                                                        </div>
	                                                        <div class="float-left content-right">
	                                                            <div class="content-right-div1">
	                                                                <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
	                                                                   target="_blank" class="content-right-title">
	                                                                    [${var.TYPENAME}]
	                                                                    <c:if test="${fn:length(var.PRODUCTREFERRED) > 11 }">
	                                                                        ${fn:substring(var.PRODUCTREFERRED,0,11)}...
	                                                                    </c:if>
	                                                                    <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 11 }">
	                                                                        ${var.PRODUCTREFERRED}
	                                                                    </c:if>
	                                                                </a>
	                                                            </div>
	                                                            <div class="content-right-div2 clearfix">
	                                                                <div class="float-left desc-left">
	                                                                    <div class="desc-span1 c999999 fl">期限：</div>
	                                                                    <div class="desc-span2 fs14 fl">
	                                                                        ${var.PRODUCTDEADLINE}
	                                                                    </div>
	                                                                    <div class="vertical-line ml10 fr"></div>
	                                                                </div>
	                                                                <div class="float-left desc-right">
	                                                                    <div class="desc-span1 c999999 fl ml-4">预计收益：</div>
	                                                                    <div class="desc-span2 fs14 fl fwb">
	                                                                        ${var.RETURNSBENCHMARKMAX}
	                                                                    </div>
	                                                                </div>
	                                                                <div class="clearb"></div>
	                                                            </div>
	                                                            <div class="content-right-div3"><span
	                                                                    class="c999999">上线时间</span>：${var.YMH}
	                                                            </div>
	                                                        </div>
	                                                        <div class="clearb"></div>
	                                                    </li>
	                                                </c:if>
	                                            </c:forEach>
	                                        </c:when>
	                                    </c:choose>
	                                </ul>
	                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#owl-example").owlCarousel({
                            items: 1, //  每一屏显示的内容数量
                            autoPlay: 5000, //  启用自动播放,5秒
                            stopOnHover: true, //  鼠标悬停
                        });
                    })
                    $(function(){
                    	$(".ljyy").click(
                    		function(){
                    			var id = $(this).children("input[name='p_id']").val();
                    			var type = $(this).children("input[name='p_type']").val();
                    			$('.yy1').show(); 
                    			$('#PRODUCTID').val(id);
                    			$('#PRODUCTTYPE').val(type);
                    		}
                    	);
                    	
                    });
                    
                </script>
				

                <!--右边-->
                <div class="hot float-left">
                    <h3 class="newest-and-hot-title">
                        热门推荐:
			<small>环成金服上线的产品都经过严格筛选，请新老客户放心选购。

			</small>
		     </h3>
                    <div id="ctl00_ContentPlaceHolder1_index_hot_online_product_server" class="hot-content">
                        <c:forEach items="${pushListTop}" var="var" varStatus="vs">
                            <c:choose>
                                <c:when test="${vs.index eq 0 }">
                                    <!--右边上部分-->
                                    <div class="hot-content-top clearfix">
                                        <div class="float-left hot-content-top-left">
                                            <div class="hot-title position-relative">
                                                <div class="hot-title-icon-left"></div>
                                                <h3 class="hot-title-h3"><a
                                                        href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                        target="_blank" class="hot-title-link">${var.PRODUCTREFERRED
                                                    }</a></h3>
                                                <div class="hot-title-icon-right">募集中</div>
                                            </div>

                                            <div class="hot-description-icons">
                                                <div class="hot-description-icon hot-description-icon1"
                                                     style="background-image: url(static/img/web/hot_description_icon1.png)">
                                                    <p class="hot-description-icon-p1">投资期限</p>
                                                    <p class="hot-description-icon-p2">${var.PRODUCTDEADLINE }</p></div>
                                                <div class="hot-description-icon hot-description-icon2"
                                                     style="background-image: url(static/img/web/hot_description_icon2.png)">
                                                    <p class="hot-description-icon-p1">预计收益率</p>
                                                    <p class="hot-description-icon-p2">${var.RETURNSBENCHMARKMAX }</p>
                                                </div>
                                                <div class="hot-description-icon hot-description-icon3"
                                                     style="background-image: url(static/img/web/hot_description_icon3.png)">
                                                    <p class="hot-description-icon-p1">融资规模</p>
                                                    <p class="hot-description-icon-p2">${var.EXPECTISSUANCE }</p></div>
                                            </div>
                                        </div>
                                        <div class="float-left hot-content-top-right">
                                            <div class="hot-content-top-right-money">起投金额：<span>${var.INVESTMENTSTARTING }</span>
                                            </div>
                                            <p class="hot-content-top-right-description">
                                                产品点评：
                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 28 }">
                                                    ${fn:substring(var.PRODUCTREVIEWS,0,28)}...
                                                </c:if>
                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 28 }">
                                                    ${var.PRODUCTREVIEWS}
                                                </c:if>
                                            </p>
                                            <div class="align-center">
	                                            <div class="cpointer btn btn-big  cpointer ljyy">
	                                               		<input type="hidden" name="p_id" value="${var.ID}">
	                                               		<input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
	                                                                                                                                     立即预约
	                                            </div>
                                            </div>
                                        </div>
                                        <div class="clearb"></div>
                                    </div>
                                    <div class="hot-content-bottom clearfix">
                                </c:when>
                                <c:otherwise>
                                    <div class="hot-content-bottom-item float-left position-relative">
                                        <div class="hot-content-bottom-item-title"><h3
                                                class="hot-content-bottom-item-title-h3 text-ellipsis">
                                            <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                               target="_blank" class="hot-content-bottom-item-title-link">${var.PRODUCTREFERRED
                                                }</a></h3>
                                            <p class="align-center">${var.RETURNSBENCHMARKMAX }</p></div>
                                        <div class="align-center invest-money-and-scale clearfix">
                                            <div class="invest-money float-left align-center"><p
                                                    class="invest-money-p1">投资期限</p>
                                                <p class="invest-money-p2">${var.PRODUCTDEADLINE }</p></div>
                                            <div class="invest-scale float-left align-center"><p
                                                    class="invest-scale-p1">融资规模</p>
                                                <p class="invest-scale-p2">${var.EXPECTISSUANCE }</p></div>
                                            <div class="clearb"></div>
                                        </div>
                                        <div class="hot-content-bottom-tips">
                                            <div class="hot-content-bottom-desc">
                                                产品点评：
                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 35 }">
                                                    ${fn:substring(var.PRODUCTREVIEWS,0,35)}...
                                                </c:if>
                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 35 }">
                                                    ${var.PRODUCTREVIEWS}
                                                </c:if>
                                            </div>
                                            <div class="align-center">
	                                            <div class="cpointer btn btn-big cpointer ljyy">
	                                               <input type="hidden" name="p_id" value="${var.ID}">
		                                           <input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
	                                                 		立即预约
	                                            </div>
                                            </div>
                                        </div>
                                        <div class="clearb"></div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <!--右边下-->
                        <div class="clearb"></div>
                    </div>

                </div>
            </div>
        </div>

        <!--  频道-start  -->
                <div class="channel channel-orange clearfix">
                    <div class="float-left channel-left position-relative">
                        <div class="channel-title position-relative">
                            <h1 class="align-center" style=" background-color:#fff; padding-top:18px ">
                                固定收益</h1>
                            <span class="align-center count-number">共<span class="count-number-big">${pd.productNumber }</span>款</span>
                        </div>
                        
                        
                        
                        <div class="channel-button align-center">
                            <a href="web/trust" class="btn btn-channel">进入频道&nbsp;&gt;</a>
                        </div>
                        <div class="channel-left-bg">
                        	<div class="channel-feature">
                            <ul>
                                <li class="position-relative">严格风控</li>
                                <li class="position-relative">政府担保</li>
                                <li class="position-relative">完善服务</li>
                            </ul>
                        	</div>
                        </div>
                    </div>
                    <div class="float-left channel-right">
                        <div class="channel-tabs-title position-relative">
                            <ul class="channel-tabs-list">
                                <li class="align-center channel-tab channel-tab-active cpointer">信托</li>
                                <li class="align-center channel-tab cpointer">资管</li>
                                <li class="align-center channel-tab cpointer">契约型</li>
                            </ul>
                            <div class="channel-tabs-corner-icon">
                            </div>
                        </div>
                        
                        <div class="channel-tabs-content">
                    <!--一页-->
                    <div class="channel-tab-content channel-tab-content-active">
                        <div id="ctl00_ContentPlaceHolder1_index_gudingshouyi_trust_product_server">
                            <div class="channel-tab-top clearfix">
                                <c:forEach items="${list1}" var="var" varStatus="vs">
                                    <c:choose>
                                        <c:when test="${vs.index eq 0 }">
                                            <div class="float-left channel-tab-top-left">
                                                <div class="channel-tab-enterprise clearfix">
                                                    <div class="float-left channel-tab-enterprise-logo"><img
                                                            src="${var.THEISSUERIMGURL }"></div>
                                                    <div class="float-left channel-tab-enterprise-detail">
                                                        <h2 class="channel-tab-enterprise-name text-ellipsis">
                                                            <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                               target="_blank" class="channel-tab-enterprise-name-link">${var.PRODUCTREFERRED
                                                                }</a></h2>
                                                        <div class="channel-tab-enterprise-rating clearfix">
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="clearb"></div>
                                                        </div>

                                                        <div class="channel-tab-enterprise-description  position-relative">
                                                            <span></span>
                                                            <a class="channel-tab-enterprise-description-link">
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 56 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,56)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 56 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-icons-desc align-center clearfix">
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon4.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.PRODUCTDEADLINE }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">投资期限</p>
                                                    </div>
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon5.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.EXPECTISSUANCE }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">融资规模</p>
                                                    </div>
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon6.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.RETURNSBENCHMARKMAX }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">收益基准</p>
                                                    </div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-button align-center">
	                                                <div class="btn btn-big btn-channel-tab  cpointer ljyy">
	                                                    <input type="hidden" name="p_id" value="${var.ID}">
	                                               		<input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
	                                                       	立即预约
	                                                  </div>
                                                </div>
                                                <div class="h25"></div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <!--右边-->
                                            <div class="float-left channel-tab-top-right">
                                                <ul>
                                                    <li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
                                                        <div class="enterprise-name position-relative"><h3><a
                                                                href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                                target="_blank"><b>${var.PRODUCTREFERRED }</b></a></h3>
                                                            <p class="invest-month primary-color">
                                                                ${var.RETURNSBENCHMARKMAX }</p></div>
                                                        <div class="enterprise-month-and-money clearfix" style="margin-left: -10px;">
                                                            <div class="float-left enterprise-chunk">投资期限：<span
                                                                    class="primary-color">${var.PRODUCTDEADLINE }</span>
                                                            </div>
                                                            <div class="float-left enterprise-chunk enterprise-chunk2">
                                                                起投金额：<span class="primary-color">${var.INVESTMENTSTARTING }</span>
                                                            </div>
                                                            <div class="clearb"></div>
                                                        </div>
                                                        <div class="enterprise-scale-and-type clearfix" style="margin-left: -10px;">
                                                            <div class="float-left enterprise-chunk">融资规模：<span
                                                                    class="primary-color">${var.EXPECTISSUANCE }</span>
                                                            </div>
                                                            <div class="float-left enterprise-chunk enterprise-chunk2">
                                                                信托类型：<span
                                                                    class="primary-color">${var.TRUSTTYPENAME }</span>
                                                            </div>
                                                            <div class="clearb"></div>
                                                        </div>

                                                        <div class="channel-tab-top-right-item-tips">
                                                            <div class="h36 lh36">
                                                                <div class="fl fs16">
                                                                    <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}" class="h36 lh36" target="_blank"><b>${var.PRODUCTREFERRED
                                                                        }</b></a></div>
                                                                <div class=" primary-color fr fs22 h36 lh36">
                                                                    ${var.RETURNSBENCHMARKMAX }
                                                                </div>
                                                            </div>
                                                            <p class=" lh24 h48 c999999">
                                                                产品点评：
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 28 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,28)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 28 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                            </p>
                                                            <div class="align-center">
                                                            	  <div class="btn btn-channel-tip cpointer ljyy">
                                                            	  	<input type="hidden" name="p_id" value="${var.ID}">
	                                               					<input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
                                                            	  	立即预约
                                                                 </div>
                                                            </div>
                                                        </div>
                                                        <div class="channel-tab-top-right-item-border"></div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <div class="clearb"></div>
                            </div>
                        </div>
                    </div>

                    <div class="channel-tab-content">
                        <div id="ctl00_ContentPlaceHolder1_index_gudingshouyi_asset_product_server">
                            <div class="channel-tab-top clearfix">


                                <c:forEach items="${list2}" var="var" varStatus="vs">
                                    <c:choose>
                                        <c:when test="${vs.index eq 0 }">
                                            <div class="float-left channel-tab-top-left">
                                                <div class="channel-tab-enterprise clearfix">
                                                    <div class="float-left channel-tab-enterprise-logo"><img
                                                            src="${var.THEISSUERIMGURL }"></div>
                                                    <div class="float-left channel-tab-enterprise-detail">
                                                        <h2 class="channel-tab-enterprise-name text-ellipsis">
                                                            <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                               target="_blank" class="channel-tab-enterprise-name-link">${var.PRODUCTREFERRED
                                                                }</a></h2>
                                                        <div class="channel-tab-enterprise-rating clearfix">
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="clearb"></div>
                                                        </div>

                                                        <div class="channel-tab-enterprise-description  position-relative">
                                                            <span></span>
                                                            <a class="channel-tab-enterprise-description-link">
                                                                 <c:if test="${fn:length(var.PRODUCTREVIEWS) > 56 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,56)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 56 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-icons-desc align-center clearfix">
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon4.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.PRODUCTDEADLINE }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line" ></div>
                                                        <p class="invest-deadline color-999">投资期限</p>
                                                    </div>
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon5.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.EXPECTISSUANCE }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">融资规模</p>
                                                    </div>
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon6.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.RETURNSBENCHMARKMAX }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">收益基准</p>
                                                    </div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-button align-center">
                                                <div class="btn btn-big btn-channel-tab  cpointer ljyy">
                                                	<input type="hidden" name="p_id" value="${var.ID}">
	                                               	<input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
                                                	立即预约</div>
                                                </div>
                                                <div class="h25"></div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <!--右边-->
                                            <div class="float-left channel-tab-top-right">
                                                <ul>
                                                    <li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
                                                        <div class="enterprise-name position-relative"><h3><a
                                                                href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                                target="_blank"><b>${var.PRODUCTREFERRED }</b></a></h3>
                                                            <p class="invest-month primary-color">
                                                                ${var.RETURNSBENCHMARKMAX }</p></div>
                                                        <div class="enterprise-month-and-money clearfix" style="margin-left: -10px;">
                                                            <div class="float-left enterprise-chunk">投资期限：<span
                                                                    class="primary-color">${var.PRODUCTDEADLINE }</span>
                                                            </div>
                                                            <div class="float-left enterprise-chunk enterprise-chunk2">
                                                                起投金额：<span class="primary-color">${var.INVESTMENTSTARTING }</span>
                                                            </div>
                                                            <div class="clearb"></div>
                                                        </div>
                                                        <div class="enterprise-scale-and-type clearfix" style="margin-left: -10px;">
                                                            <div class="float-left enterprise-chunk">融资规模：<span
                                                                    class="primary-color">${var.EXPECTISSUANCE }</span>
                                                            </div>
                                                            <div class="float-left enterprise-chunk enterprise-chunk2">
                                                                信托类型：<span
                                                                    class="primary-color">${var.TRUSTTYPENAME }</span>
                                                            </div>
                                                            <div class="clearb"></div>
                                                        </div>

                                                        <div class="channel-tab-top-right-item-tips">
                                                            <div class="h36 lh36">
                                                                <div class="fl fs16">
                                                                    <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}" class="h36 lh36" target="_blank"><b>${var.PRODUCTREFERRED
                                                                        }</b></a></div>
                                                                <div class=" primary-color fr fs22 h36 lh36">
                                                                    ${var.RETURNSBENCHMARKMAX }
                                                                </div>
                                                            </div>
                                                            <p class=" lh24 h48 c999999">
                                                                产品点评：
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 28 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,28)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 28 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                            </p>
                                                            <div class="align-center">
                                                            <div class="btn btn-channel-tip cpointer ljyy">
                                                            <input type="hidden" name="p_id" value="${var.ID}">
	                                               			<input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
                                                            	立即预约</div></div>
                                                        </div>
                                                        <div class="channel-tab-top-right-item-border"></div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <div class="clearb"></div>
                            </div>
                        </div>
                    </div>
                    <div class="channel-tab-content">
                        <div id="ctl00_ContentPlaceHolder1_index_gudingshouyi_hign_product_server">
                            <div class="channel-tab-top clearfix">
                                <c:forEach items="${list3}" var="var" varStatus="vs">
                                    <c:choose>
                                        <c:when test="${vs.index eq 0 }">
                                            <div class="float-left channel-tab-top-left">
                                                <div class="channel-tab-enterprise clearfix">
                                                    <div class="float-left channel-tab-enterprise-logo"><img
                                                            src="${var.THEISSUERIMGURL }"></div>
                                                    <div class="float-left channel-tab-enterprise-detail">
                                                        <h2 class="channel-tab-enterprise-name text-ellipsis">
                                                            <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                               target="_blank" class="channel-tab-enterprise-name-link">${var.PRODUCTREFERRED
                                                                }</a></h2>
                                                        <div class="channel-tab-enterprise-rating clearfix">
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="clearb"></div>
                                                        </div>

                                                        <div class="channel-tab-enterprise-description  position-relative">
                                                            <span></span>
                                                            <a class="channel-tab-enterprise-description-link">
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 56 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,56)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 56 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-icons-desc align-center clearfix">
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon4.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.PRODUCTDEADLINE }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">投资期限</p>
                                                    </div>
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon5.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.EXPECTISSUANCE }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">融资规模</p>
                                                    </div>
                                                    <div class="float-left channel-tab-icon-desc"
                                                         style=" background: url(static/img/web/hot_description_icon6.png) no-repeat 100% 100%;">
                                                        <p class="invest-month primary-color"><span
                                                                class="count-down-number">${var.RETURNSBENCHMARKMAX }</span>
                                                        </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">收益基准</p>
                                                    </div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-button align-center">
                                                <div class="btn btn-big btn-channel-tab  cpointer ljyy">
                                                <input type="hidden" name="p_id" value="${var.ID}">
	                                            <input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
                                                	立即预约</div>
                                                </div>
                                                <div class="h25"></div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <!--右边-->
                                            <div class="float-left channel-tab-top-right">
                                                <ul>
                                                    <li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
                                                        <div class="enterprise-name position-relative"><h3><a
                                                                href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                                target="_blank"><b>${var.PRODUCTREFERRED }</b></a></h3>
                                                            <p class="invest-month primary-color">
                                                                ${var.RETURNSBENCHMARKMAX }</p></div>
                                                        <div class="enterprise-month-and-money clearfix" style="margin-left: -10px;">
                                                            <div class="float-left enterprise-chunk">投资期限：<span
                                                                    class="primary-color">${var.PRODUCTDEADLINE }</span>
                                                            </div>
                                                            <div class="float-left enterprise-chunk enterprise-chunk2">
                                                                起投金额：<span class="primary-color">${var.INVESTMENTSTARTING }</span>
                                                            </div>
                                                            <div class="clearb"></div>
                                                        </div>
                                                        <div class="enterprise-scale-and-type clearfix" style="margin-left: -10px;">
                                                            <div class="float-left enterprise-chunk">融资规模：<span
                                                                    class="primary-color">${var.EXPECTISSUANCE }</span>
                                                            </div>
                                                            <div class="float-left enterprise-chunk enterprise-chunk2">
                                                                信托类型：<span
                                                                    class="primary-color">${var.TRUSTTYPENAME }</span>
                                                            </div>
                                                            <div class="clearb"></div>
                                                        </div>

                                                        <div class="channel-tab-top-right-item-tips">
                                                            <div class="h36 lh36">
                                                                <div class="fl fs16">
                                                                    <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}" class="h36 lh36" target="_blank"><b>${var.PRODUCTREFERRED
                                                                        }</b></a></div>
                                                                <div class=" primary-color fr fs22 h36 lh36">
                                                                    ${var.RETURNSBENCHMARKMAX }
                                                                </div>
                                                            </div>
                                                            <p class=" lh24 h48 c999999">
                                                                产品点评：
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 28 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,28)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 28 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                            </p>
                                                            <div class="align-center">
                                                            <div class="btn btn-channel-tip cpointer ljyy">
                                                            <input type="hidden" name="p_id" value="${var.ID}">
	                                               			<input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">	
                                                            	立即预约
                                                            </div>
                                                            </div>
                                                        </div>
                                                        <div class="channel-tab-top-right-item-border"></div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <div class="clearb"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearb">
                    </div>
                </div>
                        
                    <div class="clearb">
                    </div>
                </div>
	
			</div>
			
			
			
			<div class="channel channel-blue clearfix">
                    <div class="float-left channel-left position-relative">
                        <div class="channel-title position-relative">
                            <h1 class="align-center"   style=" background-color:#fff; padding-top:18px ;color:#00aefd;">
                                浮动收益</h1>
                            <span class="align-center count-number">共<span class="count-number-big">${pd.productStableNumber }</span>款</span>
                        </div>
                        
                        <div class="channel-button align-center">
                            <a href="web/privateEquitylist" class="btn btn-channel">进入频道&nbsp;&gt;</a>
                        </div>
                        <div class="channel-left-bg"  style="background-color:#00aefd;">
                        <div class="channel-feature">
                            <ul>
                                <li class="position-relative">高收益性</li>
                                <li class="position-relative">风险可控</li>
                                <li class="position-relative">退出灵活</li>
                            </ul>
                        	</div>
                        </div>
                    </div>
                    <div class="float-left channel-right">
                        <div class="channel-tabs-title position-relative">
                            <ul class="channel-tabs-list">
                                <li class="align-center channel-tab channel-tab-active cpointer">股权投资</li>
                                <li class="align-center channel-tab cpointer">政府债</li>
                                <li class="align-center channel-tab cpointer">对冲•定增</li>
                            </ul>
                            <div class="channel-tabs-corner-icon">
                            </div>
                        </div>
                        <div class="channel-tabs-content">
                    <div class="channel-tab-content channel-tab-content-active">
                        <div id="ctl00_ContentPlaceHolder1_index_fudongshouyi_guquan_product_server">
                            <div class="channel-tab-top clearfix">
                                <c:forEach items="${list4}" var="var" varStatus="vs">
                                    <c:choose>
                                        <c:when test="${vs.index eq 0 }">
                                            <div class="float-left channel-tab-top-left">
                                                <div class="channel-tab-enterprise clearfix">
                                                    <div class="float-left channel-tab-enterprise-logo"><img
                                                            src="${var.THEISSUERIMGURL }" alt="信托企业logo"></div>
                                                    <div class="float-left channel-tab-enterprise-detail">
                                                        <h2 class="channel-tab-enterprise-name text-ellipsis"><a
                                                                href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                                target="_blank"
                                                                class="channel-tab-enterprise-name-link">${var.PRODUCTREFERRED
                                                            }</a></h2>
                                                        <div class="channel-tab-enterprise-rating clearfix">
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="float-left rating-star"></div>
                                                            <div class="clearb"></div>
                                                        </div>
                                                        <div class="channel-tab-enterprise-description text-ellipsis position-relative">
                                                            <span></span><a
                                                                class="channel-tab-enterprise-description-link">
                                                                 <c:if test="${fn:length(var.PRODUCTREVIEWS) > 56 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,56)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 56 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                                </a></div>
                                                    </div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-icons-desc align-center clearfix">
                                                    <div class="float-left channel-tab-icon-desc" 
                                                    style=" background: url(static/img/web/hot_description_icon4.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.EXPECTISSUANCE }</span></p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">目标规模</p></div>
                                                    <div class="float-left channel-tab-icon-desc" 
                                                    style=" background: url(static/img/web/hot_description_icon5.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.INVESTMENTSTARTING }</span>
                                                    </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">投资门槛</p></div>
                                                    <div class="float-left channel-tab-icon-desc" 
                                                     style=" background: url(static/img/web/hot_description_icon6.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.PRODUCTDEADLINE }</span></p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">存续期限</p></div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-button align-center">
                                                 <div class="btn btn-big btn-channel-tab   cpointer ljyy">
                                                 <input type="hidden" name="p_id" value="${var.ID}">
	                                             <input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
                                                 	立即预约</div>
                                                </div>
                                                <div class="h25"></div>
                                            </div>
                                            <div class="float-left channel-tab-top-right">
                                                <ul>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
                                            <div class="enterprise-name position-relative">
                                                <h3>
                                                    <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                       target="_blank">
                                                        <b>
                                                            <c:if test="${fn:length(var.PRODUCTREFERRED) > 14 }">
                                                                ${fn:substring(var.PRODUCTREFERRED,0,14)}..
                                                            </c:if>
                                                            <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 14 }">
                                                                ${var.PRODUCTREFERRED}
                                                            </c:if>
                                                        </b></a></h3>
                                            </div>
                                            <div class="enterprise-month-and-money clearfix">
                                                <div class="float-left enterprise-chunk">投资期限：<span
                                                        class="primary-color">${var.PRODUCTDEADLINE }</span></div>
                                                <div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span
                                                        class="primary-color">${var.INVESTMENTSTARTING }</span></div>
                                                <div class="clearb"></div>
                                            </div>
                                            <div class="enterprise-scale-and-type clearfix">
                                                <div class="float-left enterprise-chunk">融资规模：<span
                                                        class="primary-color">${var.EXPECTISSUANCE }</span></div>
                                                <div class="clearb"></div>
                                            </div>
                                            <div class="channel-tab-top-right-item-tips">
                                                <div class="h36 lh36">
                                                    <div class="fl fs16"><a
                                                            href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                            target="_blank">
                                                        <b>
                                                            <c:if test="${fn:length(var.PRODUCTREFERRED) > 14 }">
                                                                ${fn:substring(var.PRODUCTREFERRED,0,14)}..
                                                            </c:if>
                                                            <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 14 }">
                                                                ${var.PRODUCTREFERRED}
                                                            </c:if>
                                                        </b>
                                                    </a></div>
                                                    <div class=" primary-color fr fs22 h36 lh36">100万</div>
                                                </div>
                                                <p class=" lh24 h48 c999999">
                                                    产品点评：
                                                    <c:if test="${fn:length(var.PRODUCTREVIEWS) > 35 }">
                                                        ${fn:substring(var.PRODUCTREVIEWS,0,35)}..
                                                    </c:if>
                                                    <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 35 }">
                                                        ${var.PRODUCTREVIEWS}
                                                    </c:if>
                                                </p>
                                                <div class="align-center">
                                                <div class="btn btn-channel-tip cpointer ljyy">
                                                <input type="hidden" name="p_id" value="${var.ID}">
	                                            <input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
                                                	立即预约</div>
                                                </div>
                                            </div>
                                            <div class="channel-tab-top-right-item-border"></div>
                                        </li>
                                    </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </ul>
                            </div>
                            <div class="clearb"></div>
                        </div>
                    </div>
                </div>
                <div class="channel-tab-content">
                    <div id="ctl00_ContentPlaceHolder1_index_fudongshouyi_dingzeng_product_server">
                        <div class="channel-tab-top clearfix">
                            <c:forEach items="${list5}" var="var" varStatus="vs">
                                <c:choose>
                                    <c:when test="${vs.index eq 0 }">
                                        <div class="float-left channel-tab-top-left">
                                            <div class="channel-tab-enterprise clearfix">
                                                <div class="float-left channel-tab-enterprise-logo"><img
                                                        src="${var.THEISSUERIMGURL }"></div>
                                                <div class="float-left channel-tab-enterprise-detail">
                                                    <h2 class="channel-tab-enterprise-name text-ellipsis"><a
                                                            href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                            target="_blank" class="channel-tab-enterprise-name-link">${var.PRODUCTREFERRED
                                                        }</a></h2>
                                                    <div class="channel-tab-enterprise-rating clearfix">
                                                        <div class="float-left rating-star"></div>
                                                        <div class="float-left rating-star"></div>
                                                        <div class="float-left rating-star"></div>
                                                        <div class="float-left rating-star"></div>
                                                        <div class="float-left rating-star"></div>
                                                        <div class="clearb"></div>
                                                    </div>
                                                    <div class="channel-tab-enterprise-description text-ellipsis position-relative">
                                                        <span></span><a class="channel-tab-enterprise-description-link">
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 56 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,56)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 56 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                        </a></div>
                                                </div>
                                                <div class="clearb"></div>
                                            </div>
                                            <div class="channel-tab-icons-desc align-center clearfix">
                                                    <div class="float-left channel-tab-icon-desc" 
                                                    style=" background: url(static/img/web/hot_description_icon4.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.EXPECTISSUANCE }</span></p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">目标规模</p></div>
                                                    <div class="float-left channel-tab-icon-desc" 
                                                    style=" background: url(static/img/web/hot_description_icon5.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.INVESTMENTSTARTING }</span>
                                                    </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">投资门槛</p></div>
                                                    <div class="float-left channel-tab-icon-desc" 
                                                     style=" background: url(static/img/web/hot_description_icon6.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.PRODUCTDEADLINE }</span></p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">存续期限</p></div>
                                                    <div class="clearb"></div>
                                                </div>
                                            <div class="channel-tab-button align-center">
                                            <div class="btn btn-big btn-channel-tab   cpointer ljyy">
                                            <input type="hidden" name="p_id" value="${var.ID}">
	                                         <input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
                                            	立即预约</div></div>
                                            <div class="h25"></div>
                                        </div>
                                        <div class="float-left channel-tab-top-right">
                                            <ul>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
                                            <div class="enterprise-name position-relative">
                                                <h3>
                                                    <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                       target="_blank">
                                                        <b>
                                                            <c:if test="${fn:length(var.PRODUCTREFERRED) > 14 }">
                                                                ${fn:substring(var.PRODUCTREFERRED,0,14)}..
                                                            </c:if>
                                                            <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 14 }">
                                                                ${var.PRODUCTREFERRED}
                                                            </c:if>
                                                        </b></a></h3>
                                            </div>
                                            <div class="enterprise-month-and-money clearfix">
                                                <div class="float-left enterprise-chunk">投资期限：<span
                                                        class="primary-color">${var.PRODUCTDEADLINE }</span></div>
                                                <div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span
                                                        class="primary-color">${var.INVESTMENTSTARTING }</span></div>
                                                <div class="clearb"></div>
                                            </div>
                                            <div class="enterprise-scale-and-type clearfix">
                                                <div class="float-left enterprise-chunk">融资规模：<span
                                                        class="primary-color">${var.EXPECTISSUANCE }</span></div>
                                                <div class="clearb"></div>
                                            </div>
                                            <div class="channel-tab-top-right-item-tips">
                                                <div class="h36 lh36">
                                                    <div class="fl fs16"><a
                                                            href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                            target="_blank">
                                                        <b>
                                                            <c:if test="${fn:length(var.PRODUCTREFERRED) > 14 }">
                                                                ${fn:substring(var.PRODUCTREFERRED,0,14)}..
                                                            </c:if>
                                                            <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 14 }">
                                                                ${var.PRODUCTREFERRED}
                                                            </c:if>
                                                        </b>
                                                    </a></div>
                                                    <div class=" primary-color fr fs22 h36 lh36">100万</div>
                                                </div>
                                                <p class=" lh24 h48 c999999">
                                                    产品点评：
                                                    <c:if test="${fn:length(var.PRODUCTREVIEWS) > 35 }">
                                                        ${fn:substring(var.PRODUCTREVIEWS,0,35)}..
                                                    </c:if>
                                                    <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 35 }">
                                                        ${var.PRODUCTREVIEWS}
                                                    </c:if>
                                                </p>
                                                <div class="align-center">
                                                <div class="btn btn-channel-tip cpointer ljyy">
                                                	<input type="hidden" name="p_id" value="${var.ID}">
	                                             <input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">
                                                	立即预约</div>
                                                </div>
                                            </div>
                                            <div class="channel-tab-top-right-item-border"></div>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            </ul>
                        </div>
                        <div class="clearb"></div>
                    </div>
                </div>
            </div>
            <div class="channel-tab-content">
                <div id="ctl00_ContentPlaceHolder1_index_fudongshouyi_duichong_product_server">
                    <div class="channel-tab-top clearfix">
                        <c:forEach items="${list6}" var="var" varStatus="vs">
                            <c:choose>
                                <c:when test="${vs.index eq 0 }">
                                    <div class="float-left channel-tab-top-left">
                                        <div class="channel-tab-enterprise clearfix">
                                            <div class="float-left channel-tab-enterprise-logo"><img
                                                    src="${var.THEISSUERIMGURL }"></div>
                                            <div class="float-left channel-tab-enterprise-detail">
                                                <h2 class="channel-tab-enterprise-name text-ellipsis"><a
                                                        href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                        target="_blank" class="channel-tab-enterprise-name-link">${var.PRODUCTREFERRED
                                                    }</a></h2>
                                                <div class="channel-tab-enterprise-rating clearfix">
                                                    <div class="float-left rating-star"></div>
                                                    <div class="float-left rating-star"></div>
                                                    <div class="float-left rating-star"></div>
                                                    <div class="float-left rating-star"></div>
                                                    <div class="float-left rating-star"></div>
                                                    <div class="clearb"></div>
                                                </div>
                                                <div class="channel-tab-enterprise-description text-ellipsis position-relative">
                                                    <span></span><a class="channel-tab-enterprise-description-link">
                                                     <c:if test="${fn:length(var.PRODUCTREVIEWS) > 56 }">
                                                                    ${fn:substring(var.PRODUCTREVIEWS,0,56)}...
                                                                </c:if>
                                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 56 }">
                                                                    ${var.PRODUCTREVIEWS}
                                                                </c:if>
                                                    </a></div>
                                            </div>
                                            <div class="clearb"></div>
                                        </div>
                                         <div class="channel-tab-icons-desc align-center clearfix">
                                                    <div class="float-left channel-tab-icon-desc" 
                                                    style=" background: url(static/img/web/hot_description_icon4.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.EXPECTISSUANCE }</span></p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">目标规模</p></div>
                                                    <div class="float-left channel-tab-icon-desc" 
                                                    style=" background: url(static/img/web/hot_description_icon5.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.INVESTMENTSTARTING }</span>
                                                    </p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">投资门槛</p></div>
                                                    <div class="float-left channel-tab-icon-desc" 
                                                     style=" background: url(static/img/web/hot_description_icon6.png) no-repeat 100% 100%;"><p
                                                            class="invest-month primary-color"><span
                                                            class="count-down-number">${var.PRODUCTDEADLINE }</span></p>
                                                        <div class="channel-tab-icon-line"></div>
                                                        <p class="invest-deadline color-999">存续期限</p></div>
                                                    <div class="clearb"></div>
                                                </div>
                                        <div class="channel-tab-button align-center">
                                        <div class="btn btn-big btn-channel-tab   cpointer ljyy">
                                       <input type="hidden" name="p_id" value="${var.ID}">
	                                    <input type="hidden" name="p_type" value="${var.PRODUCTTYPE}"> 	
                                        	立即预约</div>
                                        </div>
                                        <div class="h25"></div>
                                    </div>
                                    <div class="float-left channel-tab-top-right">
                                        <ul>
                                </c:when>
                                <c:otherwise>
                                    <li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
                                        <div class="enterprise-name position-relative">
                                            <h3><a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                   target="_blank">
                                                <b>
                                                    <c:if test="${fn:length(var.PRODUCTREFERRED) > 14 }">
                                                        ${fn:substring(var.PRODUCTREFERRED,0,14)}..
                                                    </c:if>
                                                    <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 14 }">
                                                        ${var.PRODUCTREFERRED}
                                                    </c:if>
                                                </b></a></h3>
                                        </div>
                                        <div class="enterprise-month-and-money clearfix">
                                            <div class="float-left enterprise-chunk">投资期限：<span class="primary-color">${var.PRODUCTDEADLINE }</span>
                                            </div>
                                            <div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span
                                                    class="primary-color">${var.INVESTMENTSTARTING }</span></div>
                                            <div class="clearb"></div>
                                        </div>
                                        <div class="enterprise-scale-and-type clearfix">
                                            <div class="float-left enterprise-chunk">融资规模：<span class="primary-color">${var.EXPECTISSUANCE }</span>
                                            </div>
                                            <div class="clearb"></div>
                                        </div>
                                        <div class="channel-tab-top-right-item-tips">
                                            <div class="h36 lh36">
                                                <div class="fl fs16"><a
                                                        href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}"
                                                        target="_blank">
                                                    <b>
                                                        <c:if test="${fn:length(var.PRODUCTREFERRED) > 14 }">
                                                            ${fn:substring(var.PRODUCTREFERRED,0,14)}..
                                                        </c:if>
                                                        <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 14 }">
                                                            ${var.PRODUCTREFERRED}
                                                        </c:if>
                                                    </b>
                                                </a></div>
                                                <div class=" primary-color fr fs22 h36 lh36">100万</div>
                                            </div>
                                            <p class=" lh24 h48 c999999">
                                                产品点评：
                                                <c:if test="${fn:length(var.PRODUCTREVIEWS) > 35 }">
                                                    ${fn:substring(var.PRODUCTREVIEWS,0,35)}..
                                                </c:if>
                                                <c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 35 }">
                                                    ${var.PRODUCTREVIEWS}
                                                </c:if>
                                            </p>
                                            <div class="align-center">
                                            <div class="btn btn-channel-tip cpointer ljyy">
                                            <input type="hidden" name="p_id" value="${var.ID}">
	                                        <input type="hidden" name="p_type" value="${var.PRODUCTTYPE}">	
                                            	立即预约
                                            </div></div>
                                        </div>
                                        <div class="channel-tab-top-right-item-border"></div>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        </ul>
                    </div>
                    <div class="clearb"></div>
                </div>
            </div>
                    </div>
                    <!--[if lt IE 9]>
            <div class="clearb"></div>
            <![endif]-->
        </div>
</div>
</div>
<div class="adviser clearfix">

    <!-- 证监会弹框 -->
   <!--  <div class="tankuang_xinzeng" id="xinhuancontent_scroll">
        <div class="diceng">
            <div class="tankuang_xinzeng_1">
                <div class="tk_left" style="background: #993400;">
                    <div class=" h70">
                    </div>
                    <div class=" w180 ml30 cffffff fs22 lh36 fwb bs957332 tac" style="border:none;">
                        <div class=" h15">
                        </div>
                        <div class="">
                            关注微信号
                        </div>
                        <div class="">
                            即时获取最
                        </div>
                        <div class="">
                            新理财信息
                        </div>
                        <div class=" h10">
                        </div>
                        <div class="w120 h120 mauto">
                            <img src="static/img/web/index_weixin_code.png" width="120" height="120" alt="微信二维码"></div>
                        <div class=" h20">
                        </div>
                    </div>
                    <div class=" w180 ml30 tac cffffff fs24 lh54 fwb">
                        400-0096-880
                    </div>
                    <div class=" w130 mauto mt10 tac">
                        <img src="static/img/web/img_index_footer_logo1.jpg" width="64" height="64"></div>
                </div>
                <div class="tk_right" style="background: #f4f4f4;">
                    <div class=" h30 bgffffff">
                    </div>
                    <div class=" h70 bgffffff">
                        <div class=" fl ml20">
                            <img src="static/img/web/img_index_logo_sign.png" width="210" alt="logo"></div>
                        <div class=" fl ml20" style="width: 3px; background: #afaeae; height: 36px; margin-top: 8px;">
                        </div>
                        <div class=" fl ml20 fs24 lh48 fwb">
                            合格投资者认定
                        </div>
                    </div>
                    <div class=" c666666 fs14 lh24 pl25 pt20 pr25 pb20">
                        <p>
                            根据《私募投资基金监督管理暂行办法》第四章第十四条规定："私募基金管理人、私募基金销售机构不得向合格投资者之外的单位和个人募集资金，不得通过报刊、电台、电视、互联网等公众传播媒体或者讲座、报告会、分析会和布告、传单、手机短信、微信、博客和电子邮件等方式，向不特定对象宣传推介。"</p>
                        <p class=" mt10" style="color: #FB930A;">
                            环成金服谨遵《私募投资基金监督管理暂行办法》之规定，只向特定投资者展示私募基金产品信息，不构成任何投资推介建议。</p>
                        <p class=" mt10">
                            合格投资者是指具备相应风险识别能力和风险承担能力，投资于单只私募基金的金额不低于100万元且符合下列相关标准的机构和个人： （一）净资产不低于1000万元的机构；
                            （二）金融资产不低于300万元或者最近三年个人年均收入不低于50万元的个人。</p>
                        <p>
                            前款所称金融资产包括银行存款、股票、债券、基金份额、资产管理计划、银行理财产品、信托计划、保险产品、期货权益等。</p>
                    </div>
                    <div>
                        <div class=" h48 lh48 fl">
                            <div onclick="colous()" id="closebtn" style="background:#4D4D4D;"
                                 class=" tac ml50 w160 h48 lh48 cffffff fs18 fr bradius5 cpointer">
                                我知道了
                            </div>
                            <div class=" w20 h20 ml50 fl">
                                <input type="checkbox" checked="checked" style="margin-top: 18px;"></div>
                            <div class=" w140 h48 fl">
                                记住选择，不再提示
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="beijing">
        </div>
    </div> -->
    
    
  
   
 <!-- 证监会弹框 -->
	<div class="tankuang_xinzeng" id="xinhuancontent_scroll" style="display:none">
            <div class="diceng">
                <div class="tankuang_xinzeng_1">
                    
                    <div class="tk_right" style="background: #fff; width:100%;">
                        <div class=" h30 bgffffff">
                        </div>
                        <div class=" h54 bgffffff">
                            <div class=" fl ml20">
                                <img src="static/img/web/img_index_logo_sign.png" width="180" alt="logo"></div>
                            <div class=" fl ml20" style="width: 3px; background: #f49703; height: 36px; margin-top: 8px;">
                            </div>
                            <div class=" fl ml20 fs20 lh48 fwb" style="color:#c54c0d;">
                                合格投资者认定</div>
                        </div>
                        <div class=" c666666 fs14 lh24 pl25 pt5 pr25 pb10" style="padding:30px 50px 20px; ">
                                
                            <p class="c000000">
                                根据《信托公司集合资金信托计划管理办法》第六条、《证券公司集合资产管理业务实施细则(2013修订)》第二十一条、《私募投资基金监督管理暂行办法》第十二条等有关法律法规的规定，合格投资者是指具备相应风险识别能力和风险承担能力，单笔投资金额不少于100万元，且符合下列条件的单位和个人：（一）净资产不低于1000 万元的单位；（二）金融资产不低于300 万元或者最近三年个人年均收入不低于50 万元的个人。</p>

							<p style="color: #FB930A;">环成金服谨遵法律法规的规定，只向合格投资者展示相关理财产品信息，不构成任何投资推介建议。</p>
                           
                        </div>
                        
                        <div style="width:650px; margin:0 auto;">
                                 <div onclick="colous1()" id="closebtn" class=" tac ml50 w100 h48 lh48 cffffff fs18 fr bradius5 cpointer" style="background:#F5A134; width:200px; font-size:16px;" >
                                    确认符合</div> 
                                <div class=" w20 h20 ml25 fl" style="margin-left:0px;">
                                    <input type="checkbox" checked="checked" style="" disabled="disabled"></div>
                                    <div class=" h20 fl" style=" margin-top:-3px;color: #FB930A;">我已阅读并符合合格投资者认定</div>
                                    
                            </div>
 <style>
 .trust_productdetail_input_bg{ background:#eeeeee; width:210px; height:40px; color:#878686; padding-left:10px; border-radius:4px; line-height:40px;}
 </style>                       
                    </div>
                    
                    <img  src="static/img/web/banner22.jpg" width="100%">
                </div>
               
            </div>
         <div class="beijing">
            </div>
        </div> 
        
       

 


 <!-- 理财学堂、热门问答 -->
 <div class="h10"></div>
    <div class="index_new">
    
    <!--1-->
    	<div class="index_new_hot">
        	<div class="index_new_hot_head">
            	<span class="new_head">行业讯息</span>
                <a href="web/newsList" target="_blank">更多>></a>
            </div>
        <c:forEach items="${newlist2}" var="var" begin="0" end="2">
            <a href="web/goNewsInfo?ID=${var.ID}" class="c333333"
                                                target="_blank">
            <dl class="index_new_con" style="margin-right:20px;">
            	<img src="${var.IMG }" width="226" height="120">
            	<dt>
                       <c:if test="${fn:length(var.NAME) > 30 }">
                           ${fn:substring(var.NAME,0,30)}..
                       </c:if>
                       <c:if test="${fn:length(var.NAME)  <= 30 }">
                           ${var.NAME}
                       </c:if>	
            	</dt>
                <dd>
                        <c:if test="${fn:length(var.COMMENT) > 40 }">
							${fn:substring(var.COMMENT,0,40)}...
						</c:if>
						<c:if test="${fn:length(var.COMMENT)  <=40 }">
							${var.COMMENT}
						</c:if>
                </dd>
            </dl>
           	</a>
         </c:forEach>   
        </div>
        
        <!--2-->
        
	<div class="index_new_wenda">
		<div class="index_new_wenda_head">
	    	<span class="new_head">理财问答</span>
	        <a href="web/wenda" target="_blank">更多>></a>
	    </div>
	    
	    <ul>
	    <c:forEach items="${newlist1}" var="var" varStatus="vs"  begin="0" end="6">
	        <c:if test="${vs.index eq 0 }">
	           	<c:forEach items="${newlist1}" var="var" varStatus="vs"   begin="0" end="6">
	           		<c:if test="${vs.index >= 0}">
	           			<a href="web/goQuestion?ID=${var.ID}" target="_blank"> 
	           			 <li class="c666666 lh40 h40"
	                          style=" border-bottom:1px dashed #d9d9d9; padding-left:20px;">
	                          <span>·</span>
	                              <c:if test="${fn:length(var.QUESTION) > 24 }">
	                                  ${fn:substring(var.QUESTION,0,24)}...
	                              </c:if>
	                              <c:if test="${fn:length(var.QUESTION)  <= 24 }">
	                                  ${var.QUESTION}
	                              </c:if>
	                      </li>
	                      </a>
	                 </c:if>
	           </c:forEach>
	           
	       </c:if>
	       
	     </c:forEach>
			</ul>
	</div>
        	
    </div>
	<div class="h10"></div>
<!--理财学堂、热门问答结束-->

 
    
	<style>
	.heide{ background-color:#000;color:#fff; line-height:24px; padding:6px 0;}
	.xiaozi{ font-size:15px; margin-left:12px;}
	.mingz{ font-size:18px; font-weight:bold; margin-left:12px}
	.mingz span{ font-size:15px; margin-left:12px;}
</style>      
      <div class="h10"></div>
      
      
      <div class="core_team">
                 <a href="web/teamList" class="c333333" target="_blank" style="font-size:18px;border-bottom:2px solid #f49703; ">理财师推荐</a>
            <div>
                <div class=" w1160 mauto"></div>



 <div class="core_team_list">
                    <div id="ctl00_ContentPlaceHolder1_core_team_list_ul_server" class="core_team_list_ul">
        <c:forEach items="${chooseList}" var="var" varStatus="vs">  
        <c:if test="${vs.index eq 0 }">
		<div class="core_team_list_li" style="background: rgb(255, 255, 255);">
			<div id="#core_team_00${vs.index+1 }" class="core_team_list_every" style="border: 1px solid rgb(239, 239, 239);">
				<div class="core_team_list_pic">
				<div class="core_team_list_headpic"><img src="${var.IMGURL}" style="z-index: 1; display: inline-block; width: 255px; height: 395px; margin-left: 0px; margin-top: 0px; overflow: hidden;"></div>
				<div class="core_team_list_intro">
				<style>
				 
				 .heide{ background-color:#000;color:#fff; line-height:24px; padding:6px 0;}
				.xiaozi{ font-size:15px; margin-left:12px;}
				 .mingz{ font-size:18px; font-weight:bold; margin-left:12px}
				 .mingz span{ font-size:15px; margin-left:12px;}
				 .core_team_list_intro_signtel{display:block;width:80px; color:#b4b4b4;   border:1px solid #b4b4b4; padding:3px 5px; text-align:center; -moz-border-radius:4px; -webkit-border-radius:4px; border-radius:4px; cursor:pointer; height:25px; line-height:25px; margin-left:auto; margin-right:auto; margin-top:15px;}
				 </style>           
				            
				            <div class="heide">
				            <div class="mingz">${var.NAME }<span>${var.POSITION }</span></div>
				            <div class="xiaozi">${var.XUEWEI }</div>
				            <div class="xiaozi">已经为<span>${var.NUMBER }</span>位顾客完成资产配置</div>
				            </div> 
				</div>
			</div>
		</div>
		<div class="core_team_list_intro_signtel" onclick="showDiv('${var.ID}','${var.NAME }')" style=" ">点击预约</div>
		</div>
		<div id="core_team_00${vs.index+1 }" class="core_team_list_li_show" style="left: 278.5px; top: 10px; display: none;">
			<div class="core_team_zyintro">职业简介</div>
			<div class="core_team_intro">${var.INFO}</div>
		</div>
		</c:if>
		<c:if test="${vs.index eq 1 }">
		 <div class="core_team_list_li teamleft" style="background: rgb(255, 255, 255);">
		<div id="#core_team_00${vs.index+1 }" class="core_team_list_every" style="border: 1px solid rgb(239, 239, 239);">
		<div class="core_team_list_pic">
		<div class="core_team_list_headpic"><img src="${var.IMGURL}" style="z-index: 1; display: inline-block; width: 255px; height: 395px; margin-left: 0px; margin-top: 0px; overflow: hidden;"></div>
		<div class="core_team_list_intro">
		 <div class="heide">
		            <div class="mingz">${var.NAME }<span>${var.POSITION }</span></div>
		            <div class="xiaozi">${var.XUEWEI }</div>
		            <div class="xiaozi">已经为<span>${var.NUMBER }</span>位顾客完成资产配置</div>
		            </div> 
		</div>
		</div>
		</div>
		<div class="core_team_list_intro_signtel" onclick="showDiv('${var.ID}','${var.NAME }')" style=" ">点击预约</div>
		</div>
		<div id="core_team_00${vs.index+1 }" class="core_team_list_li_show" style="left: 575.5px; top: 10px; display: none;">
		<div class="core_team_zyintro">职业简介</div>
		<div class="core_team_intro">${var.INFO}</div>
		</div>
		</c:if>
		<c:if test="${vs.index eq 2 }">
		<div class="core_team_list_li teamleft" style="background: rgb(255, 255, 255);">
			<div id="#core_team_00${vs.index+1 }" class="core_team_list_every" style="border: 1px solid rgb(239, 239, 239);">
			<div class="core_team_list_pic">
			<div class="core_team_list_headpic"><img src="${var.IMGURL}" style="z-index: 1; display: inline-block; width: 255px; height: 395px; margin-left: 0px; margin-top: 0px; overflow: hidden;"></div>
			<div class="core_team_list_intro">
			 <div class="heide">
			            <div class="mingz">${var.NAME }<span>${var.POSITION }</span></div>
			            <div class="xiaozi">${var.XUEWEI }</div>
			            <div class="xiaozi">已经为<span>${var.NUMBER }</span>位顾客完成资产配置</div>
			            </div> 
			</div>
			</div>
			</div>
			<div class="core_team_list_intro_signtel" onclick="showDiv('${var.ID}','${var.NAME }')" style=" ">点击预约</div>
		</div>
		<div id="core_team_00${vs.index+1 }" class="core_team_list_li_show" style="left: 874.5px; top: 10px; display: none;">
			<div class="core_team_zyintro">职业简介</div>
			<div class="core_team_intro">${var.INFO}</div>
		</div>
		</c:if>
		<c:if test="${vs.index eq 3 }">
		<div class="core_team_list_li teamleft" style="background: rgb(255, 255, 255);">
			<div id="#core_team_00${vs.index+1 }" class="core_team_list_every" style="border: 1px solid rgb(239, 239, 239);">
				<div class="core_team_list_pic">
				<div class="core_team_list_headpic"><img src="${var.IMGURL}" style="z-index: 1; display: inline-block; width: 255px; height: 395px; margin-left: 0px; margin-top: 0px; overflow: hidden;"></div>
				<div class="core_team_list_intro">
				 <div class="heide">
				            <div class="mingz">${var.NAME }<span>${var.POSITION }</span></div>
				            <div class="xiaozi">${var.XUEWEI }</div>
				            <div class="xiaozi">已经为<span>${var.NUMBER }</span>位顾客完成资产配置</div>
				            </div> 
				</div>
				</div>
			</div>
			<div class="core_team_list_intro_signtel" onclick="showDiv('${var.ID}','${var.NAME }')" style=" ">点击预约</div>
		</div>
		<div id="core_team_00${vs.index+1 }" class="core_team_list_li_show" style="left: 597.5px; top: 10px; display: none;">
			<div class="core_team_zyintro">职业简介</div>
			<div class="core_team_intro">${var.INFO}</div>
		</div>
		</c:if>
        </c:forEach>            
                    

</div>
                </div>


    
    
  </div><div class=" clearb">
                </div></div>

</div>
</div>
<div class="h10"></div>
<div class="h10"></div>

<!-- footer -->
<%@include file="bottom.jsp"%>
<script type="text/javascript">
    //  频道tab切换控制
    registerChannelEvent('channel-orange');
    registerChannelEvent('channel-blue');

    function colous1() {
    	//var expiresDate= new Date();
    	//expiresDate.setTime(expiresDate.getTime() + (1 * 60 * 1000));
    	$.cookie('qhhcjf_index', 'true', {expires : 1});
        $("#xinhuancontent_scroll").hide();
    }
    
</script>
<div id="jquery-yuyue">
                <div id="jquery-lightbox" style="display:none;">
                    <div id="lightbox-container-image-data-box">
                        <div class="lightbox-container_box_left">
                            预约当前理财师</div>
                        <div class="lightbox-container_box_right">
                            <a id="lightbox-secNav-btnClose" onclick="closeDiv()">
                                <img src="static/img/web/lightbox-btn-close.png">
                            </a>
                        </div>
                    </div>
                    <div id="lightbox-container-image-box">
                    	<input type="hidden" id="FINANCIALPLANNERID">
                        <div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; margin-top: 10px; color:#333333;">
                                理财师：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="OrderPlanner" disabled="true " style="border: 1px solid #F49703; width: 100%; height: 36px; color:#999999; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                姓名：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="USERNAME" placeholder="请输入您的姓名" style="border: 1px solid #F49703; width: 100%; height: 36px; color:#999999;
                                    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                手机号：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="CONTACTMOBILE" placeholder="请输入您的手机号" style="border: 1px solid #F49703; width: 100%; color:#999999;
                                    height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                您的要求：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <textarea id="YOURREQUEST" style="resize:none; border: 1px solid #F49703; width: 100%; height: 64px; color:#999999; line-height:24px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></textarea>
                            </div>
                            <div style="width: 80%; margin: 0 auto;">
                                <div style="background: #F49703; border: none; width: 100%; height: 36px; line-height: 36px;
                                    color: #fff; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                                    margin-top: 20px;" onclick="licaishi_click()">
                                    立即提交</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="bg" style="display:none;position:fixed;background-color: black;width: 100%;top:0;height: 100%;opacity: 0.5;"></div>  
            </div>
<script>    
  function showDiv(ID,NAME){  
    //document.getElementById('jquery-lightbox').style.display='block';  
    $("#jquery-lightbox").show();
   /*  $("#bg").show(); */
    $("#OrderPlanner").val(NAME); 
    $("#FINANCIALPLANNERID").val(ID);
}  
function closeDiv(){  
    //document.getElementById('jquery-lightbox').style.display='none';  
    $("#jquery-lightbox").hide();
  /*   $("#bg").hide(); */
}  

function licaishi_click(){
		var data={};
		data.FINANCIALPLANNERID = $("#FINANCIALPLANNERID").val();
		if (!$("#USERNAME").val().trim()) { 
			alert("请输入您的姓名！"); 
			$("#USERNAME").focus(); 
			return false; 
 		} 
		data.NAME = $("#USERNAME").val();
		if (!$("#CONTACTMOBILE").val().match(/^(((1[0-9]{2})|159|153)+\d{8})$/)) {
			alert("手机号码格式不正确！"); 
			$("#CONTACTMOBILE").focus(); 
			return false; 
		}
		data.PHONE = $("#CONTACTMOBILE").val();
		if($("#YOURREQUEST").val()){
			data.COMMENTS = $("#YOURREQUEST").val();
		}
		$.ajax({
				type: "POST",
				url: '<%=basePath%>web/lcsyy',
		    	data: data,
				dataType:'json',
				success: function(data){
					 if(data.result == 01){
					 	alert("预约成功");
					 }else{
					 	alert(data.msg);
					 }
				}
		});
	}
	
	function jianguanyuyue(){ 
		var data={};
		if (!$("#JIANGUANNAME").val().trim() || $("#JIANGUANNAME").val().trim() == "请输入您的姓名") { 
			alert("请输入您的姓名！"); 
			$("#JIANGUANNAME").focus(); 
			return false; 
 		} 
		data.NAME = $("#JIANGUANNAME").val();
		if (!$("#JIANGUANPOHONE").val().match(/^(((1[0-9]{2})|159|153)+\d{8})$/) || $("#JIANGUANPOHONE").val()=='请输入您的手机号码') {
			alert("手机号码格式不正确！"); 
			$("#JIANGUANPOHONE").focus(); 
			return false; 
		}
		data.PHONE = $("#JIANGUANPOHONE").val();
		$.ajax({
				type: "POST",
				url: '<%=basePath%>web/lcsyy',
		    	data: data,
				dataType:'json',
				success: function(data){
					colous();
				}
		});
	}
	
	function goQuery(src){
		window.open(src);
	}

</script>
</div></div></div>
</body>
</html>
