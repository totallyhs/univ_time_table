package org.timetable.univ.controller.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.timetable.univ.dao.LKHMemberDao;
import org.timetable.univ.model.vo.MemberVo;

import com.google.gson.Gson;

@Controller
public class AjaxController {
	@Autowired
	Gson gson;
	
	@Autowired
	LKHMemberDao memberDao;
	
	// Ajax로 실시간으로 데이터 받아오기 위한 메소드
	@RequestMapping(value="/joinIdCheck", method = RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String idCheckAjaxHandle(@RequestParam String id ) {
		System.out.println("param : " + id);
		MemberVo MemberId = memberDao.getIdCheck(id);
		String json = gson.toJson(MemberId);
		return json;
	}
	@RequestMapping(value="/joinNickCheck", method = RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String nickCheckAjaxHandle(@RequestParam String nickname ) {
		System.out.println("param : " + nickname);
		MemberVo MemberNackname = memberDao.getNickNameCheck(nickname);
		String json = gson.toJson(MemberNackname);
		return json;
	}
	
	
	
}
