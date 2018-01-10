<%@page pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath %>">
		<meta charset="utf-8">
        <title>用户登录__环成金服</title>
		<style>
			.err_input {
				border:1px solid red;
			}
		</style>
		<script src="static/js/web/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="static/js/web/jquery.cookie.js"></script>
        <link href="static/css/web/Sign_in.css" rel="stylesheet" type="text/css" /> 
        <link href="static/css/web/style.css" rel="stylesheet" type="text/css" />
        <link href="static/img/web/logo2.ico" rel="Shortcut Icon" /> 
	</head>
    
    
    
	<body>
    
    <div class="R_top">
        	<div class="top_box">
            	<a href="http://www.qhhcjf.com/web/index" target="_blank">
            		<div class="logo_S">环成金服</div>
            	</a>
               
            </div>
		</div>
    
    
    <div style="background:url(static/img/web/register_img/bg_3.jpg) 50% no-repeat;">
            <div class="register" style="height:480px;">
            
                <div class="sign_in_K">
                
                    <div style="color:#FFF; font-size:20px; " >用户登录</div>
                    
                    <form action="" method="post" name="loginForm" id="loginForm">
                    		<div style="position:relative;" >
                                <img src="static/img/web/register_img/phone.png" style="position:absolute; top:44px; left:15px;" />
                                <input type="text" name="loginname" id="loginname" value="" placeholder="请输入手机号" />
                            </div>   
                            <span id="err_user"></span>
                            <br/>
                            
                            
                            <div style="position:relative;" >
                            	<img src="static/img/web/register_img/lock.png" style="position:absolute; top:44px; left:15px;" />
                                <input type="password" name="password" id="password" placeholder="请输入密码" value="" />
                            </div>
                            <span id="err_pwd"></span>
                            <br/>
                            
                            <!-- <div style="float:right; margin-right:25px;">
                            	<font color="#FFFFFF">记住密码</font>
                            	<input id="saveid" type="checkbox" onclick="savePaw();"/>
                            </div> -->
                            <div style="float:right; margin-right:25px;">
                            	<a style="color:#FFFFFF;" href="web/findpwd/index" >忘记密码</a>
                            </div>
                            <br/>
                            <a onclick="severCheck();" id="to-recover">
                                登录
                            </a>
                    </form>
                    
                   
                    <div style="color:#FFF; font-size:14px; text-align:right; margin-top:20px; " >
                    
                    还不是环成金服用户？<a class="denglu red" href="web/register">免费注册</a>
                    
                    </div>
                    
                </div>
                
            </div>
            
    </div>
    
    
      <!--底部-->
    <div class=" w1200 mauto R_bot">
    	<div class=" clearb" >
                <div class="h40">
                </div>
                <div class=" w290 h12 mauto" style=" font-size:12px;">
                    <ul>
                        <li class=" fl w70 h12 lh12 tac"><a href="web/aboutUsList">联系我们</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="web/aboutUsList">加入我们</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="" >免责声明</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="http://www.qhhcjf.com/sitemap.html" target="_blank" >网站地图</a></li>
                    </ul>
                </div>
            </div>
            
           <div class=" h10 clearb"></div> 
           
         <div>
         	<p class=" tac lh24 " style=" font-size:12px; color:#666;">
                ©2017 www.qhhcjf.com 深圳前海环成投资咨询有限公司 版权所有 
                <a href="" target="_blank">粤ICP备 17043698号-1</a>
                
		 	</p>
         </div>   
            
    
    </div>
    
    
	<script>
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
							//saveCookie();
							window.location.href='web/index';
						}else if("usererror" == data.result){
							$("#err_user").html("*用户名或密码错误");
							$("#err_user").css("color","#FF0000");
							$("#err_user").css("font-size","16px");
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
	
		/**function savePaw() {
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
		}**/
		jQuery(function() {
			/* var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") { */
				$("#loginname").val("");
				$("#password").val("");
				//$("#saveid").attr("checked", true);
		
		});
	</script>
	</body>
</html>