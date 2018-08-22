package org.timetable.univ;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@GetMapping("index")
	public String index() {
		return "index";
	}
	
	@PostMapping("index")
	public ModelAndView indexLoginHandle(@RequestParam(value="id") String id) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
		
	}
}
