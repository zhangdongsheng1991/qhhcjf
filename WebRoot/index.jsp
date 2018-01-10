<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.fh.util.UtilCheckPcOrPhone,javax.servlet.http.Cookie"%>
<%	int count = 0;
	if(UtilCheckPcOrPhone.pcOrPhone(request.getHeader("user-agent"))){
		request.getRequestDispatcher("/web/appindex").forward(request, response);
	}else{
		Cookie[] cookies = request.getCookies();//这样便可以获取一个cookie数组
		if(null!=cookies){
			for(Cookie cookie : cookies){
			    if(cookie.getName().equals("guidancePage")){
			    	request.getRequestDispatcher("/web/index").forward(request, response);
			    	return;
			    }
			}
			request.getRequestDispatcher("/web/guidancePage").forward(request, response);
		}else{
			request.getRequestDispatcher("/web/guidancePage").forward(request, response);
		}
	}
%>
