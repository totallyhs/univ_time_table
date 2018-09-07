package org.timetable.univ;

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
import org.timetable.univ.dao.SHSMemberDao;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.MemberVo;

import com.google.gson.Gson;

@Controller
public class IndexController {
	
	@Autowired
	SHSMemberDao shsMemberDao;
	
	@Autowired
	Gson gson;

	@GetMapping({"/index", "/"})
	public String index(@RequestParam(name="page", defaultValue="0") int page, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		if (memberVo != null) {
			List<Map<Integer, List<ClassVo>>> lastCombi = 
					(List<Map<Integer, List<ClassVo>>>)session.getAttribute("lastCombi");
			if (lastCombi != null) {
				session.setAttribute("lastCombiTimetable", gson.toJson(lastCombi.get(page)));
			}
		}
		return "index";
	}
	
	@PostMapping({"/index", "/"})
	public String indexLoginHandle(@RequestParam String id, HttpSession session) {
		// 회원 정보 가져오기
		MemberVo memberVo = shsMemberDao.findById(id);
		
		// 회원 정보 세션에 넣기
		session.setAttribute("memberVo", memberVo);
		
		return "index";
		
	}
	
}
