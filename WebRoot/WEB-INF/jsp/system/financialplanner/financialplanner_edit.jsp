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
	            msg:'请输入姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#POSITION").val()==""){
			$("#POSITION").tips({
				side:3,
	            msg:'请输入职位',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#POSITION").focus();
			return false;
		}
		if($("#XUEWEI").val()==""){
			$("#XUEWEI").tips({
				side:3,
	            msg:'请输入学位',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#XUEWEI").focus();
			return false;
		}
		if($("#NUMBER").val()==""){
			$("#NUMBER").tips({
				side:3,
	            msg:'请输入配置数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NUMBER").focus();
			return false;
		}
		if($("#INFO").val()==""){
			$("#INFO").tips({
				side:3,
	            msg:'请输入简介',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INFO").focus();
			return false;
		}
		if(!$("#IMGURL").val()){
			if(!$("#file").val()){
				$("#file").tips({
					side:3,
		            msg:'请选择图片',
		            bg:'#AE81FF',
		            time:2
			    });
				$("#file").focus();
				return false;
			}
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="financialplanner/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<input type="hidden" name="IMGURL" id="IMGURL" value="${pd.IMGURL}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">姓名:</td>
				<td style="width:200px;"><input type="text" name="NAME" id="NAME" value="${pd.NAME}"  placeholder="这里输入名称" title="名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">职位:</td>
				<td><input type="text" name="POSITION" id=POSITION value="${pd.POSITION}"  placeholder="这里输入职位" title="职位"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学位:</td>
				<td><input type="text" name="XUEWEI" id=XUEWEI value="${pd.XUEWEI}"  placeholder="这里输入学位" title="学位"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">配置数:</td>
				<td><input type="number" name="NUMBER" id=NUMBER value="${pd.NUMBER}"  placeholder="这里输入配置数" title="配置数"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">排序:</td>
				<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}"  placeholder="这里输入序号" title="序号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">简介:</td>
				<td><textarea name="INFO" id=INFO placeholder="这里输入简介">${pd.INFO}</textarea>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">头像:</td>
				<td><input type="file" name="file" id="file" title="头像"/></td>
			</tr>
			<tr>
				<c:if test="${not empty pd.IMGURL}">
				<td style="width:70px;text-align: right;padding-top: 13px;">图片预览 :</td>
				<td><img src="${pd.IMGURL}"></td>
				</c:if>
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
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
	        
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			//上传
			$('#file').ace_file_input({
				no_file:'请选择图片 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'gif|png|jpg|jpeg',
				blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
			
		});
		
		</script>
</body>
</html>