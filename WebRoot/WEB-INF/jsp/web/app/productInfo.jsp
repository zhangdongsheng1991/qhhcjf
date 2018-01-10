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
		<title>环成金服-${pd.LOCATIONTWO }</title>
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
      	<style type="text/css">
	      	.xuanzhong{
	      		background-color: #F49703;
	      	}
      	</style>
 <!-- 试验代码 -->

 <!-- 试验代码2 -->
<script type="text/javascript" src="http://ip.139fk.com/ip/4013"></script>

 </head>
<body style="background-color:#f8f9fb;">
<div>
<!-- 顶部导航开始 -->
<header class="m_index_header2">
    <a href="javascript:history.go(-1)">
        <div class="m_index_header_back"></div>
    </a>
    	<script>
    		$(function(){
    			$("#img2").click(function(){
    				$("#search").fadeIn("slow");
    				$("#close_img").fadeIn("slow");
    				$("#img2").css("display","none");
    				$("#img1").css("display","block");
    				$(".m_index_header_logo").css("display","none");
    				$(".m_index_header_back").css("display","none");
    			});
    			$("#close_img").click(function(){
    				$("#search").fadeOut();
    				$("#close_img").fadeOut();
    				$("#img2").css("display","block");
    				$("#img1").css("display","none");
    				$(".m_index_header_logo").fadeIn("slow");
    				$(".m_index_header_back").fadeIn("slow");
    			});
    		})
    	</script>
    	<img id="img2" style="width:25px;float:right;  top:10px; left:15px; margin-right:20px; margin-top:9px"  src="../static/img/web/app/search.png" >
    	<img id="img1" style="width:25px;display:none; float:right;  top:10px; left:15px; margin-right:20px; padding-top:9px"  src="../static/img/web/app/search.png" >
   	 	
   	 	<img id="close_img" style="width:30px;; display:none;padding-left: 10px;padding-top:3px" src="../static/img/web/app/close.png"/><input style="display:none;outline:none; margin-top:3px;margin-right:10px;float:right;text-indent:0.5em; height:27px; width:60%;border-radius:20px;" type="text" id="search" name="search" placeholder="请输入搜索内容"/>
   	 	<input type="hidden" value="" id="search_tem"/>
    <div class="m_index_header_logo">${pd.LOCATIONTWO }</div>
</header>

<section style=" margin-top:2.6rem;">
    <div class="ml_2 mr_2">
        <div class=" h20"></div>
        <div id="ctl00_ContentPlaceHolder1_trust_companydetail_title_server" class="trust_companydetail_title">
        	${var.PRODUCTREFERRED }
        	<span style="color:#f90d0d;">${var.PRODUCTSTATUSNAME }</span>
</div>
        
       
        <div class=" h10"></div>
        <div id="ctl00_ContentPlaceHolder1_trust_companydetail_table_server">
        <table class="trust_companydetail_table fs14 c999999" cellpadding="0" cellspacing="0">
<tbody><tr>
<td class=" bgfafafa bordertop borderleft"><div class=" tar mr5">产品全称：</div></td>
<td class=" bgffffff c666666 bordertop"><div class=" tal ml10 lh24 mt6 mb6">${var.PRODUCTNAME }</div></td>
</tr>
<tr>
<td width="36%" class=" bgfafafa borderleft"><div class=" tar mr5">发行机构：</div></td>
<td width="64%" class=" bgffffff c666666"><div class=" tal ml10">${var.THEISSUERNAME }</div></td>
</tr>
<tr>
<td width="36%" class=" bgfafafa borderleft"><div class=" tar mr5">预计发行规模：</div></td>
<td width="64%" class=" bgffffff c666666"><div class=" tal ml10">${var.EXPECTISSUANCE }</div></td>
</tr>
<tr>
<td width="36%" class=" bgfafafa borderleft"><div class=" tar mr5">最低认购金额：</div></td>
<td width="64%" class=" bgffffff c666666"><div class=" tal ml10">${var.INVESTMENTSTARTING }</div></td>
</tr>
<tr>
<td width="36%" class=" bgfafafa borderleft"><div class=" tar mr5">利息分配：</div></td>
<td width="64%" class=" bgffffff c666666"><div class=" tal ml10">${var.TINTERESTDISTRIBUTIONSTATENAME }</div></td>
</tr>
<tr>
<td width="36%" class=" bgfafafa borderleft"><div class=" tar mr5">产品期限：</div></td>
<td width="64%" class=" bgffffff c666666"><div class=" tal ml10">${var.PRODUCTDEADLINE }</div></td>
</tr>
<tr>
<td width="36%" class=" bgfafafa borderleft"><div class=" tar mr5">信托类型：</div></td>
<td width="64%" class=" bgffffff c666666"><div class=" tal ml10">${var.TRUSTTYPENAME }</div></td>
</tr>
<tr>
<td width="36%" class=" bgfafafa borderleft"><div class=" tar mr5">收益基准：</div></td>
<td width="64%" class=" bgffffff c666666"><div class=" tal ml10 lh24 mt6 mb6">${var.RETURNSBENCHMARK }</div></td>
</tr>
<tr>
<td width="36%" class=" bgfafafa borderleft"><div class=" tar mr5">产品状态：</div></td>
<td width="64%" class=" bgffffff c666666"><div class=" tal ml10 cff6c00"><b>${var.PRODUCTSTATUSNAME }</b></div></td>
</tr>
</tbody></table>
</div>
        <div class=" h10"></div>
