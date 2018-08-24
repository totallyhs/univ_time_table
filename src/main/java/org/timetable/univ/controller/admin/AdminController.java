package org.timetable.univ.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	
	@RequestMapping("/admin")
	public ModelAndView adminHandle() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin");
		
		
		return mav;
	}
}
