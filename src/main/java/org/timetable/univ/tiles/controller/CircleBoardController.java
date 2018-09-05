package org.timetable.univ.tiles.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.board.CircleBoardDao;
import org.timetable.univ.model.vo.CommentsVo;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.model.vo.PostFileVo;
import org.timetable.univ.model.vo.PostVo;
import org.timetable.univ.service.CircleUploadService;
import org.timetable.univ.service.UploadService;

import com.google.gson.Gson;


@Controller
public class CircleBoardController {	
	
	@Autowired
	CircleBoardDao CircleBoardDao;
	@Autowired
	UploadService uploadService;
	@Autowired
	CircleUploadService CircleUploadService;
	
	@Autowired
	Gson gson;
	// 최초 상단바에서 자유게시판 눌렀을 때 세팅해주는 컨트롤러
	@RequestMapping("/circleboard")
	public ModelAndView circleBoardHandle(@RequestParam(name="no") int no,@RequestParam(name="page", defaultValue="1") int page) {
		ModelAndView mav = new ModelAndView();
		List<PostVo> list = new ArrayList();
		System.out.println(page);
		int start = (page-1)*10+1;
		int end = page*10;
		Map<String,Integer> map = new HashMap();
		System.out.println(no);
		map.put("no", Integer.valueOf(no));
		map.put("start", start);
		map.put("end",end);
		list = CircleBoardDao.selectBoardPage(map);
		for(PostVo a : list) {
			a.setCount(CircleBoardDao.replyCount(a.getNo()));
		}
		
		int totalPage = CircleBoardDao.pageCount(no);
		int pagebegin=0;
		int pageend=0;
		if(page>3&&totalPage>=page+2) {
			pagebegin=page-2;
		}else if(page>4&&totalPage<page+2) {
			pagebegin=totalPage-4;
		}else {
			pagebegin=1;
		}
		if(page<=3&&totalPage>=5) {
			pageend=5;
		}else if(page>3&&totalPage>=page+2) {
			pageend=page+2;
		}else{
			pageend=totalPage;
		}
		
		mav.addObject("pagebegin",pagebegin);
		mav.addObject("pageend",pageend);
		mav.addObject("totalpage",totalPage);
		mav.addObject("no",no);
		mav.addObject("page",page);
		mav.setViewName("circleboard");
		mav.addObject("board", "동아리게시판");
		mav.addObject("postlist",list);
		
		return mav;
	}
	
	// 글쓰기 눌렀을 때 넘겨주는 컨트롤러
	@GetMapping("/circleboardwrite")
	public ModelAndView circleWriteGetHandle() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardNo", 40);

