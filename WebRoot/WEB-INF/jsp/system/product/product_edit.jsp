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
		<link rel="stylesheet" href="static/css/chosens.css" />
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
		if(!$("#THEISSUER").val()){
			$("#THEISSUER").tips({
				side:3,
	            msg:'请选择发行机构',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#THEISSUER").focus();
			return false;
		}
		if($("#PRODUCTNAME").val()==""){
			$("#PRODUCTNAME").tips({
				side:3,
	            msg:'请输入产品名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCTNAME").focus();
			return false;
		}
		if(!$("#PRODUCTREFERRED").val()){
			$("#PRODUCTREFERRED").tips({
				side:3,
	            msg:'请输入产品简称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCTREFERRED").focus();
			return false;
		}
		if(!$("#RETURNSBENCHMARK1").val()){
			$("#RETURNSBENCHMARK1").tips({
				side:3,
	            msg:'请输入收益基准',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RETURNSBENCHMARK1").focus();
			return false;
		}
		if(!$("#RETURNSBENCHMARKMAX").val()){
			$("#RETURNSBENCHMARKMAX").tips({
				side:3,
	            msg:'请输入最高收益基准',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RETURNSBENCHMARKMAX").focus();
			return false;
		}
		if(!$("#INVESTMENTSTARTING").val()){
			$("#INVESTMENTSTARTING").tips({
				side:3,
	            msg:'请输入投资起点',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INVESTMENTSTARTING").focus();
			return false;
		}
		if(!$("#PRODUCTDEADLINE").val()){
			$("#PRODUCTDEADLINE").tips({
				side:3,
	            msg:'请输入产品期限',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCTDEADLINE").focus();
			return false;
		}
		if(!$("#PRODUCTREVIEWS").val()){
			$("#PRODUCTREVIEWS").tips({
				side:3,
	            msg:'请输入产品点评',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCTREVIEWS").focus();
			return false;
		}
		if(!$("#EXPECTISSUANCE").val()){
			$("#EXPECTISSUANCE").tips({
				side:3,
	            msg:'请输入预计发行规模',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXPECTISSUANCE").focus();
			return false;
		}
		if(!$("#INTERESTDISTRIBUTIONSTATE").val()){
			$("#INTERESTDISTRIBUTIONSTATE").tips({
				side:3,
	            msg:'请输入利息分配',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INTERESTDISTRIBUTIONSTATE").focus();
			return false;
		}
		if(!$("#TRUSTTYPE").val()){
			$("#TRUSTTYPE").tips({
				side:3,
	            msg:'请输入信托类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TRUSTTYPE").focus();
			return false;
		}
		
		if(!$("#PRODUCTSTATUS").val()){
			$("#PRODUCTSTATUS").tips({
				side:3,
	            msg:'请输入产品状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCTSTATUS").focus();
			return false;
		}
		var INVESTMENTSTARTINGSTATE = "";
      	$('input:checkbox[name=INVESTMENTSTARTINGS]:checked').each(function(i){
       		if(0==i){
        		INVESTMENTSTARTINGSTATE = $(this).val();
       		}else{
        		INVESTMENTSTARTINGSTATE += (","+$(this).val());
       		}
      	});
      	$("#INVESTMENTSTARTINGSTATE").val(INVESTMENTSTARTINGSTATE);
      	var PRODUCTDEADLINESTATE = "";
      	$('input:checkbox[name=PRODUCTDEADLINES]:checked').each(function(i){
       		if(0==i){
        		PRODUCTDEADLINESTATE = $(this).val();
       		}else{
        		PRODUCTDEADLINESTATE += (","+$(this).val());
       		}
      	});
      	$("#PRODUCTDEADLINESTATE").val(PRODUCTDEADLINESTATE);
      	var RETURNSBENCHMARKSTATE = "";
      	$('input:checkbox[name=RETURNSBENCHMARKS]:checked').each(function(i){
       		if(0==i){
        		RETURNSBENCHMARKSTATE = $(this).val();
       		}else{
        		RETURNSBENCHMARKSTATE += (","+$(this).val());
       		}
      	});
      	$("#RETURNSBENCHMARKSTATE").val(RETURNSBENCHMARKSTATE);
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="product/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<input type="hidden" name="INVESTMENTSTARTINGSTATE" id="INVESTMENTSTARTINGSTATE"/>
		<input type="hidden" name="PRODUCTDEADLINESTATE" id="PRODUCTDEADLINESTATE"/>
		<input type="hidden" name="RETURNSBENCHMARKSTATE" id="RETURNSBENCHMARKSTATE"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品分类:</td>
				<td>
					<select name="TYPE" id="TYPE">
						<option value="">请选择分类</option>
						<option value="1" <c:if test="${pd.TYPE eq '1' }">selected='selected'</c:if>>信托</option>
						<option value="2" <c:if test="${pd.TYPE eq '2' }">selected='selected'</c:if>>资管</option>
						<option value="3" <c:if test="${pd.TYPE eq '3' }">selected='selected'</c:if>>契约</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">发行机构:</td>
				<td>
					<select name="THEISSUER" id="THEISSUER" class="dept_select" >
						<option value="">请选择发行机构</option>
						<c:forEach items="${INSTITUTIONList}" var="var" >
							<option value="${var.ID }" <c:if test="${var.ID eq pd.THEISSUER}">selected='selected'</c:if>>${var.NAME }</option>
						</c:forEach>
					</select>
				<%-- <input type="text" name="THEISSUER" id="THEISSUER" value="${pd.THEISSUER}"  placeholder="这里输入发行机构" title="发行机构"/> --%>
				
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品全称:</td>
				<td style="width:200px;"><input type="text" name="PRODUCTNAME" id="PRODUCTNAME" value="${pd.PRODUCTNAME}"  placeholder="这里输入全称" title="全称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品简称:</td>
				<td><input type="text" name="PRODUCTREFERRED" id=PRODUCTREFERRED value="${pd.PRODUCTREFERRED}"  placeholder="这里输入简称" title="简称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">最高收益基准:</td>
				<td><input type="text" name="RETURNSBENCHMARKMAX" id="RETURNSBENCHMARKMAX" value="${pd.RETURNSBENCHMARKMAX}"  placeholder="这里输入最高收益基准" title="最高收益基准"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">收益基准:</td>
				<td>
					1、<input type="text" name="RETURNSBENCHMARK" id="RETURNSBENCHMARK1" value="${pd.RETURNSBENCHMARK1}"  placeholder="这里输入收益基准" title="收益基准"/><br/>
					2、<input type="text" name="RETURNSBENCHMARK" id="RETURNSBENCHMARK2" value="${pd.RETURNSBENCHMARK2}"  placeholder="这里输入收益基准" title="收益基准"/><br/>
					3、<input type="text" name="RETURNSBENCHMARK" id="RETURNSBENCHMARK3" value="${pd.RETURNSBENCHMARK3}"  placeholder="这里输入收益基准" title="收益基准"/><br/>
					4、<input type="text" name="RETURNSBENCHMARK" id="RETURNSBENCHMARK4" value="${pd.RETURNSBENCHMARK4}"  placeholder="这里输入收益基准" title="收益基准"/>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">投资起点:</td>
				<td><input type="text" name="INVESTMENTSTARTING" id="INVESTMENTSTARTING" value="${pd.INVESTMENTSTARTING}"  placeholder="这里输入投资起点" title="投资起点"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品期限:</td>
				<td><input type="text" name="PRODUCTDEADLINE" id="PRODUCTDEADLINE" value="${pd.PRODUCTDEADLINE}"  placeholder="这里输入产品期限" title="产品期限"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品点评:</td>
				<td><input type="text" name="PRODUCTREVIEWS" id="PRODUCTREVIEWS" value="${pd.PRODUCTREVIEWS}"  placeholder="这里输入产品点评" title="产品点评"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">预计发行规模:</td>
				<td><input type="text" name="EXPECTISSUANCE" id="EXPECTISSUANCE" value="${pd.EXPECTISSUANCE}"  placeholder="这里输入预计发行规模" title="预计发行规模"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">利息分配:</td>
				<td>
					<select name="INTERESTDISTRIBUTIONSTATE" id="INTERESTDISTRIBUTIONSTATE">
						<option value="">请选择利息分配</option>
						<c:forEach items="${INTERESTDISTRIBUTIONList}" var="var" >
							<option value="${var.ID }" <c:if test="${var.ID eq pd.INTERESTDISTRIBUTIONSTATE}">selected='selected'</c:if>>${var.NAME }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">信托类型:</td>
				<td>
					<select name="TRUSTTYPE" id="TRUSTTYPE">
						<option value="">请选择信托类型</option>
						<c:forEach items="${TRUSTList}" var="var" >
							<option value="${var.ID }" <c:if test="${var.ID eq pd.TRUSTTYPE}">selected='selected'</c:if>>${var.NAME }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品状态:</td>
				<td>
					<select name="PRODUCTSTATUS" id="PRODUCTSTATUS">
						<option value="">请选择产品状态</option>
						<c:forEach items="${PRODUCTList}" var="var" >
							<option value="${var.ID }" <c:if test="${var.ID eq pd.PRODUCTSTATUS}">selected='selected'</c:if>>${var.NAME }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">认购起点:</td>
				<td>
					<c:forEach items="${INVESTMENTSTARTINGList}" var="var" >
						<%-- <input type="checkbox" name="INVESTMENTSTARTINGSTATE" id='${var.ID }' value="${var.NAME }" <c:if test="${fn:indexOf(pd.INVESTMENTSTARTINGSTATE,var.ID)}"> checked='checked'</c:if>> --%>
						<input style="opacity:15" type="checkbox" name="INVESTMENTSTARTINGS" value="${var.ID }" <c:if test="${fn:contains(pd.INVESTMENTSTARTINGSTATE,var.ID)}"> checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${var.NAME}&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品期限:</td>
				<td>
					<c:forEach items="${PRODUCTDEADLINEList}" var="var" >
						<%-- <input type="checkbox" name="INVESTMENTSTARTINGSTATE" id='${var.ID }' value="${var.NAME }" <c:if test="${fn:indexOf(pd.PRODUCTDEADLINESTATE,var.ID)}"> checked='checked'</c:if>> --%>
						<input style="opacity:15" type="checkbox" name="PRODUCTDEADLINES" value="${var.ID }" <c:if test="${fn:contains(pd.PRODUCTDEADLINESTATE,var.ID)}"> checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${var.NAME}&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">收益基准:</td>
				<td>
					<c:forEach items="${RETURNSBENCHMARKList}" var="var" >
						<input style="opacity:1" name="Fruit" type="checkbox" value="${var.NAME }" />
						<%-- <input type="checkbox" name="INVESTMENTSTARTINGSTATE" id='${var.ID }' value="${var.NAME }" <c:if test="${fn:indexOf(pd.RETURNSBENCHMARKSTATE,var.ID)}"> checked='checked'</c:if>> --%>
						<input style="opacity:15" type="checkbox" name="RETURNSBENCHMARKS" value="${var.ID }" <c:if test="${fn:contains(pd.RETURNSBENCHMARKSTATE,var.ID)}"> checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${var.NAME}&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">排序:</td>
				<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}"  placeholder="这里输入排序" title="排序"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">详情:</td>
				<td>
					<script  style="width:680px;height:800px;" id="DETAILS" name="DETAILS" type="text/plain">${pd.DETAILS}</script>
					<%-- <input type="text" name="DETAILS" id="DETAILS" value="${pd.DETAILS}"  placeholder="这里输入详情" title="详情"/> --%>
				</td>
			</tr>
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
   		<script type="text/javascript" src="static/js/chosen.jquery.js"></script><!-- 下拉框 -->
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
			//下拉框
			$('.dept_select').chosen();
			$(".chosen-results").height(300);
		});
		
		</script>
</body>
</html>