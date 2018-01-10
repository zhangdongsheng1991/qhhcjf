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
		if(${edit=="true"}){
			$("#messagetype option:selected").siblings().attr("disabled",true);
		} 
		if(${mm.messagetype==0}){
			$("#addproduct").css("display","block");
		}
		if(${productlist!=null&&!productlist.isEmpty()}){
			$("#addproduct").css("display","block");
			$("#product_table").css("display","block");
		}
		$("#messagetype").change(function(){
			if($("#messagetype").val()==0){
				$("#addproduct").css("display","block");
				$("#product_table").css("display","block");
			}else{
				$("#addproduct").css("display","none");
				$("#product_table").css("display","none");
			}
		});
		
		$("#addproduct").click(function(){
			if($("input[name='ids']").length==0){
				window.open("messagemanagement/productlist","产品列表","height=600, width=600, top=50%, left=600px");
			}else{
				var idsstr="";
				var ids = $("input[name='ids']");	
				for(var i=0;i<ids.length;i++){
					idsstr += ids[i].value+"-";
				}
				window.open("messagemanagement/productlist?idstr="+idsstr,"产品列表","height=600, width=600, top=50%, left=600px");
			}
		});
	})
		/* function ss(){
			window.open("messagemanagement/showuser","_blank","height=500,width=400,left=650,top=170, scrollbars=no,location=no");
		} */
		function createproduct(id,typename,theissuername,productreferred){
			var table = $('#product_table');
			table.append("<tr class='"+id+"'>"+
							"<td style='display:none'><input name='ids' type='hidden' value='"+id+"'/></td><td>产品类型</td>"+
							"<td>"+typename+"</td>"+
						"</tr>"+
						"<tr class='"+id+"'>"+
							"<td>发行机构</td><td>"+theissuername+"</td>"+
						"</tr>"+
						"<tr class='"+id+"'>"+
							"<td>产品简称</td><td>"+productreferred+"</td>"+
						"</tr>")
		}
		function removeproduct(id){
			$("."+id).remove();
		}
		function submitForm(t){
			if($("#subject").val().trim()==''||$("#subject").val()==null){
				$.messager.alert('提示','[消息标题]不能为空!');
				return;
			}
			if($("#messagetype").val()=='0'){
				if($("input[name='ids']").val()==''||$("input[name='ids']").val()==null){
					$.messager.alert('提示','请添加产品信息!');
					return;
				}
			}
			$("#status").val(t);
			$("#Form1").submit();
		}
		function clearForm(){
			$('#Form1').form('clear');
		}
	</script>
</head>
<body  class="easyui-layout">
	
 <div data-options="region:'center',title:'编辑消息',border:false">
		<div id="tb" style="padding: 3px;background-color:#ccc">
			<a href="javascript:void(0)" class="easyui-linkbutton"
               iconcls="icon-back" onclick="location.href='/messagemanagement/listmessages?status=${status}&year=${year}&month=${month}&messagetype=${messagetype}'" plain="true">返回</a>
			<c:if test="${mm.status=='1'||mm.status==null}">
	    		 <a href="javascript:void(0)" class="easyui-linkbutton"
               		iconcls="icon-save" onclick="submitForm('1')" plain="true">保存</a>
	    		<a href="javascript:void(0)"  class="easyui-linkbutton"
               		iconcls="icon-ok" onclick="submitForm('0')" plain="true">
	    			发布
	    		</a>
	    	</c:if>
	    	<c:if test="${mm.status=='0'}">
	    		<a href="javascript:void(0)"  class="easyui-linkbutton"
               		iconcls="icon-redo" onclick="submitForm('1')" plain="true">
	    			撤回
	    		</a>
	    	</c:if>
          
       </div>
       <div>
		<c:if test="${info=='发布成功'}">
			<script>
				$(function(){
					$.messager.alert('提示','发布成功!');	
				})
			</script>
		</c:if>
		<c:if test="${info=='保存成功'}">
			<script>
				$(function(){
					$.messager.alert('提示','保存成功!');	
				})
			</script>
			<img src="static/img/web/register_img/tick.png" />保存成功
			<br/>
		</c:if>
		<c:if test="${info=='操作成功'}">
		<script>
			$(function(){
					$.messager.alert('提示','操作成功!');	
				})
			</script>
			<!-- <img src="static/img/web/register_img/tick.png" />操作成功
			<br/> -->
		</c:if>
		<c:if test="${status=='操作失败'}">
			<img src="static/img/web/register_img/false.png" />操作失败
			<br/>
		</c:if>
		</div>
	<form id="Form1" action="messagemanagement/saveMessage" method="post">
	    	<input type="hidden" name="id" value="${mm.id }" />
	    	<input type="hidden" name="year" value="${year }" />
	    	<input type="hidden" name="month" value="${month}" />
	    	<input type="hidden" id="messagetype1" name="messagetype1" value="${messagetype }" />
	    	<input id="status" type="hidden" name="status" value="${status }" />
	    	<input id="edit" name="edit" type="hidden" value="${edit}"/>
	    	<table id="message_table" cellpadding="5">
				<tr>
					<td>消息类型</td>
					<td>
						<select id="messagetype" name="messagetype" onchange="isproductinfo()" data-options="required:true">
							<option <c:if test='${mm.messagetype==1}'>selected="selected"</c:if>  value="1">系统消息</option>
							<option <c:if test='${mm.messagetype==0}'>selected="selected"</c:if>  value="0">产品消息</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<td>消息标题</td>
					<td>
						<input id="subject" type="text" name="subject" value="${mm.subject }" data-options="required:true"/>
					</td>
	    		</tr>
	    		<tr>
	    			<td>消息内容</td>
					<td>
						<input id="messagecontent"  type="text" name="messagecontent" value="${mm.messagecontent }" data-options="required:true"/>
					</td>
				</tr>
				<tr >
					<td colspan="2">
						<input id="addproduct" type="button" value="添加产品" style="display:none"/>
					</td>
				</tr>
	    	</table>
	    	
	    	
	    	<table id="product_table" cellpadding="5">
	    		<c:if test="${productlist!=null}">	
		    		<c:forEach var="product" items="${productlist}">
		    			<tr class='${product.ID}'>
							<td style='display:none'><input name='ids' type='hidden' value='${product.ID}'/></td>
							<td>产品类型</td>
							<td>
								<c:if test="${product.TYPE eq '1' }">信托</c:if>
								<c:if test="${product.TYPE eq '2' }">资管</c:if>
								<c:if test="${product.TYPE eq '3' }">契约</c:if>
							</td>
						</tr>
						<tr class='${product.ID}'>
							<td>发行机构</td><td>${product.THEISSUERNAME}</td>
						</tr>
						<tr class='${product.ID}'>
							<td>产品简称</td><td>${product.PRODUCTREFERRED}</td>
						</tr>
		    		</c:forEach>
		    	</c:if>
	    	</table>
	    </form>
    </div>
</body>
</html>