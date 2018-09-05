package org.timetable.univ.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.timetable.univ.controller.component.Timetable;
import org.timetable.univ.model.vo.ClassVo;

import com.google.gson.Gson;

@Service
public class TimetableService {

	@Autowired
	Gson gson;
	
	public String checkboxChecked(String json, Timetable timetable) {
		// list of maps containing in map
		// key : id, val : classid
		// key : units, val : units
		// key : boxes, val :  list of boxes => i- day
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		
		List classJson = gson.fromJson(json, List.class);
		String subjectNo = (String) ((Map)classJson.get(0)).get("subjetno");
		System.out.println(classJson);
		
		// update checkedSubjectClassMap
		Map<String, List<ClassVo>> checkedSubjectClassMap = timetable.checkedSubjectClassMap;
		
		// to update checkedClassMap
		Map<Integer, List<ClassVo>> checkedClassMap = timetable.checkedClassMap;
		
		// to update table
		boolean[][] table = timetable.table;
		
		if (!checkedSubjectClassMap.containsKey(subjectNo)) {
			List<ClassVo> clList = new ArrayList<ClassVo>();
			checkedSubjectClassMap.put(subjectNo, clList);
		}
		
		// for each class
		for (int i=0; i<classJson.size(); i++) {
			Map<String, Object> jsonMap = (Map<String, Object>) classJson.get(i);
			int id = Integer.parseInt((String)jsonMap.get("id"));
			int units = Integer.parseInt((String)jsonMap.get("units"));
			int classNo = Integer.parseInt((String)jsonMap.get("no"));
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("id", id);
			resultMap.put("units", units);
			
			
			ClassVo classVo = new ClassVo();
				classVo.setId(id);
				classVo.setDay(Integer.parseInt((String)jsonMap.get("day")));
				classVo.setNo(classNo);
				classVo.setProfessor((String)jsonMap.get("professor"));
				classVo.setStarttime(Integer.parseInt((String)jsonMap.get("starttime")));
				classVo.setEndtime(Integer.parseInt((String)jsonMap.get("endtime")));
			
			checkedSubjectClassMap.get(subjectNo).add(classVo);
			
			System.out.println("checkboxchecked prof : " + classVo.getProfessor());
			// set checkedClassMap
			if (!checkedClassMap.containsKey(classNo)) {
				List<ClassVo> checkedClassList = new ArrayList<ClassVo>();
				checkedClassMap.put(classNo, checkedClassList);
			}
			checkedClassMap.get(classNo).add(classVo);
			
			// update table	and result
			int start = ((Double)jsonMap.get("start")).intValue();
			int end = ((Double)jsonMap.get("end")).intValue();
			int day = Integer.parseInt((String)jsonMap.get("day"));
			
			List<String> resultBoxesList = new ArrayList<String>();
			// for each box
			for (int j=start; j<=end; j++) {
				table[j-1][day-1] = true;
				
				String box = j + "-" + day;
				resultBoxesList.add(box);
			}
			resultMap.put("boxes", resultBoxesList);
			result.add(resultMap);
			
		} // for each class
		
		
		String jsonResult = gson.toJson(result);
		
		return jsonResult;
	}

	public String checkboxUnchecked(String json, Timetable timetable) {
		// list of maps containing in map
				// key : id, val : classid
				// key : units, val : units
				// key : boxes, val :  list of boxes => i- day
				List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
				
				
				List classJson = gson.fromJson(json, List.class);
				String subjectNo = (String) ((Map)classJson.get(0)).get("subjetno");
				int classNo = Integer.parseInt((String)((Map)classJson.get(0)).get("no"));
				System.out.println(classJson);
				
				// update checkedSubjectClassMap
				Map<String, List<ClassVo>> checkedSubjectClassMap = timetable.checkedSubjectClassMap;
				
				// to update checkedClassMap
				Map<Integer, List<ClassVo>> checkedClassMap = timetable.checkedClassMap;
				
				// to update table
				boolean[][] table = timetable.table;
				
				
				// removing in checkedSubjectClassMap
				if (checkedSubjectClassMap.containsKey(subjectNo)) {
					checkedSubjectClassMap.remove(subjectNo);
				}
				
				// removing in checkedClassMap
				if (checkedClassMap.containsKey(classNo)) {
					checkedClassMap.remove(classNo);
				}
				
				// for each class
				for (int i=0; i<classJson.size(); i++) {
					Map<String, Object> jsonMap = (Map<String, Object>) classJson.get(i);
					int id = Integer.parseInt((String)jsonMap.get("id"));
					int units = Integer.parseInt((String)jsonMap.get("units"));
					
					Map<String, Object> resultMap = new HashMap<String, Object>();
					resultMap.put("id", id);
					resultMap.put("units", units);
					
					// update table	and result
					int start = ((Double)jsonMap.get("start")).intValue();
					int end = ((Double)jsonMap.get("end")).intValue();
					int day = Integer.parseInt((String)jsonMap.get("day"));
					
					List<String> resultBoxesList = new ArrayList<String>();
					// for each box
					for (int j=start; j<=end; j++) {
						table[j-1][day-1] = false;
						
						String box = j + "-" + day;
						resultBoxesList.add(box);
					}
					resultMap.put("boxes", resultBoxesList);
					result.add(resultMap);
					
				} // for each class
				
				String jsonResult = gson.toJson(result);
				
				return jsonResult;
	}
	
}
