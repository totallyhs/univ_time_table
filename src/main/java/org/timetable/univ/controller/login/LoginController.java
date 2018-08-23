package org.timetable.univ.controller.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.timetable.univ.dao.SHSMemberDao;
import org.timetable.univ.model.vo.MemberVo;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	SHSMemberDao shsMemberDao;
	
	@PostMapping("/login")
	public String loginHandle(@RequestParam HashMap<String, String> data, WebRequest webRequest) {
		MemberVo memberVo = shsMemberDao.findByIdAndPassMap(data);
		
		webRequest.setAttribute("memberVo", memberVo, WebRequest.SCOPE_SESSION);
		
		if (memberVo==null) {
			webRequest.setAttribute("login", false, WebRequest.SCOPE_REQUEST);
		}
		
		return ("index");
	}
}
