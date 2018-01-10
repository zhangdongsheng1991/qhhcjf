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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<link rel="Shortcut Icon" href="static/img/web/logo2.ico"> 
 <title>定增理财产品_定增理财产品咨询_定增理财产品预约 - 环成金服</title>
<meta name="keywords" content="定增理财产品,定增理财产品咨询,专业定增理财咨询,定增产品简介,定增理财收益,定增理财产品风险,对冲理财产品,对冲理财产品咨询,专业对冲理财咨询,对冲产品简介,对冲理财收益,对冲理财产品风险">
<meta name="description" content="环成金服--一站式对冲理财服务平台,专业理财顾问全天候24小时提供对冲理财咨询;全面解读对冲产品收益风险,免费咨询,可以依据客户偏好、为客户量身定制个性化对冲理财产品。">

<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css" href="static/css/web/equity.css">

    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
   <%@include file="baidusq.jsp"%>
</head>

<body style=" background-color:#fcfcfc;">
<!-- 合格投资者认定 -->
	<%@include file="authentication.jsp" %>
	<%@include file="head.jsp"%>
	<input type="hidden" id="WEBTYPE" value="7">
    <div id="common_currentlocation" class=" clearb">
    	<!--<div id="trust_index_banner" class="clearb" style="width:100%; height:350px; background:url(static/img/web/img_index_banner_joinus1.jpg) no-repeat top center;"></div>-->
        <div id="ctl00_ContentPlaceHolder1_Location_common_currentlocation_list" class=" w1200 mauto h48 lh48 fs14 c666666">
            <div class=" fl">当前位置：</div>
            <div class=" fl ml10"><a href="web/index">首页</a></div>
            <div class=" fl ml10">&gt;</div><div class=" fl ml10">
            <a href="javascript:{location.reload();}">对冲•定增</a></div>
		</div>
    </div>
    
    <div id="container" style="border: none; background: none; position: relative;">
        
        <div class=" w1200 mauto">
            <div class=" h20">
            </div>
            <div class=" w885 fl">
                <div class=" h36 lh32 clearb">
                    <div class=" h18 fl bls3ba7ef mt7 ml5">
                    </div>
                    <div class=" h32 fl ml10 fs18 c00aeff">
                        对冲•定增</div>
                </div>
                <div class="pe_prolist_wrap" id="equity_fund_list">
                	<ul class="pe_pro_list">
						<!-- 开始循环 -->	
						<c:choose>
							<c:when test="${not empty list}">
									<c:forEach items="${list}" var="var" varStatus="vs">
											<li class="pro_item">
						                        <div class="pro_item_inner clearfix">
						                        <div class="item_col_01">
						                        <div class="figure_wrap">
						                        <a><img class="figure" src="${var.THEISSUERIMGURL }" alt=""></a>
						                        </div>
						                        <div class="heading"><a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=2" target="_blank" class="title c000000" title="${var.PRODUCTREFERRED }">${var.PRODUCTREFERRED }</a><c:if test="${var.PRODUCTSTATUSNAME=='售罄'}">
									            	<span class="c00aeff" style="color:#999; margin-left:6px;">${var.PRODUCTSTATUSNAME }</span>
									            </c:if>
									            <c:if test="${var.PRODUCTSTATUSNAME=='预热中'||var.PRODUCTSTATUSNAME=='预约中'}">
									            	<span class="c00aeff" style=" margin-left:6px;">${var.PRODUCTSTATUSNAME }</span>
									            </c:if></div>
						                        <div class="comment"><span class="c999999">环成金服点评：</span>
						                        	<a title="${var.PRODUCTREVIEWS}">
						                        		<c:if test="${fn:length(var.PRODUCTREVIEWS) > 45 }">
															${fn:substring(var.PRODUCTREVIEWS,0,45)}...
														</c:if>
														<c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 45 }">
															${var.PRODUCTREVIEWS}
														</c:if>
						                        	</a>
						                        </div>
						                        </div>
						                        <div class="item_col_02">
						                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
						                        <tbody>
						                        <tr><td class="c_1">目标规模：</td><td class="c_2"><span class="cff6600">${var.EXPECTISSUANCE }</span> </td></tr>
						                        <tr><td class="c_1">存续期限：</td><td class="c_2"><span class="cff6600"><a class="login-modal">${var.PRODUCTDEADLINE }</a></span></td></tr>
						                        <tr>
						                        	<td class="c_1">投资方向：</td>
						                        	<td class="c_2" title="${var.INVESTMENTDIRECTION }">
						                        		<c:if test="${fn:length(var.INVESTMENTDIRECTION) > 5 }">
															${fn:substring(var.INVESTMENTDIRECTION,0,5)}...
														</c:if>
														<c:if test="${fn:length(var.INVESTMENTDIRECTION)  <= 5 }">
															${var.INVESTMENTDIRECTION}
														</c:if>
						                        	</td>
						                        </tr>
						                        </tbody>
						                        </table>
						                        </div>
						                        <div class="item_col_03">
						                        <div class="heading">起投金额</div>
						                        <div class="returns">${var.INVESTMENTSTARTING }<small class="small"></small></div>
						                        <a  href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=2" target="_blank"><div class=" pevc_reserve_btn bradius5 fr tac cffffff">查看详情</div></a>
						                        </div>
						                        </div>
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
                <div class=" h70 clearb bgfafafa" id="IsShowEquityListPage">
                    <div class=" h25"></div>
                    <div id="divPage" class="page" style=" text-align:center">
                    ${page.pageStr}
                    </div>
                </div>
            </div>
            <div class=" w300 fr">
				<c:choose>
					<c:when test="${not empty newsList}">
						<div class=" h36 lh32 clearb">
		                    <div class=" h18 fl bls3ba7ef mt7 ml5"></div>
		                    <div class=" h32 fl ml10 fs18 c00aeff">股权投资学堂</div>
		                </div>
		                <div class=" w300 h190 bse1e1e1 bgffffff">
		                    <div class=" h10"></div>
		                    <ul class=" pt10 pb10 pl20 pr20">
		                    	<c:forEach items="${newsList}" var="var" varStatus="vs">
			                        <li><a href="web/goNewsInfo?ID=${var.ID}" target="_blank" class=" w220 h30 lh30 fs14 c666666 overhide"><em>· </em>${var.NAME }</a></li>
		                    	</c:forEach>
		                    </ul>
		                    <div class=" h10"></div>
		                </div>
					</c:when>
				</c:choose>
            </div>
        </div>
    </div>
    
    
     <!-- footer -->
