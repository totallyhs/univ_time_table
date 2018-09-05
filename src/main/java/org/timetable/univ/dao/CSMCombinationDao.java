package org.timetable.univ.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.SubjectVo;

@Repository
public class CSMCombinationDao {
	@Autowired
	SqlSessionTemplate template;
	
	public List<ClassVo> getcultivateClasses(){
		return template.selectList("csm_combi.cultivateClasses");
	}
	public int cutureUnits(String subjectno) {
		return template.selectOne("csm_combi.cultureUnits",subjectno);
	}
	public SubjectVo getInformSubject(int no) {
		return template.selectOne("csm_combi.subjectImform",no);
	}
	
}
