package org.timetable.univ.tiles.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.timetable.univ.dao.SHSMemberDao;
import org.timetable.univ.model.vo.MemberVo;

import com.google.gson.Gson;

@Controller
@RequestMapping("/member")
public class SHSMemberController {

	@Autowired
	SHSMemberDao shsMemberDao;
	
	@Autowired
	Gson gson;
	
	@RequestMapping(path="/ajaxId", produces="application/json;charset=utf-8")
	@ResponseBody
	public String memberAjaxIdHandle(@RequestParam String id) {
		List<MemberVo> list = shsMemberDao.findAlikeId(id);
		
		String json = gson.toJson(list);
		
		return json;
	}
}
