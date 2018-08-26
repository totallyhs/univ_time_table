package org.timetable.univ.controller.subjects;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.SubjectVo;

@Repository
public class SHSSubjectDao {

	@Autowired
	SqlSessionTemplate template;
	
	public List<SubjectVo> getAllSubjects() {
		return template.selectList("shs_subject.getAllSubjects", null);
	}
	
	public List<SubjectVo> getSubjectsByDept(int departmentNo) {
		return template.selectList("shs_subject.getSubjectsByDept", departmentNo);
	}
}
