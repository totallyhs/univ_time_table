package org.timetable.univ.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.ClassVo;

@Repository
public class SHSClassDao {

	@Autowired
	SqlSessionTemplate template;
	
	public int getClassSeq() {
		return template.selectOne("shs_class.getClassSeq", null);
	}
	
	public boolean insertClass(ClassVo classVo) {
		int success = template.insert("shs_class.insertClass", classVo);
		return (success == 1);
	}
}
