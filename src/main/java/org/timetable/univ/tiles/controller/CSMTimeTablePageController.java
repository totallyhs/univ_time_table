package org.timetable.univ.tiles.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.CSMTimeTableDao;
import org.timetable.univ.dao.SHSSubjectDao;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.SubjectVo;

@Controller
@RequestMapping("/timetable")
public class CSMTimeTablePageController {
	@Autowired
	SHSSubjectDao subjectdao;
	@Autowired
	CSMTimeTableDao timetabledao;
	
	@RequestMapping("/result")
	public String timetableResultHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "result", WebRequest.SCOPE_REQUEST);
		
		return "timetable";
	}
	
	@RequestMapping("/search")
	public ModelAndView timetableSearchHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "search", WebRequest.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();
		List<SubjectVo> subjectList = subjectdao.getAllSubjects();
		
		for(int i=0;i<subjectList.size();i++) {
			subjectList.get(i).setClassList(timetabledao.getSubjectClassList(subjectList.get(i).getNo()));
		}
		mav.addObject("subjectList", subjectList);
		mav.setViewName("timetable");
		return mav;
	}
	
}
