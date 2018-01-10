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
	
	function addeditmessage(id){
		var year = $("select[name='year']",window.parent.document).val();
		var month = $("select[name='month']",window.parent.document).val();
		$("#Frame2",parent.document.body).attr("src","messagemanagement/addEditMessage?id="+id+"&status="+$("#status").val()+"&messagetype="+$("#messagetype").val()+"&year="+year+"&month="+month);
	}
	function deletemessage(){
		var year = $("select[name='year']",window.parent.document).val();
		var month = $("select[name='month']",window.parent.document).val();
		if($("input[name='selectids']:checked").length==0){
			$.messager.alert('系统提示','请选择要删除的记录!');	
			return;
		}
		if(confirm("删除之后不可恢复，确定要删除吗？")){
			var ids = "";
			$("input[name='selectids']:checked").each(function(){
				ids+=$(this).val()+",";
			})
			ids = ids.substr(0,ids.length-1);
			location.href="messagemanagement/deleteMessage?ids="+ids+"&status="+$("#status").val()+"&messagetype="+$("#messagetype").val()+"&year="+year+"&month="+month;
		}else{
			
		}
	}
	
	function readingLog(){
		if($("input[name='selectids']:checked").length==0||
				$("input[name='selectids']:checked").length>1){
			$.messager.alert('系统提示','请选择一条已发布消息进行查看!');	
			return;
		}
		if($("input[name='selectids']:checked").length==1){
			$.ajax({
				type:"post",
				url:"messagemanagement/checkStatus",
				data:{"id":$("input[name='selectids']:checked").val()},
				datatype:"json",
				success:function(data){
					if(data){
						location.href = "messagemanagement/readingLog?messageid="+$("input[name='selectids']:checked").val();
					}else{
						$.messager.alert('系统提示','请选择一条已发布消息进行查看!');
						return;
					}
				}
			})
		}
	}
	$(function(){
		$("#nextpage").click(function(){
			var pageNumber = Number($("#pageNumber").val())+1;
			if(pageNumber>${pageCount}){
				return;
			}
			var status = $("#status").val();
			var messagetype = $("#messagetype").val();
			var year = $("#year").val();
			var month = $("#month").val();
			location.href = "messagemanagement/listmessages?status="+status+"&year="+year+"&month="+month+"&messagetype="+messagetype+"&pageNumber="+pageNumber;
		});
		
		$("#provpage").click(function(){
			var pageNumber = Number($("#pageNumber").val())-1;
			if(pageNumber<1){
				return;
			}
			var status = $("#status").val();
			var messagetype = $("#messagetype").val();
			var year = $("#year").val();
			var month = $("#month").val();
			location.href = "messagemanagement/listmessages?status="+status+"&year="+year+"&month="+month+"&messagetype="+messagetype+"&pageNumber="+pageNumber;
		});
	})
		
	
	</script>
</head>
<body  class="easyui-layout">
<input id="status" type="hidden" name="status" value="${status}">
<input id="messagetype" type="hidden" name="messagetype" value="${messagetype}">
<input id="year" type="hidden" value="${year}">
<input id="month" type="hidden" value="${month}">
 <div  data-options="region:'center',title:'消息列表',border:false">
		<div id="tb" style="padding: 3px;background-color:#ccc">
           <a class="easyui-linkbutton"
               iconcls="icon-add" onclick="addeditmessage('')" plain="true">添加</a>
          <!--  <a class="easyui-linkbutton"
               iconcls="icon-edit" onclick="edituser()" plain="true">修改</a> -->
           <a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="deletemessage()">
           		删除
           	</a>
           	
           	<a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="readingLog()">
           		查看阅读记录
           	</a>

       </div>
	 <table  class="easyui-datagrid" style="width:100%;max-height: 522px"
            data-options="method:'get',border:false,checkbox:true,singleSelect:false,fitColumns:false ">
            <thead>
                <tr>
                	<th data-options="field:'xz',align:'center'" width="32"></th>
					<th data-options="field:'xh',align:'center'" width="35">序号</th>
					<th data-options="field:'sffb',align:'center'" width="40">状态</th>
					<th data-options="field:'bj',align:'center'" width="40">编辑</th>
					<th data-options="field:'xxlx',align:'center'" width="80">消息类型</th>
					<th data-options="field:'xxbt',align:'center'" width="160">消息标题</th>
					<th data-options="field:'xxnr',align:'center'" width="160">消息内容</th>
					<th data-options="field:'cjsj',align:'center'" width="160">创建时间</th>
					<th data-options="field:'fbsj',align:'center'" width="160">发布时间</th>                  	
                </tr>
            </thead>
	           	<c:forEach var="message" items="${list}" varStatus="vs">
					<tr>
						<td><input name='selectids' type="checkbox" value="${message.id}"/></td>
						<td>${vs.index+1 }</td>
						<td>
							<c:if test="${message.status=='0'}">
								<img style="width:25px;height:25px" src="static/img/web/common/usable.png">
							</c:if>
							<c:if test="${message.status=='1'}">
								<img style="width:25px;height:25px" src="static/img/web/common/disable.png">
							</c:if>
						</td>
						<td><img onclick="addeditmessage('${message.id }');" style="cursor:pointer; width:20px;height:20px" src="static/img/web/common/edit.png"></td>
						<td>
							
							<c:if test="${message.messagetype=='0' }">
								产品消息
							</c:if>
							<c:if test="${message.messagetype=='1' }">
								系统消息
							</c:if>
						</td>
						<td>${message.subject }</td>
						<td>${message.messagecontent }</td>
						<td>${message.ctdate }</td>
						<td>${message.sendtime }</td>
					</tr>
				</c:forEach>
        </table>
        	<c:if test="${empty list}">
           		没有相关数据
          </c:if>
		 <!-- 分页 -->
		 <div id="pag" style="margin-top:7px; width:100%;height:30px;line-height:30px;">
		 	<span style="float:right;margin-right:30px">&nbsp;&nbsp;&nbsp;&nbsp;共 ${total} 条记录</span>
		 	<span id="nextpage" style="font-size:14px; cursor:pointer;float:right;">&nbsp;下一页</span>
		 	<span style="float:right;"><input id="pageNumber" readonly="readonly" style="text-align:center;width:15px" value="${pageNumber}">/ ${pageCount}</span>
		 	<span id="provpage" style="font-size:14px;cursor:pointer; float:right">上一页&nbsp;&nbsp;</span>
		 </div>
    </div>
</body>
</html>