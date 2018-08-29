package org.timetable.univ.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.MailFileVo;
import org.timetable.univ.model.vo.MailVo;

@Repository
public class SHSMailDao {

	@Autowired
	SqlSessionTemplate template;
	
	// MAIL
	
	public int getMailSeq() {
		return template.selectOne("shs_mail.getMailSeq", null);
	}
	
	public List<MailVo> getAllMails() {
		return template.selectList("shs_mail.getAllMails", null);
	}
	
	public List<Map<String, Object>> getAllMailsWithFilesCount() {
		return template.selectList("shs_mail.getAllMailsWithFilesCount", null);
	}
	
	
	// Mail Files
	
	public int getMailfileSeq() {
		return template.selectOne("shs_mail.getAmilfileSeq", null);
	}
	
	public List<MailFileVo> getFilesByMailNo(int mailno) {
		return template.selectList("shs_mail.getFilesByMailNo", mailno);
	}
}
