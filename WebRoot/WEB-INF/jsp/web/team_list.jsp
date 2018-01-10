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
<link rel="stylesheet" type="text/css" href="static/css/web/gjf_index.css">

    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
   <%@include file="baidusq.jsp"%>
</head>

<body style=" background-color:#fcfcfc;">
<%@include file="head.jsp"%>
    <div id="index_banner" class="clearb">
    	<div class="flexslider">
        	<ul class="slides">
            <li style="background: url(static/img/web/img_index_banner_joinus1.jpg) 65% 0px no-repeat; width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1;" class="">
            	<a href="" class=" h420 cpointer" target="_blank">
                	<div style="width: 100%; height: 420px;"></div></a></li>
            <li style="background: url(static/img/web/img_index_banner_joinus1.jpg) 65% 0px no-repeat; width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;" class="flex-active-slide">
            	<a href="" class=" h420 cpointer" target="_blank">
                    <div style="width: 100%; height: 420px;"></div></a></li>
            </ul>
    	</div>
    </div>
     <div id="container" style="border: none; background: none;">
     <!-- 当前位置 -->
        <div id="common_currentlocation" class=" clearb">
        <div id="ctl00_ContentPlaceHolder1_Location_common_currentlocation_list" class=" w1200 mauto h48 lh48 fs14 c666666">
        	<div class=" fl">当前位置：</div>
            <div class=" fl ml10"><a href="web/index">首页</a></div>
            <div class=" fl ml10">&gt;</div>
			<div class=" fl ml10"><a href="javascript:{location.reload();}">关于我们</a></div>
			
		</div>
    </div>   

        
        <div class="h10">
        </div>
        <div class="h10">
        </div>
        <div class="core_team">
            <div>
                <div class=" w1160 mauto">
                    <img src="static/img/web/img_coreteam_toptitlepic.png"></div>
                <div class="h10">
                </div>
                <div class=" fs16 lh32 c999999">
                    <p class=" tindent2">深圳前海环成投资咨询有限公司奉行客户至上的理财服务理念，从渠道多方面的收集项目实时信息，为客户把控项目的风险，力竭为客户挑选最优质、最安全的理财产品！我们心中有一个目标，那就是让深圳前海环成为金融行业的服务标杆！</p>
                    <p class=" tindent2">我们不一定无所不能，但我们为人诚信、积极进取、兢兢业业。一切以客户的需求为出发点，为客户提供最及时可信的服务是我们不懈的追求！</p>
                    <p class=" tindent2">我们没有过多虚而不实的话语，更不会推辞与抱怨，言必信，行必果；只为不负您所托！</p>
                </div>
                <div class="h10">
                </div>
                 <div class="core_team_list">
                    <div id="ctl00_ContentPlaceHolder1_core_team_list_ul_server" class="core_team_list_ul">
        <c:forEach items="${mainChoose}" var="var" varStatus="vs">  
        <c:if test="${vs.index+1 eq 1 || vs.index+1 eq 5 || vs.index+1 eq 9 || vs.index+1 eq 13 || vs.index+1 eq 17 || vs.index+1 eq 21 || vs.index+1 eq 25 || vs.index+1 eq 29 || vs.index+1 eq 33 || vs.index+1 eq 37 || vs.index+1 eq 41}">
		<div class="core_team_list_li" style="background: rgb(255, 255, 255);">
			<div id="#core_team_00${vs.index+1 }" class="core_team_list_every" style="border: 1px solid rgb(239, 239, 239);">
				<div class="core_team_list_pic">
				<div class="core_team_list_headpic"><img src="${var.IMGURL}" style="z-index: 1; display: inline-block; width: 255px; height: 395px; margin-left: 0px; margin-top: 0px; overflow: hidden;"></div>
				<div class="core_team_list_intro">
				<style>
				 .heide{ background-color:#000;color:#fff; line-height:24px; padding:6px 0;}
				.xiaozi{ font-size:15px; margin-left:12px;}
				 .mingz{ font-size:18px; font-weight:bold; margin-left:12px}
				 .mingz span{ font-size:15px; margin-left:12px;}
				 .core_team_list_intro_signtel{display:block;width:80px; color:#b4b4b4;   border:1px solid #b4b4b4; padding:3px 5px; text-align:center; -moz-border-radius:4px; -webkit-border-radius:4px; border-radius:4px; cursor:pointer; height:25px; line-height:25px; margin-left:auto; margin-right:auto; margin-top:15px;}
				 </style>           
				            
				            <div class="heide">
				            <div class="mingz">${var.NAME }<span>${var.POSITION }</span></div>
				            <div class="xiaozi">${var.XUEWEI }</div>
				            <div class="xiaozi">已经为<span>${var.NUMBER }</span>位顾客完成资产配置</div>
				            </div> 
				</div>
			</div>
		</div>
		<div class="core_team_list_intro_signtel" onclick="showDiv('${var.ID}','${var.NAME }')" style=" ">点击预约</div>
		</div>
		<div id="core_team_00${vs.index+1 }" class="core_team_list_li_show" style="left: 278.5px; top: 10px; display: none;">
			<div class="core_team_zyintro">职业简介</div>
			<div class="core_team_intro">${var.INFO}</div>
		</div>
		</c:if>
		<c:if test="${vs.index+1 eq 2 || vs.index+1 eq 6 || vs.index+1 eq 10 || vs.index+1 eq 14 || vs.index+1 eq 18 || vs.index+1 eq 22 || vs.index+1 eq 26 || vs.index+1 eq 30 || vs.index+1 eq 34 || vs.index+1 eq 38 || vs.index+1 eq 42 }">
		 <div class="core_team_list_li teamleft" style="background: rgb(255, 255, 255);">
		<div id="#core_team_00${vs.index+1 }" class="core_team_list_every" style="border: 1px solid rgb(239, 239, 239);">
		<div class="core_team_list_pic">
		<div class="core_team_list_headpic"><img src="${var.IMGURL}" style="z-index: 1; display: inline-block; width: 255px; height: 395px; margin-left: 0px; margin-top: 0px; overflow: hidden;"></div>
		<div class="core_team_list_intro">
		 <div class="heide">
		            <div class="mingz">${var.NAME }<span>${var.POSITION }</span></div>
		            <div class="xiaozi">${var.XUEWEI }</div>
		            <div class="xiaozi">已经为<span>${var.NUMBER }</span>位顾客完成资产配置</div>
		            </div> 
		</div>
		</div>
		</div>
		<div class="core_team_list_intro_signtel" onclick="showDiv('${var.ID}','${var.NAME }')" style=" ">点击预约</div>
		</div>
		<div id="core_team_00${vs.index+1 }" class="core_team_list_li_show" style="left: 575.5px; top: 10px; display: none;">
		<div class="core_team_zyintro">职业简介</div>
		<div class="core_team_intro">${var.INFO}</div>
		</div>
		</c:if>
		<c:if test="${vs.index+1 eq 3 || vs.index+1 eq 7 || vs.index+1 eq 11 || vs.index+1 eq 15 || vs.index+1 eq 19 || vs.index+1 eq 23 || vs.index+1 eq 27 || vs.index+1 eq 31 || vs.index+1 eq 35 || vs.index+1 eq 39 || vs.index+1 eq 43 }">
		<div class="core_team_list_li teamleft" style="background: rgb(255, 255, 255);">
			<div id="#core_team_00${vs.index+1 }" class="core_team_list_every" style="border: 1px solid rgb(239, 239, 239);">
			<div class="core_team_list_pic">
			<div class="core_team_list_headpic"><img src="${var.IMGURL}" style="z-index: 1; display: inline-block; width: 255px; height: 395px; margin-left: 0px; margin-top: 0px; overflow: hidden;"></div>
			<div class="core_team_list_intro">
			 <div class="heide">
			            <div class="mingz">${var.NAME }<span>${var.POSITION }</span></div>
			            <div class="xiaozi">${var.XUEWEI }</div>
			            <div class="xiaozi">已经为<span>${var.NUMBER }</span>位顾客完成资产配置</div>
			            </div> 
			</div>
			</div>
			</div>
			<div class="core_team_list_intro_signtel" onclick="showDiv('${var.ID}','${var.NAME }')" style=" ">点击预约</div>
		</div>
		<div id="core_team_00${vs.index+1 }" class="core_team_list_li_show" style="left: 874.5px; top: 10px; display: none;">
			<div class="core_team_zyintro">职业简介</div>
			<div class="core_team_intro">${var.INFO}</div>
		</div>
		</c:if>
		<c:if test="${vs.index+1 eq 4 || vs.index+1 eq 8 || vs.index+1 eq 12 || vs.index+1 eq 16 || vs.index+1 eq 20 || vs.index+1 eq 24 || vs.index+1 eq 28 || vs.index+1 eq 32 || vs.index+1 eq 36 || vs.index+1 eq 40 || vs.index+1 eq 44 }">
		<div class="core_team_list_li teamleft" style="background: rgb(255, 255, 255);">
			<div id="#core_team_00${vs.index+1 }" class="core_team_list_every" style="border: 1px solid rgb(239, 239, 239);">
				<div class="core_team_list_pic">
				<div class="core_team_list_headpic"><img src="${var.IMGURL}" style="z-index: 1; display: inline-block; width: 255px; height: 395px; margin-left: 0px; margin-top: 0px; overflow: hidden;"></div>
				<div class="core_team_list_intro">
				 <div class="heide">
				            <div class="mingz">${var.NAME }<span>${var.POSITION }</span></div>
				            <div class="xiaozi">${var.XUEWEI }</div>
				            <div class="xiaozi">已经为<span>${var.NUMBER }</span>位顾客完成资产配置</div>
				            </div> 
				</div>
				</div>
			</div>
			<div class="core_team_list_intro_signtel" onclick="showDiv('${var.ID}','${var.NAME }')" style=" ">点击预约</div>
		</div>
		<div id="core_team_00${vs.index+1 }" class="core_team_list_li_show" style="left: 597.5px; top: 10px; display: none;">
			<div class="core_team_zyintro">职业简介</div>
			<div class="core_team_intro">${var.INFO}</div>
		</div>
		</c:if>
        </c:forEach>            
                    

</div>
                </div>
                <div class=" clearb">
                </div>
            </div>
        </div></div>
        
        
        
        
        
         <div id="jquery-yuyue">
                <div id="jquery-lightbox" style="display:none;">
                    <div id="lightbox-container-image-data-box">
                        <div class="lightbox-container_box_left">
                            预约当前理财师</div>
                        <div class="lightbox-container_box_right">
                            <a id="lightbox-secNav-btnClose" onclick="closeDiv()">
                                <img src="static/img/web/lightbox-btn-close.png">
                            </a>
                        </div>
                    </div>
                    <div id="lightbox-container-image-box">
                    	<input type="hidden" id="FINANCIALPLANNERID">
                        <div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; margin-top: 10px; color:#333333;">
                                理财师：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="OrderPlanner" disabled="true " style="border: 1px solid #F49703; width: 100%; height: 36px; color:#999999; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                姓名：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="USERNAME" placeholder="请输入您的姓名" style="border: 1px solid #F49703; width: 100%; height: 36px; color:#999999;
                                    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                手机号：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="CONTACTMOBILE" placeholder="请输入您的手机号" style="border: 1px solid #F49703; width: 100%; color:#999999;
                                    height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                您的要求：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <textarea id="YOURREQUEST" style="border: 1px solid #F49703; width: 100%; height: 64px; color:#999999; line-height:24px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></textarea>
                            </div>
                            <div style="width: 80%; margin: 0 auto;">
                                <div style="background: #FB7704; border: none; width: 100%; height: 36px; line-height: 36px;
                                    color: #fff; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                                    margin-top: 20px;" onclick="licaishi_click()">
                                    立即提交</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="bg" style="display:none;position:fixed;background-color: black;width: 100%;top:0;height: 100%;opacity: 0.5;"></div>  
            </div>
 <!-- footer -->
<%@include file="bottom.jsp"%>
<script>    
  function showDiv(ID,NAME){  
    //document.getElementById('jquery-lightbox').style.display='block';  
    $("#jquery-lightbox").show();
   /*  $("#bg").show(); */
    $("#OrderPlanner").val(NAME); 
    $("#FINANCIALPLANNERID").val(ID);
}  
function closeDiv(){  
    //document.getElementById('jquery-lightbox').style.display='none';  
    $("#jquery-lightbox").hide();
  /*   $("#bg").hide(); */
}  

function licaishi_click(){
		var data={};
		data.FINANCIALPLANNERID = $("#FINANCIALPLANNERID").val();
		if (!$("#USERNAME").val().trim()) { 
			alert("请输入您的姓名！"); 
			$("#USERNAME").focus(); 
			return false; 
 		} 
		data.NAME = $("#USERNAME").val();
		if (!$("#CONTACTMOBILE").val().match(/^(((1[0-9]{2})|159|153)+\d{8})$/)) {
			alert("手机号码格式不正确！"); 
			$("#CONTACTMOBILE").focus(); 
			return false; 
		}
		data.PHONE = $("#CONTACTMOBILE").val();
		if($("#YOURREQUEST").val()){
			data.COMMENTS = $("#YOURREQUEST").val();
		}
		$.ajax({
				type: "POST",
				url: '<%=basePath%>web/lcsyy',
		    	data: data,
				dataType:'json',
				success: function(data){
					 if(data.result == 01){
					 	alert("预约成功");
					 }else{
					 	alert(data.msg);
					 }
				}
		});
	}

</script> 
</body>
</html>