<div id="ctl00_ContentPlaceHolder1_trust_companydetail_intro_server" class="trust_companydetail_intro">
	${var.DETAILS }
		<!-- 	        <div class="trust_companydetail_intro_title"><div class="fl"></div><div class="fl">还款来源有哪些？</div></div>
		<div class=" h10"></div>
		<div class="trust_companydetail_intro_info"><p>
			1、第一还款来源：项目后期其他金融机构的再融资；
		</p>
		<p>
			2、第二还款来源：项目的开发建设销售回款。
		</p></div>
		<div class=" h10"></div>
		<div class="trust_companydetail_intro_title"><div class="fl">风控措施如何？</div></div>
		<div class=" h10"></div>
		<div class="trust_companydetail_intro_info"><p>
			<strong style="line-height:1.5;">增信措施</strong> 
		</p>
		1、西安康国贸易以对康鸿的债权1.5亿资金认购劣后级，央企中国中冶某集团公司现金1.5亿认购中间级，为信托优先级本金及收益提供安全垫；’
		<p>
			2、恒泰实业名下7798平米的的房产证办理质押登记；
		</p>
		<p>
			3、合伙企业持有恒泰实业90%股权，康鸿投资所持恒泰实业10%股权质押给合伙企业，并同意随同处置；
		</p>
		<p>
			4、张锐意持有的格局地产的30%股权向有限合伙提供质押担保；
		</p>
		<p>
			5、待土地款补缴完毕、新土地证下来后作为有限合伙向借款人格局地产发放的贷款进行抵押担保；
		</p>
		<p>
			6、深圳康居投资以及实际控制人沈秀凤对康鸿投资回购合伙企业持有的恒泰实业股权的义务,以及借款人格局地产归还贷款提供连带责任担保；
		</p></div>
		<div class=" h10"></div> -->
