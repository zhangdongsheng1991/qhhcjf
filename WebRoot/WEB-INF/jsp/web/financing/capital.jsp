<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<title>环成金服融资网</title>
<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css"
	href="static/css/web/financing_css/financing_css.css">
<script src="static/js/web/jquery-1.7.2.min.js"></script>
<script src="static/js/web/financing_js/financing_js.js"></script>
 <link rel="Shortcut Icon" href="static/img/web/logo2.ico">
</head>


<body>
	<div class="Top">
    	<div class="top">
       	<div class="top_L"> 环成金服-您终身信赖的财富管家 </div>
        <div class="top_R">
   <!--     <img src="static/img/web/financing_img/jiantou.png" />-->
         <a href="web/index">投资服务咨询</a></div>
        </div>
        
    </div>

	<!--头部-->
	<div class="nav_box">
		<a href="web/index" target="_blank">
			<div class="logo">环成金服融资网</div>
		</a>
		<ul class="nav">
			<li ><a href="web/financing">首页</a></li>
            <li class="Choice" ><a href="web/capital">找资金</a></li>
            <li><a href="web/sch_finance">金融学院</a></li>
			<li><a onclick="showhz('发布项目')" class="comy_but" href="javascript:;"
				style="padding:0px; margin-left:20px;">我要融资</a></li>
		</ul>
	</div>
	<!--头部结束-->

	<div class="banner1"></div>


	<!--产品板块-->
	<div id="trust_ProductCenter_Search">
	<div class=" w1200 mauto">
	<div class=" trust_ProductCenter_Search_Condition bts0068ff "
		id="trust_ProductCenter_Search_Condition_trust">
		<div class="h20"></div>
		<div class="trust_ProductCenter_Search_ul fs14 c666666">
			<div class=" fl w110 h40 lh40 tar">所在地区：</div>
			<ul class="bbd999999 h40 lh40">
				<input type="hidden" name="LOCATION" value="">
				<li id="locationli"
					class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a
					onclick="conditionsChange('','',this)">不限</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg">
					<a id="currlocationName" style="cursor: pointer;" onclick="chooseLocation('','',this)">
						北京	
					</a>	
				</li>
				<div style="float: left;cursor: default;">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="morelocation" style="cursor: pointer;">更多+</span>
				</div>
			</ul>
			<div class="locationDl" style="display:none;">
			<c:forEach var="location" items="${locationMap}">
			<dl style="min-height:40px; width:1100px; margin-left:100px; overflow: hidden;" >
				<dt style="float:left; margin:10px; width:10px;color:#f49703; ">${location.key }</dt>
				<dd style="float:left; margin:10px; width:800px; ">
					<c:forEach var="locationName" items="${location.value}">
					<span class="locationName" onclick="chooseLocation('','${locationName}','')" style="cursor:pointer; margin: 0px 10px;">
						${locationName}
					</span>
					</c:forEach>
				</dd>
			</dl>
			</c:forEach>
			</div>
		</div>

		<div class="trust_ProductCenter_Search_ul fs14 c666666">
			<div class=" fl w110 h40 lh40 tar">是否上市：</div>
			<ul class="bbd999999 h40 lh40">
				<input type="hidden" name="LISTED" value="">
				<li
					class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a
					onclick="conditionsChange('','',this)">不限</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('已上市','已上市',this)">已上市</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('未上市','未上市',this)">未上市</a></li>
			</ul>
		</div>

		<div class="trust_ProductCenter_Search_ul fs14 c666666">
			<div class=" fl w110 h40 lh40 tar">是否信托公司：</div>
			<ul class="bbd999999 h40 lh40">
				<input type="hidden" name="ISTRUST" value="">
				<li
					class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a
					onclick="conditionsChange('','',this)">不限</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('信托公司','信托公司',this)">信托公司</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('非信托公司','非信托公司',this)">非信托公司</a></li>
			</ul>
		</div>

		<div class="trust_ProductCenter_Search_ul fs14 c666666">
			<div class=" fl w110 h40 lh40 tar">股东背景：</div>
			<ul class="bbd999999 h40 lh40">
				<input type="hidden" name="SHAREHOLDER" value="">
				<li
					class=" h32 lh32 trust_ProductCenter_Search_bg trust_ProductCenter_Search_bg_over"><a
					onclick="conditionsChange('','',this)">不限</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('地方政府','地方政府',this)">地方政府</a></li>
				<!-- <li class=" h32 lh32 trust_ProductCenter_Search_bg"><a onclick="conditionsChange('b9bc6bcaba174c2b9243ea09fdc57b35','贷款类',this)">贷款类</a></li> -->
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('金融机构控股','金融机构控股',this)">金融机构控股</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('民营企业','民营企业',this)">民营企业</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('省级政府控股','省级政府控股',this)">省级政府控股</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('央企国企','央企国企',this)">央企国企</a></li>
				<li class=" h32 lh32 trust_ProductCenter_Search_bg"><a
					onclick="conditionsChange('央企控股','央企控股',this)">央企控股</a></li>
			</ul>
		</div>
		<div class="h75 fs14 c666666">
			<div class=" h20"></div>
			<div class=" h32 lh32">
				<div class=" fl w120 h32 lh32 tar">关 键 词：</div>
				<div class=" fl w250 h32 bradius16 bsebebeb ml20">
					<div class=" fl h32">
						<input id="searchText" type="text"
							class=" h32  ml8  pl20 w190 fs14 c999999" style=" border:none;"
							value="">
					</div>
					<div class=" fl">
						<input type="button" class="w24 h24 lh24 mt3"
							style=" background:url(static/img/web/sousuo.png) no-repeat; border:none; cursor:pointer;"
							onclick="getList(1)">
					</div>
				</div>
			</div>
		</div>

		<div class=" h48 lh48 c666666">

			<div class=" fl w120 tar">已选条件：</div>

			<div class="bts999999">
				<div
					class="fl h24 lh24 mt10 trust_ProductCenter_Search_ClearCondition">
					<font id="LOCATION" style="cursor:pointer"><input
						type="hidden" value=""><a style="color: red;" class="fl"></a></font>
					<font id="LISTED" style="cursor:pointer"><input
						type="hidden" value=""><a style="color: red;" class="fl"></a></font>
					<font id="ISTRUST" style="cursor:pointer"><input
						type="hidden" value=""><a style="color: red;" class="fl"></a></font>
					<font id="SHAREHOLDER" style="cursor:pointer"><input
						type="hidden" value=""><a style="color: red;" class="fl"></a></font>
					&nbsp;&nbsp;&nbsp;<a class="c0068ff cpointer" href="javascript:{location.reload();}"
						style="cursor:pointer">清空条件</a>
				</div>
				<div class="fl h24 lh24 mt8 ml20">
					<a>共<span id="totalResult"
						style=" font-size:16px; color:#f60; margin:0px 5px;">${page.totalResult }</span>款产品满足条件
					</a>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<div class="product_box">
		<ul class="product">
		<c:forEach var="institution" items="${list }">
			<li>
				<div class="comy_logo">
					<img style="width:100px" src="${institution.IMGURL }">
				</div>

				<div class="comy_con">
					<div>
						<span class="S_l">投资机构：</span> <span class="S_r">${institution.NAME}</span>
					</div>

					
					<div>
						<span class="S_l">资金规模：</span> <span class="S_r">${institution.CAPITAL}万</span>
					</div>
					<div>
						<span class="S_l">所在地区：</span> <span class="S_r">${institution.LOCATION}</span>
					</div>
					
				</div> 
				<a onclick="showhz('${institution.NAME}')" class="comy_but">申请合作</a>
			</li>
		</c:forEach>
		</ul>
	</div>

	<!--底部翻页导航-->
	 <div class=" h70 clearb bgfafafa" id="IsShowPage">
        <div class=" h25"></div>
        <div class="page" id="divPage" style=" text-align:center">
        	${page.pageStr}
        </div>
    </div>

	<!--底部翻页导航结束-->

	<div class="flow">
		<div class="header" style="color:#FFF;">
			<span class="su"></span> 服务流程
		</div>

		<div class="function">
			<img src="static/img/web/financing_img/flow.png" />
		</div>
	</div>
	<%@include file="../bottom.jsp"%>
	<%@include file="common_hz.jsp" %>
	<script>
	$("#LOCATION").find("input").val("");
	$("#LISTED").find("input").val("");
	$("#ISTRUST").find("input").val("");
	$("#SHAREHOLDER").find("input").val("");
	    document.onkeydown = function (e) {//键盘按键控制
	        e = e || window.event;
	        if ((e.ctrlKey && e.keyCode == 82) || //ctrl+R
	            e.keyCode == 116) {//F5刷新，禁止
	        	
	        }
	    }
	   
		$(function(){ 
			$("#morelocation").click(function(){
				if($("#morelocation").html()=="收起-"){
					$("#morelocation").html("更多+");
					$(".locationDl").slideUp(300);
				}else{
					$(".locationDl").slideDown(300);
					$("#morelocation").html("收起-");
				}
			});
			
			/* $('#comy_but').click(function(){
				alert(institutionname);
				var name = $('#yuyue_name');
				var val_name=name.val();
				
				var reg = /^[\u4E00-\u9FA5]{2,5}$/;
				if(!reg.test(val_name.trim())){
					$(".name-tip").css("display","block");
					return;
				}else{
					$(".name-tip").css("display","none");
				};
				var phone =$('#yuyue_phone');
				var val_phone=phone.val();
				var reg = /^1\d{10}$/;
				if(!reg.test(val_phone.trim())){
					$(".phone-tip").css("display","block");
					return;
				}else{
					$(".phone-tip").css("display","none");
				};
				var SHAREHOLDERSBACKGROUND='融资网-'+
				 $.ajax({
                    url: "web/activityApply",
                    type: "post",
                    data: {
                       "NAME": val_name,
                        "PHONE": val_phone,
                        "SHAREHOLDERSBACKGROUND": consultType,
                        "INVESTMENTTHRESHOLD": '',
                        "RETURNSBENCHMARK": '',
                        "PRODUCTDEADLINE": '',
                        "TRUSTNAME":''
                    },
                    dataType: "json",
                    success: function(data) {
                      // flag = true;
                        
                        if (data.result == 01) {
                            $("#reportName").val("");
                            $("#reportMobile").val("");
                            $('#selected_succ').css('display','block');
                            $('#zx').css('display','none');
                        }else{
                         alert(data.msg);
                        }
                       
                    }
                }); 
				
			}); */
		})
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
		function chooseLocation(id,str,e){
			var t = $(e).html();
			$(".locationDl").slideUp(300);
			$("#morelocation").html("更多+");
			$("#currlocationName").html("");
			if(''==str){
				str=t;
				$("#currlocationName").html(t);
			}else{
				$("#currlocationName").html(str);
			}
			var ul = $("#currlocationName").parent().parent();
			var li = $(ul).find("li");
			li.removeClass();
			li.addClass("h32 lh32 trust_ProductCenter_Search_bg");
			$("#currlocationName").parent().addClass("trust_ProductCenter_Search_bg_over");
			//设置选中值
			var name = $(ul).find("input").attr("name");
			$("#"+name).find("input").val(str);
			$("#"+name).find("a").html(str);
			if(str){
				/* $("#"+name).find("a").empt(); */
				$("#"+name).find("a").html(str+"<span onclick='clears(this)'> X</span>");
			}
			//设置初始页为0
			//调用查询
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
			var LOCATION = $("#LOCATION").find("input").val();
			if(LOCATION){
				data.LOCATION = LOCATION;
			}
			var LISTED = $("#LISTED").find("input").val();
			if(LISTED){
				data.LISTED = LISTED;
			}
			var ISTRUST = $("#ISTRUST").find("input").val();
			if(ISTRUST){
				data.ISTRUST = ISTRUST;
			}
			var SHAREHOLDER = $("#SHAREHOLDER").find("input").val();
			if(SHAREHOLDER){
				data.SHAREHOLDER = SHAREHOLDER;
			}
			var SEARCHINGNAME = $("#searchText").val().trim();
			if(SEARCHINGNAME){
				data.SEARCHINGNAME = SEARCHINGNAME;
			}
			$.ajax({
				type: "POST",
				url: '<%=basePath%>web/getInstitution',
		    	data: data,
				dataType:'json',
				success: function(data){
					 if(data.result == 01){
					 	$("#divPage").html(data.page.pageStr.toString());
					 	//清空列表 进行循环
					 	$(".product_box").empty();
					 	$("#totalResult").html(data.page.totalResult);
					 	var str = "<ul class='product'>";
					 	for(var i=0;i<data.list.length;i++){
					 		var info = data.list[i];
					 		str+="<li>"+
									"<div class='comy_logo'>"+
										"<img style='width:125px' src='"+info.IMGURL+"'>"+
									"</div>"+
									"<div class='comy_con'>"+
										"<div>"+
											"<span class='S_l'>投资机构：</span> <span class='S_r'>"+info.NAME+"</span>"+
										"</div>"+
										"<div>"+
											"<span class='S_l'>资金规模：</span> <span class='S_r'>"+info.CAPITAL+"万</span>"+
										"</div>"+
										"<div>"+
										"<span class='S_l'>所在地区：</span> <span class='S_r'>"+info.LOCATION+"</span>"+
										"</div>"+
									"</div> <a onclick=\"showhz('"+info.NAME+"')\" class='comy_but'>申请合作</a>"+
								"</li>";
					 	}
					 	str+="<ul>"
					 	$(".product_box").append(str); 
					 }else{
					 	alert(data.msg);
					 }
				}
			});
		}
	</script>
</body>
</html>
