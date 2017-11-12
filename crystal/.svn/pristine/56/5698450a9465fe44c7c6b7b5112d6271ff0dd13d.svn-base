package com.base.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.base.common.util.ConfigUtil;

@WebListener
public class InitListener implements ServletContextListener {

    public InitListener() {
    }

    public void contextInitialized(ServletContextEvent event)  { 
    	
    	event.getServletContext().setAttribute("path", event.getServletContext().getContextPath());
    }

    public void contextDestroyed(ServletContextEvent evnet)  { 
    }
	
}
