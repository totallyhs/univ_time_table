package org.timetable.univ.controller.courses;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.timetable.univ.dao.SHSDepartmentDao;
import org.timetable.univ.dao.SHSSubjectDao;
import org.timetable.univ.model.vo.SubjectVo;

@Controller
@RequestMapping("/courses")
public class SHSSubjectController {
	
	@Autowired
	SHSSubjectDao shsSubjectDao;
	
	@Autowired
	SHSDepartmentDao shsDepartmentDao;

	@GetMapping("/subject/list")
	public String subjectListHandle(WebRequest webRequest) {
		// content = subjects
		webRequest.setAttribute("content", "subjects", WebRequest.SCOPE_REQUEST);
		
		// get all subjects and put in request
		List<HashMap> subjectsList =  shsSubjectDao.getAllSubjectsWithDeptName();
		webRequest.setAttribute("subjectsList", subjectsList, WebRequest.SCOPE_REQUEST);
		
		return "courses.list.subjects";
	}
	
	
}
