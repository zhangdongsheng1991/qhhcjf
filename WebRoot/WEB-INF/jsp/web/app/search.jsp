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
		<title>环成金服</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=11,IE=10,IE=9,IE=8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <meta http-equiv="Cache-Control" content="no-siteapp">
		<link href="../static/css/web/app/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="../static/css/web/app/index.css" type="text/css">  
		<link rel="stylesheet" href="../static/css/web/app/test.css">
		 <script type="text/javascript" src="../static/js/web/app/jquery-1.7.2.min.js"></script>
		  <script type="text/javascript" src="../static/js/web/app/jQuery.touchSlider.js"></script>
		 
      	<script>
      	
      	$(function(){
      		$("#img1").click(function(){ 
				var currentPage = $("#currentPage").val();
				var v = $("#search").val();
				if(v.trim()==''){
					$("#ctl00_ContentPlaceHolder1_index_xintuo_server").empty();
					return;
				}
      			$.ajax({
      				type:"POST",
      				url:"/web/search",
      				data:{"searchName":v,"currentPage":currentPage},
      				dataType:"json",
      				success:function(data){
      					$("#ctl00_ContentPlaceHolder1_index_xintuo_server").empty();
      					if(data!=null){
      						for(var i=0;i<data.length;i++){
      							var t_PRODUCTREFERRED;
      							var PRODUCTREFERRED = data[i].PRODUCTREFERRED
      							if(PRODUCTREFERRED.length>12){
      								t_PRODUCTREFERRED = PRODUCTREFERRED.substring(0,12);
      							}else{
      								t_PRODUCTREFERRED = PRODUCTREFERRED;
      							}
      							if(i==0){
	      							$("#ctl00_ContentPlaceHolder1_index_xintuo_server").append(
	      									"<a href='/web/goAppProductInfo?ID="+data[i].ID+"&PRODUCTTYPE="+data[i].PRODUCTTYPE+"'>"+
		      									"<div class='m_xintuo_intro_list bbse1e1e1'>"+
		      					                "<div class='m_xintuo_intro_top'>"+
		      					                    "<div class='m_xintuo_intro_title'>"+
		      					                  		t_PRODUCTREFERRED+
		      					                    "</div>"+
		      					                   "<div class='m_xintuo_intro_less'>"+data[i].RETURNSBENCHMARKMAX+"</div>"+
		      					        		"</div>"+
		      					                "<div class='m_xintuo_intro_bottom'>"+
		      					                    "<div class='m_xintuo_intro_bottom_left'>"+
		      					                        "<div class='m_xintuo_intro_bottom_floor'>"+
		      					                        	"<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>期限：</span><span class=' c666666'>"+data[i].PRODUCTDEADLINE+"</span></div>"+
		      						                        "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>类型：</span><span class=' c666666'>"+data[i].TRUSTTYPENAME+"</span></div>"+
		      					                        "</div>"+
		      					                        "<div class='m_xintuo_intro_bottom_floor'>"+
		      					                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>付息：</span><span class=' c666666'>"+data[i].TINTERESTDISTRIBUTIONSTATENAME+"</span></div>"+
		      					                            "<div class='m_xintuo_intro_bottom_half'><span class=' c9'>规模：</span><span class=' c6'>"+data[i].EXPECTISSUANCE+"</span></div>"+
		      					                        "</div>"+
		      					                        "<div class='h6 clearb'>"+
		      					                        "</div>"+
		      					                    "</div>"+
		      					                    "<div class='m_xintuo_intro_bottom_right'>"+
		      					                        "<img src='/"+data[i].THEISSUERIMGURL+"' width='62'>"+
		      					                   "</div>"+
		      									"</div>"+
		      					            	"<div class=' h6 clearb'></div>"+
		      					            "</div>"+
		      				        	"</a>"
	      							);
      							}else{
      								$("#ctl00_ContentPlaceHolder1_index_xintuo_server").append(
          									"<div class=' h15' style='background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; '></div>"+
    	      								"<a href='/web/goAppProductInfo?ID="+data[i].ID+"&PRODUCTTYPE="+data[i].PRODUCTTYPE+"'>"+
    	      						        	"<div class='m_xintuo_intro_list bbse1e1e1'>"+
    	      						                "<div class='m_xintuo_intro_top'>"+
    	      						                   "<div class='m_xintuo_intro_title'>"+
    	      						                 t_PRODUCTREFERRED+
    	      						                    "</div>"+
    	      						                    "<div class='m_xintuo_intro_less'>"+data[i].RETURNSBENCHMARKMAX+"</div>"+
    	      					        			"</div>"+
    	      						                "<div class='m_xintuo_intro_bottom'>"+
    	      						                    "<div class='m_xintuo_intro_bottom_left'>"+
    	      						                        "<div class='m_xintuo_intro_bottom_floor'>"+
    	      						                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>期限：</span><span class=' c666666'>"+data[i].PRODUCTDEADLINE+"</span></div>"+
    	      						                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>类型：</span><span class=' c666666'>"+data[i].TRUSTTYPENAME+"</span></div>"+
    	      						                        "</div>"+
    	      						                        "<div class='m_xintuo_intro_bottom_floor'>"+
    	      						                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>付息：</span><span class=' c666666'>"+data[i].TINTERESTDISTRIBUTIONSTATENAME+"</span></div>"+
    	      						                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>规模：</span><span class=' c666666'>"+data[i].EXPECTISSUANCE+"</span></div>"+
    	      						                        "</div>"+
    	      						                        "<div class='h6 clearb'>"+
    	      						                        "</div>"+
    	      						                    "</div>"+
    	      						                    "<div class='m_xintuo_intro_bottom_right'>"+
    	      						                        "<img src='/"+data[i].THEISSUERIMGURL+"' width='62'>"+
    	      						                    "</div>"+
    	      										"</div>"+
    	      						            	"<div class=' h6 clearb'></div>"+
    	      						            "</div>"+
    	      				        		"</a>"
          								);
      							}
      							$("#more").css("display","block");
      						}	
      					}
      					
      				}
      			});	
      		});
			$("#search").keyup(function(){ 
				var currentPage = $("#currentPage").val();
				var v = $("#search").val();
				if(v.trim()==''){
					$("#ctl00_ContentPlaceHolder1_index_xintuo_server").empty();
					return;
				}
      			$.ajax({
      				type:"POST",
      				url:"/web/search",
      				data:{"searchName":v,"currentPage":currentPage},
      				dataType:"json",
      				success:function(data){
      					$("#ctl00_ContentPlaceHolder1_index_xintuo_server").empty();
      					if(data!=null){
      						for(var i=0;i<data.length;i++){
      							var t_PRODUCTREFERRED;
      							var PRODUCTREFERRED = data[i].PRODUCTREFERRED
      							if(PRODUCTREFERRED.length>12){
      								t_PRODUCTREFERRED = PRODUCTREFERRED.substring(0,12);
      							}else{
      								t_PRODUCTREFERRED = PRODUCTREFERRED;
      							}
      							if(i==0){
	      							$("#ctl00_ContentPlaceHolder1_index_xintuo_server").append(
	      									"<a href='/web/goAppProductInfo?ID="+data[i].ID+"&PRODUCTTYPE="+data[i].PRODUCTTYPE+"'>"+
		      									"<div class='m_xintuo_intro_list bbse1e1e1'>"+
		      					                "<div class='m_xintuo_intro_top'>"+
		      					                    "<div class='m_xintuo_intro_title'>"+
		      					                  		t_PRODUCTREFERRED+
		      					                    "</div>"+
		      					                   "<div class='m_xintuo_intro_less'>"+data[i].RETURNSBENCHMARKMAX+"</div>"+
		      					        		"</div>"+
		      					                "<div class='m_xintuo_intro_bottom'>"+
		      					                    "<div class='m_xintuo_intro_bottom_left'>"+
		      					                        "<div class='m_xintuo_intro_bottom_floor'>"+
		      					                        	"<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>期限：</span><span class=' c666666'>"+data[i].PRODUCTDEADLINE+"</span></div>"+
		      						                        "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>类型：</span><span class=' c666666'>"+data[i].TRUSTTYPENAME+"</span></div>"+
		      					                        "</div>"+
		      					                        "<div class='m_xintuo_intro_bottom_floor'>"+
		      					                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>付息：</span><span class=' c666666'>"+data[i].TINTERESTDISTRIBUTIONSTATENAME+"</span></div>"+
		      					                            "<div class='m_xintuo_intro_bottom_half'><span class=' c9'>规模：</span><span class=' c6'>"+data[i].EXPECTISSUANCE+"</span></div>"+
		      					                        "</div>"+
		      					                        "<div class='h6 clearb'>"+
		      					                        "</div>"+
		      					                    "</div>"+
		      					                    "<div class='m_xintuo_intro_bottom_right'>"+
		      					                        "<img src='/"+data[i].THEISSUERIMGURL+"' width='62'>"+
		      					                   "</div>"+
		      									"</div>"+
		      					            	"<div class=' h6 clearb'></div>"+
		      					            "</div>"+
		      				        	"</a>"
	      							);
      							}else{
      								$("#ctl00_ContentPlaceHolder1_index_xintuo_server").append(
          									"<div class=' h15' style='background-color:#f8f9fb; border-bottom:#f1f1f2 1px solid; '></div>"+
    	      								"<a href='/web/goAppProductInfo?ID="+data[i].ID+"&PRODUCTTYPE="+data[i].PRODUCTTYPE+"'>"+
    	      						        	"<div class='m_xintuo_intro_list bbse1e1e1'>"+
    	      						                "<div class='m_xintuo_intro_top'>"+
    	      						                   "<div class='m_xintuo_intro_title'>"+
    	      						                 t_PRODUCTREFERRED+
    	      						                    "</div>"+
    	      						                    "<div class='m_xintuo_intro_less'>"+data[i].RETURNSBENCHMARKMAX+"</div>"+
    	      					        			"</div>"+
    	      						                "<div class='m_xintuo_intro_bottom'>"+
    	      						                    "<div class='m_xintuo_intro_bottom_left'>"+
    	      						                        "<div class='m_xintuo_intro_bottom_floor'>"+
    	      						                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>期限：</span><span class=' c666666'>"+data[i].PRODUCTDEADLINE+"</span></div>"+
    	      						                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>类型：</span><span class=' c666666'>"+data[i].TRUSTTYPENAME+"</span></div>"+
    	      						                        "</div>"+
    	      						                        "<div class='m_xintuo_intro_bottom_floor'>"+
    	      						                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>付息：</span><span class=' c666666'>"+data[i].TINTERESTDISTRIBUTIONSTATENAME+"</span></div>"+
    	      						                            "<div class='m_xintuo_intro_bottom_half'><span class=' c999999'>规模：</span><span class=' c666666'>"+data[i].EXPECTISSUANCE+"</span></div>"+
    	      						                        "</div>"+
    	      						                        "<div class='h6 clearb'>"+
    	      						                        "</div>"+
    	      						                    "</div>"+
    	      						                    "<div class='m_xintuo_intro_bottom_right'>"+
    	      						                        "<img src='/"+data[i].THEISSUERIMGURL+"' width='62'>"+
    	      						                    "</div>"+
    	      										"</div>"+
    	      						            	"<div class=' h6 clearb'></div>"+
    	      						            "</div>"+
    	      				        		"</a>"
          								);
      							}
      							$("#more").css("display","block");
      						}	
      					}
      					
      				}
      			});	
      		});
      	})
      	function nextPage(){
    		var currentPage = parseInt($("#currentPage").val()) +1;
    		console.log("currentPage="+currentPage);
    		getList(currentPage);
    	}
      	function getList(currentPage){
    		var PRODUCTTYPE = $("#PRODUCTTYPE").val();
    		var data = {};
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
							"<div class=' tac' style=' background:#f49703; height:36px; line-height:36px; width:94%; margin-left:3%; color:#fff; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px;'>"+
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
      	</script>
      	</head>

<body>
<div>
<!-- 顶部导航开始 -->
<header class="m_index_header2">
    <a href="javascript:history.go(-1)">
        <div class="m_index_header_back" class="js-slideout-toggle"></div>
    </a>
    <div style="position:relative; display:inline-block; float:right; width:90%;" >
    	<img id="img1" style="float:right;  top:10px; left:15px; margin-right:20px; margin-top:11px" class="js-slideout-toggle" src="../static/img/web/app/search.png" width="23">
   	 	<input style=" margin-top:2px;margin-right:20px;float:right;text-indent:0.7em; height:30px; width:70%;border-radius: 20px;" type="text" id="search" name="search" />
	</div>
</header>

      <section class="m_index_xintuo">
      	<br/><br/>
        <div id="ctl00_ContentPlaceHolder1_index_xintuo_server" class="m_xintuo_intro">
        	
        </div>
        <div id="more" onclick="nextPage()" class=" tac" style="display:none;background:#f49703; height:36px; line-height:36px; width:94%; margin-left:3%; color:#fff; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px;">
			点击更多
		</div>
		<input type="hidden" id="currentPage" value="1">
    </section>
</body>
</html>