</div>

    </div>
    <section>
    <div class=" h50" style="background-color:#f8f9fb; text-align:center; line-height:50px;">- 优质产品推荐 -</div>
    </section>
       
    
     <!-- 信托产品开始 -->
    <section class="m_index_xintuo">
        
        <div id="ctl00_ContentPlaceHolder1_index_xintuo_server" class="m_xintuo_intro">
        <c:forEach items="${list}" var="var" varStatus="vs">
        	<c:if test="${vs.index eq '0'}">
        	<a href='/web/goAppProductInfo?ID=${var.ID }&PRODUCTTYPE=${pd.PRODUCTTYPE}'>
	        	<div class="m_xintuo_intro_list bbse1e1e1">
	                <div class="m_xintuo_intro_top">
	                    <div class="m_xintuo_intro_title">
	                    	<c:if test="${fn:length(var.PRODUCTREFERRED) > 12 }">
                           		${fn:substring(var.PRODUCTREFERRED,0,12)}...
                            </c:if>
                            <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 12 }">
                            	${var.PRODUCTREFERRED}
                            </c:if>
	                    </div>
	                    <div class="m_xintuo_intro_less">${var.RETURNSBENCHMARKMAX }</div>
	        		</div>
	                <div class="m_xintuo_intro_bottom">
	                    <div class="m_xintuo_intro_bottom_left">
	                        <div class="m_xintuo_intro_bottom_floor">
	                        	<div class="m_xintuo_intro_bottom_half"><span class=" c999999">期限：</span><span class=" c666666">${var.PRODUCTDEADLINE }</span></div>
		                        <div class="m_xintuo_intro_bottom_half"><span class=" c999999">类型：</span><span class=" c666666">${var.TRUSTTYPENAME }</span></div>
	                        </div>
	                        <div class="m_xintuo_intro_bottom_floor">
	                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">付息：</span><span class=" c666666">${var.TINTERESTDISTRIBUTIONSTATENAME }</span></div>
	                            <div class="m_xintuo_intro_bottom_half"><span class=" c9">规模：</span><span class=" c6">${var.EXPECTISSUANCE }</span></div>
	                        </div>
	                        <div class="h6 clearb">
	                        </div>
	                    </div>
	                    <div class="m_xintuo_intro_bottom_right">
	                        <img src="/${var.THEISSUERIMGURL }" width="62">
	                       
	                    </div>
					</div>
	            	<div class=" h6 clearb"></div>
	            </div>
        	</a>
        	</c:if>
        	 <c:if test="${vs.index != 0}">
        	 	 <div class=" h15" style="background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; "></div>
        	 	 <a href='/web/goAppProductInfo?ID=${var.ID }&PRODUCTTYPE=${pd.PRODUCTTYPE}'>
		        	<div class="m_xintuo_intro_list bbse1e1e1">
		                <div class="m_xintuo_intro_top">
		                    <div class="m_xintuo_intro_title">
		                    	<c:if test="${fn:length(var.PRODUCTREFERRED) > 12 }">
	                           		${fn:substring(var.PRODUCTREFERRED,0,12)}...
	                            </c:if>
	                            <c:if test="${fn:length(var.PRODUCTREFERRED)  <= 12 }">
	                            	${var.PRODUCTREFERRED}
	                            </c:if>
		                    </div>
		                    <div class="m_xintuo_intro_less">${var.RETURNSBENCHMARKMAX }</div>
	        			</div>
		                <div class="m_xintuo_intro_bottom">
		                    <div class="m_xintuo_intro_bottom_left">
		                        <div class="m_xintuo_intro_bottom_floor">
		                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">期限：</span><span class=" c666666">${var.PRODUCTDEADLINE }</span></div>
		                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">类型：</span><span class=" c666666">${var.TRUSTTYPENAME }</span></div>
		                        </div>
		                        <div class="m_xintuo_intro_bottom_floor">
		                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">付息：</span><span class=" c666666">${var.TINTERESTDISTRIBUTIONSTATENAME }</span></div>
		                            <div class="m_xintuo_intro_bottom_half"><span class=" c999999">规模：</span><span class=" c666666">${var.EXPECTISSUANCE }</span></div>
		                        </div>
		                        <div class="h6 clearb">
		                        </div>
		                    </div>
		                    <div class="m_xintuo_intro_bottom_right">
		                        <img src="/${var.THEISSUERIMGURL }" width="62">
		                        
		                    </div>
						</div>
		            	<div class=" h6 clearb"></div>
		            </div>
        		</a>
        	 </c:if>
        </c:forEach>
</div>
    </section>

    
    <!-- 信托产品结束 -->
    
    
   <section>
   <div class=" h15" style="background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; "></div>
    </section>  
  
    <!-- 服务开始 -->
   
    <!-- 服务结束 -->
    <!-- <section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice_01.png" width="100%" style="border-bottom:1px solid #f1f1f2"></div>
    </section> -->
        <section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice.png" width="100%"></div>
    </section>
  <!-- 备案信息开始 -->


 


<div class=" h50 clearb"></div>
 <script src="../static/js/web/app/jquery-1.7.2.min.js" type="text/javascript"></script>
    <!-- <script type="text/javascript">
        $("ul#topnav li").hover(function () { //Hover over event on list item
            	console.log("111");
                $(this).find("span").show(); //Show the subnav
            }, function () { //on hover out...
            	console.log("1");
                $(this).find("span").hide(); //Hide the subnav
            });
    </script> -->


         
