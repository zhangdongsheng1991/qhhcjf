<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>环成金服融资网</title>
<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css"
	href="static/css/web/financing_css/financing_css.css">
<script src="static/js/web/jquery-1.7.2.min.js"></script>
<script src="static/js/web/financing_js/financing_js.js"></script>
 <link rel="Shortcut Icon" href="static/img/web/logo2.ico">
</head>


<body>
	<div class="Top">
    	<div class="top">
       	<div class="top_L"> 环成金服-您终身信赖的财富管家 </div>
        <div class="top_R">
     <!--   <img src="static/img/web/financing_img/jiantou.png" />-->
         <a href="web/index">投资服务咨询</a></div>
        </div>
        
    </div>

	<!--头部-->
	<div class="nav_box">
		<a href="web/financing" target="_blank">
			<div class="logo">环成金服融资网</div>
		</a>


		<ul class="nav">
			<li class="Choice"><a href="web/financing">首页</a></li>
			<li><a href="web/capital">找资金</a></li>
			<li><a href="web/sch_finance">金融学院</a></li>
			<li><a onclick="showhz('发布项目')" class="comy_but" href="javascript:;"
				style="padding:0px; margin-left:20px;">我要融资</a></li>
		</ul>

	</div>
	<!--头部结束-->

	<div class="banner"></div>


	<div class="data">
		<div class="data_box">
			<img src="static/img/web/financing_img/data.png" />
		</div>
	</div>

	<div class="function">
		<img src="static/img/web/financing_img/function.png" />
	</div>


	<div class="merit">
		<div class="header">
			<span class="su"></span> 环成金服平台优势

		</div>

		<div class="merit_con"></div>

	</div>

	<!--产品板块-->
	<div class="header">
		<span class="su"></span> 专业融资对接平台 <a href="web/capital">
			<div class="more"></div>
		</a>
	</div>

	<div class="product_box">
		<ul class="product">
			<c:forEach var="institution" items="${hotList}">
			<li>
				<div class="comy_logo">
					<img style="width:100px" src="${institution.IMGURL}">
				</div>

				<div class="comy_con">
					<div>
						<span class="S_l">投资机构：</span> <span class="S_r">${institution.FULLNAME}</span>
					</div>
					<div>
						<span class="S_l">资金规模：</span> <span class="S_r">${institution.CAPITAL} 万元</span>
					</div>
					<div>
						<span class="S_l">所在地区：</span> <span class="S_r">${institution.LOCATION}</span>
					</div>
				</div> <a onclick="showhz('${institution.NAME}')"  class="comy_but">申请合作</a>
			</li>
			</c:forEach>

		</ul>
	</div>

	<!--产品板块结束-->

	<div class="header">
		<span class="su"></span> 企业介绍

	</div>

	<dl class="company">
		<dt class="comy_img">
			<img src="static/img/web/financing_img/2.jpg" />
		</dt>
		<dd class="comy_right">
			<div class="hcjf">深圳前海环成投资咨询有限公司</div>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;环成金服隶属于深圳前海环成投资咨询有限公司；环成金服是国内一家专为高净值人群提供财富管理服务的综合性平台，位于国际金融中心深圳。
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;环成金服专注于财富管理领域，致力于为单笔投资100万以上的个人客户及机构客户提供固定收益金融资产配置。作为独立的第三方理财平台，我们始终坚持以客户为中心，根据客户财务状况和风险偏好，为客户量身提供个性化的理财方案，帮助客户实现稳定、安全的财富增值。成立至今，已有超过3.5万名高净值客户在环成金服成功完成资产配置，总计配置资产规模达400亿。
			</p>

		</dd>
	</dl>

	<div class="flow">
		<div class="header" style="color:#FFF;">
			<span class="su"></span> 服务流程
		</div>

		<div class="function">
			<img src="static/img/web/financing_img/flow.png" />
		</div>
	</div>


	<%@include file="../bottom.jsp"%>
	<!--弹窗框-->
	<%@include file="common_hz.jsp" %>
</body>
</html>