<%@include file="bottom.jsp"%>
<script type="text/javascript">
	//分页查询
		function getList(currentPage){
			var data={};
			data.TYPE = 3;//资管 
			data.currentPage = currentPage;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>web/getOffsetList',
		    	data: data,
				dataType:'json',
				success: function(data){
					console.log(JSON.stringify(data));
					 if(data.result == 01){
					 	$("#divPage").html(data.page.pageStr.toString());
					 	//清空列表 进行循环
					 	$(".pe_pro_list").html("");
					 	for(var i=0;i<data.list.length;i++){
					 			var info = data.list[i];
								var INVESTMENTDIRECTION = info.INVESTMENTDIRECTION;
								if(INVESTMENTDIRECTION.length>5){
							   		INVESTMENTDIRECTION = INVESTMENTDIRECTION.substring(0,5)+"..."; 
							   	}
							   	var PRODUCTREVIEWS = "";
							   	if(info.PRODUCTREVIEWS){
							   		PRODUCTREVIEWS = info.PRODUCTREVIEWS;
									if(PRODUCTREVIEWS.length>45){
								   		PRODUCTREVIEWS = PRODUCTREVIEWS.substring(0,45)+"..."; 
								   	}
							   	}
							   	var statusstr="";
							   	if('售罄'==info.PRODUCTSTATUSNAME){
						 			statusstr = "<span class='c00aeff' style='color:#999; margin-left:6px;'>"+info.PRODUCTSTATUSNAME+"</span>";
						 		}else{
						 			statusstr = "<span class='c00aeff' style=' margin-left:6px;'>"+info.PRODUCTSTATUSNAME+"</span>";
						 		}
					 			var str =	"<li class='pro_item'>"+
						                        "<div class='pro_item_inner clearfix' onclick='goInfo(${var.ID})'>"+
						                        "<div class='item_col_01'>"+
						                        "<div class='figure_wrap'>"+
						                        "<a><img class='figure' src='"+info.THEISSUERIMGURL+"' alt=''></a>"+
						                        "</div>"+
						                        "<div class='heading'><a href='web/goProductInfo?ID="+info.ID+"&PRODUCTTYPE=2' target='_blank' class='title c000000' title='"+info.PRODUCTREFERRED+"'>"+info.PRODUCTREFERRED+"</a>"+statusstr+"</div>"+
						                        "<div class='comment'><span class='c999999'>环成金服点评：</span><a>"+PRODUCTREVIEWS+"</a></div>"+
						                        "</div>"+
						                        "<div class='item_col_02'>"+
						                        "<table width='100%' border='0' cellpadding='0' cellspacing='0'>"+
						                        "<tbody>"+
						                        "<tr><td class='c_1'>目标规模：</td><td class='c_2'><span class='cff6600'>"+info.EXPECTISSUANCE+"</span> </td></tr>"+
						                        "<tr><td class='c_1'>存续期限：</td><td class='c_2'><span class='cff6600'><a class='login-modal'>"+info.PRODUCTDEADLINE+"</a></span></td></tr>"+
						                        "<tr>"+
						                        	"<td class='c_1'>投资方向：</td>"+
						                        	"<td class='c_2' title='"+info.INVESTMENTDIRECTION+"'>"+
						                        		INVESTMENTDIRECTION+
						                        	"</td>"+
						                        "</tr>"+
						                        "</tbody>"+
						                        "</table>"+
						                        "</div>"+
						                        "<div class='item_col_03'>"+
						                        "<div class='heading'>起投金额</div>"+
						                        "<div class='returns'>"+info.INVESTMENTSTARTING+"<small class='small'></small></div>"+
						                        "<a href='web/goProductInfo?ID="+info.ID+"&PRODUCTTYPE=2' target='_blank'><div class=' pevc_reserve_btn bradius5 fr tac cffffff'>查看详情</div></a>"+
						                        "</div>"+
						                        "</div>"+
						                    "</li>";
							$(".pe_pro_list").append(str);
					 	}
					 }else{
					 	alert(data.msg);
					 }
				}
			});
		}
		//前往详情页面
		function goInfo(ID){
			
		}
</script>
</body>
</html>
