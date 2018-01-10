package com.fh.controller.web;

import java.util.Collection;

import javax.servlet.ServletException;

import org.directwebremoting.Browser;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;
import org.directwebremoting.WebContextFactory;

public class DemoTest { 
	public void onPageLoad(String userId){
		ScriptSession scriptSession = WebContextFactory.get().getScriptSession();
		scriptSession.setAttribute(userId, userId);
		DwrScriptSessionManagerUtil dwrScriptSessionManagerUtil = new DwrScriptSessionManagerUtil();
		try{
			dwrScriptSessionManagerUtil.init();
		}catch(ServletException e){
			e.printStackTrace();
		}
		
	}
	public void sendMsg(String userid,String message,String jsFuc){
		final String userId = userid;
		final String msg = message;
		final String jsFunc = "receiveMsg";
		Browser.withAllSessionsFiltered(new ScriptSessionFilter(){
			public boolean match(ScriptSession session){
				if(session.getAttribute("userId")==null){
					return false;
				}else{
					return (session.getAttribute("userId")).equals(userId);
				}
			}
		}, new Runnable(){
			private ScriptBuffer script = new ScriptBuffer();
			public void run(){
				script.appendCall(jsFunc, msg);
				Collection<ScriptSession>sessions = Browser.getTargetSessions();
				for(ScriptSession scriptSession:sessions){
					scriptSession.addScript(script);
				}
			}
		});
	}
}
