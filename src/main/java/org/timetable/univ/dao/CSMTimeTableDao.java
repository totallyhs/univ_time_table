package org.timetable.univ.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.SubjectVo;

@Repository
public class CSMTimeTableDao {
	@Autowired
	SqlSessionTemplate template;
	
	public List<SubjectVo> getAllSubjects() {
		return template.selectList("csm_timetable.allSubjectList", null);
	}
	public List<Integer> getClassNo(String subjectNo){
		return template.selectList("csm_timetable.subjectClassNoList",subjectNo);
	}
	public List<ClassVo> getClassList(int classNo){
		return template.selectList("csm_timetable.classList",classNo);
	}
	public List<ClassVo> getSubjectClassList(String subjectNo){
		return template.selectList("csm_timetable.subjectClassList",subjectNo);
	}
	
}
