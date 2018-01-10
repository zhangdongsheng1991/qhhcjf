<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入产品名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if(!$("#ORGANIZATION").val()){
			$("#ORGANIZATION").tips({
				side:3,
	            msg:'请输入发行机构',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ORGANIZATION").focus();
			return false;
		}
		if(!$("#SCALE").val()){
			$("#SCALE").tips({
				side:3,
	            msg:'请输入融资规模',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SCALE").focus();
			return false;
		}
		if(!$("#INIMONEY").val()){
			$("#INIMONEY").tips({
				side:3,
	            msg:'请输入起投金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INIMONEY").focus();
			return false;
		}
		if(!$("#ALLOCATION").val()){
			$("#ALLOCATION").tips({
				side:3,
	            msg:'请输入利息分配',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ALLOCATION").focus();
			return false;
		}
		if(!$("#EXPIRES").val()){
			$("#EXPIRES").tips({
				side:3,
	            msg:'请输入产品期限',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXPIRES").focus();
			return false;
		}
		if(!$("#TYPE").val()){
			$("#TYPE").tips({
				side:3,
	            msg:'请输入产品类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
			return false;
		}
		if(!$("#STANDARD").val()){
			$("#STANDARD").tips({
				side:3,
	            msg:'请输入收益基准',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STANDARD").focus();
			return false;
		}
		if(!$("#STATUS").val()){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入产品状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		if(!$("#COMMENTS").val()){
			$("#COMMENTS").tips({
				side:3,
	            msg:'请输入产品点评',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMMENTS").focus();
			return false;
		}
		if(!$("#DIRECTION").val()){
			$("#DIRECTION").tips({
				side:3,
	            msg:'请输入投资方向',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DIRECTION").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="setincrease/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<input type="hidden" name="INVESTMENTSTARTINGSTATE" id="INVESTMENTSTARTINGSTATE"/>
		<input type="hidden" name="PRODUCTDEADLINESTATE" id="PRODUCTDEADLINESTATE"/>
		<input type="hidden" name="RETURNSBENCHMARKSTATE" id="RETURNSBENCHMARKSTATE"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品全称:</td>
				<td style="width:200px;"><input type="text" name="NAME" id="NAME" value="${pd.NAME}"  placeholder="这里输入全称" title="全称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">发行机构:</td>
				<td><input type="text" name="ORGANIZATION" id=ORGANIZATION value="${pd.ORGANIZATION}"  placeholder="这里输入发行机构" title="发行机构"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">融资规模:</td>
				<td><input type="text" name="SCALE" id="SCALE" value="${pd.SCALE}"  placeholder="这里输入融资规模" title="融资规模"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">起投金额:</td>
				<td><input type="text" name="INIMONEY" id="INIMONEY" value="${pd.INIMONEY}"  placeholder="这里输入起投金额" title="起投金额"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">利息分配:</td>
				<td><input type="text" name="ALLOCATION" id="ALLOCATION" value="${pd.ALLOCATION}"  placeholder="这里输入利息分配" title="利息分配"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品期限:</td>
				<td><input type="text" name="EXPIRES" id="EXPIRES" value="${pd.EXPIRES}"  placeholder="这里输入产品期限" title="产品期限"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品类型:</td>
				<td><input type="text" name="TYPE" id="TYPE" value="${pd.TYPE}"  placeholder="这里输入产品类型" title="产品类型"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">收益基准:</td>
				<td><input type="text" name="STANDARD" id="STANDARD" value="${pd.STANDARD}"  placeholder="这里输入收益基准" title="收益基准"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品状态:</td>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}"  placeholder="这里输入产品状态" title="产品状态"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品点评:</td>
				<td><input type="text" name="COMMENTS" id="COMMENTS" value="${pd.COMMENTS}"  placeholder="这里输入产品点评" title="产品点评"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">投资方向:</td>
				<td><input type="text" name="DIRECTION" id="DIRECTION" value="${pd.DIRECTION}"  placeholder="这里输入投资方向" title="投资方向"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">排序:</td>
				<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}"  placeholder="这里输入排序" title="排序"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">详情:</td>
				<td>
					<script  style="width:680px;height:800px;" id="DETAILS" name="DETAILS" type="text/plain">${pd.DETAILS}</script>
					<input type="text" name="DETAILS" id="DETAILS" value="${pd.DETAILS}"  placeholder="这里输入详情" title="详情"/>
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
	        var ue = UE.getEditor('DETAILS');
	        
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>