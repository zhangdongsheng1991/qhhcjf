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
         <link rel="stylesheet" href="../static/css/web/app/test.css">
         <link rel="stylesheet" href="../static/css/web/app/appNews/appNews.css" type="text/css"> 
         
		 <script type="text/javascript" src="../static/js/web/app/jquery-1.7.2.min.js"></script>
      	<script type="text/javascript" src="../static/js/web/app/jQuery.touchSlider.js"></script>
		
      	<!-- 百度移动统计 -->
      	<script>
			var _hmt = _hmt || [];
			(function() {
			  var hm = document.createElement("script");
			  hm.src = "https://hm.baidu.com/hm.js?488c86c7e5cd9e20b6c010df9b6fef3f";
			  var s = document.getElementsByTagName("script")[0]; 
			  s.parentNode.insertBefore(hm, s);
			})();
			</script>
         <script type="text/javascript">
         	function goAppNewsInfo(id){
   				location.href = "/web/goAppNewsInfo?ID="+id;
   			}
	     	function goQuery(src){
	    		window.open(src);
	    	}
        $(document).ready(function () {

            $(".main_visual").hover(function () {
                $("#btn_prev,#btn_next").fadeIn()
            }, function () {
                $("#btn_prev,#btn_next").fadeOut()
            });

            $dragBln = false;

            $(".main_image").touchSlider({
                flexible: true,
                speed: 200,
                btn_prev: $("#btn_prev"),
                btn_next: $("#btn_next"),
                paging: $(".flicking_con a"),
                counter: function (e) {
                    $(".flicking_con a").removeClass("on").eq(e.current - 1).addClass("on");
                }
            });

            $(".main_image").bind("mousedown", function () {
                $dragBln = false;
            });

            $(".main_image").bind("dragstart", function () {
                $dragBln = true;
            });

            $(".main_image a").click(function () {
                if ($dragBln) {
                    return false;
                }
            });

            timer = setInterval(function () {
                $("#btn_next").click();
            }, 5000);

            $(".main_visual").hover(function () {
                clearInterval(timer);
            }, function () {
                timer = setInterval(function () {
                    $("#btn_next").click();
                }, 5000);
            });

            $(".main_image").bind("touchstart", function () {
                clearInterval(timer);
            }).bind("touchend", function () {
                timer = setInterval(function () {
                    $("#btn_next").click();
                }, 5000);
            });

        });
    </script>
    <script type="text/javascript">
        $(function () {
            var w = $(this).width();
            var imgHeight = $(".main_image img").height();
            if (imgHeight != 0) {
                $(".main_visual").css({ height: imgHeight + "px" });
                $(".main_image").css({ height: imgHeight + "px" });
                $(".main_image ul").css({ height: imgHeight + "px" });
                $(".main_image li").css({ height: imgHeight + "px" });
            }
        })
    </script>
  
	</head>

<body style="background-color:#f8f9fb;">
<div>
<!-- 顶部导航开始 -->
<header class="m_index_header">
    <!--<a href="javascript:history.go(-1)">
        <div class="m_index_header_back"></div>
    </a>-->
    <a class="js-slideout-toggle" style=" float:right; margin-right:10px; margin-top:3px"><img src="../static/img/web/app/ann.png" width="25"></a>
    <!-- <a class="js-slideout-toggle" href="/web/gosearch" style=" float:right; margin-right:27px; margin-top:6px"><img src="../static/img/web/app/search.png" width="25"/></a> -->
    <div class="m_index_header_logo"></div>
