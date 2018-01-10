<%@page pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<title>网站用户管理_环成金服</title>
	<base href="<%=basePath%>">
	<link rel="Shortcut Icon" href="static/img/web/logo2.ico"> 
	<link rel="stylesheet" type="text/css" href="static/css/easyui/demo.css">
	<style>
		.selected{
			background:#3d444a;
		}
	</style>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script>
			if(top.location!=self.location){
				top.location=self.location;
			}
			$(function(){
				$("#userManagement").click(function(){
					$("#userManagement").addClass("selected");
					$("#userManagement").siblings().removeClass("selected");
					$("#Frame1").attr("src","usermanagement/leftsecond");
				});
				
				$("#messageManagement").click(function(){
					$("#messageManagement").addClass("selected");
					$("#messageManagement").siblings().removeClass("selected");
					$("#Frame1").attr("src","messagemanagement/messagetype");
				});
			})
		</script>
	</head>
		<body style="background:#F5F5F5">
			<div style="height:650px;width:100%;">
				<div style="width:100%;height:75px;background: #FFF">
					<img style="width:215px;padding-left: 30px;" src="static/img/web/img_index_logo_sign.png" alt="logo">
				</div>
				<div style="width:100%;height:650px">
				
					<ul style=" float: left;height:650px;width:15%;text-align: center; border-top:1px solid #000; background:#2e353b">
                    
						<li class="selected" id="userManagement" style="cursor:pointer;  text-align: center;height:50px; color:#FFF; font-size: 16px; line-height:50px;  border-bottom:1px solid #3d444a; ">
							<!--<img src="../static/img/user.png" style="padding-top:1px; height: 60px;width:60px;cursor: pointer;" title="用户管理" />
							<br/>-->
                           	 用户管理
						</li>
                        
						<li id="messageManagement" style="cursor:pointer; text-align: center;height:50px; color:#FFF; font-size: 16px; line-height:50px;  border-bottom:1px solid #3d444a;">
							<!--<img src="../static/img/user.png" style="height: 60px;width:60px;cursor: pointer;" title="权限管理" />
							<br/><span style="font-size: 14px">用户管理</span>-->
                          	 消息发布
						</li>
					</ul>
					<div style="float: left;width: 15%;">
					 	<iframe scrolling="yes" style="height:650px; width:100%; " ID="Frame1"  SRC="usermanagement/leftsecond" scrolling="no"></iframe>
					 </div>
					<div id="div_frame2" style="float: left;width:70%;">
					    <iframe style="height:650px;width:100%;" ID="Frame2" name="Frame2" SRC=""  STYLE="background-color: green"> 
					    </iframe>
					</div>
				</div>
			</div>
	</body>
</html>













