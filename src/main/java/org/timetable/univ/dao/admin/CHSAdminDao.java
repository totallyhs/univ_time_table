package org.timetable.univ.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.MemberVo;

@Repository
public class CHSAdminDao {

	@Autowired
	SqlSessionTemplate template;
	

	
	public List<MemberVo> memberList(){
		return template.selectList("chs_admin.memberlist");
	}
	
	public MemberVo memberDeleteSelect(int no) {
		return template.selectOne("chs_admin.memberdeleteselect",no);
	}
	
	public boolean memberDelete(int no) {
		return template.delete("chs_admin.memberdelete",no)==1?true:false;
	}
	
	public boolean memberDeleteMany(String id) {
		return template.delete("chs_admin.memberdeletemany",id)==1?true:false;
	}
	
	public int userCount() {
		return template.selectOne("chs_admincount.usercount");
		
	}
	public int postCount() {
		return template.selectOne("chs_admincount.postcount");
	}
	
	public int replyCount() {
		return template.selectOne("chs_admincount.replycount");
	}
	
}
