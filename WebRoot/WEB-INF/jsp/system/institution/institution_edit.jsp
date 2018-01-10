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
		<script type="text/javascript" src="static/js/common/laydate/laydate.js"></script>
		
<script type="text/javascript">
	var timestamp = Date.parse(new Date()); 
	
	//保存
	function save(){
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入机构名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if(!$("#IMGURL").val()){
			if(!$("#file").val()){
				$("#file").tips({
					side:3,
		            msg:'请选择图标',
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
	<form action="institution/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<input type="hidden" name="IMGURL" id="IMGURL" value="${pd.IMGURL}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">机构名称:</td>
				<td style="width:200px;"><input type="text" name="NAME" id="NAME" value="${pd.NAME}"  placeholder="这里输入机构名称" title="机构名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">图标:</td>
				<td><input type="file" name="file" id="file" title="图标"/></td>
			</tr>
			<tr>
				<c:if test="${not empty pd.IMGURL}">
				<td style="width:70px;text-align: right;padding-top: 13px;">图标预览 :</td>
				<td><img src="${pd.IMGURL}"></td>
				</c:if>
			</tr>
			
			<!-- 2017.07.26添加 -->
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">平均收益率:</td>
				<td><input type="text" name="AR" id="AR" value="${pd.AR}" title="平均收益率"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品兑付比:</td>
				<td><input type="text" name="PPR" id="PPR" value="${pd.PPR }" title="产品兑付比"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">注册资本(万元):</td>
				<td><input type="text" name="CAPITAL" id="CAPITAL" value="${pd.CAPITAL }" title="注册资本"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">股东背景:</td>
				<td><input type="text" name="SHAREHOLDER" id="SHAREHOLDER" value="${pd.SHAREHOLDER }" title="股东背景"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">法人代表:</td>
				<td><input type="text" name="CORPORATION" id="CORPORATION" value="${pd.CORPORATION }" title="法人代表"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">所在地区:</td>
				<td><input type="text" name="LOCATION" id="LOCATION" value="${pd.LOCATION }" title="所在地区"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">成立时间:</td>
				<td><input style="" readonly="readonly"  onclick="laydate()" name="FOUNDINGTIME" id="FOUNDINGTIME" value="${pd.FOUNDINGTIME }"  title="成立时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">浏览次数:</td>
				<td><input type="number" name="VIEWS" id="VIEWS" value="${pd.VIEWS }" title="浏览次数"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">董事长:</td>
				<td><input type="text" name="CHAIRMAN" id="CHAIRMAN" value="${pd.CHAIRMAN }" title="董事长"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">公司简介:</td>
				<td><input type="text" name="INTRODUCTION" id="INTRODUCTION" value="${pd.INTRODUCTION }" title="公司简介"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">公司全称:</td>
				<td><input type="text" name="FULLNAME" id="FULLNAME" value="${pd.FULLNAME }" title="公司全称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否上市:</td>
				<td>
					<select id="LISTED" name="LISTED">
						<option <c:if test="${pd.LISTED=='是'}">selected='selected'</c:if> value="是">是</option>
						<option <c:if test="${pd.LISTED=='否'||pd.LISTED==null}">selected='selected'</c:if> value="否">否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">资产管理规模:</td>
				<td><input type="text" name="AUM" id="AUM" value="${pd.AUM }" title="资产管理规模"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">总经理:</td>
				<td><input type="text" name="MANAGER" id="MANAGER" value="${pd.MANAGER }" title="总经理"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">大股东:</td>
				<td><input type="text" name="M_SHAREHOLDER" id="M_SHAREHOLDER" value="${pd.M_SHAREHOLDER }" title="大股东"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">环成金服点评:</td>
				<td><input type="text" name="COMMENT" id="COMMENT" value="${pd.COMMENT }" title="环成金服点评"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否信托公司:</td>
				<td>
					<select id="ISTRUST" name="ISTRUST">
					<option <c:if test="${pd.ISTRUST=='否'||pd.ISTRUST==null}">selected='selected'</c:if> value="否">否</option>
					<option <c:if test="${pd.ISTRUST=='是'}">selected='selected'</c:if> value="是">是</option>
						
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">排序:</td>
				<td><input type="number" name="RANKING" id="RANKING" value="${pd.RANKING }" title="排序"/></td>
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