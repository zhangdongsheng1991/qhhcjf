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
 <title>信托理财产品_信托理财产品咨询_信托理财产品预约 - 环成金服</title>
<meta name="keywords" content="信托理财产品,信托理财产品咨询,专业信托理财咨询,信托产品简介,信托理财收益,信托理财增信措施,信托理财产品风险">
<meta name="description" content="环成金服--一站式信托理财服务平台,专业理财顾问全天候24小时提供信托理财咨询;全面解读信托产品收益风险,免费咨询,可以依据客户偏好、为客户量身定制个性化信托理财产品。">


<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css" href="static/css/web/trust.css">

    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
    <script src="static/js/web/common.js" type="text/javascript"></script>
   <%@include file="baidusq.jsp"%>
</head>

<body style=" background-color:#fcfcfc;">
  	<script type="text/javascript">
        //  频道tab切换控制
        registerChannelEvent('channel-orange');
        registerChannelEvent('channel-blue');
    </script>
	<%@include file="head.jsp"%>
	<%@include file="/WEB-INF/jsp/web/register/loginpopup.jsp"%>
	<!--产品预约弹出框 -->
	<%@include file="/WEB-INF/jsp/web/common/productreservation.jsp"%>
	<input type="hidden" id="WEBTYPE" value="2">
    <div id="container" style="border: none; background: none;">
	<!-- 当前位置 -->
    <div id="common_currentlocation" class=" clearb">
        <div id="ctl00_ContentPlaceHolder1_Location_common_currentlocation_list" class=" w1200 mauto h48 lh48 fs14 c666666">
        	<div class=" fl">当前位置：</div>
            <div class=" fl ml10"><a href="web/index">首页</a></div>
            <div class=" fl ml10">&gt;</div>
			<!-- <div class=" fl ml10"><a href="javascript:{location.reload();}">固定收益</a></div> -->
			<div class=" fl ml10">&gt;</div><div class=" fl ml10"><a href="javascript:{location.reload();}">信托产品</a></div>
		</div>
    </div>   
     <!-- 产品搜索 -->
        <div id="trust_ProductCenter_Search">
            <div class=" w1200 mauto">
                <div class=" h10"></div>
                <div class="h44 bbs0068ff fs18">
                    <div class=" h10"></div>
                    <div id="ctl00_ContentPlaceHolder1_trust_ProductCenter_Search_link" class=" h24">
                    	<div class=" fwb w120 h24 fl brsdedede tac"><a href="javascript:{location.reload();}" style="color: #f49703" class=" w120 h24 c3a8eff">信托产品</a></div>
						<div class=" fwb w120 h24 fl brsdedede tac"><a href="web/mislist" class=" w120 h24">资管产品</a></div>
						<div class=" fwb w170 h24 fl tac"><a href="web/covenant" class=" w120 h24">契约型产品</a></div>
					</div>
                </div>
                <!-- 搜索区域 -->
                <div class=" trust_ProductCenter_Search_Condition bts0068ff " id="trust_ProductCenter_Search_Condition_trust">
                	<div class="h20"></div>
 					<div class="trust_ProductCenter_Search_ul fs14 c666666">
                    <div class=" fl w110 h40 lh40 tar">认购起点：</div>
                    <ul class="bbd999999 h40 lh40">
                    	<input type="hidden" name="INVESTMENTSTARTINGSTATE" value="">
                    	<li class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a onclick="conditionsChange('','',this)">不限</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('a3714f8b7e0d4db5a290a0751f5f1909','100万以内',this)">100万以内</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('0705badaa3384c59869942d6aebe04b3','100万(含)~300万',this)">100万(含)~300万</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('47055d97428f4181be6f4cc153d54b5f','300万(含)以上',this)">300万(含)以上</a></li>
					</ul>
                    </div>

					<div class="trust_ProductCenter_Search_ul fs14 c666666">
					<div class=" fl w110 h40 lh40 tar">产品期限：</div>
					<ul class="bbd999999 h40 lh40">
						<input type="hidden" name="PRODUCTDEADLINESTATE" value="">
						<li class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a onclick="conditionsChange('','',this)">不限</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('9e335c300d4c4d90a209c0f351e177c4','一年以下(含)',this)">一年以下(含)</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('ac750d88887a4f9e8d745813e3a63811','1~2年(含)',this)">1~2年(含)</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('978053346e5d44af9ab3cf05e439795b','2年以上',this)">2年以上</a></li>
					</ul>
					</div>

					<div class="trust_ProductCenter_Search_ul fs14 c666666">
					<div class=" fl w110 h40 lh40 tar">收益基准：</div>
					<ul class="bbd999999 h40 lh40">
						<input type="hidden" name="RETURNSBENCHMARKSTATE" value="">
						<li class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a onclick="conditionsChange('','',this)">不限</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('4299b39479bc4569afa09903ae5d905f','8%以内(含)',this)">8%以内(含)</a></li>
						<!-- <li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('','',this)">6%~8%(含)</a></li> -->
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('1a35eeb3a4634b41b7abe8e4af69b18f','8%~10%(含)',this)">8%~10%(含)</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('e421ab4b7bf94cf79810eb09a971db1e','10%以上',this)">10%以上</a></li>
					</ul>
					</div>

					<div class="trust_ProductCenter_Search_ul fs14 c666666">
					<div class=" fl w110 h40 lh40 tar">信托类型：</div>
					<ul class="bbd999999 h40 lh40">
						<input type="hidden" name="TRUSTTYPE" value="">
						<li class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a onclick="conditionsChange('','',this)">不限</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('ec00c89f4c2a480e92faf45decde1bb8','政信类',this)">政信类</a></li>
						<!-- <li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('b9bc6bcaba174c2b9243ea09fdc57b35','贷款类',this)">贷款类</a></li> -->
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('4bcece2ee7ea45208a211b15d86f7477','房地产类',this)">房地产类</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('aa446bc988c1424496eaa8dc71b4f6c5','工商企业类',this)">工商企业类</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('14dd65a3e1f2403d8cab66dd1019ff58','基础设施类',this)">基础设施类</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('93d7b88f59af472d9fd33ae384a688db','股权类',this)">股权信托</a></li>
						<!-- <li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('e4baf05e457542a0b5dff00b8104def3','资金池',this)">资金池</a></li> -->
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('2b1dce05c1504a17b35159353c328403','PPP',this)">PPP</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('ab61eb93f1104a65b7a9e71c2e7f1fb3','其他',this)">其他</a></li>
					</ul>
					</div>

					<div class="trust_ProductCenter_Search_ul fs14 c666666">
					<div class=" fl w110 h40 lh40 tar">付息方式：</div>
					<ul class="bbd999999 h40 lh40">
						<input type="hidden" name="INTERESTDISTRIBUTIONSTATE" value="">
						<li class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a onclick="conditionsChange('','',this)">不限</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('e2122208f92f47f28e15f082f0d8586a','季度付息',this)">季度付息</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('8d416989822a4e958a517b366223d617','每半年付息',this)">每半年付息</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('3f34cc4884ba47318cdd52839de52964','按年付息',this)">按年付息</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('29f3d4e9d2a24c948898d99b4e46ffd7','到期付息',this)">到期付息</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('219ba699a52b49c3af3a54bda23f5c22','每月付息',this)">每月付息</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('e2122208f92f47f28e15f082f0d8586b','其他',this)">其他</a></li>
					</ul>
					</div>

					<div class="trust_ProductCenter_Search_ul fs14 c666666">
					<div class=" fl w110 h40 lh40 tar">产品状态：</div>
					<ul class="bbd999999 h40 lh40">
						<input type="hidden" name="PRODUCTSTATUS" value="">
						<li class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a onclick="conditionsChange('','',this)">不限</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('2a0ae66cc3704b2388b19800122236c4','预约中',this)">预约中</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('e8982a12c772466b940049b394bfcabb','已售罄',this)">已售罄</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('20170816addyurenging123456789012','预热中',this)">预热中</a></li>
						<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('new','最新',this)">最新</a></li>
					</ul>
					</div>

