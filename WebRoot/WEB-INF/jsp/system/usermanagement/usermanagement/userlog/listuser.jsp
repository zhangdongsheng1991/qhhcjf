<%@page pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	var setting = {
		data: {
			key: {
				title:"t"
			},
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: beforeClick,
			onClick: onClick
		}
	};

	var zNodes =${result};

	var className = "dark";
	function beforeClick(treeId, treeNode, clickFlag) {
		className = (className === "dark" ? "":"dark");
		return (treeNode.click != false);
	}
	function onClick(event, treeId, treeNode, clickFlag) { 
		var id = treeNode.id;
		$("#Frame2").attr("src","usermanagement/userlog/logtype?id="+id);
	}		

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
	</SCRIPT>
	<style>
	</style>
</HEAD>

<body class="easyui-layout">
     <div data-options="region:'west',split:true" title="收起" style="width: 190px;">
        <div class="easyui-accordion" data-options="fit:true,border:false">
            <div title="用户列表" data-options="selected:true" style="overflow: visible;">
				<ul id="treeDemo" class="ztree" style=" height:98%;width:93%;padding-left:10px;margin-top:0px;border:none;background: #FFF;overflow-y:scroll;overflow-x:auto;"></ul>
            </div>
        </div>
    </div>
	<div  data-options="region:'center'">
         <iframe ID="Frame2" name="Frame2" SRC="" STYLE="width:100%;height:500px;scrolling : no"> 
		</iframe>
       </div>
    
</body>
</HTML>