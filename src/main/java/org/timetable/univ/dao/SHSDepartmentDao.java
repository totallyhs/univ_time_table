package org.timetable.univ.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.DepartmentVo;

@Repository
public class SHSDepartmentDao {

	@Autowired
	SqlSessionTemplate template;
	
	public List<DepartmentVo> getAllDept() {
		return template.selectList("shs_department.getAllDept", null);
	}
}
