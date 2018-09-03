package org.timetable.univ.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/timetable/ajax")
public class SHSTimeTableAjaxController {

	
	@RequestMapping(path="/checkbox", produces="application/json;charset=utf-8")
	@ResponseBody
	public String timetableCheckboxAjaxHandle(@RequestParam String json) {
		
		return null;
	}
}
