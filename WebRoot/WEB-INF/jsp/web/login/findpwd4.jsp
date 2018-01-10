<%@page pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath %>">
		<meta charset="utf-8">
        <title>修改成功__环成金服</title>
    	<script src="static/js/jquery-1.7.2.js" type="text/javascript"></script>
		<script>
			
		</script>
            <link href="static/css/web/Sign_in.css" rel="stylesheet" type="text/css" /> 
             <link href="static/css/web/style.css" rel="stylesheet" type="text/css" />
        
	</head>
    
    
	<body>
    	<div class="R_top">
        	<div class="top_box">
            	<a href="web/index" target="_blank">
            		<div class="logo_F">环成金服</div>
            	</a>
                
            </div>
		</div>
    
    <div class="register"  style="height: 430px;">
    	<div style="text-align:center"><img id="corr_pwd" src="static/img/web/register_img/success.png" style="width:87px;height:87px" /></div>
    	<div style="font-size:40px;text-align:center;padding-top:15px">修改成功</div>
    		<br/><br/><br/>
    	<div style="text-align:center"><button onclick="location.href='web/login'" id="register" style="margin-left:  354px" type="button">立即登录</button></div>
    	<div style="text-align:center"><button  onclick="location.href='web/index'" id="register" style="margin-left:  354px" type="button">进入官网</button></div>
    	
	</div>
    
    
    <!--底部-->
    <div class=" w1200 mauto R_bot">
    	<div class=" clearb" >
                <div class="h40">
                </div>
                <div class=" w290 h12 mauto" style=" font-size:12px;">
                    <ul>
                        <li class=" fl w70 h12 lh12 tac"><a href="web/aboutUsList">联系我们</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="web/aboutUsList">加入我们</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="" >免责声明</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="http://www.qhhcjf.com/sitemap.html" target="_blank" >网站地图</a></li>
                    </ul>
                </div>
            </div>
            
           <div class=" h10 clearb"></div> 
           
         <div>
         	<p class=" tac lh24 " style=" font-size:12px; color:#666;">
                ©2017 www.qhhcjf.com 深圳前海环成投资咨询有限公司 版权所有 
                <a href="" target="_blank">粤ICP备 17043698号-1</a>
                
		 	</p>
         </div>   
            
    
    </div>
    
    
    </body>
</html>