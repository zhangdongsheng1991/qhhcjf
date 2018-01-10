<%@page pageEncoding="utf-8" %>
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
<title>环成金服融资网</title>
	<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/financing_css/financing_css.css" >
    <link href="/static/css/web/news/Untitled-2.css" rel="stylesheet" type="text/css" />
     <link rel="Shortcut Icon" href="static/img/web/logo2.ico">
    <script src="static/js/web/financing_js/jquery-1.7.2.min.js"></script>
	<script src="static/js/web/financing_js/financing_js.js"></script>
	<script src="static/js/web/paiming/paiming_js.js" type="text/javascript"></script>
<script>
	var _pageSize = 6;
	var _columns = "";
	var _tablename="td_news";
	var _loaddata = function(data){
		if(data!=null){
			$("#news").children().remove();
			for(var i=0;i<data.length;i++){
				var comment = data[i].COMMENT;
				if(comment.length>80){
					comment = comment.substr(0,80)+"...";
				}
				$("#news").append(
					"<dl  class='new_con'>"+
						"<a target='_blank' style='color: black' href='web/goNewsInfo?ID="+data[i].ID+"'>"+
						"<img src='"+data[i].IMG+"' />"+
						"<dt>"+data[i].NAME+"</dt>"+
						"<span style='color:#CCC; font-size:14px;'>浏览量：<b>"+data[i].PVIEWS+"</b></span>"+
		                "<dd style='color:#666; font-size:14px;'>"+
		                	comment+
		                "</dd>"+
	                "<div class='new_more'>"+
	                	">>详情"+
	                "</div>"+
	                 "</a>"+
	           	 	"</dl>"
				);
			}
		}				
	}
	$(function(){
		$("#_type").children().each(function(i,n){
			if($(n).children().html()=='${typename}'){
				$(n).addClass("moren");
				$(n).siblings().removeClass("moren");
			}	
		});
		$("#_type").children().click(function(){
			$(this).addClass("moren");
			$(this).siblings().removeClass("moren");
			var _val = $(this).children().html();
			window.open("web/sch_finance?typename="+encodeURI(encodeURI(_val,"utf-8"),"utf-8"),"_self");
		})
	})
</script>
</head>


<body>
	<div class="Top">
    	<div class="top">
       	<div class="top_L"> 环成金服-您终身信赖的财富管家 </div>
        <div class="top_R">
<!--        <img src="static/img/web/financing_img/jiantou.png" />
-->         <a href="web/index">投资服务咨询</a></div>
        </div>
        
    </div>
    
<!--头部-->
    <div class="nav_box">
    	<a href="web/index" target="_blank">
    		<div class="logo">环成金服融资网</div>
        </a>
        
        
    	<ul class="nav">
        	<li ><a href="web/financing">首页</a></li>
            <li ><a href="web/capital">找资金</a></li>
            <li class="Choice"><a href="web/sch_finance">金融学院</a></li>
            <li><a onclick="showhz('发布项目')" class="comy_but" href="javascript:;"
				style="padding:0px; margin-left:20px;">我要融资</a></li>
        </ul>
    
    </div>
<!--头部结束-->

	<div class="banner2"></div>

<!--新闻内容-->
	<div class="big_box">     
    <!--左边内容-->
    	<div class="box_l" >
        	<ul id="_type" class="new_nav" >
            	<li class="moren"><a href="javascript:;" >财经要闻</a></li>
                <li><a href="javascript:;" >股权投资</a></li>
                <li><a href="javascript:;" >阳光私募 </a></li>
                <li><a href="javascript:;" >信托资管 </a></li>
                <li><a href="javascript:;" >海外保险 </a></li>
            </ul>
            <div id="news">
            <c:forEach var="news" items="${list}">
		            <dl  class="new_con">
		          	 <a target="_blank" style="color: black" href="web/goNewsInfo?ID=${news.ID}">
		            	<img src="${news.IMG }" />
		            	<dt>
		            		${news.NAME}
		            	</dt>
		                <span style="color:#CCC; font-size:14px;">浏览量：<b>${news.PVIEWS }</b></span>
		                <dd style="color:#666; font-size:14px;">
		                	 <c:if test="${fn:length(news.COMMENT) > 80 }">
	                             ${fn:substring(news.COMMENT,0,80)}...
	                         </c:if>
	                         <c:if test="${fn:length(news.COMMENT)  <= 80 }">
	                             ${news.COMMENT}
	                         </c:if>
		                </dd>
		                <div class="new_more">
		                	>>详情
		                </div>
		                 </a>
		            </dl>
	           
            </c:forEach>
            </div>
            
            <div  id="IsShowPage" style="width:500px; height:32px;  float:right; margin-top:30px;  " >
				<div style="float:right;cursor:pointer;height:30px;width:120px;line-height: 30px;margin:0px 10px;">
					到第<input value="" type="text" id="tzys" style="width:20px;height:20px;border:1px solid #ccc"/>页
					<button id="tz">跳转</button>
				</div>
				<div id="nextpage" style="float:right;cursor:pointer;height:30px;width:50px;line-height: 30px;margin:0px 10px;">
					下一页
				</div>
				<div id="ym" style="float:right;line-height:32px;">
					<input type="text" value="${pageNow}" id="pageNow" style="border:none;width:18px;text-align: right;font-size: 15px"/>/<input type="text" value="${pageCount}" id="pageCount" style="border:none;width:18px;text-align: left;font-size: 15px"/>
				</div>
				<div  id="prevpage" style="float:right; cursor:pointer;height:30px;width:50px;line-height: 30px;margin:0px 10px;">
					上一页
				</div>
				<input type="hidden" id="condition" value="${condition}" />
				<input type="hidden" id="order" value="${order}" />
			</div>
			
        </div>
        
        <!--右边内容-->
    	<div class="box_r">
            <div class="xtwdr3">
                <div class="xtwdr2_1">热门资讯</div>
                    <ul>
                    	<c:forEach var="hotNews" items="${hotNewsList}">
                    		<li>
                    			<a href="web/goNewsInfo?ID=${hotNews.ID}" target="_blank">
                    				<img style="vertical-align: middle;" src="static/img/web/questions_answers/jiant.png">
                    				 <c:if test="${fn:length(hotNews.NAME) > 11}">
			                             ${fn:substring(hotNews.NAME,0,11)}...
			                         </c:if>
			                         <c:if test="${fn:length(hotNews.NAME)  <= 11 }">
			                             ${hotNews.NAME}
			                         </c:if>
                    			</a>
                    		</li>
                    	</c:forEach>
                    </ul>
             </div>
            
            
         </div>
        <!--清除浮动-->
        <div class="clearfloat"></div>
    
    </div>


<!--新闻内容结束-->



<!--底部-->
	<div class="flow">
    	<div class="header" style="color:#FFF;">
            <span class="su"></span>
                服务流程
        </div>
    	
        <div class="function">
    		<img src="static/img/web/financing_img/flow.png" />
    	</div>
    </div>


<%@include file="../bottom.jsp"%>
              <!--弹窗框-->
       <%@include file="common_hz.jsp" %>




</body>
</html>
