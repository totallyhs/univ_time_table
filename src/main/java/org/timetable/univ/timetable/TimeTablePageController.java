package org.timetable.univ.timetable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.CSMTimeTableDao;
import org.timetable.univ.dao.SHSSubjectDao;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.model.vo.SubjectVo;
import org.timetable.univ.timetable.mongo.TimetableMongoRepository;
import org.timetable.univ.timetable.mongo.TimetableMongoVo;

import com.google.gson.Gson;

@Controller
@RequestMapping("/timetable")
public class TimeTablePageController {
	@Autowired
	SHSSubjectDao subjectdao;
	@Autowired
	CSMTimeTableDao timetabledao;
	
	@Autowired
	CSMTimetableService csmTimetable;
	
	@Autowired
	TimetableMongoRepository timetableMongoRepository;
	
	@Autowired
	Gson gson;
	
	@RequestMapping("/search")
	public ModelAndView timetableSearchHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "search", WebRequest.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();
		Timetable timetable = new Timetable();
		webRequest.setAttribute("timetable", timetable, WebRequest.SCOPE_SESSION);
		
		//SubjectList
		List<SubjectVo> subjectList = subjectdao.getOnlyMajorSubjects();
		
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
		mav.setViewName("timetable.edited");
		return mav;
	}
	
	
	
	@PostMapping("/culture/combination")
	@ResponseBody
	public String cultureCombinationPostHandle(@RequestParam int unitssum, WebRequest webRequest,  
			HttpSession session) {
		Timetable timetable = (Timetable)session.getAttribute("timetable");
		Map<Integer, List<ClassVo>> checkedClassMap = timetable.checkedClassMap;
		
		List<Map> cultureCombi = csmTimetable.cultureCombination(timetable, unitssum);
		session.setAttribute("cultureCombinedTimetable", cultureCombi);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		if (cultureCombi != null && !cultureCombi.isEmpty()) {
			jsonMap.put("empty", true);
		} else {
			jsonMap.put("empty", false);
		}
		
		return gson.toJson(jsonMap);
		
	}
	
	
	@GetMapping("/culture/combination")
	public ModelAndView cultureCombinationGetHandle(@RequestParam(name="page", defaultValue="0") int page, WebRequest webRequest, 
			HttpSession session) {
		webRequest.setAttribute("content", "culture.combined", WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		
		List<Map<Integer, List<ClassVo>>> cultureCombi = 
				(List<Map<Integer, List<ClassVo>>>)session.getAttribute("cultureCombinedTimetable");
		
		// Mongo delete then save
		String memberId = ((MemberVo)session.getAttribute("memberVo")).getId();
		
		timetableMongoRepository.deleteByMemberId(memberId);
		
		TimetableMongoVo ttMongoVo = new TimetableMongoVo();
		ttMongoVo.setCultureCombiStr(gson.toJson(cultureCombi));
		ttMongoVo.setMemberId(((MemberVo)session.getAttribute("memberVo")).getId());
		timetableMongoRepository.insertListTimeTable(ttMongoVo);
		
		
		if (cultureCombi.size() > page) {
			mav.addObject("cultureCombinedTimetable", gson.toJson(cultureCombi.get(page)));
			System.out.println("page : " + page);
			System.out.println(cultureCombi.get(page));
		} else {
			mav.addObject("cultureCombinedTimetable", null);
		}
		
		mav.addObject("listLength", cultureCombi.size());
		mav.addObject("page", page);
		mav.setViewName("timetable.culture.combined");
		
		return mav;
	}
	
	
	
}
