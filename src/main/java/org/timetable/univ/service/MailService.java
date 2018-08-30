package org.timetable.univ.service;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.timetable.univ.dao.SHSMailDao;
import org.timetable.univ.model.vo.MailVo;
import org.timetable.univ.model.vo.MemberVo;

@Service
public class MailService {

	@Autowired
	SHSMailDao shsMailDao;
	
	public void setMailVo(MailVo mailVo, MemberVo memberVo) {
		int no = shsMailDao.getMailSeq();
		mailVo.setNo(no);
		
		String sender = memberVo.getId();
		mailVo.setSender(sender);
		
		mailVo.setSentDate(new Date());
		
		mailVo.setSeen("n");
		
	}
}
