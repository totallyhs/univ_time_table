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
import org.timetable.univ.dao.SHSAdminDao;
import org.timetable.univ.dao.SHSMemberDao;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.model.vo.VisitorCountVo;

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
	public String loginHandle(@RequestParam HashMap<String, String> data, WebRequest webRequest) {
		MemberVo memberVo = shsMemberDao.findByIdAndPassMap(data);
		webRequest.setAttribute("memberVo", memberVo, WebRequest.SCOPE_SESSION);
		
		// visitorCnt setting + saving if mod 100 == 0 
		int visitorCnt = (Integer)application.getAttribute("visitorCnt");
		application.setAttribute("visitorCnt", visitorCnt + 1);
		if ((visitorCnt+1)%100 == 0 ) {
			shsAdminDao.updateVisitorCnt(visitorCnt + 1);
		}
		
		
		if (memberVo==null) {
			webRequest.setAttribute("login", false, WebRequest.SCOPE_REQUEST);
		}
		
		return ("index");
	}
	
	@RequestMapping("/logout")
	public String indexAjaxLogoutHandle(HttpSession session) {
		session.invalidate();
		
		return "index";
	}
}
