package org.timetable.univ.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController {

	@RequestMapping("/inbox")
	public ModelAndView inboxHandle() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("inbox");
		return mav;
	}
}
