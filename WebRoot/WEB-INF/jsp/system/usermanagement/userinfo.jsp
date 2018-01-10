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
</head>
<body  class="easyui-layout">
 <div  data-options="region:'center',title:'查看用户'">
		<div id="tb" style="padding: 3px;background-color:#ccc">
           <a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-back" onclick="history.go(-1)" plain="true">返回</a>
       </div>
	    	<input type="hidden" name="id" value="${user.id }" />
	    	<table cellpadding="5">
				<tr>
					<td>登录ip</td>
					<td>${user.ip}</td>
					<td>手机号</td>
					<td>${user.u_phone }</td>
					
				</tr>
				<tr>
					<td>姓名</td>
					<td>${user.u_name }</td>
					<td>性别</td>
					<td>
						<c:if test="${user.u_sex==0}">
							男
						</c:if>
						<c:if test="${user.u_sex==1}">
							女
						</c:if>
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>${user.u_email}</td>
					<td>注册时间</td>
					<td>${user.registerdate}</td>
				</tr>
				<tr>
					<td colspan="2">最后登录时间</td>
					<td colspan="2">${user.last_login}</td>
					
				</tr>
			</table>
    </div>
</body>
</html>