<div class="h75 fs14 c666666">
	<div class=" h20"></div>
	<div class=" h32 lh32">
		<div class=" fl w120 h32 lh32 tar">关 键 词：</div>
		<div class=" fl w250 h32 bradius16 bsebebeb ml20">
			<div class=" fl h32"><input id="searchText" type="text" class=" h32  ml8  pl20 w190 fs14 c999999" style=" border:none;" value=""></div>
			<div class=" fl"><input type="button" class="w24 h24 lh24 mt3" style=" background:url(static/img/web/sousuo.png) no-repeat; border:none; cursor:pointer;" onclick="getList(1)"></div>
		</div>
	</div>
</div>

<div class=" h48 lh48 c666666">

<div class=" fl w120 tar">已选条件：</div>

<div class="bts999999">

<div class="fl h24 lh24 mt10 trust_ProductCenter_Search_ClearCondition">
	<font id="INVESTMENTSTARTINGSTATE" style="cursor:pointer"><input type="hidden" value=""><a style="color: red;" class="fl"></a></font>
	<font id="PRODUCTDEADLINESTATE" style="cursor:pointer"><input type="hidden" value=""><a style="color: red;" class="fl"></a></font>
	<font id="RETURNSBENCHMARKSTATE" style="cursor:pointer"><input type="hidden" value=""><a style="color: red;" class="fl"></a></font>
	<font id="TRUSTTYPE" style="cursor:pointer"><input type="hidden" value=""><a style="color: red;" class="fl"></a></font>
	<font id="INTERESTDISTRIBUTIONSTATE" style="cursor:pointer"><input type="hidden" value=""><a style="color: red;" class="fl"></a></font>
	<font id="PRODUCTSTATUS" style="cursor:pointer"><input type="hidden" value=""><a style="color: red;" class="fl"></a></font>
