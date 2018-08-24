package org.timetable.univ.controller.admin;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

	ServletContext application;
	
//	@RequestMapping("/dashboard")
//	public String adminDashboardHandle() {
//		
//		return "admin.dashboard";
//	}
	@RequestMapping("/dashboard")
	public ModelAndView adminMainHandle() {
		ModelAndView mav = new ModelAndView();
		
		
		
		
		mav.setViewName("admin.dashboard");
		return mav;
	}
	@RequestMapping("/timetable")
	public ModelAndView adminTimetableHandle() {
		ModelAndView mav=new ModelAndView();
		
		
		
		return mav;
		
	}
}
