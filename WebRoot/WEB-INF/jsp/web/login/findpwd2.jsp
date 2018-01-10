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
        		if($("#t").val()=="ok"){
        			$("#sub").attr("disabled","true");
        		}
        		//手机验证码倒计时
				var countdown=10;
				$("#btn").click(function(){ 
					$("#t").val("");
					$("#sub").removeAttr("disabled");  
					$.ajax({
						type:"POST",
						url:"web/generate",
						data:{"k":'${k}'},
						datatype:"json",
						success:function(data){
							if(data=="false"){
								$("#err_msg").html("");
								$("#err_msg").html("操作过于频繁,请明天再试");
								$("#err_msg").css("color","red");
								$("#btn").attr("disabled",true);
								$("#sub").attr("disabled",true);
								return;
							}
							if(data!=""){
								$("#temp_id2").val(data.split("_")[0]);
								$("#u_checkphone").val(data.split("_")[1]);
							}else{
								$("#err_msg").html("");
								$("#err_msg").html("验证超时");
								$("#err_msg").css("color","red");
								return;
							}
						}
					})
				});
				
				$("#sub").click(function(){
					if($("#err_msg").html()!="验证超时"){
						$.ajax({
							type:"POST",
							url:"web/checkphonecode",
							data:{"phonecode":$("#u_checkphone").val(),"temp_id2":$("#temp_id2").val(),"k":'${k}'},
							datatype:"json",
							success:function(data){
								if(data!=""&&data!="err"){
									$("#t").val("ok");
									location.href="web/findpwd/resetPassword?key="+data;
								}else if(data=="err"){
									$("#err_msg").html("");
									$("#err_msg").html("验证码错误");
								}else{
									$("#err_msg").html("");
									$("#err_msg").html("验证超时");
								}
							}
						})
					}else{
						location.href="web/findpwd/index";
					}
				})
        	})
        </script> 
	</head>
    
    
    
	<body>
    
    <div class="R_top">
        	<div class="top_box">
        	<input type="hidden" id="t"/>
            	<a href="web/index" target="_blank">
            		<div class="logo_F"></div>
            	</a>
               
            </div>
		</div>
    
    <div class="register" style="height: 430px;">
    		<span class="R_title" style="margin-left: 250px;"> 
                <span class="red">*</span>
             		   手机验证码:
            </span>
            <div style="position:relative; display:inline-block;" >
                <img src="static/img/web/register_img/code.png" style="position:absolute; top:44px; left:15px;" />
                <input class="div_input" style="width:170px" id="u_checkphone" type="text" name="u_checkphone"  placeholder="请输入手机验证码"/>
            </div>
            <input style="width:120px" type="button" id="btn" value="免费获取验证码" />
            <span id="c_checkphone"></span>
            <br/>
            <input type="hidden" id="temp_id2"/> 
            <span id="err_msg"></span>
             <div style="display:inline-block;" >
              	<button id="sub"  style="width:100px;background-size:100px 50px" type="button">提交</button>
              	 
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
	</body>
</html>