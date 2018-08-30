package org.timetable.univ.tiles.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.SHSMailDao;
import org.timetable.univ.model.vo.MailFileVo;
import org.timetable.univ.model.vo.MailVo;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.service.MailService;
import org.timetable.univ.service.UploadService;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	SHSMailDao shsMailDao;
	
	@Autowired
	UploadService uploadService;
	
	@Autowired
	MailService mailService;
	
	// INBOX
	
	@GetMapping("/inbox")
	public ModelAndView inboxHandle(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// get mails
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		List<Map<String, Object>> mailList = shsMailDao.getAllMailsWithFilesCount(memberVo.getId());
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
	public String composingPostHandle(@ModelAttribute MailVo mailVo, 
			WebRequest webRequest, @RequestParam("fileupload") MultipartFile[] files) {
		// Mail
		mailService.setMailVo(mailVo, 
				(MemberVo)webRequest.getAttribute("memberVo", WebRequest.SCOPE_SESSION));
		
		boolean mailSuccess = shsMailDao.saveMail(mailVo);
		System.out.println("mailsave success = " + mailSuccess);
		
		// Mail files
		int successCnt = 0;
		boolean mailFileSuccess = false;
		if (!files[0].isEmpty()) {
			for (int i=0; i<files.length; i++) {
				MailFileVo mailFileVo = null;
				try {
					mailFileVo = uploadService.mailFileUploadHanlde(files[i], mailVo.getNo());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				boolean succ = shsMailDao.saveMailFiles(mailFileVo);
				if (succ) {
					successCnt++;
				}
			}
			System.out.println("mail files save success = " + (successCnt == files.length));
			if (successCnt == files.length) {
				mailFileSuccess = true;
			}
		} else {
			mailFileSuccess = true;
		}
		
		if (mailSuccess && mailFileSuccess) {
			webRequest.setAttribute("success", true, WebRequest.SCOPE_REQUEST);
		} else{
			webRequest.setAttribute("success", false, WebRequest.SCOPE_REQUEST);
		}
		
		return "mail.compose";
	}
	
	
	// VIEW
	
	@GetMapping("view")
	public String viewGetHandle(@RequestParam("no") int no, WebRequest webRequest, HttpServletRequest request) {
		MailVo mailVo = shsMailDao.getMailByNo(no);
		List<MailFileVo> files = shsMailDao.getFilesByMailNo(no);
		
		webRequest.setAttribute("mailVo", mailVo, WebRequest.SCOPE_REQUEST);
		webRequest.setAttribute("files", files, WebRequest.SCOPE_REQUEST);
		webRequest.setAttribute("uri", request.getRequestURI(), WebRequest.SCOPE_REQUEST);
		
		return "mail.view";
		
	}
	
}
