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
	
	public List<MailVo> getAllMails(String receiver) {
		return template.selectList("shs_mail.getAllMails", receiver);
	}
	
	public List<Map<String, Object>> getAllMailsWithFilesCount(String receiver) {
		return template.selectList("shs_mail.getAllMailsWithFilesCount", receiver);
	}
	
	public boolean saveMail(MailVo mailVo) {
		int success = template.insert("shs_mail.saveMail", mailVo);
		return (success == 1);
	}
	
	public MailVo getMailByNo(int no) {
		return template.selectOne("shs_mail.getMailByNo", no);
	}
	
	
	// Mail Files
	
	public int getMailfileSeq() {
		return template.selectOne("shs_mail.getMailfileSeq", null);
	}
	
	public List<MailFileVo> getFilesByMailNo(int mailno) {
		return template.selectList("shs_mail.getFilesByMailNo", mailno);
	}
	
	public boolean saveMailFiles(MailFileVo mailFileVo) {
		int success = template.insert("shs_mail.saveMailFiles", mailFileVo);
		return (success == 1);
	}
	
	public int  mailCount(String receiver) {
		return template.selectOne("shs_mail.mailcount",receiver);
	}
	
	public boolean mailDelete(int no) {
		return template.delete("shs_mail.maildelete",no)==1?true:false;
	}
}
