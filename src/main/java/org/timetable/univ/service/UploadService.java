package org.timetable.univ.service;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.timetable.univ.dao.SHSMailDao;
import org.timetable.univ.model.vo.MailFileVo;
import org.timetable.univ.model.vo.PostFileVo;

@Service
public class UploadService {

	
	@Autowired
	ServletContext ctx;
	
	@Autowired
	SHSMailDao shsMailDao;
	
	public PostFileVo uploadHandle(MultipartFile files,int postno) throws Exception {
		PostFileVo vo = new PostFileVo();
		File dir = new File(ctx.getRealPath("/boardwrite"), String.valueOf(postno));
		System.out.println(ctx.getRealPath("/boardwrite"));
		if(!dir.exists()) {
			dir.mkdirs();
		}
			File dest = new File(dir, files.getOriginalFilename()); //
			files.transferTo(dest);
			
			vo.setFileName(files.getOriginalFilename());
			vo.setPostNo(postno);
			vo.setDownloadCnt(0);
			vo.setFilePath("/boardwrite/"+postno+"/"+files.getOriginalFilename());
			vo.setFileSize(files.getSize());
			System.out.println(vo);
			
			return vo;
	}
	
	public MailFileVo mailFileUploadHanlde(MultipartFile file, int mailno) throws Exception {
		MailFileVo mailFileVo = new MailFileVo();
		File dir = new File(ctx.getRealPath("/mail"), String.valueOf(mailno));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		String fileName = file.getOriginalFilename();
		int no = shsMailDao.getMailfileSeq();
		System.out.println(no);
		
		
		File dest = new File(dir, fileName); //
		file.transferTo(dest);
		
		mailFileVo.setNo(no);
		mailFileVo.setMailNo(mailno);
		mailFileVo.setFileSize(file.getSize());
		mailFileVo.setFileName(fileName);
		System.out.println(mailFileVo.toString());
		
		return mailFileVo;
		
		
	}
}
