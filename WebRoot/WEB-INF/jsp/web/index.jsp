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
    <link rel="stylesheet" type="text/css" href="static/css/web/style.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/gjf_index.css">

    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
   <link rel="Shortcut Icon" href="static/img/web/logo2.ico"> 
<title>信托理财产品预约_资管产品预约_信托理财投资 ——环成金服</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="私募，信托，契约型，政府债、对冲•定增">
	<meta http-equiv="description" content="环成金服是国内一家专为高净值人群提供财富管理服务的综合性平台，专注于财富管理领域，
为客户提供包括但不限于信托、资管、契约型,定增等产品的咨询服务">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@include file="baidusq.jsp"%>
  </head>
  
  <body style=" background-color:#fcfcfc;">
  <script type="text/javascript">
        //  频道tab切换控制
        registerChannelEvent('channel-orange');
        registerChannelEvent('channel-blue');
    </script>
	<%@include file="head.jsp"%>
	<input type="hidden" id="WEBTYPE" value="1">
     <!-- banner -->
       <div id="container" style="border: none; background: none;">
        <div>      
            <div id="index_banner" class="clearb">
                <div class="flexslider">
                    <ul class="slides">
                        <li style="background: url(static/img/web/img_index_banner_joinus1.jpg) 65% 0px no-repeat; width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1;" class="">
                            <a class=" h420 cpointer" target="_blank">
                                <div style="width: 100%; height: 420px;">
                                </div>
                            </a></li>
                       
                       
                       
                        
                        <li style="background: url(static/img/web/img_index_banner_joinus1.jpg) 65% 0px no-repeat; width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;" class="flex-active-slide"><a class=" h420 cpointer" target="_blank">
                            <div style="width: 100%; height: 420px;">
                            </div>
                        </a></li>
                        
                    </ul>
                <ol class="flex-control-nav flex-control-paging"><li><a class=""></a></li><li><a class=""></a></li><li><a class="flex-active"></a></li></ol></div>
            </div>
    

	<div class="w1200 mauto main">
                <!--  最新上线与热门推荐-start  -->
                <div class="newest-and-hot clearfix">
                    <div class="newest float-left">
                        <h3 class="newest-and-hot-title">
                            最新上线</h3>
                        <div id="ctl00_ContentPlaceHolder1_index_new_online_product_server">
                        <div id="owl-example" class="owl-carousel newest-slide owl-theme" style="opacity: 1; display: block;">
							<div class="owl-wrapper-outer"><div class="owl-wrapper" style=""><div class="owl-item" style="width: 318px;"><div>
								<ul>
					<!-- 开始循环 -->	
					<c:choose>
						<c:when test="${not empty newProduct}">
								<c:forEach items="${newProduct}" var="var" varStatus="vs">
									<li class="slide-list-item clearfix">
										<div class="float-left icon-left"><div class="icon-bg" style="background-image: url(static/img/web/crown_${vs.index+1}.png)">${vs.index+1}</div></div>
										<div class="float-left content-right">
										<div class="content-right-div1">
											<a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=${var.PRODUCTTYPE}" target="_blank" class="content-right-title">
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
											<div class="float-left desc-left"><div class="desc-span1 c999999 fl">期限：</div><div class="desc-span2 fs14 fl">${var.PRODUCTDEADLINE}</div><div class="vertical-line ml10 fr"></div></div>
											<div class="float-left desc-right"><div class="desc-span1 c999999 fl ml12">预计收益：</div><div class="desc-span2 fs18 fl">${var.RETURNSBENCHMARK}</div></div>
											<div class="clearb"></div>
										</div>
										<div class="content-right-div3"><span class="c999999">上线时间</span>：${var.YMH}</div>
										</div>
										<div class="clearb"></div>
									</li>
							</c:forEach>
					</c:when>
				</c:choose>
						</ul>
						</div></div></div></div></div></div>
                    </div>
                    
                    <!--右边-->
                    <div class="hot float-left">
                        <h3 class="newest-and-hot-title">
                            热门推荐</h3>
                        <div id="ctl00_ContentPlaceHolder1_index_hot_online_product_server" class="hot-content">
                       
                        	<c:choose>
					<c:when test="${not empty pushListTop}">
						<c:forEach items="${pushListTop}" var="var" varStatus="vs">
							<c:choose>
								<!--右边上部分-->
								<c:when test="${vs.index eq 0 }">
									<div class="hot-content-top clearfix">
										<div class="float-left hot-content-top-left">
											<div class="hot-title position-relative"><div class="hot-title-icon-left"></div><h3 class="hot-title-h3"><a href="" target="_blank" class="hot-title-link">${var.PRODUCTREFERRED }</a></h3>								   							<div class="hot-title-icon-right">募集中</div></div>
											<div class="hot-description-icons">
												<div class="hot-description-icon hot-description-icon1" style="background-image: url(img/hot_description_icon1.png)">
					                            	<p class="hot-description-icon-p1">投资期限</p><p class="hot-description-icon-p2">${var.PRODUCTDEADLINE }</p></div>
												<div class="hot-description-icon hot-description-icon2" style="background-image: url(img/hot_description_icon2.png)">
					                        		<p class="hot-description-icon-p1">预计收益率</p><p class="hot-description-icon-p2">${var.RETURNSBENCHMARK }</p></div>
												<div class="hot-description-icon hot-description-icon3" style="background-image: url(img/hot_description_icon3.png)">
					                            	<p class="hot-description-icon-p1">融资规模</p><p class="hot-description-icon-p2">${var.EXPECTISSUANCE }</p></div>
											</div>
										</div>
	
										<div class="float-left hot-content-top-right">
											<div class="hot-content-top-right-money">起投金额：<span>${var.INVESTMENTSTARTING }</span></div>
											<p class="hot-content-top-right-description">
												产品点评：
												<c:if test="${fn:length(var.PRODUCTREVIEWS) > 28 }">
													${fn:substring(var.PRODUCTREVIEWS,0,28)}...
												</c:if>
												<c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 28 }">
													${var.PRODUCTREVIEWS}
												</c:if>
											</p>
												<div class="align-center"><a class="cpointer btn btn-big  cpointer">立即预约</a></div>
										</div>
										<div class="clearb"></div>
									</div>
								</c:when>
								<c:otherwise>
									<!--右边下-->
						<div class="hot-content-bottom clearfix">
						<div class="hot-content-bottom-item float-left position-relative">
						<div class="hot-content-bottom-item-title"><h3 class="hot-content-bottom-item-title-h3 text-ellipsis">
                        <a href="" target="_blank" class="hot-content-bottom-item-title-link">HT证券-华建2号</a></h3><p class="align-center">10%</p></div>
						<div class="align-center invest-money-and-scale clearfix">
							<div class="invest-money float-left align-center"><p class="invest-money-p1">投资期限</p><p class="invest-money-p2">24个月</p></div>
							<div class="invest-scale float-left align-center"><p class="invest-scale-p1">融资规模</p><p class="invest-scale-p2">2亿</p></div>
							<div class="clearb"></div>
						</div>
						
                        
                        </div>
                        </div>
				
                        <div class="hot-content-bottom-tips">
                        	<div class="hot-content-bottom-desc">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</div>
                            <div class="align-center"><a  class="cpointer btn btn-big cpointer">立即预约</a></div></div>
							<div class="clearb"></div>
						</div>
						
                        <div class="hot-content-bottom-item float-left position-relative">
						<div class="hot-content-bottom-item-title"><h3 class="hot-content-bottom-item-title-h3 text-ellipsis">
                        <a href="" target="_blank" class="hot-content-bottom-item-title-link">HT证券-华建2号</a></h3><p class="align-center">10%</p></div>
						<div class="align-center invest-money-and-scale clearfix">
							<div class="invest-money float-left align-center"><p class="invest-money-p1">投资期限</p><p class="invest-money-p2">24个月</p></div>
							<div class="invest-scale float-left align-center"><p class="invest-scale-p1">融资规模</p><p class="invest-scale-p2">2亿</p></div>
							<div class="clearb"></div>
						</div>
						
                        <div class="hot-content-bottom-tips">
                        	<div class="hot-content-bottom-desc">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</div>
                            <div class="align-center"><a  class="cpointer btn btn-big cpointer">立即预约</a></div></div>
							<div class="clearb"></div>
						</div>

						<div class="hot-content-bottom-item float-left position-relative">
						<div class="hot-content-bottom-item-title"><h3 class="hot-content-bottom-item-title-h3 text-ellipsis">
                        <a href="" target="_blank" class="hot-content-bottom-item-title-link">HT证券-华建2号</a></h3><p class="align-center">10%</p></div>
						<div class="align-center invest-money-and-scale clearfix">
							<div class="invest-money float-left align-center"><p class="invest-money-p1">投资期限</p><p class="invest-money-p2">24个月</p></div>
							<div class="invest-scale float-left align-center"><p class="invest-scale-p1">融资规模</p><p class="invest-scale-p2">2亿</p></div>
							<div class="clearb"></div>
						</div>
						
                        <div class="hot-content-bottom-tips">
                        	<div class="hot-content-bottom-desc">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</div>
                            <div class="align-center"><a  class="cpointer btn btn-big cpointer">立即预约</a></div></div>
							<div class="clearb"></div>
						</div>
						<div class="clearb"></div></div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
				</c:choose>
                        
                        <!--右边下-->
						<div class="hot-content-bottom clearfix">
						<!-- 开始循环 -->
						<c:choose>
						<c:when test="${not empty pushLisBelowt}">
								<c:forEach items="${pushLisBelowt}" var="var" varStatus="vs">
						<div class="hot-content-bottom-item float-left position-relative">
						<div class="hot-content-bottom-item-title"><h3 class="hot-content-bottom-item-title-h3 text-ellipsis">
                        <a href="web/trustDetails?ID=${var.ID}" target="_blank" class="hot-content-bottom-item-title-link">${var.PRODUCTNAME}</a></h3><p class="align-center">${var.RETURNSBENCHMARK}</p></div>
						<div class="align-center invest-money-and-scale clearfix">
							<div class="invest-money float-left align-center"><p class="invest-money-p1">投资期限</p><p class="invest-money-p2">${var.PRODUCTDEADLINE}</p></div>
							<div class="invest-scale float-left align-center"><p class="invest-scale-p1">融资规模</p><p class="invest-scale-p2">${var.EXPECTISSUANCE}</p></div>
							<div class="clearb"></div>
						</div>
						
                        <div class="hot-content-bottom-tips">
                        	<div class="hot-content-bottom-desc">产品点评：${var.PRODUCTREVIEWS}</div>
                            <div class="align-center"><a  class="cpointer btn btn-big cpointer">立即预约</a></div></div>
							<div class="clearb"></div>
						</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
                        
                       </div>


				<!--  频道-start  -->
                <div class="channel channel-orange clearfix">
                    <div class="float-left channel-left position-relative">
                        <div class="channel-title position-relative">
                            <h1 class="align-center"> 固定收益</h1>
                            <span class="align-center count-number">共<span class="count-number-big">2098</span>款</span>
                        </div>
                       
                        <div class="channel-button align-center">
                            <a href="" class="btn btn-channel">进入频道&nbsp;&gt;</a>
                        </div>
                        <div class="channel-left-bg">
                        </div>
                    </div>
                    <div class="float-left channel-right">
                        <div class="channel-tabs-title position-relative">
                            <ul class="channel-tabs-list">
                                <li class="align-center channel-tab channel-tab-active cpointer"><a href="web/mislist" class="cur">信托</a></li>
                                <li class="align-center channel-tab cpointer"><a href="web/constant" class="cur">资管</a></li>
                                <li class="align-center channel-tab cpointer"><a href="web/mislist" class="cur">契约型</a></li>
                            </ul>
                            <div class="channel-tabs-corner-icon">
                            </div>
                        </div>
                        
                       
                        <div class="channel-tabs-content"> 
                        	<!--一页-->
                            <div class="channel-tab-content channel-tab-content-active">
                                <div id="ctl00_ContentPlaceHolder1_index_gudingshouyi_trust_product_server"><div class="channel-tab-top clearfix">
                                <!-- 开始循环 -->
									<c:choose>
										<c:when test="${not empty trustLeft}">
											<c:forEach items="${trustLeft}" var="var" varStatus="vs">
											<div class="float-left channel-tab-top-left">
											<div class="channel-tab-enterprise clearfix">
											<div class="float-left channel-tab-enterprise-logo"><img src="static/img/web/logo1.jpg" alt="信托企业logo"></div>
												<div class="float-left channel-tab-enterprise-detail">
												<h2 class="channel-tab-enterprise-name text-ellipsis">
		                                        	<a href="web/trustDetails?ID=${var.ID}" target="_blank" class="channel-tab-enterprise-name-link">${var.PRODUCTNAME}</a></h2>
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
													<a class="channel-tab-enterprise-description-link" href="web/trustDetails?ID=${var.ID}" target="_blank">${var.PRODUCTREVIEWS}</a>
		                                        </div>
												</div>
												<div class="clearb"></div>
												</div>
												
		                                        <div class="channel-tab-icons-desc align-center clearfix">
													<div class="float-left channel-tab-icon-desc">
		                                            	<p class="invest-month primary-color"><span class="count-down-number">${var.PRODUCTDEADLINE}</span></p>
		                                            	<div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">投资期限</p>
		                                            </div>
													<div class="float-left channel-tab-icon-desc" style=" background: url(static/img/web/hot_description_icon5.png) no-repeat 100% 100%;">
		                                            	<p class="invest-month primary-color"><span class="count-down-number">${var.EXPECTISSUANCE}</span></p>
		                                                <div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">融资规模</p>
		                                            </div>
													<div class="float-left channel-tab-icon-desc"  style=" background: url(static/img/web/hot_description_icon6.png) no-repeat 100% 100%;">
		                                            	<p class="invest-month primary-color"><span class="count-down-number">${var.RETURNSBENCHMARK}</span>%</p>
		                                            	<div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">收益基准</p>
		                                            </div>
													<div class="clearb"></div>
		                                        </div>
												<div class="channel-tab-button align-center"><a class="btn btn-big btn-channel-tab  cpointer">立即预约</a></div>
												<div class="h25"></div>
												</div>
										</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="main_info">
												<td colspan="100" class="center" >没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
										
                      		<!--右边-->                
                            <div class="float-left channel-tab-top-right" >
								<ul>
									<!-- 开始循环 -->
									<c:choose>
										<c:when test="${not empty trustRight}">
											<c:forEach items="${trustRight}" var="var" varStatus="vs">
												<li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
													<div class="enterprise-name position-relative"><h3><a href="web/trustDetails?ID=${var.ID}" target="_blank"><b>${var.PRODUCTNAME}</b></a></h3><p class="invest-month primary-color">${var.RETURNSBENCHMARK}</p></div>
													<div class="enterprise-month-and-money clearfix">
			                                        	<div class="float-left enterprise-chunk">投资期限：<span class="primary-color">${var.PRODUCTDEADLINE}</span></div>
			                                        	<div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">${var.INVESTMENTSTARTING}</span></div><div class="clearb"></div>
			                                        </div>
													<div class="enterprise-scale-and-type clearfix">
			                                        	<div class="float-left enterprise-chunk">融资规模：<span class="primary-color">${var.EXPECTISSUANCE}</span></div>
			                                        	<div class="float-left enterprise-chunk enterprise-chunk2">信托类型：<span class="primary-color">政信类</span></div><div class="clearb"></div>
			                                        </div>
													
			                                        <div class="channel-tab-top-right-item-tips">
			                                        	<div class="h36 lh36"><div class="fl fs16">
			                                            	<a href="web/trustDetails?ID=${var.ID}" class="h36 lh36" target="_blank"><b>${var.PRODUCTNAME}</b></a></div>
			                                            	<div class=" primary-color fr fs22 h36 lh36">${var.RETURNSBENCHMARK}</div>
			                                        	</div>
														<p class=" lh24 h48 c999999">产品点评：${var.PRODUCTREVIEWS}</p>
			                                            <div class="align-center"><a onclick="" class="btn btn-channel-tip cpointer">立即预约</a></div>
			                                        </div>
													<div class="channel-tab-top-right-item-border"></div>
			                                   </li>
                                   			</c:forEach>
										</c:when>
										<c:otherwise>
											<tr class="main_info">
												<td colspan="100" class="center" >没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
									</ul>
								</div>
                                
								<div class="clearb"></div></div>
								</div></div>
                                
                            <div class="channel-tab-content">
                                <div id="ctl00_ContentPlaceHolder1_index_gudingshouyi_asset_product_server">
                                <div class="channel-tab-top clearfix">
                                <!-- 左边  -->
                                <!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty constantRight}">
										<c:forEach items="${constantRight}" var="var" varStatus="vs">
											<div class="float-left channel-tab-top-left">
												<div class="channel-tab-enterprise clearfix">
												<div class="float-left channel-tab-enterprise-logo"><img src="static/img/web/logo1.jpg" alt="信托企业logo"></div>
													<div class="float-left channel-tab-enterprise-detail">
													<h2 class="channel-tab-enterprise-name text-ellipsis">
			                                        	<a href="web/trustDetails?ID=${var.ID}" target="_blank" class="channel-tab-enterprise-name-link">${var.PRODUCTNAME}</a>
			                                        </h2>
													<div class="channel-tab-enterprise-rating clearfix">
			                                        	<div class="float-left rating-star"></div>
			                                        	<div class="float-left rating-star"></div>
			                                        	<div class="float-left rating-star"></div>
			                                        	<div class="float-left rating-star"></div>
			                                        	<div class="float-left rating-star"></div>
			                                        	<div class="clearb"></div>
			                                         </div>
			
													<div class="channel-tab-enterprise-description text-ellipsis position-relative">
			                                        	<span></span>
														<a class="channel-tab-enterprise-description-link" href="" target="_blank">${var.PRODUCTREVIEWS}</a>
			                                        </div>
													</div>
													<div class="clearb"></div>
													</div>
													
			                                        <div class="channel-tab-icons-desc align-center clearfix">
														<div class="float-left channel-tab-icon-desc">
			                                            	<p class="invest-month primary-color"><span class="count-down-number">${var.PRODUCTDEADLINE}</span></p>
			                                            	<div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">投资期限</p>
			                                            </div>
														<div class="float-left channel-tab-icon-desc">
			                                            	<p class="invest-month primary-color"><span class="count-down-number">${var.EXPECTISSUANCE}</span></p>
			                                                <div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">融资规模</p>
			                                            </div>
														<div class="float-left channel-tab-icon-desc">
			                                            	<p class="invest-month primary-color"><span class="count-down-number">${var.RETURNSBENCHMARK}</span>%</p>
			                                            	<div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">收益基准</p>
			                                            </div>
														<div class="clearb"></div>
			                                        </div>
													<div class="channel-tab-button align-center"><a class="btn btn-big btn-channel-tab  cpointer">立即预约</a></div>
													<div class="h25">
												</div>
											</div>
									</c:forEach>
								</c:when>
										<c:otherwise>
											<tr class="main_info">
												<td colspan="100" class="center" >没有相关数据</td>
											</tr>
										</c:otherwise>
							</c:choose>
										
                       		<!--右边-->                
                            <div class="float-left channel-tab-top-right">
								<ul>
									<li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
										<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>中江信托-金马432号</b></a></h3><p class="invest-month primary-color">8%</p></div>
										<div class="enterprise-month-and-money clearfix">
                                        	<div class="float-left enterprise-chunk">投资期限：<span class="primary-color">36个月</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div>
                                        </div>
										<div class="enterprise-scale-and-type clearfix">
                                        	<div class="float-left enterprise-chunk">融资规模：<span class="primary-color">1.2亿</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">信托类型：<span class="primary-color">政信类</span></div><div class="clearb"></div>
                                        </div>
										
                                        <div class="channel-tab-top-right-item-tips">
                                        	<div class="h36 lh36"><div class="fl fs16">
                                            	<a href="" class="h36 lh36" target="_blank"><b>中江信托-金马432号</b></a></div>
                                            	<div class=" primary-color fr fs22 h36 lh36">8%</div>
                                        	</div>
											<p class=" lh24 h48 c999999">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</p>
                                            <div class="align-center"><a onclick="" class="btn btn-channel-tip cpointer">立即预约</a></div>
                                        </div>
										<div class="channel-tab-top-right-item-border"></div>
                                   </li>
                                   
									<li class="channel-tab-top-right-item position-relative">
										<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>中江信托-金马432号</b></a></h3><p class="invest-month primary-color">8%</p></div>
										<div class="enterprise-month-and-money clearfix">
                                        	<div class="float-left enterprise-chunk">投资期限：<span class="primary-color">36个月</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div>
                                        </div>
										<div class="enterprise-scale-and-type clearfix">
                                        	<div class="float-left enterprise-chunk">融资规模：<span class="primary-color">1.2亿</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">信托类型：<span class="primary-color">政信类</span></div><div class="clearb"></div>
                                        </div>
										
                                        <div class="channel-tab-top-right-item-tips">
                                        	<div class="h36 lh36"><div class="fl fs16">
                                            	<a href="" class="h36 lh36" target="_blank"><b>中江信托-金马432号</b></a></div>
                                            	<div class=" primary-color fr fs22 h36 lh36">8%</div>
                                        	</div>
											<p class=" lh24 h48 c999999">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</p>
                                            <div class="align-center"><a onclick="" class="btn btn-channel-tip cpointer">立即预约</a></div>
                                        </div>
										<div class="channel-tab-top-right-item-border"></div>
                                   </li>
                                   
									<li class="channel-tab-top-right-item position-relative">
										<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>中江信托-金马432号</b></a></h3><p class="invest-month primary-color">8%</p></div>
										<div class="enterprise-month-and-money clearfix">
                                        	<div class="float-left enterprise-chunk">投资期限：<span class="primary-color">36个月</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div>
                                        </div>
										<div class="enterprise-scale-and-type clearfix">
                                        	<div class="float-left enterprise-chunk">融资规模：<span class="primary-color">1.2亿</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">信托类型：<span class="primary-color">政信类</span></div><div class="clearb"></div>
                                        </div>
										
                                        <div class="channel-tab-top-right-item-tips">
                                        	<div class="h36 lh36"><div class="fl fs16">
                                            	<a href="" class="h36 lh36" target="_blank"><b>中江信托-金马432号</b></a></div>
                                            	<div class=" primary-color fr fs22 h36 lh36">8%</div>
                                        	</div>
											<p class=" lh24 h48 c999999">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</p>
                                            <div class="align-center"><a onclick="" class="btn btn-channel-tip cpointer">立即预约</a></div>
                                        </div>
										<div class="channel-tab-top-right-item-border"></div>
                                   </li>
                                   <li class="channel-tab-top-right-item position-relative">
										<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>中江信托-金马432号</b></a></h3><p class="invest-month primary-color">8%</p></div>
										<div class="enterprise-month-and-money clearfix">
                                        	<div class="float-left enterprise-chunk">投资期限：<span class="primary-color">36个月</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div>
                                        </div>
										<div class="enterprise-scale-and-type clearfix">
                                        	<div class="float-left enterprise-chunk">融资规模：<span class="primary-color">1.2亿</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">信托类型：<span class="primary-color">政信类</span></div><div class="clearb"></div>
                                        </div>
										
                                        <div class="channel-tab-top-right-item-tips">
                                        	<div class="h36 lh36"><div class="fl fs16">
                                            	<a href="" class="h36 lh36" target="_blank"><b>中江信托-金马432号</b></a></div>
                                            	<div class=" primary-color fr fs22 h36 lh36">8%</div>
                                        	</div>
											<p class=" lh24 h48 c999999">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</p>
                                            <div class="align-center"><a onclick="" class="btn btn-channel-tip cpointer">立即预约</a></div>
                                        </div>
										<div class="channel-tab-top-right-item-border"></div>
                                   </li>
								</ul></div>
                                
								<div class="clearb"></div></div>
								</div></div>
                            <div class="channel-tab-content">
                                <div id="ctl00_ContentPlaceHolder1_index_gudingshouyi_hign_product_server"><div class="channel-tab-top clearfix">
								<div class="float-left channel-tab-top-left">
									<div class="channel-tab-enterprise clearfix">
									<div class="float-left channel-tab-enterprise-logo"><img src="static/img/web/logo1.jpg" alt="信托企业logo"></div>
										<div class="float-left channel-tab-enterprise-detail">
										<h2 class="channel-tab-enterprise-name text-ellipsis">
                                        	<a href="" target="_blank" class="channel-tab-enterprise-name-link">吉林信托-汇融3123116 号</a></h2>
										<div class="channel-tab-enterprise-rating clearfix">
                                        	<div class="float-left rating-star"></div>
                                        	<div class="float-left rating-star"></div>
                                        	<div class="float-left rating-star"></div>
                                        	<div class="float-left rating-star"></div>
                                        	<div class="float-left rating-star"></div>
                                        	<div class="clearb"></div>
                                         </div>

										<div class="channel-tab-enterprise-description text-ellipsis position-relative">
                                        	<span></span>
											<a class="channel-tab-enterprise-description-link" href="" target="_blank">应收账款+上市公司实际控制连带责任担保+保理公司到..</a>
                                        </div>
										</div>
										<div class="clearb"></div>
										</div>
										
                                        <div class="channel-tab-icons-desc align-center clearfix">
											<div class="float-left channel-tab-icon-desc">
                                            	<p class="invest-month primary-color"><span class="count-down-number">1+1年</span></p>
                                            	<div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">投资期限</p>
                                            </div>
											<div class="float-left channel-tab-icon-desc">
                                            	<p class="invest-month primary-color"><span class="count-down-number">2.2亿</span></p>
                                                <div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">融资规模</p>
                                            </div>
											<div class="float-left channel-tab-icon-desc">
                                            	<p class="invest-month primary-color"><span class="count-down-number">7.7</span>%</p>
                                            	<div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">收益基准</p>
                                            </div>
											<div class="clearb"></div>
                                        </div>
										<div class="channel-tab-button align-center"><a class="btn btn-big btn-channel-tab  cpointer">立即预约</a></div>
										<div class="h25"></div>
										</div>
										
                      		<!--右边-->                
                            <div class="float-left channel-tab-top-right">
								<ul>
									<li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
										<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>中江信托-金马432号</b></a></h3><p class="invest-month primary-color">8%</p></div>
										<div class="enterprise-month-and-money clearfix">
                                        	<div class="float-left enterprise-chunk">投资期限：<span class="primary-color">36个月</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div>
                                        </div>
										<div class="enterprise-scale-and-type clearfix">
                                        	<div class="float-left enterprise-chunk">融资规模：<span class="primary-color">1.2亿</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">信托类型：<span class="primary-color">政信类</span></div><div class="clearb"></div>
                                        </div>
										
                                        <div class="channel-tab-top-right-item-tips">
                                        	<div class="h36 lh36"><div class="fl fs16">
                                            	<a href="" class="h36 lh36" target="_blank"><b>中江信托-金马432号</b></a></div>
                                            	<div class=" primary-color fr fs22 h36 lh36">8%</div>
                                        	</div>
											<p class=" lh24 h48 c999999">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</p>
                                            <div class="align-center"><a onclick="" class="btn btn-channel-tip cpointer">立即预约</a></div>
                                        </div>
										<div class="channel-tab-top-right-item-border"></div>
                                   </li>
                                   
									<li class="channel-tab-top-right-item position-relative">
										<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>中江信托-金马432号</b></a></h3><p class="invest-month primary-color">8%</p></div>
										<div class="enterprise-month-and-money clearfix">
                                        	<div class="float-left enterprise-chunk">投资期限：<span class="primary-color">36个月</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div>
                                        </div>
										<div class="enterprise-scale-and-type clearfix">
                                        	<div class="float-left enterprise-chunk">融资规模：<span class="primary-color">1.2亿</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">信托类型：<span class="primary-color">政信类</span></div><div class="clearb"></div>
                                        </div>
										
                                        <div class="channel-tab-top-right-item-tips">
                                        	<div class="h36 lh36"><div class="fl fs16">
                                            	<a href="" class="h36 lh36" target="_blank"><b>中江信托-金马432号</b></a></div>
                                            	<div class=" primary-color fr fs22 h36 lh36">8%</div>
                                        	</div>
											<p class=" lh24 h48 c999999">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</p>
                                            <div class="align-center"><a onclick="" class="btn btn-channel-tip cpointer">立即预约</a></div>
                                        </div>
										<div class="channel-tab-top-right-item-border"></div>
                                   </li>
                                   
									<li class="channel-tab-top-right-item position-relative">
										<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>中江信托-金马432号</b></a></h3><p class="invest-month primary-color">8%</p></div>
										<div class="enterprise-month-and-money clearfix">
                                        	<div class="float-left enterprise-chunk">投资期限：<span class="primary-color">36个月</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div>
                                        </div>
										<div class="enterprise-scale-and-type clearfix">
                                        	<div class="float-left enterprise-chunk">融资规模：<span class="primary-color">1.2亿</span></div>
                                        	<div class="float-left enterprise-chunk enterprise-chunk2">信托类型：<span class="primary-color">政信类</span></div><div class="clearb"></div>
                                        </div>
										
                                        <div class="channel-tab-top-right-item-tips">
                                        	<div class="h36 lh36"><div class="fl fs16">
                                            	<a href="" class="h36 lh36" target="_blank"><b>中江信托-金马432号</b></a></div>
                                            	<div class=" primary-color fr fs22 h36 lh36">8%</div>
                                        	</div>
											<p class=" lh24 h48 c999999">产品点评：国企铁路干线+省会房产抵押+省级政府批复文件!</p>
                                            <div class="align-center"><a onclick="" class="btn btn-channel-tip cpointer">立即预约</a></div>
                                        </div>
										<div class="channel-tab-top-right-item-border"></div>
                                   </li>
								</ul></div>
                                
								<div class="clearb"></div></div>
								</div></div>
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
                            <h1 class="align-center" style="color:#00aefd;">浮动收益</h1>
                            <span class="align-center count-number">共<span class="count-number-big">2098</span>款</span>
                        </div>
                        <div class="channel-feature">
                            <ul>
                                <li class="position-relative"><span class="icon-right"></span>高收益神话</li>
                                <li class="position-relative"><span class="icon-right"></span>尽享创新红利</li>
                                <li class="position-relative"><span class="icon-right"></span>退出渠道多元</li>
                            </ul>
                        </div>
                        <div class="channel-button align-center">
                            <a href="" target="_blank" class="btn btn-channel">进入频道&nbsp;&gt;</a>
                        </div>
                        <div class="channel-left-bg"  style="background-color:#00aefd;">
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
                                <div id="ctl00_ContentPlaceHolder1_index_fudongshouyi_guquan_product_server"><div class="channel-tab-top clearfix">
			<div class="float-left channel-tab-top-left">
						<!-- 开始循环 -->
						<c:choose>
							<c:when test="${not empty floatLeft}">
									<c:forEach items="${floatLeft}" var="var" varStatus="vs">
										<div class="channel-tab-enterprise clearfix">
										<div class="float-left channel-tab-enterprise-logo"><img src="static/img/web/logo1.jpg" alt="信托企业logo"></div>
										<div class="float-left channel-tab-enterprise-detail">
										<h2 class="channel-tab-enterprise-name text-ellipsis"><a href="web/trustDetails?ID=${var.ID}" target="_blank" class="channel-tab-enterprise-name-link">${var.PRODUCTNAME}</a></h2>
										<div class="channel-tab-enterprise-rating clearfix"><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="clearb"></div></div>
										<div class="channel-tab-enterprise-description text-ellipsis position-relative"><span></span><a class="channel-tab-enterprise-description-link" href="web/trustDetails?ID=${var.ID}" target="_blank">${var.PRODUCTREVIEWS}</a></div>
										</div>
										<div class="clearb"></div>
										</div>
										<div class="channel-tab-icons-desc align-center clearfix">
										<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">${var.EXPECTISSUANCE}</span></p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">目标规模</p></div>
										<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">${var.INVESTMENTSTARTING}</span></p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">投资门槛</p></div>
										<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">${var.PRODUCTDEADLINE}</span>%</p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">存续期限</p></div>
										<div class="clearb"></div></div>
										<div class="channel-tab-button align-center"><a  class="btn btn-big btn-channel-tab   cpointer">立即预约</a></div>
										<div class="h25"></div>
									</c:forEach>
							</c:when>
							<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
							</c:otherwise>
						</c:choose>
			</div>
			<div class="float-left channel-tab-top-right">
					<ul>
						<!-- 开始循环 -->
						<c:choose>
							<c:when test="${not empty floatRight}">
									<c:forEach items="${floatRight}" var="var" varStatus="vs">
										<li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
											<div class="enterprise-name position-relative"><h3><a href="web/trustDetails?ID=${var.ID}" target="_blank"><b>${var.PRODUCTNAME}</b></a></h3><p class="invest-month primary-color">${var.INVESTMENTSTARTING}</p></div>
											<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">管理机构：<span class="primary-color">${var.THEISSUER}</span></div><div class="float-left enterprise-chunk enterprise-chunk2">目标规模：<span class="primary-color">${var.EXPECTISSUANCE}</span></div><div class="clearb"></div></div>
											<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">存续期限：<span class="primary-color">${var.PRODUCTDEADLINE}</span></div><div class="float-left enterprise-chunk enterprise-chunk2">投资方向：<span class="primary-color">${var.TRUSTTYPE}</span></div><div class="clearb"></div></div>
											<div class="channel-tab-top-right-item-tips">
											<div class="h36 lh36"><div class="fl fs16"><a href="web/trustDetails?ID=${var.ID}" target="_blank"><b>${var.PRODUCTNAME}</b></a></div><div class=" primary-color fr fs22 h36 lh36">${var.INVESTMENTSTARTING}</div></div>
											<p class=" lh24 h48 c999999">产品点评：${var.PRODUCTREVIEWS}</p><div class="align-center"><a  class="btn btn-channel-tip cpointer">立即预约</a></div></div>
											<div class="channel-tab-top-right-item-border"></div>
										</li>
									</c:forEach>
									</c:when>
									<c:otherwise>
											<tr class="main_info">
												<td colspan="100" class="center" >没有相关数据</td>
											</tr>
									</c:otherwise>
						</c:choose>
					<!-- <li class="channel-tab-top-right-item position-relative">
					<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>东方汇富-中航神舟电力PE</b></a></h3><p class="invest-month primary-color">101万</p></div>
					<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">管理机构：<span class="primary-color">东楷投资..</span></div><div class="float-left enterprise-chunk enterprise-chunk2">目标规模：<span class="primary-color">1亿</span></div><div class="clearb"></div></div>
					<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">存续期限：<span class="primary-color">2+1年</span></div><div class="float-left enterprise-chunk enterprise-chunk2">投资方向：<span class="primary-color">中航神舟..</span></div><div class="clearb"></div></div>
					<div class="channel-tab-top-right-item-tips">
					<div class="h36 lh36"><div class="fl fs16"><a href="" target="_blank"><b>东方汇富-中航神舟电力PE</b></a></div><div class=" primary-color fr fs22 h36 lh36">101万</div></div>
					<p class=" lh24 h48 c999999">产品点评：正规金融产品+顶级PE公司+政府支持行业+行业龙头+央企股东+保底收益8%+上市成功..</p><div class="align-center"><a  class="btn btn-channel-tip cpointer">立即预约</a></div></div>
					<div class="channel-tab-top-right-item-border"></div></li>
					<li class="channel-tab-top-right-item position-relative">
					<div class="enterprise-name position-relative"><h3><a href="http://www.zcscs.com/Equity_Detail_57_69_-1_-1_4.html" target="_blank"><b>第三方支付•中汇支付借壳上..</b></a></h3><p class="invest-month primary-color">100万</p></div>
					<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">管理机构：<span class="primary-color">空</span></div><div class="float-left enterprise-chunk enterprise-chunk2">目标规模：<span class="primary-color">1亿</span></div><div class="clearb"></div></div>
					<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">存续期限：<span class="primary-color">2年</span></div><div class="float-left enterprise-chunk enterprise-chunk2">投资方向：<span class="primary-color">资金专项..</span></div><div class="clearb"></div></div>
					<div class="channel-tab-top-right-item-tips">
					<div class="h36 lh36"><div class="fl fs16"><a href="" target="_blank"><b>第三方支付•中汇支付借壳上..</b></a></div><div class=" primary-color fr fs22 h36 lh36">100万</div></div>
					<p class=" lh24 h48 c999999">产品点评：华夏人寿入资16.7股权+牌照稀缺+业务规模全国第五，股东已控股上市公司，未来A股..</p><div class="align-center"><a  class="btn btn-channel-tip cpointer">立即预约</a></div></div>
					<div class="channel-tab-top-right-item-border"></div></li> -->
					</ul>
			</div>
 <div class="clearb"></div></div>
