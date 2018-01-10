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
	<script>
		function submitForm(){
			$("#Form1").submit();
		}
		function clearForm(){
			$('#Form1').form('clear');
		}
	</script>
</head>
<body  class="easyui-layout">
 <div  data-options="region:'center',title:'编辑用户'">
		<div id="tb" style="padding: 3px;background-color:#ccc">
           <a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-back" onclick="location.href='/usermanagement/showUser?id=${treeId}'" plain="true">返回</a>
           <a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-save" onclick="submitForm()" plain="true">保存</a>
       </div>
       <div>
		<c:if test="${status=='ok'}">
			<img src="static/img/web/register_img/tick.png" />保存成功
			<br/>
		</c:if>
		<c:if test="${status=='err'}">
			<img src="static/img/web/register_img/false.png" />保存失败
			<br/>
		</c:if>
		</div>
	 <form id="Form1" action="usermanagement/saveuser" method="post">
	    	<input type="hidden" name="id" value="${user.id }" />
	    	<input type="hidden" id="treeId" name="treeId" value="${treeId}" />
	    	<table cellpadding="5">
	    		<tr>
	    			<td>是否禁用</td>
					<td>
						<select id="disable" name="disable">
							<option <c:if test="${user.disable==0}"> selected="selected"</c:if> value="0">启用</option>
							<option <c:if test="${user.disable==1}"> selected="selected"</c:if> value="1">禁用</option>
						</select>
					
					</td>
				</tr>
				<tr>
					<td>登录ip</td>
					<td>
						${user.ip}
						<input type="hidden" name="ip" value="${user.ip}" data-options="required:false"/>
					</td>
				</tr>
				<tr>
					<td>手机号</td>
					<td>
						${user.u_phone }
						<input type="hidden" name="u_phone" value="${user.u_phone }" data-options="required:true"/>
					</td>
	    		</tr>
	    		<tr>
	    			<td>姓名</td>
					<td>
						${user.u_name }
						<input  type="hidden" name="u_name" value="${user.u_name }" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td>性别</td>
					<td>
						<c:if test="${user.u_sex==0}">
							男
						</c:if>
						<c:if test="${user.u_sex==1}">
							女
						</c:if>
						<input type="hidden" name="u_sex" value="${user.u_sex}" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>
						${user.u_email}
						<input type="hidden" name="u_email" value="${user.u_email}" data-options="required:false"/>
					</td>
				</tr>
				<tr>
					<td>注册时间</td>
					<td>
						${user.registerdate}
						<input  type="hidden" name="registerdate" value="${user.registerdate}" data-options="required:true"/>
					</td>
	    		</tr>
	    	</table>
	    </form>
    </div>
</body>
</html>