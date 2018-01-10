<%@page pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
        <link href="../static/css/web/guidancePage/guidancePage.css" rel="stylesheet" type="text/css"/>
		<script src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/web/jquery.cookie.js"></script>
		<script>
			function investment(){
				$.cookie('guidancePage','yes', {
					expires : 1
				});
				location.href="web/index"
			}
			function financing(){
				$.cookie('guidancePage','yes', {
					expires : 1
				});
				location.href = "web/financing"
			}
		</script>
	</head>
	<body>
    	<div class="G_box">
			<div class="G_logo">
            	
            
            </div>
            
            <div class="G_con">

            </div>
            
            
            <div class="G_btn">
                <button onclick="investment()" id="touzi">我要投资</button>
                <button onclick="financing()" id="rongzi">我要融资</button>
            </div>
		</div>
	</body>
</html>