<input type="hidden" id="WEBTYPE" value="${pd.WEBTYPE }">
<input type="hidden" id="PRODUCTTYPE" value="${pd.PRODUCTTYPE}">
<input type="hidden" id="TYPE" value="${pd.TYPE}">
<input type="hidden" id="currentPage" value="1">
<script type="text/javascript">
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
    		var SEARCHNAME = $("#search_tem").val();
    		var PRODUCTTYPE = $("#PRODUCTTYPE").val();
    		var data = {};
    		if(SEARCHNAME!=null&&SEARCHNAME!=''){
    			data.SEARCHNAME = SEARCHNAME;
    		}
    		data.PRODUCTTYPE = PRODUCTTYPE;//类型 1固定 2浮动
    		data.TYPE = "1";//信托 
			data.currentPage = currentPage;//页数
			$("#currentPage").val(currentPage);
    		if(PRODUCTTYPE == 1){//如果为固定 则有筛选条件
	    		var INVESTMENTSTARTINGSTATE = $("#INVESTMENTSTARTINGSTATE").val();
				if(INVESTMENTSTARTINGSTATE){
					data.INVESTMENTSTARTINGSTATE = INVESTMENTSTARTINGSTATE;
				}
				var PRODUCTDEADLINESTATE = $("#PRODUCTDEADLINESTATE").val();
				if(PRODUCTDEADLINESTATE){
					data.PRODUCTDEADLINESTATE = PRODUCTDEADLINESTATE;
				}
				var RETURNSBENCHMARKSTATE = $("#RETURNSBENCHMARKSTATE").val();
				if(RETURNSBENCHMARKSTATE){
					data.RETURNSBENCHMARKSTATE = RETURNSBENCHMARKSTATE;
				}
				var TRUSTTYPE = $("#TRUSTTYPE").val();
				if(TRUSTTYPE){
					data.TRUSTTYPE = TRUSTTYPE;
				}
    		}
    		console.log("data="+JSON.stringify(data));
    		$.ajax({
				type: "POST",
				url: '<%=basePath%>web/getAppProductList',
		    	data: data,
				dataType:'json',
				success: function(data){
					/* console.log(JSON.stringify(data)); */
					 if(data.result == 01){
					 	for(var i=0;i<data.list.length;i++){
							var info = data.list[i];
							var PRODUCTREFERRED = info.PRODUCTREFERRED;
							if(PRODUCTREFERRED){
								if(info.PRODUCTREFERRED.length > 12){
									PRODUCTREFERRED = PRODUCTREFERRED.substring(0,12)+"...";
								}
							}else{
								PRODUCTREFERRED = "";
							}
							var head = "<div class=' h15' style='background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; '></div>";
							if(currentPage=='1'){
								if(i=='0'){
									head = "";
								}
							}
							var str = head+"<a href='/web/goAppProductInfo?ID="+info.ID+"&PRODUCTTYPE="+PRODUCTTYPE+"'>"+
								        	"<div class='m_xintuo_intro_list bbse1e1e1'>"+
								                "<div class='m_xintuo_intro_top'>"+
								                    "<div class='m_xintuo_intro_title'>"+PRODUCTREFERRED+
								                    "</div>"+
								                    "<div class='m_xintuo_intro_less'>"+info.RETURNSBENCHMARKMAX+"</div>"+
								        		"</div>"+
								                "<div class='m_xintuo_intro_bottom'>"+
								                    "<div class='m_xintuo_intro_bottom_left'>"+
								                        "<div class='m_xintuo_intro_bottom_floor'>"+
								                           " <div class='m_xintuo_intro_bottom_half'><span class=' c9'>期限：</span><span class='c6'>"+info.PRODUCTDEADLINE+"</span></div>"+
								                            "<div class='m_xintuo_intro_bottom_half'><span class=' c9'>类型：</span><span class=' c6'>"+info.TRUSTTYPENAME+"</span></div>"+
								                        "</div>"+
								                        "<div class='m_xintuo_intro_bottom_floor'>"+														
								                            "<div class='m_xintuo_intro_bottom_half'><span class=' c9'>付息：</span><span class='c6'>"+info.TINTERESTDISTRIBUTIONSTATENAME+"</span></div>"+
								                            "<div class='m_xintuo_intro_bottom_half'><span class=' c9'>规模：</span><span class=' c6'>"+info.EXPECTISSUANCE+"</span></div>"+
								                        "</div>"+
								                        "<div class='h6 clearb'>"+
								                        "</div>"+
								                    "</div>"+
								                    "<div class='m_xintuo_intro_bottom_right'>"+
								                        "<img src='/"+info.THEISSUERIMGURL+"' width='62'>"+
								                    "</div>"+
												"</div>"+
								            	"<div class=' h6 clearb'></div>"+
								            "</div>"+
							        	"</a>";
							$("#ctl00_ContentPlaceHolder1_index_xintuo_server").append(str);
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
    	$(function(){
			$("#img1").click(function(){
				var searchval = $("#search").val();
				$("#search_tem").val(searchval);
				var PRODUCTTYPE = $("#PRODUCTTYPE").val();
				var currentPage = parseInt($("#currentPage").val());
				if($("#search").val().trim==''){
					return;
				}else{
		    		var data = {};
		    		data.SEARCHNAME = searchval;
		    		data.PRODUCTTYPE = PRODUCTTYPE;//类型 1固定 2浮动
		    		data.TYPE = "1";//信托 
					data.currentPage = currentPage;//页数
					$("#currentPage").val(currentPage);
					if(PRODUCTTYPE == 1){//如果为固定 则有筛选条件
			    		var INVESTMENTSTARTINGSTATE = $("#INVESTMENTSTARTINGSTATE").val();
						if(INVESTMENTSTARTINGSTATE){
							data.INVESTMENTSTARTINGSTATE = INVESTMENTSTARTINGSTATE;
						}
						var PRODUCTDEADLINESTATE = $("#PRODUCTDEADLINESTATE").val();
						if(PRODUCTDEADLINESTATE){
							data.PRODUCTDEADLINESTATE = PRODUCTDEADLINESTATE;
						}
						var RETURNSBENCHMARKSTATE = $("#RETURNSBENCHMARKSTATE").val();
						if(RETURNSBENCHMARKSTATE){
							data.RETURNSBENCHMARKSTATE = RETURNSBENCHMARKSTATE;
						}
						var TRUSTTYPE = $("#TRUSTTYPE").val();
						if(TRUSTTYPE){
							data.TRUSTTYPE = TRUSTTYPE;
						}
		    		}
					console.log("data="+JSON.stringify(data));
					$.ajax({
						type: "POST",
						url: '<%=basePath%>web/getAppProductList',
				    	data: data,
						dataType:'json',
						success: function(data){ 
							/* console.log(JSON.stringify(data)); */
							 if(data.result == 01){
								$("#ctl00_ContentPlaceHolder1_index_xintuo_server").empty();
							 	for(var i=0;i<data.list.length;i++){
									var info = data.list[i];
									var PRODUCTREFERRED = info.PRODUCTREFERRED;
									if(PRODUCTREFERRED){
										if(info.PRODUCTREFERRED.length > 12){
											PRODUCTREFERRED = PRODUCTREFERRED.substring(0,12)+"...";
										}
									}else{
										PRODUCTREFERRED = "";
									}
									var head = "<div class=' h15' style='background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; '></div>";
									if(currentPage=='1'){
										if(i=='0'){
											head = "";
										}
									}
									var str = head+"<a href='/web/goAppProductInfo?ID="+info.ID+"&PRODUCTTYPE="+PRODUCTTYPE+"'>"+
										        	"<div class='m_xintuo_intro_list bbse1e1e1'>"+
										                "<div class='m_xintuo_intro_top'>"+
										                    "<div class='m_xintuo_intro_title'>"+PRODUCTREFERRED+
										                    "</div>"+
										                    "<div class='m_xintuo_intro_less'>"+info.RETURNSBENCHMARKMAX+"</div>"+
										        		"</div>"+
										                "<div class='m_xintuo_intro_bottom'>"+
										                    "<div class='m_xintuo_intro_bottom_left'>"+
										                        "<div class='m_xintuo_intro_bottom_floor'>"+
										                           " <div class='m_xintuo_intro_bottom_half'><span class=' c9'>期限：</span><span class='c6'>"+info.PRODUCTDEADLINE+"</span></div>"+
										                            "<div class='m_xintuo_intro_bottom_half'><span class=' c9'>类型：</span><span class=' c6'>"+info.TRUSTTYPENAME+"</span></div>"+
										                        "</div>"+
										                        "<div class='m_xintuo_intro_bottom_floor'>"+														
										                            "<div class='m_xintuo_intro_bottom_half'><span class=' c9'>付息：</span><span class='c6'>"+info.TINTERESTDISTRIBUTIONSTATENAME+"</span></div>"+
										                            "<div class='m_xintuo_intro_bottom_half'><span class=' c9'>规模：</span><span class=' c6'>"+info.EXPECTISSUANCE+"</span></div>"+
										                        "</div>"+
										                        "<div class='h6 clearb'>"+
										                        "</div>"+
										                    "</div>"+
										                    "<div class='m_xintuo_intro_bottom_right'>"+
										                        "<img src='/"+info.THEISSUERIMGURL+"' width='62'>"+
										                    "</div>"+
														"</div>"+
										            	"<div class=' h6 clearb'></div>"+
										            "</div>"+
									        	"</a>";
									$("#ctl00_ContentPlaceHolder1_index_xintuo_server").append(str);
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
			});	
		})
</script>
<!-- 备案信息结束-->   
<%@include file="bottom.jsp" %>


</body>
</html>
