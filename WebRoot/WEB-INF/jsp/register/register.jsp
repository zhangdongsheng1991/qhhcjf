<%@page pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<style>
			.err_input {
				border:1px solid red;
			}
		</style>
    	<script src="/static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script>
			$(function(){
				var countdown=60;
				$("#btn").click(function(){
					if (countdown == 0){
						$("#btn").removeatt("disabled");	
						$("#btn").val("免费获取验证码");
						countdown=60;
					}else{ 
						$("#btn").attr("disabled", true); 
						$("#btn").val("重新发送(" + countdown + ")"); 
						countdown--; 
					} 
					setTimeout(function() { 
						$("#btn").click() 
					},1000) 
				});
				
				//验证手机
				$("#u_phone").blur(function(){
					if($("#u_phone").val().trim()==''){
						$("#s_phone").css("color","red");
						$("#s_phone").html("手机号不能为空");
						$("#u_phone").addClass("err_input");
						return;
					}else{
						//ajax
						
						$("#s_phone").css("color","black");
						$("#s_phone").html("");
						$("#u_phone").removeClass("err_input");
					}
					
					
				});
				$("#u_pwd").blur(function(){
					if($("#c_pwd").val()!=''){
						if($("#u_pwd").val()!=$("#c_pwd").val()){
							$("#s_c_pwd").css("color","red");
							$("#s_c_pwd").html("两次输入密码不一致");
							$("#c_pwd").addClass("err_input");
						}else{
							$("#s_c_pwd").html("");
							$("#c_pwd").removeClass("err_input");
						}
					}
					if($("#u_pwd").val().trim()==''){
						$("#s_pwd").css("color","red");
						$("#s_pwd").html("密码不能为空");
						$("#u_pwd").addClass("err_input");
						return;
					}else{
					//ajax
						
						$("#s_pwd").css("color","black");
						$("#s_pwd").html("");
						$("#u_pwd").removeClass("err_input");
					}
				});
				
				$("#c_pwd").blur(function(){
					if($("#u_pwd").val()!=$("#c_pwd").val()){
						$("#s_c_pwd").css("color","red");
						$("#s_c_pwd").html("两次输入密码不一致");
						$("#c_pwd").addClass("err_input");
					}else{
						$("#s_c_pwd").html("");
						$("#c_pwd").removeClass("err_input");
					}
				})
			})
		</script>
	</head>
	<body>
		<form id="formregister" action="web/saveUser" method="post">
			手机号:<input id="u_phone" type="text" name="u_phone" /><span id="s_phone"></span><br/>
			密&nbsp;&nbsp;码:<input id="u_pwd" type="password" name="u_pwd" /><span id="s_pwd"></span><br/>
			确认密码:<input id="c_pwd" type="password" name="c_pwd" /><span id="s_c_pwd"></span><br/>
			手机验证码:<input id="u_checkphone" type="text" name="u_checkphone" /><input type="button" id="btn" value="免费获取验证码" /><br/>
			姓&nbsp;&nbsp;名:<input id="c_name" type="text" name="c_name" /><span id="s_name"></span><br/>
			邮&nbsp;&nbsp;箱:<input id="c_email" type="text" name="c_email" /><br/><br/>
			
			<button id="register" type="submit">立即注册</button>
			

		</form>
	</body>
</html>