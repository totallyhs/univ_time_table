package org.timetable.univ.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.VisitorCountVo;

@Repository
public class SHSAdminDao {

	@Autowired
	SqlSessionTemplate template;
	
	public boolean updateVisitorCnt(Integer cnt) {
		int success = template.update("shs_admin.updateVisitorCnt", cnt);
		return (success == 1);
	}
	
	public VisitorCountVo getVisitorCountVo() {
		return template.selectOne("shs_admin.getVisitorCountVo", null);
	}
	
	public int getVisitorCnt() {
		Integer visitorCnt = template.selectOne("shs_admin.getVisitorCnt", null);
		System.out.println(visitorCnt);
		return visitorCnt.intValue();
	}
	
}