<a class="c0068ff cpointer" href="javascript:{location.reload();}" style="cursor:pointer">清空条件</a></div>
<div class="fl h24 lh24 mt8 ml20"><a >共<span id="totalResult" style=" font-size:16px; color:#f60; margin:0px 5px;">${page.totalResult }</span>款产品满足条件</a></div>
</div>
</div>
</div>

 <div class=" h20 clearb bgfafafa"></div>
 
 <div class="w1200 trust_ProductCenter_Search_list fs14" id="trust_ProductCenter_Search_Condition_trustlist">
 <c:choose>
 <c:when test="${not empty list}">
 	<c:forEach items="${list}" var="var" varStatus="vs">
		 <div class="product_box" style="position:relative;">
		 <c:if test="${vs.index<5 }">
		 	<img style="position:absolute; left:0px; top:0px;" src="static/img/web/hot.png">
        </c:if>
        <c:if test="${vs.index>=5 }">
        </c:if>
    	<div class="product_box_Title">
        	<a href="web/goCompany?ID=${var.THEISSUER}" target="_blank";>
                <img src="${var.THEISSUERIMGURL}" width="30" height="30">
            </a>
            <a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=1" target="_blank";>
                <h3>
	                ${var.PRODUCTREFERRED}
				</h3>
            </a>
            <c:if test="${var.PRODUCTSTATUSNAME=='售罄'}">
            	<span style="color:#999" class="zt ys">${var.PRODUCTSTATUSNAME }</span>
            </c:if>
            <c:if test="${var.PRODUCTSTATUSNAME=='预热中'||var.PRODUCTSTATUSNAME=='预约中'}">
            	<span  class="zt ys">${var.PRODUCTSTATUSNAME }</span>
            	<div style="float:right;margin-right: 65px"  class="zt">
            		<c:if test="${fn:contains(collectionProductIds, var.ID)}">
	            		<img style="width:25px" src="static/img/web/common/collection.png"/>
	            		<span id="${var.ID}" class="collection" style="cursor:pointer;margin-left:5px;font-size: 16px;color:#666;">取消收藏</span>
            		</c:if>
            		<c:if test="${!fn:contains(collectionProductIds, var.ID)}">
	            		<img style="width:25px" src="static/img/web/common/nocollection.png"/>
	            		<span id="${var.ID}" class="collection" style="cursor:pointer;margin-left:5px;font-size: 16px;color:#666;">收藏产品</span>
            		</c:if>
            	</div>
            </c:if>
        </div>
        
        <div style="height:160px;">
            <ul class="con_1">
                <li><span class="gray">起投金额:</span>${var.INVESTMENTSTARTING }</li>
                <li><span class="gray">产品期限:</span>${var.PRODUCTDEADLINE }</li>
            </ul>
            
            <ul class="con_2">
                <li><span class="gray">付息方式:</span>${var.TINTERESTDISTRIBUTIONSTATENAME }</li>
                <li><span class="gray">信托类型:</span>${var.TRUSTTYPENAME }</li>
            </ul>
            
            <div class="con_3">
                <span class="gray">收益基准:</span>
                <div class="yellow">${var.RETURNSBENCHMARKMAX }</div>
            </div>
            
            <div class="con_4">
               	${var.RETURNSBENCHMARK }
            </div>
            
            <div class="con_5">
            	<a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=1" target="_blank"><div class="but">查看详情</div></a>
                
			    <textarea style="display:none" class="content">
			    	【发行机构】${var.THEISSUERNAME }
			    	【产品名称】${var.PRODUCTREFERRED }
			    	【收益基准】${var.RETURNSBENCHMARK }
			    	【产品期限】${var.PRODUCTDEADLINE }
			    	【大小配比】严格匹配
			    	【预计发行规模】${var.EXPECTISSUANCE }
			    	【最低认购金额】${var.INVESTMENTSTARTING }
			    	【产品点评】${var.PRODUCTREVIEWS }
			    </textarea>
                <div class="but" onclick="jsCopy(${vs.index},'<%=session.getAttribute("sessionWebUser") %>')">资料下载</div>
                <div class="but ljyy">
                <input type="hidden" name="p_id" value="${var.ID}">
	            <input type="hidden" name="p_type" value="1">	
                	立即预约
                </div>
            </div>
        </div>  
        
        <div class="product_box_bottom">
        	<span class="gray">产品点评:</span>	
            ${var.PRODUCTREVIEWS } 
        </div>
  
    </div>
 
 </c:forEach>
 </c:when>
 <c:otherwise>
		没有相关数据
