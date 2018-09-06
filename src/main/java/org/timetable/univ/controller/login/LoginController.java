package org.timetable.univ.controller.login;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.timetable.univ.controller.component.Timetable;
import org.timetable.univ.dao.SHSAdminDao;
import org.timetable.univ.dao.SHSMemberDao;
import org.timetable.univ.model.vo.MemberVo;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	SHSMemberDao shsMemberDao;
	
	@Autowired
	SHSAdminDao shsAdminDao;
	
	@PostMapping("/login")
	public String loginHandle(@RequestParam HashMap<String, String> data, WebRequest webRequest,HttpSession session) {
		MemberVo memberVo = shsMemberDao.findByIdAndPassMap(data);
		webRequest.setAttribute("memberVo", memberVo, WebRequest.SCOPE_SESSION);
		
		// visitorCnt setting + saving if mod 100 == 0 
		int visitorCnt = (Integer)application.getAttribute("visitorCnt");
		application.setAttribute("visitorCnt", visitorCnt + 1);
		if ((visitorCnt+1)%100 == 0 ) {
			shsAdminDao.updateVisitorCnt(visitorCnt + 1);
		}
		System.out.println("membervo" + memberVo);
		System.out.println("Test" + session.getAttribute("target"));
		MemberVo vo = (MemberVo)session.getAttribute("memberVo");
		String id = vo.getId();
		
		
		
		if (memberVo==null) {
			webRequest.setAttribute("login", false, WebRequest.SCOPE_REQUEST);
			System.out.println("test" + session.getAttribute("target"));
			if(session.getAttribute("target") != null) {
				String t = (String)webRequest.getAttribute("target", WebRequest.SCOPE_SESSION);
				return "redirect:"+t;
			}
		} else {
			Timetable timetable = new Timetable();
			webRequest.setAttribute("timetable", timetable, WebRequest.SCOPE_SESSION);
		} 
		String t = (String)webRequest.getAttribute("target", WebRequest.SCOPE_SESSION);
		System.out.println("t : " + t);
		
		if(t==null) {
			System.out.println("nulltest");
			return "redirect:/index";
		}
		else if(t.equals("/bulletinboard")) {
			return "redirect:"+t+"?no="+session.getAttribute("no");
		}else if(t.equals("/circleboard")){
			return "redirect:"+t+"?no="+session.getAttribute("no");
		}else {
			return "redirect:"+t;
		}
	}
	
	@RequestMapping("/logout")
	public String indexAjaxLogoutHandle(HttpSession session) {
		session.invalidate();
		
		return "index";
	}
}
