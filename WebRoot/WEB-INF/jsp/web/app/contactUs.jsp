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
		<title>环成金服-关于我们</title>
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
      	</head>

<body style="background-color:#f8f9fb;">
<div>
<!-- 顶部导航开始 -->
<header class="m_index_header2">
    <a href="javascript:history.go(-1)">
        <div class="m_index_header_back"></div>
    </a>
     <a style=" float:right; margin-right:10px; margin-top:3px"><img class="js-slideout-toggle" src="../static/img/web/app/ann.png" width="25"></a>
    <div class="m_index_header_logo">联系我们</div>
    
    
</header>
     <section style=" padding-top:2.6rem;">
    <div style="background-color:#f8f9fb;">
    	<img src="../static/img/web/app/biaotou.jpg">
    </div>
    <div style="">
    	<img src="../static/img/web/app/neirong.jpg" style=" border-bottom:1px solid #f1f1f2; border-top:#f1f1f2 solid 1px;">
    </div>
    </section>
	
    <section>
   <div class=" h15" style="background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; "></div>
    </section>  
  
    <!-- 服务开始 -->
   
    <!-- 服务结束 -->
    <!--<section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice_01.png" width="100%" style="border-bottom:1px solid #f1f1f2"></div>
    </section>-->
        <section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice.png" width="100%"></div>
    </section>
  <!-- 备案信息开始 -->

<div class=" h50 clearb"></div>
<input type="hidden" id="WEBTYPE" value="${pd.WEBTYPE }">
<%@include file="bottom.jsp"%>
</div>
</body>
</html>
