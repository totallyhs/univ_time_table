package org.timetable.univ.tiles.controller;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping("/admin")
public class AdminPageController {

	ServletContext application;
	
	@RequestMapping("/dashboard")
	public String adminDashboardHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "dashboard", WebRequest.SCOPE_REQUEST);
		
		return "admin.dashboard";
	}
	
	@RequestMapping("/subjects/add")
	public String adminSubjetsAddHandle(WebRequest webRequest) {
		webRequest.setAttribute("content", "classes", WebRequest.SCOPE_REQUEST);
		
		return "admin.subjects";
	}
}