</header>

 <!-- Banner开始 -->
    <section>
        <div class="main_visual" style="height:155px;margin-top: 45px;">
	       <div class="flicking_con">
		        <a href="" class="">1</a>
		        <a href="" class="">2</a>
		        <a href="" class="on">3</a>
	        </div>
	        <div class="main_image">
		        <ul style="width: 640px; overflow: visible; ">
			        <li style="float: none; display: block; position: absolute; top: 0px; left: 0px; width: 640px; ">
			        <a href=""><img src="../static/img/web/app/img_main_11.jpg"></a>
                    </li>
			        <li style="float: none; display: block; position: absolute; top: 0px; left: -640px; width: 640px; ">
                    <a href="/web/trust_search"><img src="../static/img/web/app/index_carousel/trust_search/carousel_trust_search.jpg"></a>
					</li> 
                    <li style="float: none; display: block; position: absolute; top: 0px; left: -1280px; width: 640px; ">
			        <a href="/web/goAppProductQuery?product=3"><img src="../static/img/web/app/trust_company/banner.jpg"></a>
                    </li>
		        </ul>
		        <a href="javascript:;" id="btn_prev" style="width: 640px; overflow: visible; display: none;"></a>
		        <a href="javascript:;" id="btn_next" style="width: 640px; overflow: visible; display: none;"></a>
	        </div>
        </div>

    </section>
    
    
    <!-- 导航栏目开始 -->
    <section class="fs16 bgffffff clearb">
        <div class="h10"></div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=1">
                <div><img src="../static/img/web/app/img_mobile_index_nav_01.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 bgffffff" style="font-size:14px;">信托</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=2">
                <div><img src="../static/img/web/app/img_mobile_index_nav_02.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 bgffffff" style="font-size:14px;">资管</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=3">
                <div><img src="../static/img/web/app/img_mobile_index_nav_03.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 bgffffff" style="font-size:14px;">契约型</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/appAboutUs">
                <div><img src="../static/img/web/app/img_mobile_index_nav_04.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 bgffffff" style="font-size:14px;">关于我们</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=1">
                <div><img src="../static/img/web/app/img_mobile_index_nav_05.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 bgffffff" style="font-size:14px;">股权投资</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=3">
                <div><img src="../static/img/web/app/img_mobile_index_nav_06.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 bgffffff" style="font-size:14px;">对冲•定增</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=2">
                <div><img src="../static/img/web/app/img_mobile_index_nav_07.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 bgffffff" style="font-size:14px;">政府债</div>
            </a>
        </div>
        <div class="w_3 fl app_1">
            <a href="/web/appNews">
                <div><img src="../static/img/web/app/img_mobile_index_nav_08.png" width="100%" height="100%"></div>
                <div class=" h24 lh24 tac c333333 bgffffff" style="font-size:14px;">新闻资讯</div>
            </a>
        </div>
        <div class="h10 clearb"></div>
    </section>
    <!-- 导航栏目结束 -->
     <section>
    <div class=" h50" style="background-color:#f8f9fb; text-align:center; line-height:50px; font-size: 18px;font-weight: bold;">- 为您推荐好的产品 -</div>
    </section>
       
    
     <!-- 信托产品开始 -->
    <section class="m_index_xintuo">
        
        <div id="ctl00_ContentPlaceHolder1_index_xintuo_server" class="m_xintuo_intro">
        <c:forEach items="${newProduct}" var="var" varStatus="vs">
        	<c:if test="${vs.index eq '0'}">
        	<a href='/web/goAppProductInfo?ID=${var.ID }&PRODUCTTYPE=${var.PRODUCTTYPE}'>
	        	<div class="m_xintuo_intro_list bbse1e1e1">
	                <div class="m_xintuo_intro_top">
	                    <div class="m_xintuo_intro_title">
	                    	<c:if test="${fn:length(var.PRODUCTREFERRED) > 12 }">
                           		${fn:substring(var.PRODUCTREFERRED,0,12)}...
                            </c:if>
                            <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 12 }">
                            	${var.PRODUCTREFERRED}
                            </c:if>
	                    </div>
	                    <div class="m_xintuo_intro_less">${var.RETURNSBENCHMARKMAX }</div>
	        		</div>
	                <div class="m_xintuo_intro_bottom">
	                    <div class="m_xintuo_intro_bottom_left">
	                        <div class="m_xintuo_intro_bottom_floor">
	                        	<div class="m_xintuo_intro_bottom_half"><span class=" c999999">期限：</span><span class=" c666666">${var.PRODUCTDEADLINE }</span></div>
		                        <div class="m_xintuo_intro_bottom_half"><span class=" c999999">类型：</span><span class=" c666666">${var.TRUSTTYPENAME }</span></div>
	                        </div>
	                        <div class="m_xintuo_intro_bottom_floor">
	                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">付息：</span><span class=" c666666">${var.TINTERESTDISTRIBUTIONSTATENAME }</span></div>
	                            <div class="m_xintuo_intro_bottom_half"><span class=" c9">规模：</span><span class=" c6">${var.EXPECTISSUANCE }</span></div>
	                        </div>
	                        <div class="h6 clearb">
	                        </div>
	                    </div>
	                    <div class="m_xintuo_intro_bottom_right">
	                        <img src="/${var.THEISSUERIMGURL }" width="50">
	                       
	                    </div>
					</div>
	            	<div class=" h6 clearb"></div>
	            </div>
        	</a>
        	</c:if>
        	 <c:if test="${vs.index != 0}">
        	 	 <div class=" h15" style="background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; "></div>
        	 	 <a href='/web/goAppProductInfo?ID=${var.ID }&PRODUCTTYPE=${var.PRODUCTTYPE}'>
		        	<div class="m_xintuo_intro_list bbse1e1e1">
		                <div class="m_xintuo_intro_top">
		                    <div class="m_xintuo_intro_title">
		                    	<c:if test="${fn:length(var.PRODUCTREFERRED) > 12 }">
	                           		${fn:substring(var.PRODUCTREFERRED,0,12)}...
	                            </c:if>
	                            <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 12 }">
	                            	${var.PRODUCTREFERRED}
	                            </c:if>
		                    </div>
		                    <div class="m_xintuo_intro_less">${var.RETURNSBENCHMARKMAX }</div>
	        			</div>
		                <div class="m_xintuo_intro_bottom">
		                    <div class="m_xintuo_intro_bottom_left">
		                        <div class="m_xintuo_intro_bottom_floor">
		                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">期限：</span><span class=" c666666">${var.PRODUCTDEADLINE }</span></div>
		                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">类型：</span><span class=" c666666">${var.TRUSTTYPENAME }</span></div>
		                        </div>
		                        <div class="m_xintuo_intro_bottom_floor">
		                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">付息：</span><span class=" c666666">${var.TINTERESTDISTRIBUTIONSTATENAME }</span></div>
		                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">规模：</span><span class=" c666666">${var.EXPECTISSUANCE }</span></div>
		                        </div>
		                        <div class="h6 clearb">
		                        </div>
		                    </div>
		                    <div class="m_xintuo_intro_bottom_right">
		                        <img src="/${var.THEISSUERIMGURL }" width="50">
		                        
		                    </div>
						</div>
		            	<div class=" h6 clearb"></div>
		            </div>
        		</a>
        	 </c:if>
        </c:forEach>
