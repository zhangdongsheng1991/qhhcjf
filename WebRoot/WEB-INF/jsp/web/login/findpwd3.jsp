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
        <title>找回密码</title>
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
        <script>
        	$(function(){
        		//验证密码强弱
				var check_str = function(){
					$("#u_pwd").removeClass("err_input");
					var strongRegex = new RegExp("^(?=.{6,})(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
					var middleRegex1 = new RegExp("^(?=.{6,})(?=.*[0-9])(?=.*\\W).*$", "g");
					var middleRegex2 = new RegExp("^(?=.{6,})(?=.*[a-z])(?=.*\\W).*$", "g");
					var middleRegex3 = new RegExp("^(?=.{6,})(?=.*[a-z])(?=.*[0-9])", "g");
					if(strongRegex.test($("#u_pwd").val())){
						$("#pwd_str").children().css("background","#F8F8FF");
						$("#pwd_str").children().eq(2).css("background","#3CB371");
					}else if(middleRegex1.test($("#u_pwd").val())||middleRegex2.test($("#u_pwd").val())||middleRegex3.test($("#u_pwd").val())){
						$("#pwd_str").children().css("background","#F8F8FF");
						$("#pwd_str").children().eq(1).css("background","#6495ED");
					}else{
						$("#pwd_str").children().css("background","#F8F8FF");
						$("#pwd_str").children().eq(0).css("background","#FF69B4");
					}
				}
				//判断填写的密码是否符合规范
				var checkpwd = function(){
					if($("#u_pwd").val().trim()==""){
						$("#s_pwd").css("color","red");
						$("#s_pwd").html("密码不能为空");
						$("#u_pwd").addClass("err_input");
						return false;
					}
					var f1 = false;
					var f2 = false;
					if($("#u_pwd").val().length<6||$("#u_pwd").val().length>18){
						$("#s_pwd").css("color","red");
						$("#u_pwd").addClass("err_input");
					}else if($("#u_pwd").val().length>=6&&$("#u_pwd").val().length<=18){
						$("#s_pwd").css("color","green");
						f1=true;
					}
					if($("#u_pwd").val().indexOf(" ")!=-1){
						$("#s1_pwd").css("color","red");
						$("#u_pwd").addClass("err_input");
					}else{
						$("#s1_pwd").css("color","green");
						f2=true;
					}
					if(f1&&f2){
						return true;
					}else{
						return false;
					}
				}
				
				//检查确认密码
				var checkconpwd = function(){
					if($("#c_pwd").val().trim()==""){
						$("#s_c_pwd").css("color","red");
						$("#s_c_pwd").html("确认密码不能为空");
						$("#c_pwd").addClass("err_input");
						return false;
					}
					if($("#u_pwd").val()!=$("#c_pwd").val()){
						$("#s_c_pwd").css("color","red");
						$("#s_c_pwd").html("两次输入密码不一致");
						$("#c_pwd").addClass("err_input");
						return false;
					}else{
						$("#s_c_pwd").html("");
						$("#c_pwd").removeClass("err_input");
						return true;
					}
				}
				$("#u_pwd").focus(function(){
					$("#u_pwd").addClass("input_input");
					$("#s_pwd").html("● 长度为 6-18 个字符");
					$("#s1_pwd").html("● 不允许有空格");
					if($("#u_pwd").val()!=''){
						checkpwd();
					}else{
						$("#s_pwd,#s1_pwd").css("color","#A9A9A9");
					}
				});
				
				$("#u_pwd").keyup(function(){
					if($("#u_pwd").val()!=''){
						//判断密码强度
						if(checkpwd()){
							check_str();
						}else{
							$("#pwd_str").children().css("background","#F8F8FF");
						}
					}else{
						$("#s_pwd,#s1_pwd").css("color","#A9A9A9");
						$("#pwd_str").children().css("background","#F8F8FF");
					}
				});
				
				$("#u_pwd").blur(function(){
					$("#u_pwd").removeClass("input_input");
					if($("#u_pwd").val()==""){
						$("#u_pwd").removeClass("err_input");
						$("#s_pwd,#s1_pwd").html("");	
						$("#corr_pwd").css("display","none");
						return;
					}
					//判断填写的密码是否符合规范
					if(checkpwd()){
						$("#corr_pwd").css("display","block");
						$("#s_pwd,#s1_pwd").html("");
					}else{
						$("#corr_pwd").css("display","none");
					}
					if($("#c_pwd").val()!=''){
						checkconpwd();
					}else{
						
					}
				});
				
				$("#c_pwd").focus(function(){
					$("#c_pwd").addClass("input_input");
				})
				$("#c_pwd").blur(function(){
					$("#c_pwd").removeClass("input_input");
					if($("#c_pwd").val()==''){
						$("#c_pwd").removeClass("err_input");
						$("#s_c_pwd").html("");
						return;
					}
					checkconpwd();
				});
				
				$("#sub").click(function(){
					var pwd = checkpwd();
					var conpwd = checkconpwd();
					if(pwd&&conpwd){
						$("#form1").submit();
					}
				});
        	})
        </script> 
	</head>
    
    
    
	<body>
    <form id="form1" action="web/findpwd/success" method="POST">
    	<input type="hidden" value="${key}" id="key" name="key"/>
	    <div class="R_top">
	        	<div class="top_box">
	            	<a href="web/index" target="_blank">
	            		<div class="logo_F"></div>
	            	</a>
	               
	            </div>
			</div>
	    
	    	<div class="register"  style="height: 430px;">
	    		<span class="R_title"   style="margin-left: 250px;"> 
	                <span class="red">*</span>
	                	新密码:
	            </span>
	            <div style="position:relative; display:inline-block;" >
	                <img src="static/img/web/register_img/lock.png" style="position:absolute; top:44px; left:15px; " />
	                <input class="div_input" id="u_pwd" type="password" name="u_pwd" placeholder="请输入登录密码" style="width:200px"/>
	            	<img id="corr_pwd" src="static/img/web/register_img/tick.png" style="display:none;position:absolute;right:10px;top:40px;" />
	            </div>
	            <div style="float:right;height:100px;width:400px;line-height:100px">
		            <ul>
		            	<li id="s_pwd" style="height:20px"></li>
		            	<li id="s1_pwd" style="height:20px"></li>
		            </ul>
	            </div>
	    		<br/>
	           		
	   			<ul id="pwd_str" style=" margin:20px 0px 0px 270px; overflow: hidden;  ">
	    			<li style="float:left; background-color:#F8F8FF;width:80px;text-align: center;  ">弱</li>
	    			<li style="float:left;background-color:#F8F8FF;width:80px;text-align: center; margin:0px 5px;">中</li>
	    			<li style="float:left;background-color:#F8F8FF;width:80px;text-align: center;">强</li>
	   			</ul>
	             <span class="R_title"  style="margin-left: 250px;"> 
	                <span class="red">*</span>
	                	确认密码:            
	            </span>
	            <div style="position:relative; display:inline-block;" >
	                <img src="static/img/web/register_img/lock.png" style="position:absolute; top:44px; left:15px;" />            
	            	<input class="div_input" id="c_pwd" type="password" name="c_pwd" placeholder="请再次输入登录密码" style="width:200px" />
	            </div>
	            <span id="s_c_pwd"></span>
	            <br/>
		            
	            <div style="display:inline-block;" >
	              	<button id="sub"  style="width:100px;background-size:100px 50px" type="button">提交</button>
	            </div>
		</div>
    </form>
    
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
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
		});
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "webcode.do?t=" + genTimestamp());
		}
	</script>
	</body>
</html>