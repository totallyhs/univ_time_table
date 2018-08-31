package org.timetable.univ.tiles.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.SHSDepartmentDao;
import org.timetable.univ.dao.admin.CHSAdminDao;
import org.timetable.univ.dao.admin.CSMAdminDao;
import org.timetable.univ.model.vo.DepartmentVo;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.model.vo.SubjectVo;

@Controller
@RequestMapping("/admin")
public class CSMAdminPageController {
	@Autowired
	CSMAdminDao admindao;
	
	@Autowired
	CHSAdminDao CHSAdminDao;
	
	@Autowired
	SHSDepartmentDao shsDepartmentDao;
	
//	ServletContext application;
//	
//	@RequestMapping("/dashboard")
//	public String adminDashboardHandle() {
//		
//		return "admin.dashboard";
//	}

	ServletContext application;
	
	@RequestMapping("/dashboard")
	public String adminDashboardHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "dashboard", WebRequest.SCOPE_REQUEST);
		
		return "admin.dashboard";
	}
//	// 관리자 member 처리
//	@RequestMapping("/member/list")
//	public String adminMemberHandler(WebRequest webRequest) {
//		
//		webRequest.setAttribute("content","members.list", WebRequest.SCOPE_REQUEST);
//		List<MemberVo> list = new ArrayList();
//		list = CHSAdminDao.memberList();
//		webRequest.setAttribute("memberlist", list, WebRequest.SCOPE_REQUEST);
//		
//		return "admin.members.list";
//	}

	@GetMapping("/subjects/add")
	public String adminSubjectsHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "subjects", WebRequest.SCOPE_REQUEST);
		
		// 전공 정보 가져오고 보내기
		List<DepartmentVo> departmentList = shsDepartmentDao.getAllDept();
		webRequest.setAttribute("departmentList", departmentList, WebRequest.SCOPE_REQUEST);
		
		return "admin.subjects";
	}
	@PostMapping("/subjects/add")
	public ModelAndView adminSubjectsAddHandle(@ModelAttribute SubjectVo svo, WebRequest webRequest) {
		webRequest.setAttribute("content", "subjects", WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		System.out.println(""+svo.getNo()+","+svo.getName()+","+svo.getUnits()+","+svo.getGrade()+","+svo.getDepartment());
		
		boolean result = admindao.addSubject(svo);
		System.out.println("addsubject complete");
		
		mav.addObject("addresult", result);
		mav.setViewName("admin.subjects");
		return mav;
	}
	
	
}
