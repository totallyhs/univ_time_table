package org.timetable.univ.tiles.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.timetable.univ.controller.component.CSMTimetable;
import org.timetable.univ.controller.component.Timetable;
import org.timetable.univ.service.TimetableService;

@Controller
@RequestMapping("/timetable/ajax")
public class SHSTimeTableAjaxController {

	@Autowired
	TimetableService timetableService;
	
	@Autowired
	CSMTimetable csmTimetable;
	
	@RequestMapping(path="/checkboxchecked", produces="application/json;charset=utf-8")
	@ResponseBody
	public String timetableCheckboxAjaxHandle(@RequestParam String json, HttpSession session) {
		Timetable timetable = (Timetable)session.getAttribute("timetable");
		String jsonResult = timetableService.checkboxChecked(json, timetable);
		
		return jsonResult;
	}
	
	
	
	
}