		mav.setViewName("circleboardwrite");
		return mav;
	}
	
	// 글작성 눌렀을때 보내주는 컨트롤러 
	@PostMapping("/circleboardwrite")
	public ModelAndView circleWritePostHandle(@ModelAttribute PostVo vo,HttpSession session,HttpServletResponse response,
			@RequestParam("fileupload") MultipartFile[] files ) throws Exception {
		System.out.println(vo.getPublished());
		ModelAndView mav = new ModelAndView();
		int no = CircleBoardDao.getSquence();
		vo.setNo(no);
		//vo.setNo(13); // mapper에서 sequence 처리 해야함.
		MemberVo mvo=(MemberVo) session.getAttribute("memberVo");
		vo.setWriter(mvo.getNickname());
		vo.setPublished("y");
		vo.setHit(0);
		System.out.println(vo.toString());
		boolean result = CircleBoardDao.insertPost(vo);
		System.out.println(result);
		//file
		if(!files[0].isEmpty()) {
			for(MultipartFile file : files) {
				
				PostFileVo fvo = CircleUploadService.uploadHandle(file, vo.getNo());
				CircleBoardDao.fileUpload(fvo);
				
			}
		}
		
		
		if(result) {
			try {
				response.sendRedirect("circleboard?no=40");
			} catch (IOException e) {
				e.printStackTrace();
			}
				}else {
			mav.setViewName("error");
		}
		
		return mav;
	}
	
	
	
	// 게시판 게시글 보여주는 컨트롤러
	@GetMapping("/circleboardview")
	public ModelAndView circleViewHandle(@RequestParam int no) {
		//여기서 post no 값 가지고옴 requestParam을 통해서 
		ModelAndView mav = new ModelAndView();
		List<PostFileVo> flist = CircleBoardDao.fileView(no);
		mav.addObject("flist",flist);
		int postlikeCount = CircleBoardDao.PostLikeCount(no);
		mav.addObject("postlike","좋아요"+postlikeCount);
		mav.setViewName("circleboardview");
		// hit 업데이트 처줘야댐.
		PostVo vo = CircleBoardDao.selectPost(no);
		mav.addObject("PostVo",vo);
		int hit = vo.getHit();
		int hitPlus = hit+1;
		Map<String,Object> map = new HashMap();
		map.put("hitPlus",hitPlus);
		map.put("no",no);
		mav.addObject("postNo",no);
		CircleBoardDao.boardHit(map);
		List<CommentsVo> rvo = new ArrayList();
		rvo = CircleBoardDao.replyList(no);
		mav.addObject("replylist",rvo);
		mav.addObject("boardno",40);
		return mav;
	}
	
	// 자유게시판 리플
	@PostMapping("/circleboardview")
	public ModelAndView circleReplyHandle(@RequestParam(name="postno") int postno,@RequestParam(name="content") String content, HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("circleboardview");
		CommentsVo vo = new CommentsVo();
		//PostVo pvo = bulletinboadrdao.selectPost(10);
		//mav.addObject("PostVo",pvo);
		vo.setContent(content);
		vo.setPostNo(postno);
		MemberVo mvo=(MemberVo) session.getAttribute("memberVo");
		vo.setPublished("y");
		vo.setCommentator(mvo.getNickname());
		System.out.println("reply"+vo.getCommentator()+vo.getNo()+vo.getPostNo()+vo.getContent());
		boolean result = CircleBoardDao.insertReply(vo);
		
		if(result) {
			try {
				response.sendRedirect("circleboardview?no="+postno);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//dao , mapper
		return mav;
		
	}
	
	@RequestMapping("/circlereplydelete")
	public String circlereplyDelete(@RequestParam(name="no") int no,@RequestParam(name="postno") int postno,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap();
		map.put("published", "n");
		map.put("no", no);
		boolean result = CircleBoardDao.replyDelete(map);
		System.out.println("replydelete /" + map.get("published")+map.get("no")+postno+result);
		if(result) {
				System.out.println("in");
		}
		return "redirect:/circleboardview?no="+postno;
	}
	
	@RequestMapping("/circlepostdelete")
	public String circleboardDelete(@RequestParam Map<String,String> map) {
		int no = Integer.parseInt(map.get("no"));
		int postno = Integer.parseInt(map.get("postno"));
		Map<String,Object> put = new HashMap();
		put.put("published", "n");
		put.put("no", postno);
		boolean result = CircleBoardDao.postDelete(put);
		if(result) {
			System.out.println("in");
		}
		return "redirect:/circleboard?no="+no;
		
	}

//	@PostMapping("/postlike")
//	public String replyLike(@RequestParam Map<String,String> map) {
//		int postno = Integer.parseInt(map.get("no"));
//		String id = map.get("id");
//		PostlikeVo vo = new PostlikeVo();
//		vo.setPostNo(postno);
//		vo.setId(id);
//		
//		System.out.println("postlie" + map);
//		boolean result = bulletinboadrdao.postLike(vo);
//		
//	
//		
//		
//		
//		return "redirect:/boardview?no="+postno;
//	}
	
	
	@GetMapping("/circlerewrite")
	public ModelAndView circlereWriteGepHandle(@RequestParam Map<String,String> map) {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(map.get("postno"));
		PostVo vo = CircleBoardDao.selectPost(no);		
		
		List<PostFileVo> flist = new ArrayList();
		
		flist = CircleBoardDao.fileView(no);
		
		mav.addObject("flist",flist);
		
		System.out.println("rewrite"+"/"+vo.getSubject());
		mav.addObject("PostVo",vo);
		mav.setViewName("circlerewrite");
		return mav;
	}
	
	@PostMapping("/circlerewrite")
	public ModelAndView circlereWritePostHandle( @RequestParam Map<String,String> map ,
			HttpSession session,HttpServletResponse response,
			@RequestParam("fileupload") MultipartFile[] files) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVo mvo=(MemberVo) session.getAttribute("memberVo");
		String subject = map.get("subject");
		String content = map.get("content");
		int no = Integer.parseInt(map.get("no"));
		System.out.println(map);
		boolean result = CircleBoardDao.reWriteUpdate(map);
		
		//file
		if(!files[0].isEmpty()) {
			for(MultipartFile file : files) {
				
				PostFileVo fvo = CircleUploadService.uploadHandle(file, no);
				CircleBoardDao.fileUpload(fvo);
				
			}
		}
		
		
		if(result) {
			try {
				response.sendRedirect("circleboard?no=40");
			} catch (IOException e) {
				e.printStackTrace();
			}
				}else {
			mav.setViewName("error");
		}
		
		return mav;
	}
	
}
