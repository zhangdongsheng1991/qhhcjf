<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#CATEGORY").val()==""){
			$("#CATEGORY").tips({
				side:3,
	            msg:'请输入类别',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CATEGORY").focus();
			return false;
		}
		if($("#QUESTION").val()==""){
			$("#QUESTION").tips({
				side:3,
	            msg:'请输入问题',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#QUESTION").focus();
			return false;
		}
		if($("#READING").val()==""){
			$("#READING").tips({
				side:3,
	            msg:'请输入阅读量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#READING").focus();
			return false;
		}
		if($("#PRIORITY").val()==""){
			$("#PRIORITY").tips({
				side:3,
	            msg:'请输入优先级',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRIORITY").focus();
			return false;
		}
		if($("#RSUV").val()==""){
			$("#RSUV").tips({
				side:3,
	            msg:'请输入是否精华',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RSUV").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="questions_answers/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">类别:</td>
				<td>
					<select name="CATEGORY" id="CATEGORY">
						<option <c:if test="${pd.CATEGORY=='信托'}">selected="selected"</c:if> value="信托">信托</option>
						<option <c:if test="${pd.CATEGORY=='基金'}">selected="selected"</c:if> value="基金">基金</option>
						<option <c:if test="${pd.CATEGORY=='债券'}">selected="selected"</c:if> value="债券">债券</option>
						<option <c:if test="${pd.CATEGORY=='股权'}">selected="selected"</c:if> value="股权">股权</option>
						<option <c:if test="${pd.CATEGORY=='理财'}">selected="selected"</c:if> value="理财">理财</option>
						<option <c:if test="${pd.CATEGORY=='证券'}">selected="selected"</c:if> value="证券">证券</option>
					</select>
					<input type="text" name="CATEGORY" id="CATEGORY" value="${pd.CATEGORY}" placeholder="这里输入类别" title="类别"/>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题:</td>
				<td><input type="text" name="QUESTION" id="QUESTION" value="${pd.QUESTION}"  placeholder="这里输入问题" title="问题"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">回答:</td>
				<td><textarea type="text" name="T_ANSWER" id="T_ANSWER" value="${pd.ANSWER}"  title="回答">${pd.ANSWER}</textarea></td>
			</tr> 
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">回答:</td>
				<td>
					<script  style="width:680px;height:800px;" id="ANSWER" name="ANSWER" type="text/plain">${pd.ANSWER}</script>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">阅读量:</td>
				<td><input type="number" name="READING" id="READING" value="${pd.READING}" maxlength="32" placeholder="这里输入阅读量" title="阅读量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">优先级:</td>
				<td><input type="number" name="PRIORITY" id="PRIORITY" value="${pd.PRIORITY}" maxlength="32" placeholder="这里输入优先级" title="优先级"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否精华:</td>
				<td>
					<select  name="RSUV" id="RSUV">
						<option <c:if test="${pd.RSUV eq '0' }">selected='selected'</c:if> value="0">否</option>
						<option <c:if test="${pd.RSUV eq '1' }">selected='selected'</c:if> value="1">是</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<!-- 配置文件 -->
    	<script type="text/javascript" src="static/ueditor/ueditor.config.js"></script>
   		<!-- 编辑器源码文件 -->
   		<script type="text/javascript" src="static/ueditor/ueditor.all.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//实例化编辑器
	        var ue = UE.getEditor('ANSWER');
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>