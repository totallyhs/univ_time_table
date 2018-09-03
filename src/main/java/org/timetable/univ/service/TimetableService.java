package org.timetable.univ.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.timetable.univ.controller.component.Timetable;

import com.google.gson.Gson;

@Service
public class TimetableService {

	@Autowired
	Gson gson;
	
	@Autowired
	Timetable timetable;
	
	public void checkboxCheck(Map jsonMap) {
		boolean[][] table = timetable.table;
		
		int classNo = (Integer)jsonMap.get("no");
		
		
	}
}
