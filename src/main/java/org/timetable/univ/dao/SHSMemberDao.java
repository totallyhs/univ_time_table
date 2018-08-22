package org.timetable.univ.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.MemberVo;

@Repository
public class SHSMemberDao {

	@Autowired
	SqlSessionTemplate template;
	
	public MemberVo findById(String id) {
		return template.selectOne("shs_member.findById", id);
	}
}
