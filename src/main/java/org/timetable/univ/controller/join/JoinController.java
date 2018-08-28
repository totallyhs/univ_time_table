package org.timetable.univ.controller.join;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.LKHMemberDao;
import org.timetable.univ.model.vo.DepartmentVo;
import org.timetable.univ.model.vo.MemberVo;

@Controller
public class JoinController {
	@Autowired
	LKHMemberDao memberDao;
	
	//가입 페이지에 학과 정보들 받아오는 메소드
	@GetMapping("/join")
	public ModelAndView joinDepartmentHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join");
		try {
			List<DepartmentVo> list = memberDao.getDepartment();
			System.out.println(list);
			mav.addObject("department", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	//가입 요청시 가입결과 반환 하는 메소드
	@PostMapping("/joinadd")
	public ModelAndView joinAddPostHandle(@ModelAttribute MemberVo vo, @RequestParam Map data, WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		int r = memberDao.addJoin(vo);
		if (r == 1) {
			MemberVo memberVo = memberDao.findByIdandPass(data);
			webRequest.setAttribute("memberVo", memberVo, WebRequest.SCOPE_SESSION);
			mav.setViewName("index");
		}else {
			mav.setViewName("join");
		}
		return mav;
	}
	
}
