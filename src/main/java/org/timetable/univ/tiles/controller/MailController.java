package org.timetable.univ.tiles.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.SHSMailDao;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	SHSMailDao shsMailDao;
	
	// INBOX
	
	@GetMapping("/inbox")
	public ModelAndView inboxHandle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		// get mails
		List<Map<String, Object>> mailList = shsMailDao.getAllMailsWithFilesCount();
		mav.addObject("mailList", mailList);
		mav.addObject("today", new Date());
		
		mav.setViewName("mail.inbox");
		mav.addObject("uri", request.getRequestURI());
		return mav;
	}
	
	// COMPOSE
	
	@GetMapping("/compose")
	public ModelAndView composingHandle(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mail.compose");
		mav.addObject("uri", request.getRequestURI());
		return mav;
	}
	
	@PostMapping("/compose")
	public String composingPostHandle(WebRequest webRequest) {
		return null;
	}
	
}
