package org.timetable.univ.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminPageController {

	@RequestMapping("/dashboard")
	public String adminDashboardHandle() {
		return "admin.dashboard";
	}
}
