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
	
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	
	<meta charset="utf-8" />
	<title>${pd.SYSNAME}</title>
	<meta name="description" content="overview & stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- basic styles -->
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	<!-- page specific plugin styles -->
	<!-- 下拉框-->
	<link rel="stylesheet" href="static/css/chosen.css" />
	<!-- ace styles -->
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="static/css/ace-skins.min.css" />
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
	<!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
	<!--引入弹窗组件end-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script>
		$(function(){
			if('${pd.idstr}'!=null&&'${pd.idstr}'!=''){
				var idstr = '${pd.idstr}';
				var idarr = idstr.split('-');
				for(var i=0;i<idarr.length;i++){
					$("#"+idarr[i]).attr("checked",true);
					$("input[name='ids']").attr("disabled",true);
					
				}
				$("#"+idarr[0]).attr("disabled",false);
			}
			$("input[name='ids']").click(function(){
				var id = $(this).val();
				if($(this).attr('checked')){
					$("input[name='ids']").attr("disabled",true);
					$(this).attr("disabled",false);
					var typename = $(this).parent().parent().children(".typename").html();
					var theissuername = $(this).parent().parent().children(".theissuername").html();
					var productreferred = $(this).parent().parent().children(".productreferred").html();
					window.opener.createproduct(id,typename,theissuername,productreferred);
				}else{
					window.opener.removeproduct(id);
					$("input[name='ids']").attr("disabled",false);
				}
			});
		})
	</script>
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<input id="idstr" value="${pd.idstr}" type="hidden"/>
			<!-- 检索  -->
			<form action="messagemanagement/productlist?idstr=${pd.idstr}" method="post" name="Form" id="Form">
			<table>
			<input type="hidden" name="INVESTMENTSTARTINGSTATE" id="INVESTMENTSTARTINGSTATE" value="${pd.INVESTMENTSTARTINGSTATE}"/>
			<input type="hidden" name="PRODUCTDEADLINESTATE" id="PRODUCTDEADLINESTATE" value="${pd.PRODUCTDEADLINESTATE}"/>
			<input type="hidden" name="RETURNSBENCHMARKSTATE" id="RETURNSBENCHMARKSTATE" value="${pd.RETURNSBENCHMARKSTATE}"/>
				<tr>
					<td>
						<select name="TYPE" id="TYPE">
							<option value="">请选择产品类型</option>
							<option value="1" <c:if test="${pd.TYPE eq '1' }">selected='selected'</c:if>>信托</option>
							<option value="2" <c:if test="${pd.TYPE eq '2' }">selected='selected'</c:if>>资管</option>
							<option value="3" <c:if test="${pd.TYPE eq '3' }">selected='selected'</c:if>>契约型</option>
						</select>
					</td>
					<td style="vertical-align:top;"> 
					  	<select name="INTERESTDISTRIBUTIONSTATE" id="INTERESTDISTRIBUTIONSTATE">
							<option value="">请选择利息分配</option>
							<c:forEach items="${INTERESTDISTRIBUTIONList}" var="var" >
								<option value="${var.ID }" <c:if test="${var.ID eq pd.INTERESTDISTRIBUTIONSTATE}">selected='selected'</c:if>>${var.NAME }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select name="TRUSTTYPE" id="TRUSTTYPE">
							<option value="">请选择信托类型</option>
							<c:forEach items="${TRUSTList}" var="var" >
								<option value="${var.ID }" <c:if test="${var.ID eq pd.TRUSTTYPE}">selected='selected'</c:if>>${var.NAME }</option>
							</c:forEach>
						</select>
					</td>
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
					<td style="vertical-align:top;"> 
					认购起点:</br>
					  	<c:forEach items="${INVESTMENTSTARTINGList}" var="var" >
							<input style="opacity:15" onchange="changes()" type="checkbox" name="INVESTMENTSTARTINGS" value="${var.ID }" <c:if test="${fn:contains(pd.INVESTMENTSTARTINGSTATE,var.ID)}"> checked="checked"</c:if>>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${var.NAME}&nbsp;</br>
						</c:forEach>
					</td>
					<td style="vertical-align:top;"> 
					产品期限:</br>
					  	<c:forEach items="${PRODUCTDEADLINEList}" var="var" >
							<input style="opacity:15" onchange="changes()" type="checkbox" name="PRODUCTDEADLINES" value="${var.ID }" <c:if test="${fn:contains(pd.PRODUCTDEADLINESTATE,var.ID)}"> checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${var.NAME}&nbsp;</br>
						</c:forEach>
					</td>
					<td style="vertical-align:top;"> 
					收益基准:</br>
					  	<c:forEach items="${RETURNSBENCHMARKList}" var="var" >
							<input style="opacity:15" onchange="changes()"  type="checkbox" name="RETURNSBENCHMARKS" value="${var.ID }" <c:if test="${fn:contains(pd.RETURNSBENCHMARKSTATE,var.ID)}"> checked="checked"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${var.NAME}&nbsp;</br>
						</c:forEach>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</table>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /></label>
						</th>
						<th class="center">产品类型</th>
						<th class="center">发行机构</th>
						<th class="center">产品全称</th>
						<th class="center">产品简称</th>
						<th class="center">收益基准</th>
						<th class="center">投资起点</th>
						<th class="center">产品期限</th>
						<th class="center">预计发行规模</th>
						<th class="center">利息分配</th>
						<th class="center">信托类型</th>
						<th class="center">产品状态</th>
						<th class="center">认购起点</th>
						<th class="center">产品期限</th>
						<th class="center">收益基准</th>
						<th class="center">创建时间</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">
									<input id="${var.ID}" class="checkproduct" type='checkbox' name='ids' value="${var.ID}" /><span class="lbl"></span>
								</td>
								<td class="center typename">${var.TYPENAME}</td>
								<td class="center theissuername">${var.THEISSUERNAME}</td>
								<td class="center">${var.PRODUCTNAME}</td>
								<td class="center productreferred">${var.PRODUCTREFERRED}</td>
								<td class="center">${var.RETURNSBENCHMARK}</td>
								<td class="center">${var.INVESTMENTSTARTING}</td>
								<td class="center">${var.PRODUCTDEADLINE}</td>
								<td class="center">${var.EXPECTISSUANCE}</td>
								<td class="center">${var.TINTERESTDISTRIBUTIONSTATENAME}</td>
								<td class="center">${var.TRUSTTYPENAME}</td>
								<td class="center">${var.PRODUCTSTATUSNAME}</td>
								<td class="center">${var.INVESTMENTSTARTINGNAMES}</td>
								<td class="center">${var.PRODUCTDEADLINENAMES}</td>
								<td class="center">${var.RETURNSBENCHMARKNAMES}</td>
								<td class="center">${var.CTDATE}</td>
							</tr>
						</c:forEach>
					</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="100" class="center" >没有相关数据</td>
							</tr>
						</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
					<c:if test="${QX.add == 1 }">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					</c:if>
					<c:if test="${QX.del == 1 }">
					<a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='icon-trash'></i></a>
					</c:if>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});
		</script>
		<script type="text/javascript">
			function changes(e){
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
			}
		</script>
	</body>
</html>

