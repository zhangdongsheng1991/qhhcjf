package com.fh.controller.web;


import javax.servlet.ServletException;

import org.directwebremoting.Container;
import org.directwebremoting.ServerContextFactory;
import org.directwebremoting.event.ScriptSessionEvent;
import org.directwebremoting.event.ScriptSessionListener;
import org.directwebremoting.extend.ScriptSessionManager;
import org.directwebremoting.servlet.DwrServlet;





public class DwrScriptSessionManagerUtil extends DwrServlet{
	private static final long serialVersionUID = 1122343434534545L;
	
	public void init() throws ServletException{
		Container c = ServerContextFactory.get().getContainer();
		ScriptSessionManager m = c.getBean(ScriptSessionManager.class);
		ScriptSessionListener listener = new ScriptSessionListener() {
			@Override
			public void sessionDestroyed(ScriptSessionEvent arg0) {
				System.out.println("destroyed");
				
			}
			
			@Override
			public void sessionCreated(ScriptSessionEvent ev) {
				String userId = "1";
				System.out.println("dddd");
				ev.getSession().setAttribute("userId", userId);
			}
		};
		m.addScriptSessionListener(listener);
	}
}
