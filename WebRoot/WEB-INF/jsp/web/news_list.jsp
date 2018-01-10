<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="环成金服_信托资管_阳光私募_股权投资_海外保险" />
<meta name="description" content="环成金服新闻资讯频道是专业的信托资管,私募股权,阳光私募,股权投资,信托产品,信托资讯披露平台,提供7*24小时资讯及产品数据,内容覆盖广泛,是一家综合资讯平台。" />
<title>新闻资讯_环成金服_产品+资讯_综合互联网智能理财平台</title>
<link rel="Shortcut Icon" href="static/img/web/logo2.ico"> 
<script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="static/js/web/news/news.js" type="text/javascript"></script>
<script src="static/js/web/paiming/paiming_js.js" type="text/javascript"></script>
<link href="/static/css/web/news/Untitled-2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
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
	})
</script>
<%@include file="baidusq.jsp"%>
</head>

<body style=" background-color:#fcfcfc;">
	<%@include file="head.jsp"%>
	<div id="common_currentlocation" class=" clearb">
        <div id="ctl00_ContentPlaceHolder1_Location_common_currentlocation_list" class=" w1200 mauto h48 lh48 fs14 c666666">
		<div class=" fl">当前位置：</div>
         <div class=" fl ml5"><a href="web/index" class=" c666666">首页</a></div>
         <div class=" fl ml5">&gt;</div>
         <div class=" fl ml5"><a href="web/newsList" class=" c666666">资讯</a></div>
         <div class=" fl ml5">&gt;</div>
     </div>
     </div>
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



<%@include file="bottom.jsp"%>
</body>
</html>