</c:otherwise>
</c:choose>
 
 
 
<!--列表-->
<!-- 
<table cellpadding="0" cellspacing="0" class="w1200">
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
</tr> -->
	<!-- 开始循环 
		<c:choose>
			<c:when test="${not empty list}">
					<c:forEach items="${list}" var="var" varStatus="vs">
						<tr class="list_info bbdebebeb c999999">
							<c:if test="${vs.index<5 }">
								<td style="position:relative;">
	                            	<img style="position:absolute; left:0px; top:0px;" src="static/img/web/hot.png"  />
	                            </td>
                            </c:if>
                            <c:if test="${vs.index>=5 }">
                            	<td style="position:relative;">
	                            </td>
                            </c:if>
							<td class=" h32 mt8"><a href="web/goCompany?ID=${var.THEISSUER}" target="_blank" class=" c666666"><div class=" fl w32 h32"><img src="${var.THEISSUERIMGURL }" width="32" height="32"></div>
							<div class=" fl h32 lh32 ml5">
								<c:if test="${fn:length(var.THEISSUERNAME) > 5 }">
									${fn:substring(var.THEISSUERNAME,0,5)}...
								</c:if>
								<c:if test="${fn:length(var.THEISSUERNAME)  <= 5 }">
									${var.THEISSUERNAME}
								</c:if>
							</div></a></td>
							<td class=" brsdedede" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=1" target="_blank" class=" c3a8eff fwb fs16">${var.PRODUCTREFERRED }</a></td>
							<td class="cff6c00 fs20">${var.RETURNSBENCHMARKMAX }</td>
							<td>${var.INVESTMENTSTARTING }</td>
							<td class=" brsdedede">${var.PRODUCTDEADLINE }</td>
							<td>${var.TINTERESTDISTRIBUTIONSTATENAME }</td>
							<td>${var.TRUSTTYPENAME }</td>
							<td class=" brsdedede cff6c00">${var.PRODUCTSTATUSNAME }</td>
							<td><a href="web/goProductInfo?ID=${var.ID}&PRODUCTTYPE=1" target="_blank"><div class="fl list_btn w120 h24 lh34 cffffff tac bradius5 bg00aeff cpointer" style=" margin-left:11px;">详情</div></a></td>
						</tr>
					</c:forEach>
			</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
		</c:choose>
</tbody>	</table>-->
</div>
                <div class=" h70 clearb bgfafafa" id="IsShowPage">
                    <div class=" h25"></div>
                    <div class="page" id="divPage" style=" text-align:center">
                    	${page.pageStr}
                    </div>
                </div>
