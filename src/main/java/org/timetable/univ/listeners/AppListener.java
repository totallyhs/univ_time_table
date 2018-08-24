package org.timetable.univ.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.timetable.univ.dao.SHSAdminDao;

@Component
public class AppListener implements ApplicationListener{

	ApplicationContext applicationContext;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private SHSAdminDao shsAdminDao;
	
	
	public void onApplicationEvent(ApplicationEvent event) {
		//System.out.println("onApplicationEvent event : " + event.toString());
		
		
		if (event instanceof ContextRefreshedEvent) {
			//System.out.println("contextInitialized");
			
			// visitor count
			//System.out.println(shsAdminDao == null);
			int visitorCnt = shsAdminDao.getVisitorCnt();
			servletContext.setAttribute("visitorCnt", visitorCnt);
			
			//System.out.println(visitorCnt + " on ContextRefreshedEvent");
		}
		
		if (event instanceof ContextClosedEvent) {
			// visitor count save
			Integer visitorCnt = (Integer)servletContext.getAttribute("visitorCnt");
			//System.out.println(visitorCnt + " on ContextClosedEvent");
			
			boolean success = shsAdminDao.updateVisitorCnt(visitorCnt);
			System.out.println("visitor count save success : " + success);
		}
	}
}
