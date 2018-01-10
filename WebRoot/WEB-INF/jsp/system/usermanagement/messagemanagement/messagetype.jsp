<%@page pageEncoding="utf-8"%>
<jsp:directive.page import="java.util.Calendar" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Calendar calendar = java.util.Calendar.getInstance();
	int year = calendar.get(Calendar.YEAR);
	int month = calendar.get(Calendar.MONTH) + 1;
%>
<!DOCTYPE html>
<HTML>
<HEAD>
	<base href="<%=basePath%>">	
	<TITLE> ZTREE DEMO - noLine </TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	 <link rel="stylesheet" type="text/css" href="static/css/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/css/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="static/css/easyui/themes/demo.css">
	<script type="text/javascript" src="static/css/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/css/easyui/jquery.easyui.min.js"></script>
	
	<link rel="stylesheet" href="static/css/ztree/demo.css" type="text/css">
	<link rel="stylesheet" href="static/css/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="static/js/ztree/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="static/js/jquery.1.7.2.js"></script>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
	<SCRIPT type="text/javascript">
		function listmessages(){
			var year = $("select[name='year']").val();
			var month = $("select[name='month']").val();
			var status = $("select[name='status']").val();
			var messagetype = $("select[name='messagetype']").val();
			$("#Frame2").attr("src","messagemanagement/listmessages?status="+status+"&year="+year+"&month="+month+"&messagetype="+messagetype);
		}
	</SCRIPT>
</HEAD>

<body class="easyui-layout">
     <div data-options="region:'west',split:true" title="收起" style="width: 190px;">
        <div class="easyui-accordion" data-options="fit:true,border:false">
            <div title="查询条件" data-options="selected:true" style="overflow: visible;">
				<div style="overflow:auto;padding:10px;text-align: left;">
					
					<label style="width: 70px">消息状态:</label>
					<select name="status" style="width:140px;">
					    <option value="" >全部</option >
					    <option value="0" >已发布的消息</option >
					    <option value="1" >未发布的消息</option >
					</select>
					<br/><br/>
					<label style="width: 70px">消息类型:</label>
					<select name="messagetype" style="width:140px;">
					    <option value="" >全部消息</option >
					    <option value="1" >系统消息</option >
					    <option value="0" >产品消息</option >
					</select>
					<br/><br/>
					<label style="width: 70px">年份:</label>
					<select style="width:140px;" name="year">
						<option value="2016" <% if(year==2016) {%>selected<%} %>>
							2016 年
						</option>
						<option value="2017" <% if(year==2017) {%>selected<%} %>>
							2017 年
						</option>
						<option value="2018" <% if(year==2018) {%>selected<%} %>>
							2018 年
						</option>
						<option value="2019" <% if(year==2019) {%>selected<%} %>>
							2019 年
						</option>
						<option value="2020" <% if(year==2020) {%>selected<%} %>>
							2020 年
						</option>
						<option value="2021" <% if(year==2021) {%>selected<%} %>>
							2021 年
						</option>
						<option value="2022" <% if(year==2022) {%>selected<%} %>>
							2022 年
						</option>
						<option value="2023" <% if(year==2023) {%>selected<%} %>>
							2023 年
						</option>
						<option value="2024" <% if(year==2024) {%>selected<%} %>>
							2024 年
						</option>
						<option value="2025" <% if(year==2025) {%>selected<%} %>>
							2025 年
						</option>
						<option value="2026" <% if(year==2026) {%>selected<%} %>>
							2026 年
						</option>
					</select>
					<br/><br/>
					<label style="width: 70px">月份:</label>
					<select name="month" style="width:140px;">
						<option value="">请选择</option>
						<option value="1" <% if(month==1) {%>selected<%} %>>一月</option>
						<option value="2" <% if(month==2) {%>selected<%} %>>二月</option>
						<option value="3" <% if(month==3) {%>selected<%} %>>三月</option>
						<option value="4" <% if(month==4) {%>selected<%} %>>四月</option>
						<option value="5" <% if(month==5) {%>selected<%} %>>五月</option>
						<option value="6" <% if(month==6) {%>selected<%} %>>六月</option>
						<option value="7" <% if(month==7) {%>selected<%} %>>七月</option>
						<option value="8" <% if(month==8) {%>selected<%} %>>八月</option>
						<option value="9" <% if(month==9) {%>selected<%} %>>九月</option>
						<option value="10" <% if(month==10) {%>selected<%} %>>十月</option>
						<option value="11" <% if(month==11) {%>selected<%} %>>十一月</option>
						<option value="12" <% if(month==12) {%>selected<%} %>>十二月</option>
					</select>
					<br/><br/>
					<a onclick="listmessages()" class="easyui-linkbutton" data-options="iconCls:'icon-search',toggle:false">查询</a>
					<!-- <a style="cursor: pointer;" onclick="listmessages('')">全部</a><br/>
					<a style="cursor: pointer;" onclick="listmessages('0')">已发布的消息</a><br/>
					<a style="cursor: pointer;" onclick="listmessages('1')">未发布的消息</a> -->
				</div>
				
            </div>
        </div>
    </div>
   
    <!-- <div style="padding:5px;background:#fafafa;width:500px;border:1px solid #ccc">
      <a href="#" class="easyui-linkbutton" iconCls="icon-add">Cancel</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel">Cancel</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload">Refresh</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-search">Query</a>
		<a href="#" class="easyui-linkbutton">text button</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-print">Print</a>
	</div> -->
	<div data-options="region:'center'">
         <iframe ID="Frame2" frameborder="none" name="Frame2" SRC="" STYLE=" border:none;width:100%;height:583px;scrolling : no"> 
		</iframe>
       </div>
    
</body>
</HTML>