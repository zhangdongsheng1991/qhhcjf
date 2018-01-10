<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<link rel="Shortcut Icon" href="static/img/web/logo2.ico">
<title>理财问答 ——环成金服</title>
<meta name="keywords" content='信托是什么,信托理财,信托产品购买流程,信托产品怎么购买,信托产品购买攻略,信托产品有哪些风险,信托产品咨询' />
<meta name="description" content='环成金服信托学堂栏目主要为您介绍信托的入门级知识、信托的购买流程、以及信托购买的风险及相关注意事项。' />
<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css" href="static/css/web/questions_answers/Untitled-2.css">
<script src="static/js/web/jquery-1.7.2.min.js"
	type="text/javascript"></script>
<script src="static/js/web/jquery.flexslider-min.js"
	type="text/javascript"></script>
<script src="static/js/web/owl.carousel.min.js"
	type="text/javascript"></script>
<script src="static/js/web/gjf_index.js" type="text/javascript"></script>
<script src="static/js/web/questions_answers/wenda.js" type="text/javascript"></script>
<%@include file="../baidusq.jsp"%>
</head>
<body style=" background-color:#fcfcfc;">
	<%@include file="../head.jsp"%>
	<!-- 内容部分 -->
	<div id="container" style="border: none; background: none;">
		<!-- 右侧悬浮按钮 -->

		<!-- 代码 开始 -->
		<!-- 新闻列表、本周热销产品、财经排行版 -->
		<div class=" h10"></div>
		<div class=" w1200 mauto">
			<div class=" fl w910">
				<div id="ctl00_ContentPlaceHolder1_common_currentlocation_list"
					class=" w910 mauto h36 lh36 fs14 c666666 bbse1e1e1">
					<div class=" fl">当前位置：</div>
					<div class=" fl ml5">
						<a href="web/index" class=" c666666">首页</a>
					</div>
					<div class=" fl ml5">&gt;</div>
					<div class=" fl ml5">
						<a href="web/wenda" class=" c666666">理财问答</a>
					</div>
				</div>
				<br/><br/><br/>
				<div class="big_box">
    
    <!--左边内容-->
    	<div class="box_l">
        <!--导航-->
	        	<div class="daohang" >
	        		<dl style="border:1px solid #b5b5b5;width:150px;text-align: center">
					  <dd  class="wendadd" style="background-color:#f49703">全部分类</dd>
					  <c:forEach var="categoryList" items="${categoryList}">
					  	<dd class="wendadd">${categoryList}</dd>
					  </c:forEach>
					</dl>
				</div>
	            
	           <!--问答框-->
	           <div class="wendakuang"  style="position:relative;" >
	           			<img id="load" src="static/images/loading.gif" style="width:50px;height:50px;display:none; position:absolute; top:200px; left:300px;" />
	  	           		<div class="wenda_top">
	                    <div id="qb" class="wenda_type" style="background-color:#f49703;color:white">最新</div>
	                    <div id="zr" class="wenda_type">最热</div>
	            	</div>
	            	<div id="wendabody">
		                <c:forEach var="wenda" items="${list}">
			       			<dl class="wendakuai">
			                	<a style="color:#f49703; font-size:18px;cursor: pointer;"  onclick="goQuestion('${wenda.ID}')" value="${wenda.ID}">
									<c:if test="${fn:length(wenda.QUESTION) > 13 }">
	                                    ${fn:substring(wenda.QUESTION,0,13)}...
	                                </c:if>
	                                <c:if test="${fn:length(wenda.QUESTION)  <= 13 }">
	                                    ${wenda.QUESTION}
	                                </c:if>
								
								</a>
			                    <span style="float:right; color:#999; margin-top:10px; margin-right:10px;">浏览量：<b>${wenda.READING}</b></span>
			                	<dd style="color:#666; font-size:14px;" >
									<c:if test="${fn:length(wenda.T_ANSWER) > 40}">
	                                    ${fn:substring(wenda.T_ANSWER,0,40)}...
	                                </c:if>
	                                <c:if test="${fn:length(wenda.T_ANSWER)  <= 40 }">
	                                    ${wenda.T_ANSWER}
	                                </c:if>
								
								</dd>
			                </dl>
		       			</c:forEach>
	       			</div>
	       		</div>
	       		<div style="width:500px; height:32px;  float:right; margin-top:30px;  " >
					<div style="float:right;cursor:pointer;height:30px;width:120px;line-height: 30px;margin:0px 10px;">
						到第<input value="" type="text" id="tzys" style="width:20px;height:20px;border:1px solid #ccc"/>页
						<button id="tz">跳转</button>
					</div>
					<div class="nextpage" style="float:right;cursor:pointer;height:30px;width:50px;line-height: 30px;margin:0px 10px;">
						下一页
					</div>
					<div id="ym" style="float:right;line-height:32px;">
						<span style='cursor:pointer' id="check" class="check">${pageNow}</span>/<span style="width:" id="ys">${pageCount}</span>
					</div>
					<div class="nextpage" style="float:right; cursor:pointer;height:30px;width:50px;line-height: 30px;margin:0px 10px;">
						上一页
					</div>
				</div>
            <!--问答框结束-->
        </div>
        
        <!--右边内容-->
    	<div class="box_r">
            <div class="xtwdr3">
                <div class="xtwdr2_1">相关信息</div>
                    <ul>
                    	<c:forEach var="rigth1" items="${right_list}">
                    		<li>
                    			<a href="web/goQuestion?ID=${rigth1.ID}" target="_blank">
                    				<img style="vertical-align: middle;" src="static/img/web/questions_answers/jiant.png" />
                    				<c:if test="${fn:length(rigth1.QUESTION) > 13 }">
	                                    ${fn:substring(rigth1.QUESTION,0,10)}...
	                                </c:if>
	                                <c:if test="${fn:length(rigth1.QUESTION)  <= 13 }">
	                                    ${rigth1.QUESTION}
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
				<!-- <div class="wenda_body">
					
					<div style="margin-top: 55px;">
						<dl style="border:1px solid #b5b5b5;width:150px;text-align: center">
						  <dd  class="wendadd" style="background-color:#f49703">全部分类</dd>
						  <c:forEach var="categoryList" items="${categoryList}">
						  	<dd class="wendadd">${categoryList}</dd>
						  </c:forEach>
						</dl>
					</div>
					<div style="height:100px; width:10px;"></div>
					<div id="qb" class="wenda_type" style="background-color:#f49703;color:white">最新</div>
					<div id="zr" class="wenda_type">最热</div>
					<div style="width:713px; border:1px solid #b5b5b5;">
						
						<ul  class="ul_question">
							<c:forEach var="wenda" items="${list}">
								<li style="height:82px; ">
									<div  style="border:1px solid white;text-align:center; background-color:#f49703;width:100px; height:80px;">
										<ul >
											<li style="color:white;height:50px;line-height:50px;text-align: center;font-size:25px;">${wenda.READING}</li>
											<li style="color:white;height:30px; line-height:30px;text-align: center">浏&nbsp;览</li>
											
										</ul>
									</div>
									<div style="height:80px;width:610px;border-bottom:1px dashed #b5b5b5;">
											<ul>
												<li onclick="goQuestion('${wenda.ID}')" value="${wenda.ID}" style="font-size:16px;cursor:pointer;color:#000;height:30px;line-height:30px;">
													&nbsp;
													<c:if test="${fn:length(wenda.QUESTION) > 13 }">
                                                         ${fn:substring(wenda.QUESTION,0,13)}...
                                                     </c:if>
                                                     <c:if test="${fn:length(wenda.QUESTION)  <= 13 }">
                                                         ${wenda.QUESTION}
                                                     </c:if>
												</li>
												<li style="font-size:14px; color:#ADADAD;height:30px;line-height:30px;">
												&nbsp;&nbsp;<span style="color:black;font-weight: bold">答&nbsp;:</span>
												    <c:if test="${fn:length(wenda.T_ANSWER) > 40}">
                                                         ${fn:substring(wenda.T_ANSWER,0,40)}...
                                                     </c:if>
                                                     <c:if test="${fn:length(wenda.T_ANSWER)  <= 40 }">
                                                         ${wenda.T_ANSWER}
                                                     </c:if>
												</li>
												 
											</ul>
									</div>
								</li>
							</c:forEach>
						</ul>
						
						
						
						
					</div>
					-->
					<input id="pageNow" value="${pageNow }" type="hidden" />
						
					<input id="pageCount" value="${pageCount}" type="hidden"/>
					
				</div>
			</div>
			
			
		
		</div>
	</div>
	<div class="clearb"></div>
	<div class=" h15 clearb"></div>
	<div id="container" style="border: none; background: none;">
		<!--  相关产品-start  -->
		<div id="trust_index_introduce" class="bgfafafa">
			<div class=" w1200 mauto"></div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="../bottom.jsp"%>
</body>
</html>