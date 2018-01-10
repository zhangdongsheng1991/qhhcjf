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
<c:if test="${pd.PRODUCTTYPE eq '1' }">
	<section class="m_index_selectmenu">
		<div id="m_trustproduct_search"><ul id="topnav">
			<li onclick="spanShow(this)">
	            <a class="m_index_selectmenu_line">认购起点</a>
	            <span>
	            	<input type="hidden" id="INVESTMENTSTARTINGSTATE" value="">
	                <div class="navlist xuanzhong"><a onclick="conditionsChange('','',this)">不限</a></div>
	                <div class="navlist"><a onclick="conditionsChange('a3714f8b7e0d4db5a290a0751f5f1909','100万以内',this)">100万以内</a></div>
	                <div class="navlist"><a onclick="conditionsChange('0705badaa3384c59869942d6aebe04b3','100万(含)~300万',this)">100万(含)~300万</a></div>
	                <div class="navlist"><a onclick="conditionsChange('47055d97428f4181be6f4cc153d54b5f','300万(含)以上',this)">300万(含)以上</a></div>
	            </span>
	        </li>
	        <li onclick="spanShow(this)">
	            <a class="m_index_selectmenu_line">投资期限</a>
	            <span>
	            	<input type="hidden" id="PRODUCTDEADLINESTATE" value="">
	                <div class="navlist xuanzhong"><a onclick="conditionsChange('','',this)">不限</a></div>
	                <div class="navlist"><a onclick="conditionsChange('9e335c300d4c4d90a209c0f351e177c4','一年以下(含)',this)">一年以下(含)</a></div>
	                <div class="navlist"><a onclick="conditionsChange('ac750d88887a4f9e8d745813e3a63811','1~2年(含)',this)">1~2年(含)</a></div>
	                <div class="navlist"><a onclick="conditionsChange('978053346e5d44af9ab3cf05e439795b','2年以上',this)">2年以上</a></div>
	            </span>
	        </li>
	        <li onclick="spanShow(this)">
	            <a class="m_index_selectmenu_line">收益基准</a>
	            <span>
	            	<input type="hidden" id="RETURNSBENCHMARKSTATE" value="">
	                <div class="navlist xuanzhong"><a onclick="conditionsChange('','',this)">不限</a></div>
	                <div class="navlist"><a onclick="conditionsChange('4299b39479bc4569afa09903ae5d905f','8%以内(含)',this)">8%以内(含)</a></div>
	                <div class="navlist"><a onclick="conditionsChange('1a35eeb3a4634b41b7abe8e4af69b18f','8%~10%(含)',this)">8%~10%(含)</a></div>
	                <div class="navlist"><a onclick="conditionsChange('e421ab4b7bf94cf79810eb09a971db1e','10%以上',this)">10%以上</a></div>
	            </span>
	           
	         </li>
	         <li onclick="spanShow(this)">
	            <a class="m_index_selectmenu_line">投资类型</a>
	            <span>
	            	<input type="hidden" id="TRUSTTYPE" value="">
	                <div class="navlist xuanzhong"><a onclick="conditionsChange('','',this)">不限</a></div>
	                <div class="navlist"><a onclick="conditionsChange('ec00c89f4c2a480e92faf45decde1bb8','政信类',this)">政信类</a></div>
	              <!--   <div class="navlist"><a onclick="loadPage(1,1,0,0,0,73,1)">贷款类</a></div> -->
	                <div class="navlist"><a onclick="conditionsChange('4bcece2ee7ea45208a211b15d86f7477','房地产类',this)">房地产类</a></div>
	                <div class="navlist"><a onclick="conditionsChange('aa446bc988c1424496eaa8dc71b4f6c5','工商企业类',this)">工商企业类</a></div>
	                <div class="navlist"><a onclick="conditionsChange('14dd65a3e1f2403d8cab66dd1019ff58','基础设施类',this)">基础设施类</a></div>
	                <div class="navlist"><a onclick="conditionsChange('93d7b88f59af472d9fd33ae384a688db','股权类',this)">股权类</a></div>
	               <!--  <div class="navlist"><a onclick="loadPage(1,1,0,0,0,114,1)">资金池</a></div> -->
	                <div class="navlist"><a onclick="conditionsChange('2b1dce05c1504a17b35159353c328403','PPP',this)">PPP</a></div>
	                <div class="navlist"><a onclick="conditionsChange('ab61eb93f1104a65b7a9e71c2e7f1fb3','其他',this)">其他</a></div>
	             <!--    <div class="navlist"><a onclick="loadPage(1,1,0,0,0,126,1)">商业保理</a></div> -->
	            </span>
	         </li>
	      </ul>
	   </div>
	</section>
</c:if>
 <!-- 信托产品开始 -->
    <section class="m_index_xintuo" style=" margin-top:<c:if test="${pd.PRODUCTTYPE eq '1' }">5.5rem;</c:if>
    <c:if test="${pd.PRODUCTTYPE eq '2' }">2.7rem;</c:if> border-top:#f1f1f2 1px solid; ">
        
    <div id="ctl00_ContentPlaceHolder1_index_xintuo_server" class="m_xintuo_intro">
        <c:forEach items="${list}" var="var" varStatus="vs">
        	<c:if test="${pd.PRODUCTTYPE != '0' }">
				<div class=" h15" style="background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; "></div>
			</c:if>
			<a href="/web/goAppProductInfo?ID=${var.ID }&PRODUCTTYPE=${pd.PRODUCTTYPE}">
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
	                            <div class="m_xintuo_intro_bottom_half"><span class=" c9">期限：</span><span class="c6">${var.PRODUCTDEADLINE }</span></div>
	                            <div class="m_xintuo_intro_bottom_half"><span class=" c9">类型：</span><span class=" c6">${var.TRUSTTYPENAME }</span></div>
	                        </div>
	                        <div class="m_xintuo_intro_bottom_floor">														
	                            <div class="m_xintuo_intro_bottom_half"><span class=" c9">付息：</span><span class="c6">${var.TINTERESTDISTRIBUTIONSTATENAME }</span></div>
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
        </c:forEach>
	</div>
    </section>
<section>
    <div class=" h15" style=" background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; "></div>
    </section>  
    
    <!-- 信托产品结束 -->
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




<section>
    <div class=" h15" style="background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; "></div>
    </section>  
  
    <!-- 服务开始 -->

    <!-- 服务结束 -->
   <!--  <section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice_01.png" width="100%"  style="border-bottom:1px solid #f1f1f2"></div>
    </section>    -->
     <section>
        <div><img src="../static/img/web/app/img_mobile_index_myservice.png" width="100%"></div>
    </section>
 


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
<%@include file="bottom.jsp"%> 


</body>
</html>
