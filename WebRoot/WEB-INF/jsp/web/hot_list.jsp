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
<title>信托理财产品预约_资管产品预约_信托理财投资 ——环成金服</title>



<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css" href="static/css/web/trust.css">
<link rel="stylesheet" type="text/css" href="static/css/web/gjf_index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/owl.theme.css">
<link rel="stylesheet" type="text/css" href="static/css/web/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="static/css/web/slide.css">
	

    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
   <%@include file="baidusq.jsp"%>
</head>

<body style=" background-color:#fcfcfc;">
  <script type="text/javascript">
        //  频道tab切换控制
        registerChannelEvent('channel-orange');
        registerChannelEvent('channel-blue');
    </script>
	<%@include file="head.jsp"%>
	<input type="hidden" id="WEBTYPE" value="8">
   	<div id="container" style="border: none; background: none;">
   	 <div class="slider" id="slider">
		<div class="slider-inner">
			<div class="item">
				<!-- <img class="img" style="background: url('static/img/web/img_index_banner_joinus1.jpg');"> -->
				<img class="img" src='static/img/web/img_aboutus_banner_00.jpg'>
			</div>
		</div>
	</div>
	<!-- 当前位置 -->
    <div id="common_currentlocation" class=" clearb">
        <div id="ctl00_ContentPlaceHolder1_Location_common_currentlocation_list" class=" w1200 mauto h48 lh48 fs14 c666666">
        	<div class=" fl">当前位置：</div>
            <div class=" fl ml10"><a href="web/index">首页</a></div>
			<div class=" fl ml10">&gt;</div><div class=" fl ml10"><a href="javascript:{location.reload();}">热销产品</a></div>
		</div>
    </div>   
     <!-- 产品搜索 -->
        <div id="trust_ProductCenter_Search">
            <div class=" w1200 mauto">
                <div class=" h10"></div>
                <div class="h50 bbs0068ff fs18 lh40">
                	<style>
                		.choose{
                			color:#f49703;
                		}
                	</style>
                    <div id="ctl00_ContentPlaceHolder1_trust_ProductCenter_Search_link" class=" h24" style="cursor:pointer">
                    	<div class=" fwb w120 h24 fl brsdedede tac"><a onclick="conditionsChange('1','1',this)" class=" w120 h24 c3a8eff choose">信托产品</a></div>
						<div class=" fwb w120 h24 fl brsdedede tac"><a onclick="conditionsChange('2','1',this)" class=" w120 h24">资管产品</a></div>
						<div class=" fwb w170 h24 fl tac brsdedede"><a onclick="conditionsChange('3','1',this)" class=" w120 h24">契约型产品</a></div>
                        <div class=" fwb w170 h24 fl tac brsdedede"><a onclick="conditionsChange('3','2',this)" class=" w120 h24">对冲•定增</a></div>
                        <div class=" fwb w170 h24 fl tac brsdedede"><a onclick="conditionsChange('1','2',this)" class=" w120 h24">股权投资</a></div>
                        <div class=" fwb w170 h24 fl tac"><a onclick="conditionsChange('2','2',this)" class=" w120 h24">政府债产品</a></div>
					</div>
					<script>
						$(function(){
							$("#ctl00_ContentPlaceHolder1_trust_ProductCenter_Search_link").children().click(function(){
								$(this).children().addClass("choose");
								$(this).siblings().children().removeClass("choose");
							});
						})
					</script>
                </div>
               
 <div class=" h20 clearb bgfafafa"></div>
 
 <div class="w1200 trust_ProductCenter_Search_list fs14" id="trsust_ProductCenter_Search_Condition_trustlist"><table cellpadding="0" cellspacing="0" class="w1200">
<!--列表-->
<tbody>
<tr class="list_bottom w1200 bgf6f6f6">
	<td class=" w20"></td>
	<td class=" w110 list_tal30">发行机构</td>
	<td class=" w220 brsdedede">产品简称</td>
	<td class=" w150">收益基准</td>
	<td class=" w100">起始资金</td>
	<td class=" w130 brsdedede">产品期限</td>
	<td class=" w100">付息方式</td>
	<td class=" w100">信托类型</td>
	<td class=" w100 brsdedede">产品状态</td>
	<td class=" w140 mauto">咨询</td>
</tr>
 			<!-- 开始循环 -->	
			<c:choose>
				<c:when test="${not empty list}">
						<c:forEach items="${list}" var="var" varStatus="vs">
							<tr class="list_info bbdebebeb c999999">
								<td></td>
								<td class=" h32 mt8"><a href="javascript:{goInfo('${var.ID}');}" class=" c666666"><div class=" fl w32 h32"><img src="${var.THEISSUERIMGURL }" width="32" height="32"></div><div class=" fl h32 lh32 ml5">
									<c:if test="${fn:length(var.THEISSUERNAME) > 5 }">
										${fn:substring(var.THEISSUERNAME,0,5)}...
									</c:if>
									<c:if test="${fn:length(var.THEISSUERNAME)  <= 5 }">
										${var.THEISSUERNAME}
									</c:if>
								</div></a></td>
								<td class=" brsdedede"><a href="javascript:{goInfo('${var.ID}');}" class=" c3a8eff fwb fs16">${var.PRODUCTREFERRED }</a></td>
								<td class="cff6c00 fs20">${var.RETURNSBENCHMARKMAX }</td>
								<td>${var.INVESTMENTSTARTING }</td>
								<td class=" brsdedede">${var.PRODUCTDEADLINE }</td>
								<td>${var.TINTERESTDISTRIBUTIONSTATENAME }</td>
								<td>${var.TRUSTTYPENAME }</td>
								
								 <c:if test="${var.PRODUCTSTATUSNAME=='售罄'}">
					            	<td style="color:#999" class=" brsdedede cff6c00">${var.PRODUCTSTATUSNAME }</td>
					            </c:if>
								 <c:if test="${var.PRODUCTSTATUSNAME=='预热中'||var.PRODUCTSTATUSNAME=='预约中'}">
					            	<td class=" brsdedede cff6c00">${var.PRODUCTSTATUSNAME }</td>
					            </c:if>
								<td><a><div onclick="goInfo('${var.ID}')" class="fl list_btn w120 h24 lh34 cffffff tac bradius5 bg00aeff cpointer" style=" margin-left:11px;">详情</div></a></td>
							</tr>
						</c:forEach>
				</c:when>
						<c:otherwise>
								<tr class="main_info">
									<td colspan="100" class="center" >没有相关数据</td>
								</tr>
						</c:otherwise>
			</c:choose>
