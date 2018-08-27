package org.timetable.univ.controller.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.LKHMemberDao;
import org.timetable.univ.model.vo.MemberVo;

@Controller
public class JoinController {
	@Autowired
	LKHMemberDao memverDao;
	
	//가입 페이지에 학과 정보들 받아오는 메소드
	@GetMapping("join")
	public ModelAndView joinDepartmentHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/join/join");
		mav.addObject("department", memverDao.getDepartment());
		return mav;
	}
	//가입 요청시 가입결과 반환 하는 메소드
	@PostMapping("joinadd")
	public ModelAndView joinAddPostHandle(@ModelAttribute MemberVo vo) {
		ModelAndView mav = new ModelAndView();
		int r = memverDao.addJoin(vo);
		if (r == 1) {
			mav.addObject("joinVo", vo);
			mav.setViewName("/join/joinend");
		}else {
			mav.setViewName("/join/join");
		}
		return mav;
	}
	@RequestMapping("join")
	public String joinHandel() {
		return "join/join";
	}
}
