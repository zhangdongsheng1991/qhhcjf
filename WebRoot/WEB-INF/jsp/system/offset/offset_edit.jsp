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
		if(!$("#ISSUE").val()){
			$("#ISSUE").tips({
				side:3,
	            msg:'请输入发行机构 ',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ISSUE").focus();
			return false;
		}
		if(!$("#ORIENTATION").val()){
			$("#ORIENTATION").tips({
				side:3,
	            msg:'请输入投资方向 ',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ORIENTATION").focus();
			return false;
		}
		if(!$("#TRUSTEE").val()){
			$("#TRUSTEE").tips({
				side:3,
	            msg:'请输入托管人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TRUSTEE").focus();
			return false;
		}
		if(!$("#CUSTODIAN").val()){
			$("#CUSTODIAN").tips({
				side:3,
	            msg:'请输入管理人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CUSTODIAN").focus();
			return false;
		}
		if(!$("#CAPITALUSES").val()){
			$("#CAPITALUSES").tips({
				side:3,
	            msg:'请输入资金用途',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CAPITALUSES").focus();
			return false;
		}
		if(!$("#MAINTENANCE").val()){
			$("#MAINTENANCE").tips({
				side:3,
	            msg:'请输入管理费',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MAINTENANCE").focus();
			return false;
		}
		if(!$("#SCALE").val()){
			$("#SCALE").tips({
				side:3,
	            msg:'请输入预计发行规模',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SCALE").focus();
			return false;
		}
		if(!$("#COUNSELOR").val()){
			$("#COUNSELOR").tips({
				side:3,
	            msg:'请输入投资顾问',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COUNSELOR").focus();
			return false;
		}
		if(!$("#DEADLINE").val()){
			$("#DEADLINE").tips({
				side:3,
	            msg:'请输入投资期限',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DEADLINE").focus();
			return false;
		}
		
		if(!$("#THRESHOLD").val()){
			$("#THRESHOLD").tips({
				side:3,
	            msg:'请输入投资门槛',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#THRESHOLD").focus();
			return false;
		}
		if(!$("#SHARING").val()){
			$("#SHARING").tips({
				side:3,
	            msg:'请输入收益分成',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SHARING").focus();
			return false;
		}
		if(!$("#COMMENTS").val()){
			$("#COMMENTS").tips({
				side:3,
	            msg:'请输入专家点评',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMMENTS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="offset/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">名称:</td>
				<td style="width:200px;"><input type="text" name="NAME" id="NAME" value="${pd.NAME}"  placeholder="这里输入名称" title="名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">发行机构:</td>
				<td><input type="text" name="ISSUE" id=ISSUE value="${pd.ISSUE}"  placeholder="这里输入发行机构" title="发行机构"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">投资方向:</td>
				<td><input type="text" name="ORIENTATION" id="ORIENTATION" value="${pd.ORIENTATION}"  placeholder="这里输入投资方向" title="投资方向"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">托管人:</td>
				<td><input type="text" name="TRUSTEE" id="TRUSTEE" value="${pd.TRUSTEE}"  placeholder="这里输入托管人" title="托管人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">管理人:</td>
				<td><input type="text" name="CUSTODIAN" id="CUSTODIAN" value="${pd.CUSTODIAN}"  placeholder="这里输入管理人" title="管理人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">资金用途:</td>
				<td><input type="text" name="CAPITALUSES" id="CAPITALUSES" value="${pd.CAPITALUSES}"  placeholder="这里输入资金用途" title="资金用途"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">管理费:</td>
				<td><input type="text" name="MAINTENANCE" id="MAINTENANCE" value="${pd.MAINTENANCE}"  placeholder="这里输入管理费" title="管理费"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">发行规模:</td>
				<td><input type="text" name="SCALE" id="SCALE" value="${pd.SCALE}"  placeholder="这里输入发行规模" title="发行规模"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">投资顾问:</td>
				<td><input type="text" name="COUNSELOR" id="COUNSELOR" value="${pd.COUNSELOR}"  placeholder="这里输入投资顾问" title="投资顾问"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">投资期限:</td>
				<td><input type="text" name="DEADLINE" id="DEADLINE" value="${pd.DEADLINE}"  placeholder="这里输入投资期限" title="投资期限"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">投资门槛:</td>
				<td><input type="text" name="THRESHOLD" id="THRESHOLD" value="${pd.THRESHOLD}"  placeholder="这里输入投资门槛" title="投资门槛"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">收益分成:</td>
				<td><input type="text" name="SHARING" id="SHARING" value="${pd.SHARING}"  placeholder="这里输入收益分成" title="收益分成"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">专家点评:</td>
				<td><input type="text" name="COMMENTS" id="COMMENTS" value="${pd.COMMENTS}"  placeholder="这里输入专家点评" title="专家点评"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">排序:</td>
				<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}"  placeholder="这里输入排序" title="排序"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">详情:</td>
				<td>
					<script  style="width:680px;height:800px;" id="INTRO" name="INTRO" type="text/plain">${pd.INTRO}</script>
					<input type="text" name="INTRO" id="INTRO" value="${pd.INTRO}"  placeholder="这里输入详情" title="详情"/>
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
	        var ue = UE.getEditor('INTRO');
	        
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>