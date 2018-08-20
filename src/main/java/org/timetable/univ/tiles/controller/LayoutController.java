package org.timetable.univ.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LayoutController {

	@RequestMapping("/default")
	public String defaultLayoutHandle() {
		return "default";
	}
}
