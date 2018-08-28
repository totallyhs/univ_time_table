package org.timetable.univ.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mail")
public class MailController {

	@RequestMapping("/inbox")
	public ModelAndView inboxHandle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mail.inbox");
		mav.addObject("uri", request.getRequestURI());
		return mav;
	}
	
	@RequestMapping("/compose")
	public ModelAndView composingHandle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mail.compose");
		mav.addObject("uri", request.getRequestURI());
		return mav;
	}
}