<div class="channel-tab-bottom clearfix">
<div class="float-left channel-tab-bottom-left clearfix">
<div class="float-left channel-news-title align-center"><div class="channel-news-title-icon"></div><p>信托学堂</p></div>
<ul class="float-left channel-news-list">
<li><a href="" target="_blank" class="channel-news-list-link">信托产品能做到刚性兑付的原因</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">海外信托的特点及与国内信托的差异</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">信托收益明显下滑 2016年投资机会何在?</a></li>
</ul>
<div class="clearb"></div></div>
<div class="float-left channel-tab-bottom-right">
<div class="float-left channel-news-title align-center"><div class="channel-news-title-icon"></div><p>行业资讯</p></div>
<ul class="float-left channel-news-list">
<li><a href="" target="_blank" class="channel-news-list-link">投资工商企业信托需要谨慎出手</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">优质定增信托产品判断标准</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">如何运用科学信托理财工具?</a></li>
</ul>
<div class="clearb"></div>
</div>
<div class="clearb"></div>
</div>
</div>
                            </div>
                            <div class="channel-tab-content">
                                <div id="ctl00_ContentPlaceHolder1_index_fudongshouyi_dingzeng_product_server"><div class="channel-tab-top clearfix">
<div class="float-left channel-tab-top-left">
<div class="channel-tab-enterprise clearfix">
<div class="float-left channel-tab-enterprise-logo"><img  src="static/img/web/logo1.jpg" alt="信托企业logo"></div>
<div class="float-left channel-tab-enterprise-detail">
<h2 class="channel-tab-enterprise-name text-ellipsis"><a href="" target="_blank" class="channel-tab-enterprise-name-link">财通基金-富春定增1588..</a></h2>
<div class="channel-tab-enterprise-rating clearfix"><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="clearb"></div></div>
</div>
<div class="clearb"></div>
</div>
<div class="channel-tab-icons-desc align-center clearfix">
<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">18个月</span></p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">投资期限</p></div>
<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">100万</span></p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">起投金额</p></div>
<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">3000万</span></p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">融资规模</p></div>
<div class="clearb"></div></div>
<div class="channel-tab-button align-center"><a class="btn btn-big btn-channel-tab   cpointer">立即预约</a></div>
<div class="h25"></div>
</div>
<div class="float-left channel-tab-top-right">
<ul>
<li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>中泰仁和-主板定增计划2号投..</b></a></h3></div>
<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">投资期限：<span class="primary-color">36月</span></div><div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div></div>
<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">融资规模：<span class="primary-color">80000万</span></div><div class="clearb"></div></div>
<div class="channel-tab-top-right-item-tips">
<div class="h36 lh36"><div class="fl fs16"><a href="" target="_blank"><b>中泰仁和-主板定增计划2号投..</b></a></div><div class=" primary-color fr fs22 h36 lh36">100万</div></div>
<p class=" lh24 h48 c999999">产品点评：综合物流服务商巨头雏形初现；覆盖国内外的快递网络，规模优势明显；坚持直营模..</p><div class="align-center"><a  class="btn btn-channel-tip cpointer">立即预约</a></div></div>
<div class="channel-tab-top-right-item-border"></div></li>
<li class="channel-tab-top-right-item position-relative">
<div class="enterprise-name position-relative"><h3><a href="http://www.zcscs.com/Movable_Detail_57_64_-1_-1_29.html" target="_blank"><b>国泰君安-永安熠生定增17号..</b></a></h3></div>
<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">投资期限：<span class="primary-color">18月</span></div><div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div></div>
<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">融资规模：<span class="primary-color">10000万</span></div><div class="clearb"></div></div>
<div class="channel-tab-top-right-item-tips">
<div class="h36 lh36"><div class="fl fs16"><a  target="_blank"><b>国泰君安-永安熠生定增17号..</b></a></div><div class=" primary-color fr fs22 h36 lh36">100万</div></div>
<p class=" lh24 h48 c999999">产品点评：历史业绩：截止2015年11月，永安发行12只定增产品，管理规模超过45亿元，平均收..</p><div class="align-center"><a class="btn btn-channel-tip cpointer">立即预约</a></div></div>
<div class="channel-tab-top-right-item-border"></div></li>
<li class="channel-tab-top-right-item position-relative">
<div class="enterprise-name position-relative"><h3><a href="http://www.zcscs.com/Movable_Detail_57_64_-1_-1_30.html" target="_blank"><b>元普定增5号</b></a></h3></div>
<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">投资期限：<span class="primary-color">18月</span></div><div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div></div>
<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">融资规模：<span class="primary-color">10000万</span></div><div class="clearb"></div></div>
<div class="channel-tab-top-right-item-tips">
<div class="h36 lh36"><div class="fl fs16"><a  target="_blank"><b>元普定增5号</b></a></div><div class=" primary-color fr fs22 h36 lh36">100万</div></div>
<p class=" lh24 h48 c999999">产品点评：张强先生曾在08年底大举抄底股市，10年预估黄金与白银的上升趋势结束，在13年成..</p><div class="align-center"><a  class="btn btn-channel-tip cpointer">立即预约</a></div></div>
<div class="channel-tab-top-right-item-border"></div></li>
</ul></div>
 <div class="clearb"></div></div>
