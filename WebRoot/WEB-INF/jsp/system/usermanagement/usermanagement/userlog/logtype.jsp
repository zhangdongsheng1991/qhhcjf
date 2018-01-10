<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>Basic Layout - jQuery EasyUI Demo</title>
	 <link rel="stylesheet" type="text/css" href="static/css/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/css/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="static/css/easyui/themes/demo.css">
	<script type="text/javascript" src="static/css/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/css/easyui/jquery.easyui.min.js"></script>
	<style>
		.round {
  			padding:10px; 
  			border-radius:15px;            /* W3C syntax */
  			float:left;
  			margin:100px 0 0 100px;
  		    height:100px;
  		    width:100px;
  		    cursor: pointer;
  		    background-image: url("static/img/web/common/loginlog.png");
  		    background-position: 0px 0px;
  		    border:none
		}
	</style>
	<script>
		function listloginlog(){
			location.href = "usermanagement/userlog/listloginlog?id="+$("#id").val();			
		}
	</script>
</head>
<body  class="easyui-layout">
	<input type="text" id="id" name="id" value="${id}"/>
 	<div  data-options="region:'center',title:'用户列表',border:false">
		<!--<div id="tb" style="padding: 3px;background-color:#ccc">
            <a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-add" onclick="newuser()" plain="true">添加</a>
           <a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-edit" onclick="edituser()" plain="true">修改</a>
           <a href="javascript:void(0)" class="easyui-linkbutton"
               iconCls="icon-cancel" plain="true" onclick="destroyUser()">删除</a> 
       </div>-->
       <div>
       		<button class="round" onclick="listloginlog()">
       		</button><br/>
       		<h3 style="float:left">登录记录</h3>
       		<button class="round">登录记录
       		</button><br/>
       		
       </div>
    </div>
</body>
</html>