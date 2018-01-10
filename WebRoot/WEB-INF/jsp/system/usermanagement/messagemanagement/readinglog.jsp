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
	$(function(){
		$("#nextpage").click(function(){
			var pageNumber = Number($("#pageNumber").val())+1;
			if(pageNumber>${pageCount}){
				return;
			}
			location.href = "messagemanagement/readingLog?messageid="+$("#messageid").val()+"&pageNumber="+pageNumber;
		});
		
		$("#provpage").click(function(){
			var pageNumber = Number($("#pageNumber").val())-1;
			if(pageNumber<1){
				return;
			}
			location.href = "messagemanagement/readingLog?messageid="+$("#messageid").val()+"&pageNumber="+pageNumber;
		});
	})
	</script>
</head>
<body  class="easyui-layout">
 <div  data-options="region:'center',title:'阅读记录',border:false" >
 	<input type="hidden" id="messageid" value="${messageid}"/>
		<div id="tb" style="padding: 3px;background-color:#ccc">
           <a onclick="javascript:history.go(-1);" class="easyui-linkbutton" iconCls="icon-back" plain="true">
           		返回
           	</a>
       </div>
	 <table  class="easyui-datagrid" style="width:100%;max-height: 522px"
            data-options="url:'datagrid_data1.json',method:'get',border:false,checkbox:true,singleSelect:false,fitColumns:false ">
            <thead>
                <tr>
					<th data-options="field:'xh',align:'center'" width="35">序号</th>
					<th data-options="field:'fssj',align:'center'" width="200">发送时间</th>
					<th data-options="field:'ydsj',align:'center'" width="200">阅读时间</th>
					<th data-options="field:'ydyh',align:'center'" width="130">阅读用户</th>
                </tr>
            </thead>
	           	<c:forEach var="read" items="${readList}" varStatus="vs">
					<tr class="read">
						<td>${(vs.index+1)+(pageNumber-1)*10 }</td>
						<td>
							${read.sendtime}
						</td>
						<td>
							${read.readingdate}
						</td>
						<td>${read.userid }</td>
					</tr>
				</c:forEach>
	           	<c:forEach var="unread" items="${unreadList}" varStatus="vs">
					<tr class="unread" style="display:none">
						<td>${(vs.index+1)+(pageNumber-1)*10 }</td>
						<td>
							${unread.sendtime}
						</td>
						<td>
							${unread.readingdate}
						</td>
						<td>${unread.userid }</td>
					</tr>
				</c:forEach>
				
        </table>
        	<c:if test="${empty unreadList&&empty readList}">
           	没有相关数据
          </c:if>
          <!-- 分页 -->
		 <div id="pag" style="margin-top:7px; width:100%;height:30px;line-height:30px;">
		 	<span style="float:right;margin-right:30px">&nbsp;&nbsp;&nbsp;&nbsp;${readCount}人已读；${unreadCount}人未读</span>
		 	<span id="nextpage" style="font-size:14px; cursor:pointer;float:right;">&nbsp;下一页</span>
		 	<span style="float:right;"><input id="pageNumber" readonly="readonly" style="text-align:center;width:15px" value="${pageNumber}">/ ${pageCount}</span>
		 	<span id="provpage" style="font-size:14px;cursor:pointer; float:right">上一页&nbsp;&nbsp;</span>
		 </div>
    </div>
</body>
</html>