<div class="channel-tab-bottom clearfix">
<div class="float-left channel-tab-bottom-left clearfix">
<div class="float-left channel-news-title align-center"><div class="channel-news-title-icon"></div><p>信托学堂</p></div>
<ul class="float-left channel-news-list">
<li><a href="" target="_blank" class="channel-news-list-link">信托产品能做到刚性兑付的原因</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">海外信托的特点及与国内信托的差异</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">信托收益明显下滑 2016年投资机会何在?</a></li>
</ul>
<div class="clearb"></div></div>
<div class="float-left channel-tab-bottom-right">
<div class="float-left channel-news-title align-center"><div class="channel-news-title-icon"></div><p>行业资讯</p></div>
<ul class="float-left channel-news-list">
<li><a href="" target="_blank" class="channel-news-list-link">投资工商企业信托需要谨慎出手</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">优质定增信托产品判断标准</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">如何运用科学信托理财工具?</a></li>
</ul>
<div class="clearb"></div>
</div>
<div class="clearb"></div>
</div>
</div>
                            </div>
                            <div class="channel-tab-content">
                                <div id="ctl00_ContentPlaceHolder1_index_fudongshouyi_duichong_product_server"><div class="channel-tab-top clearfix">
<div class="float-left channel-tab-top-left">
<div class="channel-tab-enterprise clearfix">
<div class="float-left channel-tab-enterprise-logo"><img src="static/img/web/logo1.jpg" alt="信托企业logo"></div>
<div class="float-left channel-tab-enterprise-detail">
<h2 class="channel-tab-enterprise-name text-ellipsis"><a href="" target="_blank" class="channel-tab-enterprise-name-link">ZS-华领鲲鹏量化对冲3号..</a></h2>
<div class="channel-tab-enterprise-rating clearfix"><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="float-left rating-star"></div><div class="clearb"></div></div>
</div>
<div class="clearb"></div>
</div>
<div class="channel-tab-icons-desc align-center clearfix">
<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">12月</span></p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">投资期限</p></div>
<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">100万</span></p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">起投金额</p></div>
<div class="float-left channel-tab-icon-desc"><p class="invest-month primary-color"><span class="count-down-number">3000万</span></p><div class="channel-tab-icon-line"></div><p class="invest-deadline color-999">融资规模</p></div>
<div class="clearb"></div></div>
<div class="channel-tab-button align-center"><a  class="btn btn-big btn-channel-tab   cpointer">立即预约</a></div>
<div class="h25"></div>
</div>
<div class="float-left channel-tab-top-right">
<ul>
<li class="channel-tab-top-right-item channel-tab-top-right-item-first position-relative">
<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>华领-添利量化对冲1号</b></a></h3></div>
<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">投资期限：<span class="primary-color">24月</span></div><div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div></div>
<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">融资规模：<span class="primary-color">空</span></div><div class="clearb"></div></div>
<div class="channel-tab-top-right-item-tips">
<div class="h36 lh36"><div class="fl fs16"><a href="" target="_blank"><b>华领-添利量化对冲1号</b></a></div><div class=" primary-color fr fs22 h36 lh36">100万</div></div>
<p class=" lh24 h48 c999999">产品点评：海量的数据客观分析决策，利用模型捕捉价差，获得持续稳定的收益；以套利对冲策..</p><div class="align-center"><a class="btn btn-channel-tip cpointer">立即预约</a></div></div>
<div class="channel-tab-top-right-item-border"></div></li>
<li class="channel-tab-top-right-item position-relative">
<div class="enterprise-name position-relative"><h3><a href="" target="_blank"><b>富隆资产-金盈1号量化对冲计..</b></a></h3></div>
<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">投资期限：<span class="primary-color">12月</span></div><div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div></div>
<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">融资规模：<span class="primary-color">空</span></div><div class="clearb"></div></div>
<div class="channel-tab-top-right-item-tips">
<div class="h36 lh36"><div class="fl fs16"><a href="" target="_blank"><b>富隆资产-金盈1号量化对冲计..</b></a></div><div class=" primary-color fr fs22 h36 lh36">100万</div></div>
<p class=" lh24 h48 c999999">产品点评：封闭期6-12个月；投资者可自由选择申购和赎回时间；管理人跟投比例不低于总资金..</p><div class="align-center"><a onclick="clickEjectContactShow(&#39;中影时空一号_对冲产品_首页浮动收益&#39;)" class="btn btn-channel-tip cpointer">立即预约</a></div></div>
<div class="channel-tab-top-right-item-border"></div></li>
<li class="channel-tab-top-right-item position-relative">
<div class="enterprise-name position-relative"><h3><a href=""><b>智裕宏观对冲投资项目</b></a></h3></div>
<div class="enterprise-month-and-money clearfix"><div class="float-left enterprise-chunk">投资期限：<span class="primary-color">24个月</span></div><div class="float-left enterprise-chunk enterprise-chunk2">起投金额：<span class="primary-color">100万</span></div><div class="clearb"></div></div>
<div class="enterprise-scale-and-type clearfix"><div class="float-left enterprise-chunk">融资规模：<span class="primary-color">空</span></div><div class="clearb"></div></div>
<div class="channel-tab-top-right-item-tips">
<div class="h36 lh36"><div class="fl fs16"><a href="http://www.zcscs.com/Movable_Detail_57_64_-1_-1_3.html" target="_blank"><b>智裕宏观对冲投资项目</b></a></div><div class=" primary-color fr fs22 h36 lh36">100万</div></div>
<p class=" lh24 h48 c999999">产品点评：宏观对冲策略实现灵活配置，多策略、多工具、全天候捕捉市场机会；元葵资产为风..</p><div class="align-center"><a onclick="clickEjectContactShow(&#39;XX证券-瑞金6号_对冲产品_首页浮动收益&#39;)" class="btn btn-channel-tip cpointer">立即预约</a></div></div>
<div class="channel-tab-top-right-item-border"></div></li>
</ul></div>
 <div class="clearb"></div></div>
