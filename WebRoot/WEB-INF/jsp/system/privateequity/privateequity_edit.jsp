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
		if($("#PROJECTFULLNAME").val()==""){
			$("#PROJECTFULLNAME").tips({
				side:3,
	            msg:'请输入选择类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROJECTFULLNAME").focus();
			return false;
		}
		if($("#REGULATORYAGENCY").val()==""){
			$("#REGULATORYAGENCY").tips({
				side:3,
	            msg:'请输入产品名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REGULATORYAGENCY").focus();
			return false;
		}
		if(!$("#DURATION").val()){
			$("#DURATION").tips({
				side:3,
	            msg:'请输入产品简称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DURATION").focus();
			return false;
		}
		if(!$("#TARGETSCALE").val()){
			$("#TARGETSCALE").tips({
				side:3,
	            msg:'请输入收益基准',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TARGETSCALE").focus();
			return false;
		}
		if(!$("#INVESTMENTTHRESHOLD").val()){
			$("#INVESTMENTTHRESHOLD").tips({
				side:3,
	            msg:'请输入投资起点',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INVESTMENTTHRESHOLD").focus();
			return false;
		}
		if(!$("#INVESTMENTORIENTATION").val()){
			$("#INVESTMENTORIENTATION").tips({
				side:3,
	            msg:'请输入产品期限',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INVESTMENTORIENTATION").focus();
			return false;
		}
		if(!$("#WHETHERORNOTTOBUY").val()){
			$("#WHETHERORNOTTOBUY").tips({
				side:3,
	            msg:'请输入产品点评',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHETHERORNOTTOBUY").focus();
			return false;
		}
		if(!$("#ORGANIZATIONFORM").val()){
			$("#ORGANIZATIONFORM").tips({
				side:3,
	            msg:'请输入发行机构',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ORGANIZATIONFORM").focus();
			return false;
		}
		if(!$("#RECRUITMENTSTATUS").val()){
			$("#RECRUITMENTSTATUS").tips({
				side:3,
	            msg:'请输入预计发行规模',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RECRUITMENTSTATUS").focus();
			return false;
		}
		if(!$("#MANAGEMENTEXPENSE").val()){
			$("#MANAGEMENTEXPENSE").tips({
				side:3,
	            msg:'请输入利息分配',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MANAGEMENTEXPENSE").focus();
			return false;
		}
		if(!$("#EXPERTCOMMENT").val()){
			$("#EXPERTCOMMENT").tips({
				side:3,
	            msg:'请输入信托类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXPERTCOMMENT").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="privateequity/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">项目全称:</td>
				<td style="width:200px;"><input type="text" name="PROJECTFULLNAME" id="PROJECTFULLNAME" value="${pd.PROJECTFULLNAME}"  placeholder="这里输入项目全称" title="项目全称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">管理机构:</td>
				<td><input type="text" name="REGULATORYAGENCY" id=REGULATORYAGENCY value="${pd.REGULATORYAGENCY}"  placeholder="这里输入管理机构" title="管理机构"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">存续期限:</td>
				<td><input type="text" name="DURATION" id="DURATION" value="${pd.DURATION}"  placeholder="这里输入存续期限" title="存续期限"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">目标规模:</td>
				<td><input type="text" name="TARGETSCALE" id="TARGETSCALE" value="${pd.TARGETSCALE}"  placeholder="这里输入目标规模" title="目标规模"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">投资门槛:</td>
				<td><input type="text" name="INVESTMENTTHRESHOLD" id="INVESTMENTTHRESHOLD" value="${pd.INVESTMENTTHRESHOLD}"  placeholder="这里输入投资门槛" title="投资门槛"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">投资方向:</td>
				<td><input type="text" name="INVESTMENTORIENTATION" id="INVESTMENTORIENTATION" value="${pd.INVESTMENTORIENTATION}"  placeholder="这里输入投资方向" title="投资方向"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">有无悔购:</td>
				<td><input type="text" name="WHETHERORNOTTOBUY" id="WHETHERORNOTTOBUY" value="${pd.WHETHERORNOTTOBUY}"  placeholder="这里输入有无悔购" title="有无悔购"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">组织形式:</td>
				<td><input type="text" name="ORGANIZATIONFORM" id="ORGANIZATIONFORM" value="${pd.ORGANIZATIONFORM}"  placeholder="这里输入组织形式" title="组织形式"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">募集状态:</td>
				<td><input type="text" name="RECRUITMENTSTATUS" id="RECRUITMENTSTATUS" value="${pd.RECRUITMENTSTATUS}"  placeholder="这里输入募集状态" title="募集状态"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">管 理 费:</td>
				<td><input type="text" name="MANAGEMENTEXPENSE" id="MANAGEMENTEXPENSE" value="${pd.MANAGEMENTEXPENSE}"  placeholder="这里输入管 理 费" title="管 理 费"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">专家点评:</td>
				<td><input type="text" name="EXPERTCOMMENT" id="EXPERTCOMMENT" value="${pd.EXPERTCOMMENT}"  placeholder="这里输入专家点评" title="专家点评"/></td>
			</tr>
			<%-- <tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">排序:</td>
				<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}"  placeholder="这里输入排序" title="排序"/></td>
			</tr> --%>
			<%-- <tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">详情:</td>
				<td>
					<script  style="width:680px;height:800px;" id="INTRO" name="INTRO" type="text/plain">${pd.INTRO}</script>
					<input type="text" name="DETAILS" id="DETAILS" value="${pd.DETAILS}"  placeholder="这里输入详情" title="详情"/>
				</td>
			</tr> --%>
			<%--<td></td>
			 <tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">条件:</td>
				<td>
					<select name="CONDTIONID" id="CONDTIONID">
						<option value="">请选择条件</option>
							<c:forEach items="${conditionList}" var="condition" >
							<option value="${condition.ID }" <c:if test="${condition.ID eq pd.CONDTIONID}">selected='selected'</c:if>>${condition.NAME }</option>
							</c:forEach>
					</select>
				</td>
			</tr> --%>
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