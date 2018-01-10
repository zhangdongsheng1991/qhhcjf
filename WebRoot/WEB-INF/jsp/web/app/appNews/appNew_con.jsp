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
	<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>环成金服-${info.NAME }</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=11,IE=10,IE=9,IE=8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <meta http-equiv="Cache-Control" content="no-siteapp">
        
		<link href="static/css/web/app/style.css" rel="stylesheet" type="text/css" />
         <link rel="stylesheet" href="static/css/web/app/index.css" type="text/css">  
         <link href="static/css/web/app/trust.css" rel="stylesheet" type="text/css" />
         <link rel="stylesheet" href="static/css/web/app/test.css">
         <link rel="stylesheet" href="static/css/web/app/appNews/appNews.css" type="text/css"> 
		 <script type="text/javascript" src="static/js/web/app/jquery-1.7.2.min.js"></script>
      	</head>

<body style="background-color:#f8f9fb;">
<div>
<!-- 顶部导航开始 -->
<header class="m_index_header2">
    <a href="javascript:history.go(-1)">
        <div class="m_index_header_back"></div>
    </a>
     <a style=" float:right; margin-right:10px; margin-top:3px"><img class="js-slideout-toggle" src="../static/img/web/app/ann.png" width="25"></a>
    <div class="m_index_header_logo">新闻资讯</div>
    
    
</header>
     <section style=" padding-top:2.6rem;">
     
     <div class="new_box">
     	<h3>${info.NAME }</h3>	
        
        <div class="info">
        	<span class="time">${info.CTDATE }</span>
            <span class="source">${info.SOURCE}</span>
        </div>
     
     	<div class="new_box_con" style="margin:10px 0px;">
        	<p>${info.DETAILED}　</p>
        </div>
     </div>
      <div class=" h8"></div>
        <div class="other">
			相关推荐	
        </div>
        <div class=" h5"></div>
     	<c:forEach var="hot" items="${hotNewsList}" begin="0" end="3">
	     <dl onclick="location.href='web/goAppNewsInfo?ID=${hot.ID}'"  class="new_con">
			<div class="box_img">
				<img src="${hot.IMG }">
			</div>	
	     	<dd>${hot.NAME }</dd>
	        <dt>浏览量：${hot.PVIEWS }</dt>
		</dl>
		</c:forEach>

        <section>
        <div><img src="static/img/web/app/img_mobile_index_myservice.png" width="100%"></div>
    </section>
  <!-- 备案信息开始 -->

<div class=" h50 clearb"></div>
<input type="hidden" id="WEBTYPE" value="${pd.WEBTYPE }">
<%@include file="../bottom.jsp"%>
</div>
</body>
</html>
