package org.timetable.univ.tiles.controller;

import java.util.ArrayList;
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
		
		//SubjectList
		List<SubjectVo> subjectList = subjectdao.getAllSubjects();
		
		// ClassMap
		/*
		Map<String, Map<Integer, List<ClassVo>>> classMap = new HashMap<String, Map<Integer, List<ClassVo>>>();
		for (int subjectCnt = 0; subjectCnt < subjectList.size(); subjectCnt++) {
			String subjectNo = subjectList.get(subjectCnt).getNo();
			Map<Integer, List<ClassVo>> cMap = null;
			// 해당 과목이 없으면 과목 Map 만들어주기
			if (!classMap.containsKey(subjectNo)) {
				cMap = new HashMap<Integer, List<ClassVo>>();
				classMap.put(subjectNo, cMap);
			}
			// 해당 과목 번호에 맞는 모든 class 갖고오기
			List<ClassVo> list = timetabledao.getSubjectClassList(subjectNo);
			// 리스트의 class 들을 cMap에 classno key 값으로 설정
			for (int i=0; i<list.size(); i++) {
				if (!cMap.containsKey(list.get(i).getNo())) {
					List<ClassVo> classList = new ArrayList<ClassVo>();
					cMap.put(list.get(i).getNo(), classList);
				}
				cMap.get(list.get(i).getNo()).add(list.get(i));
			}
		}
		*/
		
		for(int i=0;i<subjectList.size();i++) {
			subjectList.get(i).setClassList(timetabledao.getSubjectClassList(subjectList.get(i).getNo()));
		}
		mav.addObject("subjectList", subjectList);
		// mav.addObject("classMap", classMap);
		mav.setViewName("timetable");
		return mav;
	}
	
}
