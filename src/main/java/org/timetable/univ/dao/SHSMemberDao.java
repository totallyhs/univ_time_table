package org.timetable.univ.dao;

import java.util.List;
import java.util.Map;

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
	
	public MemberVo findByIdAndPassMap(Map<String, String> data) {
		return template.selectOne("shs_member.findByIdAndPassMap", data);
		
	}
	
	public List<MemberVo> findAlikeId(String id) {
		return template.selectList("shs_member.findAlikeId", "%" + id + "%");
	}
	public boolean updateLastLogin(String id) {
		return template.update("shs_member.updateLastLogin",id)==1?true:false;
	}
}
