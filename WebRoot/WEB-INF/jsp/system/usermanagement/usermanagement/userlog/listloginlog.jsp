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
		function operationrecords(u_phone,logincount){
			location.href = "usermanagement/userlog/operationrecords?u_phone="+u_phone+"&logincount="+logincount;
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
					<th data-options="field:'u_phone',align:'center'" width="140">登录用户</th>
					<th data-options="field:'logincount',align:'center'" width="100">登录次数</th>
					<th data-options="field:'logintime',align:'center'" width="160">登录时间</th>
					<th data-options="field:'ckjl',align:'center'" width="160">操作</th>
                </tr>
            </thead>
	           	<c:forEach var="user" items="${list}" varStatus="vs">
					<tr>
						<td>${vs.index+1 }</td>
						<td>${user.u_phone }</td>
						<td>${user.logincount }</td>
						<td>
							<fmt:formatDate value="${user.logintime }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							<a href="javascript:void(0)" class="easyui-linkbutton"
              				 iconcls="icon-search" onclick="operationrecords('${user.u_phone }','${user.logincount }')" plain="true">查看本次登录操作记录</a>
						</td>
					</tr>
					
				</c:forEach>
        </table>
        <c:if test="${empty list}">
           	没有相关数据
          </c:if>
    </div>
</body>
</html>