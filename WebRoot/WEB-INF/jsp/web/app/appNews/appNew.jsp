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
		<title>环成金服-新闻资讯</title>
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
      	<script type="text/javascript" src="static/js/web/app/jQuery.touchSlider.js"></script>
      	<script>
      		function goAppNewsInfo(id){
      			location.href = "web/goAppNewsInfo?ID="+id;
      		}
      		$(function(){
      			$("#TYPE"+${pd.TYPE}).addClass("xuanzhong");
				$("#ul_subject").children().click(function(){
					if("股权投资"==$(this).html()){
						$("#TYPE").val(1);
					}else if("阳光私募"==$(this).html().trim()){
						$("#TYPE").val(2);
					}else if("信托资管"==$(this).html().trim()){
						$("#TYPE").val(3);
					}else if("海外保险"==$(this).html().trim()){
						$("#TYPE").val(4);
					}else if("财经要闻"==$(this).html().trim()){
						$("#TYPE").val(5);
					}
					location.href = "web/appNews?TYPE="+$("#TYPE").val();
				});      
				
			});
      		
    	function spanShow(e){
        	$("#m_trustproduct_search").parent().find("span").hide();
        	$(e).find("span").show(); //Show the subnav
        }
   		//筛选
       	function conditionsChange(id,str,e){
       		 event.stopPropagation();
       		//切换亮点
       		var span = $(e).parent().parent();
       		$(span).hide();
       		var div = $(span).find("div");
       		div.removeClass();
       		div.addClass("navlist");
       		$(e).parent().addClass("xuanzhong");
       		$(span).find("input").val(id);
       		/* console.log("input="+$(span).find("input").val()); */
       		$("#ctl00_ContentPlaceHolder1_index_xintuo_server").html("");
       		//设置初始页为0
       		//调用查询
       		getList(1);
       	}
       	//获取更多
       	function nextPage(){
       		var currentPage = parseInt($("#currentPage").val()) +1;
       		console.log("currentPage="+currentPage);
       		getList(currentPage);
       	}
       	
       	function getList(currentPage){
       		var data = {};
       		data.TYPE=$("#TYPE").val();
       		data.currentPage = currentPage;//页数
   			$("#currentPage").val(currentPage);
       		console.log("data="+JSON.stringify(data));
       		$.ajax({
   				type: "POST",
   				url: '<%=basePath%>web/getAppNewsList',
   		    	data: data,
   				dataType:'json',
   				success: function(data){
   					/* console.log(JSON.stringify(data)); */
   					 if(data.result == 01){
   					 	for(var i=0;i<data.list.length;i++){
   							var info = data.list[i];
   							
   							var head = "";
   							if(currentPage=='1'){
   								if(i=='0'){
   									head = "";
   								}
   							}
   							var str = head+"<dl  onclick=\"goAppNewsInfo('"+info.ID+"')\"  class='new_con'>"+
   					     	"<div class='box_img'><img src='"+info.IMG+"'></div>"+
   					     	"<dd>"+info.NAME+"</dd>"+
   					        "<dt>浏览量："+info.PVIEWS+"</dt> "+
   						"</dl>";
   							$("#d1").append(str);
   						}
   						var pageStr = "";
   						console.log(data.page.totalPage>1);
   						console.log(data.page.totalPage>currentPage);
   						if(data.page.totalPage>1 && data.page.totalPage>currentPage){
   							pageStr = ""+
   							"<div class='h20'></div>"+
   							"<div onclick='nextPage()' class=' tac' style=' background:#f49703; height:36px; line-height:36px; width:94%; margin-left:3%; color:#fff; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px;'>"+
   								"点击更多"+
   							"</div>"+
   							"<div class='h20'></div>";
   						}else{
   							pageStr = ""+
   							"<div class='h20'></div>"+
   							"<div class=' tac' style=' background:#DCDCDC; height:36px; line-height:36px; width:94%; margin-left:3%; color:#fff; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px;'>"+
   								"没有更多了"+
   							"</div>"+
   							"<div class='h20'></div>";
   						}
   						console.log("pageStr="+pageStr);
   						/* $("#pageStr").html(""); */
   						$("#pageStr").html(pageStr);
   					 }else{
   					 	alert(data.msg);
   					 }
   				}
   			});
       	}
       	
       	function forParam(data){
       		
       	}
      	</script>

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
	<input id="TYPE" name="TYPE" type="hidden" value="${pd.TYPE }">
     <section style=" padding-top:40px;">
     <ul id="ul_subject" class="new_biaoti">
        <li id="TYPE5">财经要闻 </li>
        <li id="TYPE1">股权投资</li>
        <li id="TYPE2">阳光私募</li>
        <li id="TYPE3">信托资管</li>
        <li id="TYPE4">海外保险</li>
    </ul>
    <div id="d1">
     <c:forEach var="news" items="${list }">
	     <dl onclick="goAppNewsInfo('${news.ID}')" class="new_con">
	     	<div class="box_img">
				<img src="${news.IMG }">
			</div>	
	     	<dd>${news.NAME}</dd>
	        <dt>浏览量：${news.PVIEWS }</dt>
		</dl>
	</c:forEach>
	</div>
	<div id="pageStr" style="overflow:hidden; background-color:#fff;border-bottom:#f1f1f2 1px solid; ">
		<div class="h20"></div>
		<c:if test="${page.totalPage eq '1' || page.totalPage eq '0'}">
			<div class=" tac" style=" background:#DCDCDC; height:36px; line-height:36px; width:94%; margin-left:3%; color:#fff; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px;">
				没有更多了
			</div>
		</c:if>
		<c:if test="${page.totalPage != '1' && page.totalPage != '0'}">
			<div onclick="nextPage()" class=" tac" style=" background:#f49703; height:36px; line-height:36px; width:94%; margin-left:3%; color:#fff; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px;">
				点击更多
			</div>
		</c:if>
		<div class="h20"></div>
		
	
	</div>
	<input type="hidden" id="currentPage" value="1">
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