<div class="channel-tab-bottom clearfix">
<div class="float-left channel-tab-bottom-left clearfix">
<div class="float-left channel-news-title align-center"><div class="channel-news-title-icon"></div><p>信托学堂</p></div>
<ul class="float-left channel-news-list">
<li><a href="" target="_blank" class="channel-news-list-link">信托产品能做到刚性兑付的原因</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">海外信托的特点及与国内信托的差异</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">信托收益明显下滑 2016年投资机会何在?</a></li>
</ul>
<div class="clearb"></div></div>
<div class="float-left channel-tab-bottom-right">
<div class="float-left channel-news-title align-center"><div class="channel-news-title-icon"></div><p>行业资讯</p></div>
<ul class="float-left channel-news-list">
<li><a href="" target="_blank" class="channel-news-list-link">投资工商企业信托需要谨慎出手</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">优质定增信托产品判断标准</a></li>
<li><a href="" target="_blank" class="channel-news-list-link">如何运用科学信托理财工具?</a></li>
</ul>
<div class="clearb"></div>
</div>
<div class="clearb"></div>
</div>
</div>
                            </div>
                        </div>
                    </div>
                    <!--[if lt IE 9]>
            <div class="clearb"></div>
            <![endif]-->
                </div>
<div class="adviser clearfix">
     
      
    <div class="">
    <h3 class="newest-and-hot-title" style="color:#000;">理财师推荐</h3>
      <div class="wrapper ad-mn relative">
        <ul>
        <c:choose>
			<c:when test="${not empty chooseList}">
				<c:forEach items="${chooseList}" var="var" varStatus="vs">
		        	<li>
		        		<a>
		              		<div class="home-lcs-pe auto lcs-pe1" style="background-image:url(${var.IMGURL})"></div>
		            	</a>
		            	<h2 class="f18 col333">${var.NAME}</h2>
		            	<h3 class="f12 col888">${var.POSITION}</h3>           
		          	</li>
          		</c:forEach>
			</c:when>
				<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
		         
			<!-- <li>
		       <a>
              <div class="home-lcs-pe auto lcs-pe2" style="background-image:url(static/img/20170222050747273.jpg);"></div>
            </a>
            <h2 class="f18 col333">韩军营</h2>
            <h3 class="f12 col888">专业风险评估师</h3>           
          </li>
		         
				   <li>
		            <a>
              <div class="home-lcs-pe auto lcs-pe3" style="background-image:url(static/img/20170222050325414.jpg);"></div>
            </a>
            <h2 class="f18 col333">张燕琴</h2>
            <h3 class="f12 col888">资深风险咨询师</h3>           
          </li>
		         
				   <li style="margin-right: 0">
		            <a>
              <div class="home-lcs-pe auto lcs-pe4" style="background-image:url(static/img/20170222052917152.jpg);"></div>
            </a>
            <h2 class="f18 col333">钟文丽</h2>
            <h3 class="f12 col888">资深理财经理</h3>           
          </li> -->
		        		
		        </ul>
      </div>
      </div>
    </div></div>
<!-- footer -->
<%@include file="bottom.jsp"%>
	<script type="text/javascript">
        //  频道tab切换控制
        registerChannelEvent('channel-orange');
        registerChannelEvent('channel-blue');
    </script>
</div></div></div>
	<script type="text/javascript">
		/* $.ajax({
	            type: 'get',
	            url: '${rootPath}/web/constant',
	            success: function (ret) {
	                var data = ret;
	                for (var i = 0; i < data.length; i++) {
	                    var item = data[i];
	                    $(domObj).append("<option value=" + item.restaurantId + ">" + item.merName + "</option>");
	                    $(domObj).selectpicker('refresh');
	                }
	            },
	            dataType: 'json'
	        }); */
    </script>
		
  </body>
</html>