</tbody></table>

</div>
                <div class=" h70 clearb bgfafafa" id="IsShowPage">
                    <div class=" h25"></div>
                    <div class="page" id="divPage" style=" text-align:center">
                    ${page.pageStr}
                    </div>
                </div>
</div></div></div>
<div class=" h50 clearb">
                </div>
 <div class=" h410" style=" border-bottom:1px dashed #7ecef4;">
                    <div class=" w990 mauto">
                        <img src="static/img/web/img_FixedFloating_title_01.jpg">
                    </div>
                    <div class=" h50 clearb">
                    </div>
                    <div class=" w990 mauto">
                        <img src="static/img/web/img_FixedFloating_content_01.jpg">
                    </div>
                    <div class=" h65 clearb">
                    </div>
                </div>


<!-- footer -->
<%@include file="bottom.jsp"%>
<input type="hidden" id="PRODUCTTYPE" value="1">
<input type="hidden" id="TYPE" value="1">
<script type="text/javascript">
    	//筛选
    	function conditionsChange(TYPE,PRODUCTTYPE,e){
    		$("#TYPE").val(TYPE);
    		$("#PRODUCTTYPE").val(PRODUCTTYPE);
    		//切换亮点
    		var div = $(e).parent().parent();
    		var a = $(div).find("a");
    		a.removeClass();
    		a.addClass("w120 h24");
    		$(e).addClass("c3a8eff");
    		//调用查询
    		getList(1);
    	}
		//分页查询
		function getList(currentPage){  
			var data={};
			data.TYPE = $("#TYPE").val();
			data.PRODUCTTYPE = $("#PRODUCTTYPE").val();
			data.currentPage = currentPage;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>web/getHotList',
		    	data: data,
				dataType:'json',
				success: function(data){
					 if(data.result == 01){
					 	$("#divPage").html(data.page.pageStr.toString());
					 	//清空列表 进行循环
					 	$(".list_info").remove();
					 	for(var i=0;i<data.list.length;i++){
					 		var info = data.list[i];
					 		var THEISSUERNAME = info.THEISSUERNAME;
					 		if(THEISSUERNAME){
					 			if(info.THEISSUERNAME.length > 5){
					 				THEISSUERNAME = THEISSUERNAME.substring(0,5)+"...";
					 			}
					 		}else{
					 			THEISSUERNAME = "";
					 		}
					 		var statusstr="";
					 		if('售罄'==info.PRODUCTSTATUSNAME){
					 			statusstr = "<td style='color:#999' class=' brsdedede cff6c00'>"+info.PRODUCTSTATUSNAME+"</td>";
					 		}else{
					 			statusstr = "<td class=' brsdedede cff6c00'>"+info.PRODUCTSTATUSNAME+"</td>";
					 		}
					 		var str = "<tr class='list_info bbdebebeb c999999'>"+
										 "<td></td>"+
										 "<td class=' h32 mt8'><a href='javascript:{goInfo(\""+info.ID+"\");}' class=' c666666'><div class=' fl w32 h32'><img src='"+info.THEISSUERIMGURL+"' width='32' height='32'></div><div class=' fl h32 lh32 ml5'>"+THEISSUERNAME+"</div></a></td>"+
										 "<td class=' brsdedede'><a href='javascript:{goInfo(\""+info.ID+"\");}' class=' c3a8eff fwb fs16'>"+info.PRODUCTREFERRED+"</a></td>"+
										 "<td class='cff6c00 fs20'>"+info.RETURNSBENCHMARKMAX+"</td>"+
										 "<td>"+info.INVESTMENTSTARTING+"</td>"+
										 "<td class=' brsdedede'>"+info.PRODUCTDEADLINE+"</td>"+
										 "<td>"+info.TINTERESTDISTRIBUTIONSTATENAME+"</td>"+
										 "<td>"+info.TRUSTTYPENAME+"</td>"+
										 statusstr+
										 "<td><a><div onclick='goInfo(\""+info.ID+"\")' class='fl list_btn w120 h24 lh34 cffffff tac bradius5 bg00aeff cpointer' style=' margin-left:11px;'>详情</div></a></td>"+
								 	 "</tr>";
							$("tbody").append(str);
					 	}
					 }else{
					 	alert(data.msg);
					 }
				}
			});
		}
		
		//去详情页
		function goInfo(ID){
			var PRODUCTTYPE = $("#PRODUCTTYPE").val();
			window.open("<%=basePath%>web/goProductInfo?ID="+ID+"&PRODUCTTYPE="+PRODUCTTYPE);
		}
</script>
</body>
</html>
