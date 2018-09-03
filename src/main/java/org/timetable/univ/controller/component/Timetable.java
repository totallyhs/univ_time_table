package org.timetable.univ.controller.component;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.timetable.univ.model.vo.ClassVo;

@Component
public class Timetable {

	public boolean[][] table = new boolean[22][5];
	
	// list : subject
	// Map : classes depending on the subject
	// Ineger : class no
	// Boolean : check
	public Map<String, List<ClassVo>> MajorSubjectMap;
	
	public Map<Integer, ClassVo> CultureSubjectMap;
	
	// check 된 class만 subjectVo.classList에 추가
	public Map<String, List<ClassVo>> checkedSubjectClassMap;
	
	// subejctno
	public List<String> userUsingAlgorithme;
	
	// Fixed timetable
	public List<Map<Integer, List<ClassVo>>> fixedTimetableList;
	
	// 학점수
	// 시간 => SQL 
	
	
	
}
