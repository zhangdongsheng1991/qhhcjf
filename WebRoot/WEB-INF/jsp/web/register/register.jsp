<%@page pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath %>">
		<meta charset="utf-8">
        <title>用户注册__环成金服</title>
        <link href="static/img/web/logo2.ico" rel="Shortcut Icon" />
    	<script src="static/js/jquery-1.7.2.js" type="text/javascript"></script>
		<script>
		 var clock = '';
		 var nums = 10;
		 var btn;
		 function sendCode(thisBtn){ 
		 	btn = thisBtn;
		 	btn.disabled = true; //将按钮置为不可点击
		 	btn.value = nums+'秒后重新获取';
		 	clock = setInterval(doLoop, 1000); //一秒执行一次
		 	$.ajax({
		 		type:"POST",
				url:"web/sendphonecode",
				data:{},
				datatype:"json",
				success: function(data){
					
				}
		 	});
		 }
		 function doLoop() {
		 	nums--;
		 	if(nums > 0){
		  		btn.value = nums+'秒后可重新获取';
		 	}else{
		  		clearInterval(clock); //清除js定时器
		  		btn.disabled = false;
		  		btn.value = '免费获取验证码';
		  		nums = 10; //重置时间
		 	}
		}	
		
		
			$(function(){
				$("#u_phone").val("");
				$("#u_pwd").val("");
				$("#c_pwd").val("");
				$("#u_name").val("");
				$("#u_email").val("");
				$("#u_checkphone").val("");
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
				//检查手机号
				var checkphone = function(){
					if($("#u_phone").val().trim()==''){
						$("#s_phone").css("color","red");
						$("#s_phone").html("手机号不能为空");
						$("#u_phone").addClass("err_input");
						return false;
					}else{
						var reg = /^1[34578]\d{9}$/;
						if(!reg.test($("#u_phone").val())){
							$("#s_phone").css("color","red");
							$("#s_phone").html("手机号格式不正确");
							$("#u_phone").addClass("err_input");
							return false;
						}else{
							var stauts;
							$.ajax({
								async:false,
								type:"POST",
								url:"web/checkphone",
								data:{"phone":$("#u_phone").val()},
								datatype:"json",
								success: function(data){
									if(data){
										$("#s_phone").css("color","red");
										$("#s_phone").html("该手机号已注册");
										$("#u_phone").addClass("err_input");
										$("#corr_phone").css("display","none");
										stauts = false;
									}else{
										stauts = true;
									}
								}
								
							});
							return stauts;
						}
					}
				}
				//判断验证码
				var checkphonecode = function(){
					if($("#u_checkphone").val().trim()==""){
						$("#c_checkphone").css("color","red");
						$("#c_checkphone").html("手机验证码不能为空");
						$("#u_checkphone").addClass("err_input");
						return false;
					}else{
						if(checkphone()){
							$("#c_checkphone").html("");
							$("#u_checkphone").removeClass("err_input");
							return true;
						}
					}
					//判断手机验证码
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
				
				//手机验证码倒计时
				/* var countdown=10;
				$("#btn").click(function(){ 
					if(checkphone()){
						if (countdown == 0){
							$("#btn").removeAttr("disabled");	
							$("#btn").val("免费获取验证码");
							countdown=10;
							return;
						}else{ 
							$("#btn").attr("disabled", true); 
							$("#btn").val(""+countdown+""); 
							countdown--; 
						} 
						setTimeout(function() { 
							$("#btn").click() 
						},1000) 
					}
				}); */
				
				
				
				//验证手机
				$("#u_phone").focus(function(){
					$("#s_phone").html("请输入中国大陆手机号");
					$("#s_phone").css("color","#A9A9A9");
					$("#u_phone").removeClass("err_input");
					$("#u_phone").addClass("input_input");
				});
				$("#u_phone").blur(function(){
					$("#u_phone").removeClass("input_input");
					if($("#u_phone").val()==''){
						$("#s_phone").html("");
						$("#corr_phone").css("display","none");
						return;
					}
					if(checkphone()){
						$("#corr_phone").css("display","block");
						$("#s_phone").html("");
						$("#u_phone").removeClass("err_input");
					}else{
						$("#corr_phone").css("display","none");
					}
				});
				
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
				
				$("#u_checkphone").focus(function(){
					$("#u_checkphone").addClass("input_input");
				});
				$("#u_checkphone").blur(function(){
					$("#u_checkphone").removeClass("input_input");
					
					if($("#u_checkphone").val()==''){
						$("#u_checkphone").removeClass("err_input");
						$("#c_checkphone").html("");
						return;
					}
				});
				
				$("#u_email").focus(function(){
					$("#u_email").addClass("input_input");
				});
				$("#u_email").blur(function(){
					$("#u_email").removeClass("input_input");
					if($("#u_email").val()==""){
						$("#u_email").removeClass("err_input");
						$("#s_email").html("");
						$("#corr_email").css("display","none");
					}
					var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
					if($("#u_email").val().trim()!=''&&!reg.test($("#u_email").val())){
						$("#s_email").css("color","red");
						$("#s_email").html("邮箱格式不正确");
						$("#corr_email").css("display","none");
						$("#u_email").addClass("err_input");
						return;
					}else if($("#u_email").val().trim()!=''&&reg.test($("#u_email").val())){
						$("#s_email").html("");
						$("#u_email").removeClass("err_input");
						$("#corr_email").css("display","block");
					}else{
						$("#corr_email").css("display","none");
					}
				});
				$("#u_name").blur(function(){
					/**if($("#u_name").val().trim()==''){
						$("#s_name").css("color","red");
						$("#s_name").html("用户名不能为空");
						$("#u_name").addClass("err_input");
						return;
					}else{
						namemsg = "";
						$("#s_name").html("");
						$("#u_name").removeClass("err_input");
					}**/
				});
				$("#webcode").focus(function(){
					$("#webcode").addClass("input_input");
				});
				$("#register").click(function(){
					var pwd = checkpwd();
					var phone = checkphone();
					var conpwd = checkconpwd();
					//var phonecode = checkphonecode();
					if($("#webcode").val().trim()==''){
						$("#c_webcode").html("请输入验证码")
						$("#c_webcode").css("color","red");
						$("#webcode").addClass("err_input");
						return;
					}
					
					if(pwd&&phone&&conpwd){
						var data = {};
						data.u_phone = $("#u_phone").val();
						data.u_name=" ";
						data.u_pwd = $("#u_pwd").val();
						data.u_email = $("#u_email").val();
						data.webcode = $("#webcode").val();
						$.ajax({
							type:"POST",
							url:"web/saveUser",
							data:data,
							datatype:"json",
							success: function(data){
								if(data=="errcode"){
									$("#c_webcode").html("验证码错误");
									$("#c_webcode").css("color","red");
									$("#webcode").addClass("err_input");
									changeCode();
									return;
								}
								if(data){
									$("#div_register").empty();
									$("#div_register").append(
										"<div style='text-align:center;padding-top:25px'><img id='corr_pwd' src='static/img/web/register_img/success.png' style='width:87px;height:87px' /></div>"+
								    	"<div style='font-size:40px;text-align:center;padding-top:20px'>注册成功</div>"+
								    	"<div style='text-align:center; height:100px; width:1040px; margin-top: 100px;'>"+
									    	"<button onclick=\"location.href='web/login'\" id='register' style='width:350px; margin: 0px 345px;' type='button'>"+
									    		"立即登录"+
									    	"</button><br/><br/>"+
									    	"<button onclick=\"location.href='web/index'\" id='register' style='width:350px; margin: 0px 345px;' type='button'>"+
								    		"进入首页"+
								    		"</button>"+
								    	"</div>'"
							    	);
								}else{
									
								}
							}
							
						});
					}else{
					}
				});
			})
			$(document).ready(function() {
				changeCode();
				$("#codeImg").bind("click", changeCode);
			});
			function genTimestamp() {
				var time = new Date();
				return time.getTime();
			}
	
			function changeCode() {
				$("#codeImg").attr("src", "webcode.do?t=" + genTimestamp()+"&type=register");
			}
		</script>
            <link href="static/css/web/Sign_in.css" rel="stylesheet" type="text/css" /> 
             <link href="static/css/web/style.css" rel="stylesheet" type="text/css" />
        
	</head>
    
    
	<body>
	
    	<div class="R_top">
        	<div class="top_box">
            	<a href="http://www.qhhcjf.com/web/index" target="_blank">
            		<div class="logo_R">环成金服</div>
            	</a>
                
                <div class="R_top_box">
                		已注册? &nbsp;<a class="denglu red" href="web/login">立即登录</a>
                </div>
                
            </div>
		</div>
    
    
    <div id="div_register" class="register">
    		<!-- <span class="R_title"> 
                	如何称呼您:
            </span>
            <div style="position:relative; display:inline-block;" >
                <img src="static/img/web/register_img/name.png" style="position:absolute; top:44px; left:15px;" />
            	<input class="div_input" id="u_name" type="text" name="u_name" placeholder="" />
            </div>
            <span id="s_name"></span>
            <br/> -->
            <span class="R_title"> 
                <span class="red">*</span>手机号:
            </span>
            
            <div style="position:relative; display:inline-block;" >
            	<img src="static/img/web/register_img/phone.png" style="position:absolute; top:44px; left:15px;" />
            	<input class="div_input" id="u_phone" type="text" name="u_phone" placeholder="请输入手机号码" maxlength="11"/>
            	<img id="corr_phone" src="static/img/web/register_img/tick.png" style="display:none;position:absolute;right:10px; top:40px;" />
            </div>
            <span id="s_phone"></span>
            <br/>
            
            <span class="R_title"> 
                <span class="red">*</span>
                密&nbsp;&nbsp;码:
            </span>
            <div style="position:relative; display:inline-block;" >
                <img src="static/img/web/register_img/lock.png" style="position:absolute; top:44px; left:15px; " />
                <input class="div_input" id="u_pwd" type="password" name="u_pwd" placeholder="请输入登录密码" />
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
           		
           	
          
            
             <span class="R_title"> 
                <span class="red">*</span>
                确认密码:            
            </span>
            <div style="position:relative; display:inline-block;" >
                 <img src="static/img/web/register_img/lock.png" style="position:absolute; top:44px; left:15px;" />            
            	<input class="div_input" id="c_pwd" type="password" name="c_pwd" placeholder="请再次输入登录密码" />
            </div>
            <span id="s_c_pwd"></span>
            <br/>
            
            <!-- <span class="R_title"> 
                <span class="red">*</span>
             		   手机验证码:
            </span>
            <div style="position:relative; display:inline-block;" >
                <img src="static/img/web/register_img/code.png" style="position:absolute; top:44px; left:15px;" />
                <input class="div_input" style="width:170px" id="u_checkphone" type="text" name="u_checkphone"  placeholder="请输入手机验证码"/>
            </div>
            <input style="width:120px" type="button" id="btn"  onclick="sendCode(this)" value="免费获取验证码" />
            <span id="c_checkphone"></span>
            <br/> -->
            
           <span class="R_title"> 
              	  邮&nbsp;&nbsp;箱:
            </span>
             <div style="position:relative; display:inline-block;" >
                <img src="static/img/web/register_img/e-mail.png" style="position:absolute; top:44px; left:15px;" />
            	<input class="div_input" id="u_email" type="text" name="u_email" placeholder="请输入邮箱地址" />
            	<img id="corr_email" src="static/img/web/register_img/tick.png" style="display:none;position:absolute;right:10px; top:40px;" />
            </div>
            <span id="s_email"></span>
            <br/>
            
            <span class="R_title"> 
              	  验证码:
            </span>
             <div style="position:relative; display:inline-block;" >
            	<input class="div_input" style="width:200px;font-size:20px" id="webcode" type="text" name="webcode"/>
                <img style="height:30px;" id="codeImg" alt="点击更换"
							title="点击更换" src="" />
               	 看不清?<a onclick="changeCode()" style="cursor: pointer;">换一张</a>
            </div>
            <span id="c_webcode"></span>
            <br/>
            <br/>
			
			<button id="register" type="button">立即注册</button>
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
    
    
    </body>
</html>