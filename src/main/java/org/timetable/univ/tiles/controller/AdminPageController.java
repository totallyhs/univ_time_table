package org.timetable.univ.tiles.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.admin.CSMAdminDao;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.SubjectVo;

@Controller
@RequestMapping("/admin")
public class AdminPageController {
	@Autowired
	CSMAdminDao admindao;
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
	
	@GetMapping("/subjects/add")
	public String adminSubjectsHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "classes", WebRequest.SCOPE_REQUEST);
		
		return "admin.subjects";
	}
	@PostMapping("/subjects/add")
	public ModelAndView adminSubjectsAddHandle(@ModelAttribute SubjectVo svo,@ModelAttribute ClassVo cvo,@RequestParam(name="sno") String sno,@RequestParam(name="cno") int cno ,WebRequest webRequest) {
		webRequest.setAttribute("content", "classes", WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		svo.setNo(sno);
		cvo.setNo(cno);
		cvo.setSubjectNo(sno);
		System.out.println(""+svo.getNo()+","+svo.getName()+","+svo.getUnits()+","+svo.getGrade()+","+svo.getDepartment());
		
		boolean result2 = admindao.addSubject(svo);
		System.out.println("addsubject complete");
		boolean result = admindao.addClass(cvo);
		System.out.println("addclass complete");
		mav.addObject("addresult",result);
//		mav.addObject("addresult",false);
		mav.setViewName("admin.subjects");
		return mav;
	}
}
