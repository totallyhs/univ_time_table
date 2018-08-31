package org.timetable.univ.tiles.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.admin.CHSAdminDao;
import org.timetable.univ.model.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class CHSAdminController {

	@Autowired
	CHSAdminDao CHSAdminDao;
	
	
	
	// 관리자 member 처리
	@RequestMapping("/members/list")
	public String adminMemberHandler(WebRequest webRequest) {
		
		webRequest.setAttribute("content","members.list", WebRequest.SCOPE_REQUEST);
		List<MemberVo> list = new ArrayList();
		list = CHSAdminDao.memberList();
		webRequest.setAttribute("memberlist", list, WebRequest.SCOPE_REQUEST);
		
		return "admin.members.list";
	}
	
	@GetMapping("/members/delete")
	public String adminMemberDeleteGetHandle(WebRequest webRequest,@RequestParam int no) {
		webRequest.setAttribute("content", "members.delete", WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		MemberVo vo = CHSAdminDao.memberDeleteSelect(no);
		webRequest.setAttribute("memberVo", vo, webRequest.SCOPE_REQUEST);
		
		return "admin.members.delete";
	}
	
	@PostMapping("/members/delete")
	public String adminMemberDeletePostHandle(WebRequest webRequest,@RequestParam int no) {
		boolean result = CHSAdminDao.memberDelete(no);
		webRequest.setAttribute("result", result, webRequest.SCOPE_REQUEST);
		
		return "admin.members.delete";
	}
	
	@GetMapping("/members/delete/many")
	public String adminMembersDeleteManyGetHandle(@RequestParam(name="checkbox") List list,WebRequest webRequest) {
		webRequest.setAttribute("content", "members.delete.many", WebRequest.SCOPE_REQUEST);
		webRequest.setAttribute("checkbox", list, webRequest.SCOPE_REQUEST);
	
		
		return "admin.members.delete.many";
	}
	
	@PostMapping("/members/delete/many")
	public String adminMembersDeleteManyPostHandle(WebRequest webRequest,@RequestParam(name="checkbox") List<String> list) {
		boolean result;
			for(int i=0; i<list.size();i++) {
				String id = list.get(i);
				result = CHSAdminDao.memberDeleteMany(id);
				webRequest.setAttribute("result", result, webRequest.SCOPE_REQUEST);
			}
			
		return "admin.members.delete.many";
	}
	
}
