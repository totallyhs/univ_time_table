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
	
	public void checkboxCheck(String json, Timetable timetable) {
		
		boolean[][] table = timetable.table;
		
		
		
		
	}
}
