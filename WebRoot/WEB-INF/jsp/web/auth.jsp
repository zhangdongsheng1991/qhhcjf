<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
	<title>环成金服</title>
  </head>
 <body>
 	
<script type="text/javascript">  
var browser={   
versions:function(){   
var u = navigator.userAgent, app = navigator.appVersion;   
return {   
trident: u.indexOf('Trident') > -1, //IE内核   
presto: u.indexOf('Presto') > -1, //opera内核   
webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核   
gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核   
mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端   
ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端   
android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器   
iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器   
iPad: u.indexOf('iPad') > -1, //是否iPad   
webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部   
};  
}()  
}
var fal = true;
if(browser.versions.ios){
	fal = false;
} 
if(browser.versions.android){
	fal = false;
}
if(browser.versions.iPhone){
	fal = false;
} 
if(browser.versions.iPad){
	fal = false;
}
if(fal){
	location.href="web/index";
}else{
	location.href="web/appindex";
}
</script>  
 </body>
</html>
