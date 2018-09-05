package org.timetable.univ.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.DepartmentVo;
import org.timetable.univ.model.vo.MemberVo;

@Repository
public class LKHMemberDao {
	@Autowired
	SqlSessionTemplate template;
	
	// 맵퍼로 가입요청 쿼리문 찾는 메소드
	public int addJoin(MemberVo vo) {
		return template.insert("LKH-Member.addJoin", vo);
	}
	// 맵퍼로 학과정보 리스트 요청하는 메소드
	public List<DepartmentVo> getDepartment() {
		List<DepartmentVo> list = template.selectList("LKH-Member.getDepartment");
		return list;
	}
	// 맵퍼로 아이디 정보 하나 요청 메소드
	public int getIdCheck(String id) {
		int maberId = template.selectOne("LKH-Member.getIdCheck", id);
		return maberId;
	}
	// 맵퍼로 닉네임 정보 하나 요청하는 메소드
	public int getNickNameCheck(String nick) {
		int maberNick = template.selectOne("LKH-Member.getNickNameCheck", nick);
		return maberNick;
	}
	// 맵퍼에서 가입 정보값 받아 오는 메소드
	public MemberVo findByIdandPass(Map data) {
		return template.selectOne("LKH-Member.findByIdandPass", data);
	}
	public MemberVo getMemberinfo(String id) {
		MemberVo memberinfo = template.selectOne("LKH-Member.Memberinfo", id);
		return memberinfo;
	}
	public int updateMember(Map<String, String> map) {
		return template.update("LKH-Member.EditMember", map);
	}
}
