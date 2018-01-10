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
	
		function showuser(id){
			$("#Frame2",parent.document.body).attr("src","usermanagement/showUser?id="+id);
		}
		
		function edituser(id){
			$("#Frame2",parent.document.body).attr("src","usermanagement/edituser?id="+id+"&treeId="+$("#treeId").val());
		}
	</script>
</head>
<body  class="easyui-layout">
	<input type="text" id="treeId" name="treeId" value="${treeId}"/>
 <div  data-options="region:'center',title:'用户列表',border:false">
		<div id="tb" style="padding: 3px;background-color:#ccc">
         <!--   <a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-add" onclick="newuser()" plain="true">添加</a>
           <a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-edit" onclick="edituser()" plain="true">修改</a>
           <a href="javascript:void(0)" class="easyui-linkbutton"
               iconCls="icon-cancel" plain="true" onclick="destroyUser()">删除</a> -->

       </div>
	 <table class="easyui-datagrid" style="width:100%;"
            data-options="url:'datagrid_data1.json',method:'get',border:false,checkbox:true,singleSelect:false,fitColumns:false ">
            <thead>
                <tr>
                	<th data-options="field:'xh',align:'center'" width="35">序号</th>
					<th data-options="field:'sfjy',align:'center'" width="60">是否禁用</th>
					<th data-options="field:'bj',align:'center'" width="40">编辑</th>
					<th data-options="field:'sjh',align:'center'" width="160">手机号</th>
					<th data-options="field:'dlcs',align:'center'" width="160">登录次数</th>
					<th data-options="field:'yhm',align:'center'" width="160">用户名</th>
					<th data-options="field:'yx',align:'center'" width="160">邮箱</th>
					<th data-options="field:'zcsj',align:'center'" width="160">注册时间</th>
                </tr>
            </thead>
	           	<c:forEach var="user" items="${list}" varStatus="vs">
	           		
					<tr>
						<td>${vs.index+1 }</td>
						<td>
							<c:if test="${user.disable=='0'}">
								<img style="width:25px;height:25px" src="static/img/web/common/usable.png">
							</c:if>
							<c:if test="${user.disable=='1'}">
								<img style="width:25px;height:25px" src="static/img/web/common/disable.png">
							</c:if>
						</td>
						<td><img onclick="edituser('${user.id }');" style="cursor:pointer; width:20px;height:20px" src="static/img/web/common/edit.png"></td>
						<td>${user.u_phone }</td>
						<td>${user.logincount }</td>
						<td>${user.u_name }</td>
						<td>${user.u_email }</td>
						<td>${user.registerdate }</td>
					</tr>
					
				</c:forEach>
        </table>
        <c:if test="${empty list}">
           	没有相关数据
          </c:if>
    </div>
</body>
</html>