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
		<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
    	<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
    	<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
    	<link rel="stylesheet" type="text/css" href="static/css/home/home-common.css">
    	<link rel="stylesheet" type="text/css" href="static/css/home/home-account.css">
    	<link rel="Shortcut Icon" href="static/img/web/logo2.ico">
    	<script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    	<script>
	    	$(function(){
				$('dd').mouseenter(function(){
					$(this).removeClass("home-dd");
					$(this).addClass("hover-nav");
				}).mouseleave(function(){
					$(this).removeClass("hover-nav");
					$(this).addClass("home-dd");
				});
				
				$('dd').click(function(){
					$('dd').removeClass("selected-nav");
					$('dd').css("font-weight","normal");
					$('dd').css("font-size","14px");
					$(this).removeClass("home-dd");
					$(this).addClass("selected-nav");
					
			    });
				
				$("#tijiao").click(function(){
					if(checkU_name()){
						var u_name = $("#u_name").val();
						var u_phone = $("#u_phone").val();
						var u_sex = $("input[name='u_sex']:checked").val();
						$.ajax({
							type:'POST',
							url:"home/updateUser",
							data:{"u_name":u_name,"u_phone":u_phone,"u_sex":u_sex},
							dataType:"json",
							success:function(data){
								alert("修改成功!");
							}
						});
					};
				})
			})
			function changeU_name(){
	    		$("#changeU_name").css("display","none");
	    		$("#strong_u_name").css("display","none");
	    		$("#u_name").css("display","block");
	    		$("#prompt").css("display","block");
	    		$("#u_name")[0].focus(); 
	    	}
	    	function checkU_name(){
	    		var u_name = $("#u_name").val();
	    		if(u_name.trim()==''){
	    			alert('请输入用户名');
	    			return;
	    		}
	    		var uPattern = /^[a-z\u4e00-\u9fa5A-Z0-9_-]{3,20}$/;
		    	if(u_name.trim().length>=3&&u_name.trim().length<20){	
	    			if(!uPattern.test(u_name)){
	    				$("#u_name").css("border","1px solid red");
			    		$("#prompt").css("color","red");
			    		return false;
		    		}else{
		    			$("#u_name").css("border","1px solid green");
			    		$("#prompt").css("display","none");
			    		$("#prompt").css("color","#666");
			    		return true;
		    		}
		    	}else{
		    		$("#u_name").css("border","1px solid red");
		    		$("#prompt").css("color","red");
		    		return false;
		    	}
	    	}
    	</script>
	</head>
	<body style="background-color:#f3f3f3;    color: #666;">
		<%@include file="../web/head.jsp"%>
		<div id="container" style="border: none; background: none;">
            <div class="home-topnav">
             	<div style="margin-left:110px" class=" fl">&nbsp;</div>
                <div class=" fl" style="color:#666655">当前位置：</div>
                <div class=" fl ml5"><a href="web/index">首页</a></div>
                <div class=" fl ml5">&gt;</div>
                <div class=" fl ml5"  style="color:#666655">账号管理</div>
                <div class=" fl ml5">&gt;</div>
                <div class=" fl ml5"></div>
            </div>
		</div>
        <div class="home-main">
       	 <!--主导航 -->
        	<div style="display:none" class="home-mainnav">
		     
		    </div>
		    <div style="height:12px">
        	</div>
        	 <!--左侧导航 -->
			<div class="home-subnav">
				<dl>	
					<dt>
						账户中心
					</dt>
					<dd  class="selected-nav">
						我的账户
					</dd>
					<dd class="home-dd">
						账户设置
					</dd>
				</dl>
				<dl>
					<dt>
						关注中心
					</dt>
					<dd class="home-dd" onclick="location.href='home/collectionProducts'">
						收藏的产品
					</dd>
					<dd class="home-dd" >
						关注的公司
					</dd>
					<dd class="home-dd" onclick="window.open('home/history')">
						浏览历史
					</dd>
				</dl>
				<dl>
					<dt>
						消息中心
					</dt>
					<dd class="home-dd">
						所有消息
					</dd>
					<dd class="home-dd">
						产品消息
					</dd>
					<dd class="home-dd">
						系统消息
					</dd>
				</dl>
			</div>
			<!--内容 -->
			<div class="home-content">
				<div class="mod-main">
					<div class="account-category">
						<ul>
							<li >基本信息</li>
							<!-- <li>sss</li>
							<li>sss</li> -->
						</ul>
					</div>
					<div class="account-info">
						<div class="form">
                            <div class="item">
                                <span class="label">手机号：</span>
                                <div class="fl">
                                    <div>
                                    	<strong>${user.u_phone}</strong>
                                    	<span class="ftx03">&nbsp; &nbsp;用于登录，不可修改~</span>
                                    	<input id="u_phone" type="hidden" name="u_phone" value="${user.u_phone }"/>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <span class="label"><em>*</em>&nbsp;用户名：</span>
                                <div class="fl" id="aliasBefore">
                                        <strong  id="strong_u_name" style="float: left">${user.u_name}</strong>
                                        <input style="float:left;display: none;" id="u_name" name="u_name" onclick="changeU_name()"  onblur="checkU_name()" type="text" class="itxt itxt-succ" maxlength="20"  value="${user.u_name}">
                                        <a id="changeU_name" href="javascript:void(0)" style="float:left" class="ftx-05 ml10" onclick="changeU_name()">修改</a>
                                       
                                    <div class="clr"></div><div class="prompt-06"><span id="aliasNameBefore_msg"></span></div>
                                    <span id="prompt" style="display:none;float:left">支持中文、字母、数字、“_”、“-”两种及以上的组合，3-20个字符</span>
                                </div>
                               
                                <div class="fl" style="display: none">
                                    <input type="hidden" id="hiddenAliasName" value="stan_eminem">
                                    <span class="ftx03">可用于登录，请牢记哦~</span>
                                    <div class="clr"></div><div class="prompt-06"><span id="aliasName_msg"></span></div>
                                </div>
                            </div>
                            <div class="item">
                                <span class="label">性别：</span>
                                <div class="fl">
                                    <input <c:if test="${user.u_sex==0}">checked="checked"</c:if> type="radio" name="u_sex" value="0"><label class="mr10">保密</label>
                                    <input <c:if test="${user.u_sex==1}">checked="checked"</c:if> type="radio" name="u_sex" value="1"><label class="mr10">男</label>
                                    <input <c:if test="${user.u_sex==2}">checked="checked"</c:if> type="radio" name="u_sex" value="2"><label class="mr10">女</label>
                                </div>
                            </div>
							<div class="item">
								<span class="label">邮箱：</span>
								<div class="fl">
									<div>
										<strong>${user.u_email}
										</strong>
										<!-- <a target="_blank" class="ml5 ftx05" href="//safe.jd.com/validate/updateMail">修改</a>
										<span class="ftx-03">&nbsp;&nbsp;&nbsp;已验证</span> -->
                                    </div>
								</div>
								<div class="clr"></div>
							</div>
							<div class="item">
                                <span class="label">注册时间：</span>
                                <div class="fl">
                                	${user.registerdate }
                                </div>
                            </div>
                            <div class="item">
                                <span class="label">&nbsp;</span>
                                <div id="tijiao" class="tijiao1">
                                  	 提交
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
        </div>
        <%@include file="../web/bottom.jsp"%>
	</body>