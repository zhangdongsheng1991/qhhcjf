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
		if($("#TYPE").val()==""){
			$("#TYPE").tips({
				side:3,
	            msg:'请输入选择类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
			return false;
		}
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入新闻名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if(!$("#SOURCE").val()){
			$("#SOURCE").tips({
				side:3,
	            msg:'请输入来源',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SOURCE").focus();
			return false;
		}
		if(!$("#IMG").val()){
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
		if(!$("#PVIEWS").val()){
			$("#PVIEWS").tips({
				side:3,
	            msg:'请输入阅读量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PVIEWS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	var count=0;
	function addtag(){
		$("#tag_td").append("<div id='"+count+"'>"+
				"<input type='hidden' name='tag_id' value='1'>"+
				"标签名称:<input type='text' name='tagname' value=''  placeholder='这里输入标签名称' title='标签'/>"+
				"<br/>"+
				"标签地址:<input type='text' name='tagurl' value='' placeholder='这里输入标签链接' title='标签'/>"+
				"<input type='button' onclick='deltag1("+count+")' value='删除标签'/>"+
				"</div><br/>");
		count++;
		return;
	}
	function deltag(v){
		$('#'+v).css("display", "none");
		$.ajax({
			type: "POST",
			url: '<%=basePath%>news/deletetagbyid.do?tm='+new Date().getTime(),
	    	data: {ID:v},
			dataType:'json',
			cache: false,
			success: function(data){
			}
		});
	}
	function deltag1(v){
		$('#'+v).remove();
	}
</script>
	</head>
<body>
	<form action="news/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<input type="hidden" name="IMG" id="IMG" value="${pd.IMG}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">新闻分类:</td>
				<td>
					<select name="TYPE" id="TYPE">
						<option value="">请选择分类</option>
						<option value="1" <c:if test="${pd.TYPE eq '1' }">selected='selected'</c:if>>私募股权</option>
						<option value="2" <c:if test="${pd.TYPE eq '2' }">selected='selected'</c:if>>阳光私募</option>
						<option value="3" <c:if test="${pd.TYPE eq '3' }">selected='selected'</c:if>>信托资管</option>
						<option value="4" <c:if test="${pd.TYPE eq '4' }">selected='selected'</c:if>>海外保险</option>
						<option value="5" <c:if test="${pd.TYPE eq '5' }">selected='selected'</c:if>>财经要闻</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">新闻标题:</td>
				<td style="width:200px;"><input type="text" name="NAME" id="NAME" value="${pd.NAME}"  placeholder="这里输入新闻标题" title="新闻标题"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">新闻简介:</td>
				<td style="width:200px;"><input type="text" name="COMMENT" id="COMMENT" value="${pd.COMMENT}"  placeholder="这里输入新闻简介" title="新闻简介 "/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">新闻来源:</td>
				<td><input type="text" name="SOURCE" id="SOURCE" value="${pd.SOURCE}"  placeholder="这里输入新闻来源" title="新闻来源"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">阅读量:</td>
				<td><input type="number" name="PVIEWS" id="PVIEWS" value="${pd.PVIEWS}"  placeholder="这里输入阅读量" title="阅读量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">标签:</td>
				<td id="tag_td">
					<span id="tag"></span>
					<input type="button" onclick="addtag()" value="创建标签"/>
					<c:if test="${list!=null}">
						<c:forEach var="tag" items="${list}">
							<div id='${tag.ID}'>
								<input type="hidden" name="tag_id" value="${tag.ID}" />
								标签名称:<input type='text' name='tagname' value='${tag.TAGNAME}'  placeholder='这里输入标签名称' title='标签'/>
								<br/>
								  标签地址:<input type='text' name='tagurl' value='${tag.TAGURL}' placeholder='这里输入标签链接' title='标签'/>
								 <input type='button' onclick="deltag('${tag.ID}')" value='删除标签'/>
							</div>
							<br/>
						</c:forEach>
					</c:if>
					
				</td>
				
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">封面图片:</td>
				<td><input type="file" name="file" id="file" title="头像"/></td>
			</tr>
			<tr>
				<c:if test="${not empty pd.IMG}">
				<td style="width:70px;text-align: right;padding-top: 13px;">图片预览 :</td>
				<td><img src="${pd.IMG}"></td>
				</c:if>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">详情:</td>
				<td>
					<script  style="width:680px;height:800px;" id="DETAILED" name="DETAILED" type="text/plain">${pd.DETAILED}</script>
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
	        var ue = UE.getEditor('DETAILED');
	        
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