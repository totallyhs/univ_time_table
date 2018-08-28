package org.timetable.univ.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping("/timetable")
public class CSMTimeTablePageController {
	@RequestMapping("/result")
	public String adminDashboardHandle(WebRequest webRequest) {
		
		return "timetable";
	}
	
}
