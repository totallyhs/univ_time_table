package org.timetable.univ.tiles.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.timetable.univ.controller.subjects.SHSSubjectDao;
import org.timetable.univ.dao.SHSDepartmentDao;
import org.timetable.univ.model.vo.DepartmentVo;
import org.timetable.univ.model.vo.SubjectVo;

import com.google.gson.Gson;

@Controller
@RequestMapping("/admin")
public class SHSAdminPageController {
	
	@Autowired
	SHSSubjectDao shsSubjectDao;
	
	@Autowired
	SHSDepartmentDao shsDepartmentDao;
	
	@Autowired
	Gson gson;
	
	@GetMapping("/classes/add")
	public String adminClassesHandle(WebRequest webRequest) {
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
	
	
	
}
