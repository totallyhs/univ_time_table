package org.timetable.univ.controller.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.board.CircleBoardDao;
import org.timetable.univ.model.vo.PostlikeVo;

import com.google.gson.Gson;

@Controller
public class CircleBoardAjaxController {

	@Autowired
	Gson gson;
	
	@Autowired
	CircleBoardDao Circleboadrdao;
	
	@RequestMapping("/circlepostlike")
	public ModelAndView postLikeAjaxHandle(@RequestParam Map<String,String> map) {
		System.out.println("ajax"+map);
		ModelAndView mav = new ModelAndView();
		int postno = Integer.parseInt(map.get("no"));
		String id = map.get("id");
		PostlikeVo vo = new PostlikeVo();
		vo.setPostNo(postno);
		vo.setId(id);
		List<PostlikeVo> list = new ArrayList<PostlikeVo>();
		list = Circleboadrdao.likeList(postno);
		
		int cnt = Circleboadrdao.PostLikeCount(postno);
		
		
		boolean result = true;
		for(PostlikeVo a : list) {
			if(id.equals(a.getId())) {
				result = false;
				break;
				}
			}
			if(result) {
				Circleboadrdao.postLike(vo);
				cnt = cnt+1;
			}
				Map<String,Object> test = new HashMap();
				test.put("result", result);
				test.put("cnt", " 좋아요"+cnt);
				String json = gson.toJson(test);
				mav.setViewName("sendjson");
				mav.addObject("json",json);
				return mav;
	}
}
