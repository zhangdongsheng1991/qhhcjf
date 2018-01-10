<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
        <title>用户登录__环成金服</title>
		<style>
			.err_input {
				border:1px solid red;
			}
		</style>
		<script src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/web/jquery.cookie.js"></script>
        <link href="static/css/web/Sign_in.css" rel="stylesheet" type="text/css" /> 
        <link href="static/css/web/style.css" rel="stylesheet" type="text/css" />
        
	</head>
	<body>
            <div class="register_tankuang" style="display: none">
                <div class="sign_in_K">
                <a class="ui-dialog-close" onclick="closepopup()" title="关闭"><span class="ui-icon ui-icon-delete"></span></a>
                
                
                    <div style="color:#FFF; font-size:20px; " >用户登录</div>
                    
                    <form action="" method="post" name="loginForm" id="loginForm">
                    		<div style="position:relative;" >
                                <img src="static/img/web/register_img/name.png" style="position:absolute; top:44px; left:15px;" />
                                <input type="text" name="loginname" id="loginname" value="" placeholder="请输入用户名" />
                            </div>   
                            <span id="err_user" style="color:red"></span>
                            <br/>
                            
                            
                            <div style="position:relative;" >
                            	<img src="static/img/web/register_img/lock.png" style="position:absolute; top:44px; left:15px;" />
                                <input type="password" name="password" id="password" placeholder="请输入密码" value="" />
                            </div>
                            <span id="err_pwd"  style="color:red"></span>
                            <br/>
                            
                            <div style="float:right; margin-right:25px;">
                            	<a style="color:#FFFFFF;" target="_blank" href="web/findpwd/index" >忘记密码</a>
                            </div>
                            
                            <br/>
                            <a onclick="severCheck();" id="to-recover">
                                登录
                            </a>
                    </form>
                    
                   
                    <div style="color:#FFF; font-size:14px; text-align:right; margin-top:20px; " >
                    
                    还不是环成金服用户？<a class="denglu red" target="_blank" href="web/register">免费注册</a>
                    
                    </div>
                    
                </div>
                
            </div>
            
  <div class="ui-mask" style="display:none;position: absolute; left: 0px; top: 0px; opacity: 0.15; z-index: 9998; background-color:#333 ; width: 1583px; height: 7200px;"></div>
    
	<script>
		function closepopup(){
			$(".register_tankuang,.ui-mask").css("display","none");
		}
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh";
				$.ajax({
					type: "POST",
					url: 'web/web_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.reload();
						}else if("usererror" == data.result){
							$("#err_user").html("*用户名或密码错误");
							$("#loginname").focus();
						}
					}
				});
			}
		}
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});
	
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}
		//客户端校验
		function check() {
			if ($("#loginname").val().trim() == ""&&$("#password").val()==""){
				$("#err_user").html("*用户名不得为空");
				$("#err_user").css("color","red");
				$("#loginname").addClass("err_input");
				$("#err_pwd").html("*密码不得为空");
				$("#err_pwd").css("color","red");
				$("#password").addClass("err_input");
				return;
			}
		
			if ($("#loginname").val().trim() == "") {
				$("#err_user").html("*用户名不得为空");
				$("#err_user").css("color","red");
				$("#loginname").addClass("err_input");
				$("#loginname").focus();
				return false;
			} else {
				$("#err_user").html("");
				$("#loginname").removeClass("err_input");
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
	
			if ($("#password").val() == "") {
				$("#err_pwd").html("*密码不得为空");
				$("#err_pwd").css("color","red");
				$("#password").addClass("err_input");
				$("#password").focus();
				return false;
			} else{
				$("#err_pwd").html("");
				$("#password").removeClass("err_input");
			}
			return true;
		}
	
		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}
	
		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
			}
		});
		
	</script>
	</body>
</html>