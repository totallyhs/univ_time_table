package org.timetable.univ.controller.component;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	// check 된 class 리스트
	public Map<Integer, List<ClassVo>> checkedClassMap;
	
	// subejctno
	public List<String> userUsingAlgorithm;
	
	// After combinantion, possible fixed timetables
	public List<Map<Integer, List<ClassVo>>> fixedTimetableList;
	
	// 학점수
	// 시간 => SQL 
	
	
	public Timetable() {
		// MajorSubjectMap
		MajorSubjectMap = new HashMap<String, List<ClassVo>>();
		
		// CultureSubjectMap
		CultureSubjectMap = new HashMap<Integer, ClassVo>();
		
		// checkedSubjectClassMap
		checkedSubjectClassMap = new HashMap<String, List<ClassVo>>();
		
		// checkedClassMap
		checkedClassMap = new HashMap<Integer, List<ClassVo>>();
		
		// userUsingAlgorithm
		userUsingAlgorithm = new ArrayList<String>();
		
		// fixedTimetableList
		fixedTimetableList = new ArrayList<Map<Integer, List<ClassVo>>>();

		
	}
	
	
}
