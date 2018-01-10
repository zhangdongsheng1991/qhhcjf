<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	<meta name="viweport" content="width=device-width,initial-scale=1"/>
	<script type="text/javascript" src="<%=path%>/dwr/engine.js"></script>
	<script type="text/javascript" src="<%=path%>/dwr/util.js"></script>
	<script type="text/javascript" src="<%=path%>/dwr/interface/DemoTest.js"></script>
	<script type="text/javascript" src="<%=path%>/static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		function init(){
			dwr.engine.setActiveReverseAjax(true);
			dwr.engine.setNotifyServerOnPageUnload(true);
			DemoTest.onPageLoad("1");
		}
		window.onload=init;
		function send(){
			var msg = $("#msg").val();
			DemoTest.sendMsg("1",msg);
		}
		function receiveMsg(msg){
			$("#msg1").val(msg);
		}
	</script>
</head>
<body>
	消息:<input type="text" id="msg">
		<button onclick ="send();">send</button><br/>
		接收的消息:<input type="text" id="msg1">
</body>
</html>