</div></div></div>
<!-- footer -->
<%@include file="bottom.jsp"%>
    <script type="text/javascript">
  //复制的内容
	    function jsCopy(i,user){
	  		if(user=='null'){
	  			$(".register_tankuang,.ui-mask").css("display","block");
	  			return;
	  		}
	        var e=document.getElementsByClassName("content")[i];//对象是content
	        e.style.display ='block';        
	        e.select(); //选择对象 
	        document.execCommand("Copy"); //执行浏览器复制命令
	        e.style.display ='none';
	       	alert("复制成功!"); 
	    } 
	    var collectionProductIds = '${collectionProductIds}';
    	$(function(){
    		//收藏产品
    		$(".collection").hover(function(){
    			$(this).css("color","black");
    		},function(){
    			$(this).css("color","#666");
    		});
    		<%-- $(".collection").click(function(){
    			var phone = '<%=session.getAttribute("sessionCurrentPhone") %>';
    			if(phone=='null'){
    	  			$(".register_tankuang,.ui-mask").css("display","block");
    	  			return;
    	  		}
    			var productId = $(this).attr("id");
    			var imgsrc = $("#"+productId).prev().attr("src");
    			
    			var path = imgsrc.substring(0,imgsrc.lastIndexOf("/"));
    			
    			var imgname = imgsrc.substring(imgsrc.lastIndexOf("/")+1,imgsrc.length-4);
    			
    			if(imgname=="nocollection"){
        			$.ajax({
        				type:'POST',
        				url:'web/collectionProduct',
        				data:{'productId':productId,'collection':'no','phone':phone},
        				dataType:'json',
        				success:function(data){
        					$("#"+productId).prev().attr("src",path+"/collection.png");
        					$("#"+productId).html("取消收藏");
        				}
        			});
    			}else{
    				$.ajax({
        				type:'POST',
        				url:'web/collectionProduct',
        				data:{'productId':productId,'collection':'yes','phone':phone},
        				dataType:'json',
        				success:function(data){
        					$("#"+productId).prev().attr("src",path+"/nocollection.png");
        					$("#"+productId).html("收藏产品");
        				}
        			});				
    			}
    		}); --%>
    		
    		
    		 //为动态生成的节点添加事件
    		 $(document).on('click', '.ljyy', function(e) {
    			 var id = $(this).children("input[name='p_id']").val();
        			var type = $(this).children("input[name='p_type']").val();
        			$('.yy1').show(); 
        			$('#PRODUCTID').val(id);
        			$('#PRODUCTTYPE').val(type);
    		 });
    		 
    		 $(document).on('mouseenter', '.collection', function(e) {
    	    		$(this).css("color","black");
    	     });
    		 $(document).on('mouseleave', '.collection', function(e) {
 	    		$(this).css("color","#666");
 	     	});
    		 
    		$(document).on('click', '.collection', function(e) {
    			var phone = '<%=session.getAttribute("sessionCurrentPhone") %>';
    			if(phone=='null'){
    	  			$(".register_tankuang,.ui-mask").css("display","block");
    	  			return;
    	  		}
    			var productId = $(this).attr("id");
    			var imgsrc = $("#"+productId).prev().attr("src");
    			
    			var path = imgsrc.substring(0,imgsrc.lastIndexOf("/"));
    			
    			var imgname = imgsrc.substring(imgsrc.lastIndexOf("/")+1,imgsrc.length-4);
    			
    			if(imgname=="nocollection"){
    				collectionProductIds+=productId+",";
        			$.ajax({
        				type:'POST',
        				url:'web/collectionProduct',
        				data:{'productId':productId,'collection':'no','phone':phone,'product_type':'xt','TYPE':'1'},
        				dataType:'json',
        				success:function(data){
        					$("#"+productId).prev().attr("src",path+"/collection.png");
        					$("#"+productId).html("取消收藏");
        				}
        			});
    			}else{
    				collectionProductIds = collectionProductIds.replace(productId,'');
    				$.ajax({
        				type:'POST',
        				url:'web/collectionProduct',
        				data:{'productId':productId,'collection':'yes','phone':phone},
        				dataType:'json',
        				success:function(data){
        					$("#"+productId).prev().attr("src",path+"/nocollection.png");
        					$("#"+productId).html("收藏产品");
        				}
        			});				
    			}
 	     	});
    		$("#WEBTYPE").val(2);
           	$(".ljyy").click(
           		function(){
           			var id = $(this).children("input[name='p_id']").val();
           			var type = $(this).children("input[name='p_type']").val();
           			$('.yy1').show(); 
           			$('#PRODUCTID').val(id);
           			$('#PRODUCTTYPE').val(type);
           		}
           	);
    	});
    	function clears(e){
    		var name = $(e).parent().parent().attr("id");
    		var ul = $("input[name='"+name+"']").parent();
    		var li = $(ul).find("li");
    		li.removeClass();
    		li.addClass("h32 lh32 trust_ProductCenter_Search_bg");
    		$(ul).find("li").eq(0).addClass("trust_ProductCenter_Search_bg_over");
    		//<font id="INVESTMENTSTARTINGSTATE"><input type="hidden" value=""><a style="color: red;" class="fl"></a></font>
    		$(e).parent().empty();
    		$("#"+name).find("input").eq(0).val("");
    		getList(1);
    	}
    	//筛选
    	function conditionsChange(id,str,e){
    		//切换亮点
    		var ul = $(e).parent().parent();
    		var li = $(ul).find("li");
    		li.removeClass();
    		li.addClass("h32 lh32 trust_ProductCenter_Search_bg");
    		$(e).parent().addClass("trust_ProductCenter_Search_bg_over");
    		//设置选中值
    		var name = $(ul).find("input").attr("name");
    		$("#"+name).find("input").val(id);
    			$("#"+name).find("a").html(str);
    		if(str){
    			/* $("#"+name).find("a").empt(); */
    			$("#"+name).find("a").html(str+"<span onclick='clears(this)'> X</span>");
    		}
    		//设置初始页为0
    		//调用查询
    		getList(1);
    	}
		//分页查询
		function getList(currentPage){
			var data={};
			data.TYPE = "1";//信托 
			data.currentPage = currentPage;
			var INVESTMENTSTARTINGSTATE = $("#INVESTMENTSTARTINGSTATE").find("input").val();
			if(INVESTMENTSTARTINGSTATE){
				data.INVESTMENTSTARTINGSTATE = INVESTMENTSTARTINGSTATE;
			}
			var PRODUCTDEADLINESTATE = $("#PRODUCTDEADLINESTATE").find("input").val();
			if(PRODUCTDEADLINESTATE){
				data.PRODUCTDEADLINESTATE = PRODUCTDEADLINESTATE;
			}
			var RETURNSBENCHMARKSTATE = $("#RETURNSBENCHMARKSTATE").find("input").val();
			if(RETURNSBENCHMARKSTATE){
				data.RETURNSBENCHMARKSTATE = RETURNSBENCHMARKSTATE;
			}
			var TRUSTTYPE = $("#TRUSTTYPE").find("input").val();
			if(TRUSTTYPE){
				data.TRUSTTYPE = TRUSTTYPE;
			}
			var INTERESTDISTRIBUTIONSTATE = $("#INTERESTDISTRIBUTIONSTATE").find("input").val();
			if(INTERESTDISTRIBUTIONSTATE){
				data.INTERESTDISTRIBUTIONSTATE = INTERESTDISTRIBUTIONSTATE;
			}
			var PRODUCTSTATUS = $("#PRODUCTSTATUS").find("input").val();
			if(PRODUCTSTATUS){
				data.PRODUCTSTATUS = PRODUCTSTATUS;
			}
			var SEARCHINGNAME = $("#searchText").val().trim();
			if(SEARCHINGNAME){
				data.SEARCHINGNAME = SEARCHINGNAME;
			}
			$.ajax({
				type: "POST",
				url: '<%=basePath%>web/getTrustList',
		    	data: data,
				dataType:'json',
				success: function(data){
					 if(data.result == 01){
					 	$("#divPage").html(data.page.pageStr.toString());
					 	//清空列表 进行循环
					 	$(".product_box").remove();
					 	$("#totalResult").html(data.page.totalResult);
					 	var user = '<%=session.getAttribute("sessionWebUser") %>';
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
					 			statusstr = "<span style='color:#999' class='zt ys'>"+info.PRODUCTSTATUSNAME+"</span>";
					 		}else{
					 			statusstr = "<span class='zt ys'>"+info.PRODUCTSTATUSNAME+"</span>"+
					 			"<div style='float:right;margin-right: 65px'  class='zt'>";
			            		if(collectionProductIds.indexOf(info.ID)>=0){
			            			statusstr+="<img style='width:25px' src='static/img/web/common/collection.png'/>"+
				            		"<span id="+info.ID+" class='collection' style='cursor:pointer;margin-left:5px;font-size: 16px;color:#666;'>取消收藏</span>";
			            		}else{
			            			statusstr+="<img style='width:25px' src='static/img/web/common/nocollection.png'/>"+
				            		"<span id="+info.ID+" class='collection' style='cursor:pointer;margin-left:5px;font-size: 16px;color:#666;'>收藏产品</span>";
			            		}
			            		statusstr+="</div>";
					 		}
					 		var str = "<div class='product_box' style='position:relative;'>";
					 		
							if(currentPage==1){
								if(!INVESTMENTSTARTINGSTATE&&!PRODUCTDEADLINESTATE&&
										!RETURNSBENCHMARKSTATE&&!TRUSTTYPE&&!INTERESTDISTRIBUTIONSTATE
										&&!PRODUCTSTATUS&&!SEARCHINGNAME){
									if(i<5){
										str+="<img style='position:absolute; left:0px; top:0px;' src='static/img/web/hot.png'  />";
		                            }
								}
							}
						   str += "<div class='product_box_Title'>"+
				        					"<a href='web/goCompany?ID="+info.THEISSUER+"' target='_blank';>"+
				                				"<img src='"+info.THEISSUERIMGURL+"' width='30' height='30'>"+
				                			"</a>"+ 
				                				"<a href='web/goProductInfo?ID="+info.ID+"&PRODUCTTYPE=1' target='_blank';><h3>"+
				               					info.PRODUCTREFERRED+
												 "</h3></a>"+
												 statusstr+
				     				   "</div>"+
				      				   "<div style='height:160px;'>"+
				           			   		"<ul class='con_1'>"+
				             					"<li><span class='gray'>起投金额:</span>"
				             							+info.INVESTMENTSTARTING+
				             					"</li>"+
				             					"<li><span class='gray'>产品期限:</span>"
				             							+info.PRODUCTDEADLINE+
				             					"</li>"+
				           					"</ul>"+
				          					"<ul class='con_2'>"+
				               					"<li><span class='gray'>付息方式:</span>"
				               							+info.TINTERESTDISTRIBUTIONSTATENAME+
				               					"</li>"+
				             					"<li><span class='gray'>信托类型:</span>"
				             							+info.TRUSTTYPENAME+
				             					"</li>"+
				          					"</ul>"+
				          					"<div class='con_3'>"+
				               					"<span class='gray'>收益基准:</span>"+
				                				"<div class='yellow'>"+info.RETURNSBENCHMARKMAX+
				                				"</div>"+
				           					"</div>"+
				            				"<div class='con_4'>"+
								                info.RETURNSBENCHMARK+
								            "</div>"+
								            "<div class='con_5'>"+
								            	"<a href='web/goProductInfo?ID="+info.ID+"&PRODUCTTYPE=1' target='_blank'><div class='but'>查看详情</div></a>"+
								            	 "<textarea style='display:none' class='content'>"+
										    	"【发行机构】"+info.THEISSUERNAME +"\n"+
										    	"【产品名称】"+info.PRODUCTREFERRED +"\n"+
										    	"【收益基准】"+info.RETURNSBENCHMARK +"\n"+
										    	"【产品期限】"+info.PRODUCTDEADLINE +"\n"+
										    	"【大小配比】严格匹配"+"\n"+
										    	"【预计发行规模】"+info.EXPECTISSUANCE +"\n"+
										    	"【最低认购金额】"+info.INVESTMENTSTARTING+"\n"+
										    	"【产品点评】"+info.PRODUCTREVIEWS+"\n"+
										    	"</textarea>"+		
								            	"<div class='but' onclick=\"jsCopy("+i+",'"+user+"')\">资料下载</div>"+
								                "<div class='but ljyy'>"+
								                "<input type='hidden' name='p_id' value="+info.ID+">"+
									            "<input type='hidden'  name='p_type' value='1'>"+	          		
								                "立即预约</div>"+
								            "</div>"+
				        				"</div>"+
								        "<div class='product_box_bottom'>"+
								        	"<span class='gray'>产品点评:</span>"+	
								        		info.PRODUCTREVIEWS+
								        "</div>"+
				    				"</div>";
							
							
							
							
							
							
							
							
							/* str+="<td class=' h32 mt8'><a href='web/goCompany?ID="+info.THEISSUER+"' target='_blank' class=' c666666'><div class=' fl w32 h32'><img src='"+info.THEISSUERIMGURL+"' width='32' height='32'></div><div class=' fl h32 lh32 ml5'>"+THEISSUERNAME+"</div></a></td>"+
								 "<td class=' brsdedede' style='text-align:left;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='web/goProductInfo?ID="+info.ID+"&PRODUCTTYPE=1' target='_blank' class=' c3a8eff fwb fs16'>"+info.PRODUCTREFERRED+"</a></td>"+
								 "<td class='cff6c00 fs20'>"+info.RETURNSBENCHMARKMAX+"</td>"+
								 "<td>"+info.INVESTMENTSTARTING+"</td>"+
								 "<td class=' brsdedede'>"+info.PRODUCTDEADLINE+"</td>"+
								 "<td>"+info.TINTERESTDISTRIBUTIONSTATENAME+"</td>"+
								 "<td>"+info.TRUSTTYPENAME+"</td>"+
								 "<td class=' brsdedede cff6c00'>"+info.PRODUCTSTATUSNAME+"</td>"+
								 "<td><a href='web/goProductInfo?ID="+info.ID+"&PRODUCTTYPE=1' target='_blank' ><div class='fl list_btn w120 h24 lh34 cffffff tac bradius5 bg00aeff cpointer' style=' margin-left:11px;'>详情</div></a></td>"+
						 	 "</tr>"; */
							$(".trust_ProductCenter_Search_list").append(str); 
					 		
					 		/* var str = "<tr class='list_info bbdebebeb c999999'>";
							if(currentPage==1){
								if(!INVESTMENTSTARTINGSTATE&&!PRODUCTDEADLINESTATE&&
										!RETURNSBENCHMARKSTATE&&!TRUSTTYPE&&!INTERESTDISTRIBUTIONSTATE
										&&!PRODUCTSTATUS&&!SEARCHINGNAME){
									if(i<5){
										str+="<td style='position:relative;'>"+
	                            		"<img style='position:absolute; left:0px; top:0px;' src='static/img/web/hot.png'  />"+
	                            		"</td>";
		                            }else{
		                            	str+="<td style='position:relative;'>"+
		                        		"</td>";
		                            }
								}else{
									str+="<td style='position:relative;'>"+
	                        		"</td>";
								}
							}else{
								str+="<td style='position:relative;'>"+
                        		"</td>";
							}
							str+="<td class=' h32 mt8'><a href='web/goCompany?ID="+info.THEISSUER+"' target='_blank' class=' c666666'><div class=' fl w32 h32'><img src='"+info.THEISSUERIMGURL+"' width='32' height='32'></div><div class=' fl h32 lh32 ml5'>"+THEISSUERNAME+"</div></a></td>"+
								 "<td class=' brsdedede' style='text-align:left;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='web/goProductInfo?ID="+info.ID+"&PRODUCTTYPE=1' target='_blank' class=' c3a8eff fwb fs16'>"+info.PRODUCTREFERRED+"</a></td>"+
								 "<td class='cff6c00 fs20'>"+info.RETURNSBENCHMARKMAX+"</td>"+
								 "<td>"+info.INVESTMENTSTARTING+"</td>"+
								 "<td class=' brsdedede'>"+info.PRODUCTDEADLINE+"</td>"+
								 "<td>"+info.TINTERESTDISTRIBUTIONSTATENAME+"</td>"+
								 "<td>"+info.TRUSTTYPENAME+"</td>"+
								 "<td class=' brsdedede cff6c00'>"+info.PRODUCTSTATUSNAME+"</td>"+
								 "<td><a href='web/goProductInfo?ID="+info.ID+"&PRODUCTTYPE=1' target='_blank' ><div class='fl list_btn w120 h24 lh34 cffffff tac bradius5 bg00aeff cpointer' style=' margin-left:11px;'>详情</div></a></td>"+
						 	 "</tr>";
							$("tbody").append(str); */
					 	}
					 }else{
					 	alert(data.msg);
					 }
				}
			});
		}
    </script>
</body>
</html>
