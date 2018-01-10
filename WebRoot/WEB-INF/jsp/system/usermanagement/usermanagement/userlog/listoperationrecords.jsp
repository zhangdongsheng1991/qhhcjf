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
         <a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-back" onclick="window.history.go(-1)" plain="true">返回上一页</a>

       </div>
	 <table class="easyui-datagrid" style="width:100%;"
            data-options="url:'datagrid_data1.json',method:'get',border:false,checkbox:true,singleSelect:false,fitColumns:false ">
            <thead>
                <tr>
                	<th data-options="field:'xh',align:'center'" width="35">序号</th>
					<th data-options="field:'operating_time',align:'center'" width="180">操作时间</th>
					<th data-options="field:'operate',align:'center'" width="300">操作内容</th>
					<th data-options="field:'comment',align:'center'" width="300">备注</th>
                </tr>
            </thead>
	           	<c:forEach var="operating_time" items="${list}" varStatus="vs">
					<tr>
						<td>${vs.index+1 }</td>
						<td>
							<fmt:formatDate value="${operating_time.operating_time }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>${operating_time.operate }</td>
						<td>${operating_time.comment }</td>
					</tr>
					
				</c:forEach>
        </table>
        <c:if test="${empty list}">
           	没有相关数据
          </c:if>
    </div>
</body>
</html>