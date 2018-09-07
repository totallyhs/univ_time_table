package org.timetable.univ.timetable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.timetable.univ.model.vo.ClassVo;

import com.google.gson.Gson;

@Service
public class SHSTimetableService {

	@Autowired
	Gson gson;
	
	public String checkboxChecked(String json, Timetable timetable) {
		// list of maps containing in map
		// key : subjectname, val : subjectname
		// key : id, val : classid
		// key : no, val : classno
		// key : units, val : units
		// key : boxes, val :  list of boxes => i- day
		// last of list : colorMap
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		
		List classJson = gson.fromJson(json, List.class);
		String subjectNo = (String) ((Map)classJson.get(0)).get("subjetno");
		String subjectname = (String)((Map)classJson.get(0)).get("subjectname");
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
		
		// classNo
		int classNo = 0;
		
		// for each class
		for (int i=0; i<classJson.size(); i++) {
			Map<String, Object> jsonMap = (Map<String, Object>) classJson.get(i);
			int id = Integer.parseInt((String)jsonMap.get("id"));
			int units = Integer.parseInt((String)jsonMap.get("units"));
			classNo = Integer.parseInt((String)jsonMap.get("no"));
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("id", id);
			resultMap.put("units", units);
			resultMap.put("no", classNo);
			resultMap.put("subjectname", subjectname);
			
			
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
			for (int j=start; j<end; j++) {
				table[j-1][day-1] = true;
				
				String box = j + "-" + day;
				resultBoxesList.add(box);
			}
			
			resultMap.put("boxes", resultBoxesList);
			result.add(resultMap);
			
		} // for each class
		
		// set color
		List<String> colorList = timetable.colorList;
		Map<String, Object> colorClassMap = (Map<String, Object>)timetable.colorClassNoMap;
		Map<String, Object> classNoColorMap = timetable.classNoColorMap;
		
		for (int i=0; i<colorList.size(); i++) {
			if (!colorClassMap.containsKey(colorList.get(i))) {
				colorClassMap.put(colorList.get(i), classNo);
				classNoColorMap.put(String.valueOf(classNo), colorList.get(i));
				break;
			}
		}
		System.out.println("colorList : " + colorList);
		System.out.println("colorClassMap :" + colorClassMap);
		System.out.println("classNoColorMap : " + classNoColorMap);
		
		result.add(classNoColorMap);
		
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
				
				// removing in colorset
				// set color
				List<String> colorList = timetable.colorList;
				Map<String, Object> colorClassMap = (Map<String, Object>)timetable.colorClassNoMap;
				Map<String, Object> classNoColorMap = timetable.classNoColorMap;
				
				String color = "";
				if (classNoColorMap.containsKey(String.valueOf(classNo))) {
					color = (String) classNoColorMap.get(String.valueOf(classNo));
					classNoColorMap.remove(String.valueOf(classNo));
				}
				if (colorClassMap.containsKey(color)) {
					colorClassMap.remove(color);
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
					for (int j=start; j<end; j++) {
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
