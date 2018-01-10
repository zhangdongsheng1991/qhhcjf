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
<title>${question.QUESTION }_理财问答_环成金服</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<meta name="keywords" content="什么是信托_对冲是什么_信托怎么买_环成金服" />
<meta name="description" content="环成金服为客户提供包括但不限于信托,资管,股权投资等理财产品的咨询服务,是国内一家专为高净值人群提供财富管理服务的综合性平台_专注于财富管理领域" />
<link rel="Shortcut Icon" href="static/img/web/logo2.ico"> 


<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css" href="static/css/web/questions_answers/Untitled-2.css">

    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
   <%@include file="../baidusq.jsp"%>
</head>

<body>
<%@include file="../head.jsp"%>
        <!-- 内容部分 -->
    <div id="container" style="border: none; background: none;">
<!-- 代码 开始 -->                                                     
        <!-- 新闻列表、本周热销产品、财经排行版 -->
        <div class=" h10"></div>
        <div class=" w1200 mauto">
            <div class=" fl w910">
                <!-- 新闻列表 -->
                <div id="ctl00_ContentPlaceHolder1_common_currentlocation_list" class=" w910 mauto h36 lh36 fs14 c666666 bbse1e1e1"><div class=" fl">当前位置：</div>
                    <div class=" fl ml5"><a href="web/index" class=" c666666">首页</a></div>
                    <div class=" fl ml5">&gt;</div>
                    <div class=" fl ml5"><a href="web/wenda" class=" c666666">理财问答</a></div>
                    <div class=" fl ml5">&gt;</div>
                    <div class=" fl ml5">
	                    <a href="javascript:{location.reload();}">
	                    	 <c:if test="${fn:length(question.QUESTION) > 24 }">
	                             ${fn:substring(question.QUESTION,0,24)}...
	                         </c:if>
	                         <c:if test="${fn:length(question.QUESTION)  <= 24 }">
	                             ${question.QUESTION}
	                         </c:if>
	                    </a>
                    </div>
                </div>
         <!--  -->
         <div class="big_box">
    
    <!--左边内容-->
    	<div class="box_l">
        	<div class="box_l_title">
            	<span style="color:#FF6600">问：</span>
            	${question.QUESTION }
                <div class="liulan">
						<div>浏览：${question.READING }</div>
				</div>
            </div>
           <!-- <div class="TAG" style="height:20px; margin:10px 0;">  
			 	<b style="color:#666; ">标签：</b>
				<a class="TAG_Label" href="javascrip;:" style="color:#FFF; font-size:14px; background:#f49703; display:inline-block; height:20px; padding:0 5px;">环成金服</a>
			    <a class="TAG_Label" href="javascrip;:" style="color:#FFF; font-size:14px; background:#f49703; display:inline-block; height:20px; padding:0 5px;">信托公司</a>
			    
			</div>	 --> 
            
            
            <div class="box_l_answer" style="font-size: 18px">
            	<span style="color:#FF6600; font-size:16px;">答：</span>
            	${question.ANSWER }

       </div>
            
            <div class="show_pre">
            	上一篇：
            	<c:if test="${question.PREV.QUESTION==null }">
            		无
            	</c:if>
            	<c:if test="${question.PREV.QUESTION!=null }">
            		<a href="/web/goQuestion?ID=${question.PREV.ID }">${question.PREV.QUESTION }</a>
            	</c:if>
            </div>
            <div class="show_next">
            	下一篇：
            	<c:if test="${question.NEXT.QUESTION==null }">
            		无
            	</c:if>
            	<c:if test="${question.NEXT.QUESTION!=null }">
            		<a href="/web/goQuestion?ID=${question.NEXT.ID }">${question.NEXT.QUESTION }</a>
            	</c:if>
            </div>
            
            
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
    <!--  -->
                
</div>
        </div>
    </div>
  <div class="clearb"></div>  
   <div class=" h15 clearb"></div>   
  <div id="container" style="border: none; background: none;">
   <!--  相关产品-start  -->
        <div id="trust_index_introduce" class="bgfafafa">
    <div class=" w1200 mauto">
        <div class=" w1200" id="trust_index_introduce_liserver">
            <!--  产品推荐-start  -->
        <div class=" w1200 mauto">
           <c:choose>
					<c:when test="${not empty list}">
						 <div class="production-recommend position-relative">
				          	<span class="icon-title production-recommend-icon"></span>
				           	<h3 class="production-recommend-title">产品推荐</h3>
				         </div>
				         <div id="ctl00_ContentPlaceHolder1_production_recommend" class=" w1200">
          					<c:forEach items="${list}" var="var" varStatus="vs">
	            				<div class="trust_index_introduce_li fl">
					                <div class=" h15"></div>
					                <div class="trust_index_introduce_li_title c00aeff lh34 h34">
					                <div class=" fl w34 h34 ml10 trust-index-introduce-li-title-icon"><img src="${var.THEISSUERIMGURL }"></div>
					                <div class=" fl ml5 fs16 trust-index-introduce-li-title"><a class="c000000 trust-index-introduce-li-title-a">${var.PRODUCTREFERRED }</a></div>
					                </div>
					                <div class="h10"></div>
					                <div class=" w190 mauto tac lh36 cff6c00 fs26 fwb">${var.RETURNSBENCHMARKMAX }</div>
					                <div class="h16"></div>
					                <div class=" w250 h24 lh24 c333333 fs14">
					                <div class=" fl w120 brd999999 tac">门槛：${var.INVESTMENTSTARTING }</div>
					                <div class=" fl w120  tac">期限：${var.PRODUCTDEADLINE }</div>
					                </div>
					                <div class=" h10"></div>
					                <div class="production-recommend-desc" title="${var.PRODUCTREVIEWS }">
						            	<c:if test="${fn:length(var.PRODUCTREVIEWS) > 35 }">
											${fn:substring(var.PRODUCTREVIEWS,0,35)}...
										</c:if>
										<c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 35 }">
											${var.PRODUCTREVIEWS}
										</c:if>
					                </div>
					                <div class=" h20"></div>
					                <a href='web/goProductInfo?ID=${var.ID }&PRODUCTTYPE=1' target='_blank' ><div class=" w120 h32 lh32 mauto tac cffffff trust_index_introduce_btn">查看详情</div></a>
					                <div class=" h22 clearb"></div>
					            </div>
				            </c:forEach>
				 	 	</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
</div>
        </div>
 
</div></div></div>
    <!-- footer -->
    <%@include file="../bottom.jsp"%>
</body>
</html>
