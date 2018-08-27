package org.timetable.univ.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
	public List<MemberVo> getDepartment() {
		List<MemberVo> list = template.selectList("LKH-Member.getDepartment");
		return list;
	}
	// 맵퍼로 아이디 정보 하나 요청 메소드
	public MemberVo getIdCheck(String id) {
		MemberVo maberId = template.selectOne("LKH-Member.getIdCheck", id);
		return maberId;
	}
	//맵퍼로 닉네임 정보 하나 요청하는 메소드
	public MemberVo getNickNameCheck(String nick) {
		MemberVo maberNick = template.selectOne("LKH-Member.getIdCheck", nick);
		return maberNick;
	}
}
