package org.timetable.univ.timetable;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/timetable/ajax")
public class TimeTableAjaxController {

	@Autowired
	SHSTimetableService timetableService;
	
	@RequestMapping(path="/checkboxchecked", produces="application/json;charset=utf-8")
	@ResponseBody
	public String timetableCheckboxCheckedAjaxHandle(@RequestParam String json, HttpSession session) {
		Timetable timetable = (Timetable)session.getAttribute("timetable");
		String jsonResult = timetableService.checkboxChecked(json, timetable);
		
		return jsonResult;
	}
	
	@RequestMapping(path="/checkboxunchecked", produces="application/json;charset=utf-8")
	@ResponseBody
	public String timetableCheckboxUncheckedAjaxHandle(@RequestParam String json, HttpSession session) {
		Timetable timetable = (Timetable)session.getAttribute("timetable");
		String jsonResult = timetableService.checkboxUnchecked(json, timetable);
		
		return jsonResult;
	}
	
	
	
	
}
