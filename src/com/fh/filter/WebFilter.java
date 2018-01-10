package com.fh.filter;

import java.io.IOException;







import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.fh.util.UtilCheckPcOrPhone;


public class WebFilter implements Filter {
	protected final Logger log = Logger.getLogger(getClass());

	public void init(FilterConfig config) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		//获取请求的URL
		//String requestURI = httpRequest.getRequestURI();
		//String requestQuery = httpRequest.getQueryString();
		
		String pcOrPhone = "";
		if(UtilCheckPcOrPhone.pcOrPhone(httpRequest.getHeader("user-agent"))){
			pcOrPhone = "手机端";
		}else{
			pcOrPhone = "电脑端";
		}
		HttpSession session = httpRequest.getSession(true);
		
		String sign = httpRequest.getParameter("sign");
		if(sign!=null){
			sign = sign.substring(0, 2);	
			if("bd".equals(sign)){
				session.setAttribute("CHANNEL", "百度");
			}else if("sg".equals(sign)){
				session.setAttribute("CHANNEL", "搜狗");
			}else if("36".equals(sign)){
				session.setAttribute("CHANNEL", "360");
			}else if("sm".equals(sign)){
				session.setAttribute("CHANNEL", "神马");
			}
		}
		
		String ip = (String) session.getAttribute("ip");
		String channelurl = (String) session.getAttribute("channelurl");
		Integer _port = (Integer) session.getAttribute("_port");
		if(ip==null){
			ip = httpRequest.getRemoteAddr();
			session.setAttribute("ip",ip);
		}
		if(_port==null){
			_port = httpRequest.getRemotePort();
			session.setAttribute("_port",_port);
		}
		if(channelurl==null){
			//channelurl = httpRequest.getHeader("REFERER");
			Enumeration enu=httpRequest.getParameterNames();  
			String parm = "?";
			while(enu.hasMoreElements()){  
				String parmName=(String)enu.nextElement();  
				String parmVal = httpRequest.getParameter(parmName);  
				parm += parmName+"="+parmVal+"&";
			}
			parm = parm.substring(0, parm.length()-1);
			channelurl = httpRequest.getRequestURI()+parm;
			session.setAttribute("channelurl",channelurl);
		}
		session.setAttribute("pcOrPhone", pcOrPhone);
		int count = 0;
		if("手机端".equals(pcOrPhone)&&httpRequest.getRequestURI().contains("web/teamList")){
			count++;
			httpRequest.getRequestDispatcher("/web/appindex").forward(request, response);
		}else{
			//若没有经过授权，跳转到授权地址
			chain.doFilter(request, response);
		}
	}

	public void destroy() {
	
	}

}