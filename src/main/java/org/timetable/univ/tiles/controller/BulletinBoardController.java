package org.timetable.univ.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BulletinBoardController {

	@RequestMapping("/bulletinboard")
	public ModelAndView bulletinBoardHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bulletinboard");
		
		mav.addObject("board","/WEB-INF/view/board/builletinboard.jsp");
		
		
		return mav;
	}
}
