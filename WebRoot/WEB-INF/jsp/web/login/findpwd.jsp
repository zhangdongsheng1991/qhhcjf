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
        <link href="static/css/web/style.css" rel="stylesheet" type="text/css" />
        <link href="static/img/web/logo2.ico" rel="Shortcut Icon" />
        <link href="static/css/web/Sign_in.css" rel="stylesheet" type="text/css" /> 
        <script>
        	$(function(){
        		$("#u_phone").val("");
        		$("#webcode").val("");
        		
        		//手机验证码倒计时
				var countdown=10;
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
				});
        		
        		
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
										stauts=true;
									}else{
										$("#s_phone").css("color","red");
										$("#s_phone").html("该手机号未注册");
										$("#u_phone").addClass("err_input");
										$("#corr_phone").css("display","none");
										stauts = false;
									}
								}
								
							});
							return stauts;
						}
					}
				}
        		var checkwebcode = function(){
        			if($("#webcode").val().trim()==''){
        				$("#c_webcode").html("请输入验证码");
        				$("#c_webcode").css("color","red");
        				$("#webcode").addClass("err_input");
        				return false;
        			}else{
        				$("#c_webcode").html("");
        				return true;
        			}
        		}
        		
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
						return;
					}
					if(checkphone()){
						$("#s_phone").html("");
						$("#u_phone").removeClass("err_input");
					}else{
					}
				});
				
				//验证码
				$("#webcode").focus(function(){
					$("#webcode").removeClass("err_input");
					$("#webcode").addClass("input_input");
				});
				$("#webcode").blur(function(){
					$("#webcode").removeClass("input_input");
				});
				$("#sub").click(function(){
					var phone = checkphone();
					var webcode = checkwebcode();
					if(phone&&webcode){
						$.ajax({
							type:"POST",
							url:"web/checkwebcode",
							data:{"webcode":$("#webcode").val(),"phone":$("#u_phone").val()},
							datatype:"json",
							success:function(data){
								if(data!=null&&data!=""){
									location.href="web/findpwd/findpwd?k="+data;
								}else{
									$("#c_webcode").html("验证码错误");
									$("#c_webcode").css("color","red");
									changeCode();
								}
							}
						})
					}
				});
        	})
        </script> 
	</head>
    
    
    
	<body>
    
    <div class="R_top">
        	<div class="top_box">
            	<a href="web/index" target="_blank">
            		<div class="logo_F"></div>
            	</a>
               
            </div>
		</div>
    
    <div class="register" style="height: 430px;">
        	<span class="R_title"  style="margin-left: 250px;"> 
            	手机号:
            </span>
            <div style="position:relative; display:inline-block;" >
            	<img src="static/img/web/register_img/phone.png" style="position:absolute; top:44px; left:15px;" />
            	<input style="width:200px" class="div_input" id="u_phone" type="text" name="u_phone" placeholder="请输入手机号码" maxlength="11"/>
            </div>
            <span id="s_phone"></span>
            <br/>
             	<span class="R_title"  style="margin-left: 250px;"> 
             		   验证码:
            	</span>
	            <div style="position:relative; display:inline-block;" >
	                <input class="div_input" style="width:200px;font-size:20px" id="webcode" type="text" name="webcode"/>
	                <img style="height:30px;" id="codeImg" alt="点击更换"
								title="点击更换" src="" />
	               	 看不清?<a onclick="changeCode()" style="cursor: pointer;">换一张</a>
	            </div>
            <br/>
            	<span id="c_webcode"></span><br/>
            <div style="display:inline-block;" >
              	<button id="sub" style="width:100px;background-size:100px 50px" type="button">提交</button>
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