</div>
    </section>

    
    <!-- 信托产品结束 -->
    <section>
    <div class=" h50" style="background-color:#f8f9fb; text-align:center; line-height:50px;  font-size: 18px;font-weight: bold;">- 新闻资讯 -</div>
    </section>
    
    <!--新闻资讯开始-->
    <c:forEach var="news" items="${newslist}" begin="0" end="4">
    	<dl onclick="goAppNewsInfo('${news.ID}')" class="new_con">
	     	<div class="box_img">
				<img src="../${news.IMG}">
			</div>	
	     	<dd>${news.NAME}</dd>
	        <dt>浏览量：${news.PVIEWS}</dt>
	</dl>
    </c:forEach>
    <!--新闻资讯结束-->
    
    
   <section>
   <div class=" h15" style="background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; "></div>
    </section>  
  
    <!-- 服务开始 -->
   
    <!-- 服务结束 -->
   <!-- <section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice_01.png" width="100%" style="border-bottom:1px solid #f1f1f2"></div>
    </section>-->
    
    <div class="pt5"> 
         <img src="../static/img/web/app/index_carousel/trust_search/pic7.png"/>
    </div>    
    
        <section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice.png" width="100%"></div>
    </section>
  <!-- 备案信息开始 -->

<div class=" h50 clearb"></div>
<!-- 备案信息结束-->   
<input type="hidden" id="WEBTYPE" value="${pd.WEBTYPE }">
<%@include file="bottom.jsp"%>
</body>
</html>
