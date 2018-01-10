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
	<%@ include file="../../system/admin/top.jsp"%> 
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="productStable/list.do" method="post" name="Form" id="Form">
			<table>
			<input type="hidden" name="INVESTMENTSTARTINGSTATE" id="INVESTMENTSTARTINGSTATE" value="${pd.INVESTMENTSTARTINGSTATE}"/>
			<input type="hidden" name="productStableDEADLINESTATE" id="productStableDEADLINESTATE" value="${pd.productStableDEADLINESTATE}"/>
			<input type="hidden" name="RETURNSBENCHMARKSTATE" id="RETURNSBENCHMARKSTATE" value="${pd.RETURNSBENCHMARKSTATE}"/>
				<tr>
					<td>
						<select name="TYPE" id="TYPE">
							<option value="">请选择产品类型</option>
							<option value="1" <c:if test="${pd.TYPE eq '1' }">selected='selected'</c:if>>股权投资</option>
							<option value="2" <c:if test="${pd.TYPE eq '2' }">selected='selected'</c:if>>政府债</option>
							<option value="3" <c:if test="${pd.TYPE eq '3' }">selected='selected'</c:if>>对冲•定增</option>
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
							<c:forEach items="${productStableList}" var="var" >
								<option value="${var.ID }" <c:if test="${var.ID eq pd.PRODUCTSTATUS}">selected='selected'</c:if>>${var.NAME }</option>
							</c:forEach>
						</select>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</table>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th class="center">序号</th>
						<th class="center">产品类型</th>
						<th class="center">发行机构</th>
						<th class="center">产品全称</th>
						<th class="center">产品简称</th>
						<th class="center">收益基准</th>
						<th class="center">投资起点</th>
						<th class="center">产品期限</th>
						<th class="center">产品点评</th>
						<th class="center">预计发行规模</th>
						<th class="center">利息分配</th>
						<th class="center">信托类型</th>
						<th class="center">产品状态</th>
						<th class="center">排序</th>
						<th class="center">创建时间</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${var.ID}" /><span class="lbl"></span></label>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td class="center">${var.TYPENAME}</td>
										<td class="center">${var.THEISSUERNAME}</td>
										<td class="center">${var.PRODUCTNAME}</td>
										<td class="center">${var.PRODUCTREFERRED}</td>
										<td class="center">${var.RETURNSBENCHMARK}</td>
										<td class="center">${var.INVESTMENTSTARTING}</td>
										<td class="center">${var.PRODUCTDEADLINE}</td>
										<td class="center">${var.PRODUCTREVIEWS}</td>
										<td class="center">${var.EXPECTISSUANCE}</td>
										<td class="center">${var.TINTERESTDISTRIBUTIONSTATENAME}</td>
										<td class="center">${var.TRUSTTYPENAME}</td>
										<td class="center">${var.PRODUCTSTATUSNAME}</td>
										<td class="center">${var.SORT}</td>
										<td class="center">${var.CTDATE}</td>
								<td style="width: 30px;" class="center">
									<div class='hidden-phone visible-desktop btn-group'>
									
										<c:if test="${QX.edit != 1 && QX.del != 1 }">
										<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
										</c:if>
										<div class="inline position-relative">
										<button class="btn btn-mini btn-info" data-toggle="dropdown"><i class="icon-cog icon-only"></i></button>
										<ul class="dropdown-menu dropdown-icon-only dropdown-light pull-right dropdown-caret dropdown-close">
											<c:if test="${QX.edit == 1 }">
											<li><a style="cursor:pointer;" title="编辑" onclick="edit('${var.ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green"><i class="icon-edit"></i></span></a></li>
											<li><a style="cursor:pointer;" title="重置排序" onclick="editSort('${var.ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green"><i class="icon-check"></i></span></a></li>
											</c:if>
											<c:if test="${QX.del == 1 }">
											<li><a style="cursor:pointer;" title="删除" onclick="del('${var.ID}');" class="tooltip-error" data-rel="tooltip" title="" data-placement="left"><span class="red"><i class="icon-trash"></i></span> </a></li>
											</c:if>
										</ul>
										</div>
									</div>
								</td>
							</tr>
						
						</c:forEach>
						</c:if>
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="100" class="center">您无权查看</td>
							</tr>
						</c:if>
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
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>productStable/goAdd.do';
			 diag.Width = 900;
			 diag.Height = 710;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>productStable/delete.do?ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>productStable/goEdit.do?ID='+Id;
			 diag.Width = 900;
			 diag.Height = 710;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		//重置排序
		function editSort(Id){
			top.jzts();
			var url = "<%=basePath%>productStable/editSort.do?ID="+Id+"&tm="+new Date().getTime();
			$.get(url,function(data){
				nextPage(${page.currentPage});
			});
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
		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>productStable/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		}
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>productStable/excel.do';
		}
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

