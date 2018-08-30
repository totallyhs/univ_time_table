package org.timetable.univ.tiles.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.SHSClassDao;
import org.timetable.univ.dao.SHSDepartmentDao;
import org.timetable.univ.dao.SHSSubjectDao;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.DepartmentVo;
import org.timetable.univ.model.vo.SubjectVo;

import com.google.gson.Gson;

@Controller
@RequestMapping("/admin")
public class SHSAdminPageController {
	
	@Autowired
	SHSSubjectDao shsSubjectDao;
	
	@Autowired
	SHSClassDao shsClassDao;
	
	@Autowired
	SHSDepartmentDao shsDepartmentDao;
	
	@Autowired
	Gson gson;
	
	// subject 수정
	@GetMapping("/subjects/list")
	public String adminSubjectsListGetHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "subjects.list", WebRequest.SCOPE_REQUEST);				
				
		// get all subjects and put in request
		List<HashMap> subjectsList =  shsSubjectDao.getAllSubjectsWithDeptName();
		webRequest.setAttribute("subjectsList", subjectsList, WebRequest.SCOPE_REQUEST);
		
		return "admin.subjects.list";
	}
	
	
	
	
	
	@GetMapping("/classes/add")
	public String adminClassesAddGetHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "classes", WebRequest.SCOPE_REQUEST);
		
		// 전공 정보 가져오고 보내기
		List<DepartmentVo> departmentList = shsDepartmentDao.getAllDept();
		webRequest.setAttribute("departmentList", departmentList, WebRequest.SCOPE_REQUEST);

		return "admin.classes";
		
	}
	
	// Classes Add 페이지에서 department을 선택하면 그에 맞는 subjects 리스트 보내주기
	@RequestMapping(path="/classes/add/ajax/subject", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String adminClassesAddAjaxSubjectHandle(@RequestParam int departmentNo) {
		System.out.println(departmentNo);
		//Map dataMap = gson.fromJson(data, Map.class);
		//int departmentNo = (Integer)dataMap.get("departmentNo");
		
		// 과목(Subject) 정보 가져오고 보내기
		List<SubjectVo> subjectList = shsSubjectDao.getSubjectsByDept(departmentNo);
		String json = gson.toJson(subjectList);
		
		return json;
	}
	@RequestMapping(path="/classes/add/ajax/subject2", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String adminClassesAddAjaxSubject2Handle(@RequestParam String sno) {
		System.out.println(sno);
		//Map dataMap = gson.fromJson(data, Map.class);
		//int departmentNo = (Integer)dataMap.get("departmentNo");
		
		// 과목(Subject) 정보 가져오고 보내기
		SubjectVo svo = shsSubjectDao.getSubjectsBySno(sno);
		String json = gson.toJson(svo);
		
		return json;
	}
	
	
	@PostMapping("/classes/add")
	public ModelAndView adminClassesAddPostHandle(@ModelAttribute ClassVo classVo, WebRequest webRequest) {
		webRequest.setAttribute("content", "classes", WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		
		// get Seq
		int id = shsClassDao.getClassSeq();
		classVo.setId(id);
		
		boolean result = shsClassDao.insertClass(classVo);
		
		System.out.println("addsubject complete");
		
		mav.addObject("addresult", result);
		mav.setViewName("admin.classes");
		return mav;
	}
	
	// subject 수정
	@GetMapping("/subjects/update")
	public String adminSubjectsUpdateGetHandle(@RequestParam String no, WebRequest webRequest) {
		webRequest.setAttribute("content", "subjects.update", WebRequest.SCOPE_REQUEST);
		
		// get subject and put in request
		SubjectVo subjectVo = shsSubjectDao.getSubjectsBySno(no);
		webRequest.setAttribute("subjectVo", subjectVo, WebRequest.SCOPE_REQUEST);
		
		// 전공 정보 가져오고 보내기
		List<DepartmentVo> departmentList = shsDepartmentDao.getAllDept();
		webRequest.setAttribute("departmentList", departmentList, WebRequest.SCOPE_REQUEST);
		
		return "admin.subjects.update";
		
	}
	
	@PostMapping("/subjects/update")
	public ModelAndView adminSubjectsUpdatePostHandle(@ModelAttribute SubjectVo subjectVo, WebRequest webRequest) {
		webRequest.setAttribute("content", "subjects.update", WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		
		System.out.println(subjectVo.getNo() + "//" + subjectVo.getDepartment());
		
		boolean result = shsSubjectDao.updateSubject(subjectVo);
		
		System.out.println("updateSubject complete");
		
		mav.addObject("addresult", result);
		mav.setViewName("admin.subjects.update");
		return mav;
	}
	
	// subject 삭제
	@GetMapping("/subjects/delete")
	public String adminSubjectsDeleteGetHandle(@RequestParam String no, WebRequest webRequest) {
		webRequest.setAttribute("content", "subjects.delete", WebRequest.SCOPE_REQUEST);
		
		// get subject and put in request
		SubjectVo subjectVo = shsSubjectDao.getSubjectsBySno(no);
		webRequest.setAttribute("subjectVo", subjectVo, WebRequest.SCOPE_REQUEST);
		
		return "admin.subjects.delete";
			
	}
	
	@PostMapping("/subjects/delete")
	public ModelAndView adminSubjectsDeletePostHandle(@RequestParam String no, WebRequest webRequest) {
		webRequest.setAttribute("content", "subjects.delete", WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		
		boolean result = shsSubjectDao.deleteSubjectByNo(no);
		
		System.out.println("deleteSubject complete");
		
		mav.addObject("addresult", result);
		mav.setViewName("admin.subjects.delete");
		return mav;
	}
	
	// subject 삭제
		@GetMapping("/subjects/delete/many")
		public String adminSubjectsDeleteManyGetHandle(@RequestParam(name="checkbox") List list, WebRequest webRequest) {
			webRequest.setAttribute("content", "subjects.delete.many", WebRequest.SCOPE_REQUEST);
			webRequest.setAttribute("checkbox", list, WebRequest.SCOPE_REQUEST);
			
			return "admin.subjects.delete.many";
				
		}
		
		@PostMapping("/subjects/delete/many")
		public ModelAndView adminSubjectsDeleteManyPostHandle(@RequestParam(name="checkbox") List<String> list, WebRequest webRequest) {
			webRequest.setAttribute("content", "subjects.delete.many", WebRequest.SCOPE_REQUEST);
			System.out.println(list);
			ModelAndView mav = new ModelAndView();
			
			boolean result = shsSubjectDao.deleteSubjectManyByNo(list);
			
			System.out.println("deleteSubject complete");
			
			mav.addObject("addresult", result);
			mav.setViewName("admin.subjects.delete.many");
			return mav;
		}
	
	
	
	
	
	
}
