package org.timetable.univ.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.timetable.univ.model.vo.PostFileVo;

@Service
public class UploadService {

	
	@Autowired
	ServletContext ctx;
	
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
}
