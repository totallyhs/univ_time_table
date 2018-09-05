package org.timetable.univ.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.SubjectVo;

@Repository
public class SHSSubjectDao {

	@Autowired
	SqlSessionTemplate template;
	
	// SELECT
	public List<SubjectVo> getAllSubjects() {
		return template.selectList("shs_subject.getAllSubjects", null);
	}
	
	public List<HashMap> getAllSubjectsWithDeptName() {
		return template.selectList("shs_subject.getAllSubjectsWithDeptName", null);
	}
	
	public List<SubjectVo> getSubjectsByDept(int departmentNo) {
		return template.selectList("shs_subject.getSubjectsByDept", departmentNo);
	}
	public SubjectVo getSubjectsBySno(String sno) {
		return template.selectOne("shs_subject.getSubjectsBySno",sno);
	}
	
	public List<SubjectVo> getOnlyMajorSubjects() {
		return template.selectList("shs_subject.getOnlyMajorSubjects", null);
	}
	
	// UPDATE
	public boolean updateSubject(SubjectVo subjectVo) {
		int success = template.update("shs_subject.updateSubject", subjectVo);
		return (success == 1);
	}
	
	// DELETE
	public boolean deleteSubjectByNo(String no) {
		int success = template.delete("shs_subject.deleteSubjectByNo", no);
		return (success == 1);
	}
	
	public boolean deleteSubjectManyByNo(List<String> list) {
		HashMap<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("list", list);
		int success = template.delete("shs_subject.deleteSubjectManyByNo", map);
		return (success == list.size());
	}
}
