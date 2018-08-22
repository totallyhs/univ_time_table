package org.timetable.univ.tiles.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.board.BulletinBoardDao;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.model.vo.PostVo;

@Controller
public class BulletinBoardController {
	
	@Autowired
	BulletinBoardDao bulletinboadrdao;
	
	// 최초 상단바에서 자유게시판 눌렀을 때 세팅해주는 컨트롤러
	@RequestMapping("/bulletinboard")
	public ModelAndView bulletinBoardHandle(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		List<PostVo> list = new ArrayList();
		list = bulletinboadrdao.selectBoardPost(no);
		PostVo vo = list.get(0);
		System.out.println(vo.getSubject());
		mav.setViewName("bulletinboard");
		mav.addObject("boardNo", 10);
		mav.addObject("board", "자유게시판");
		mav.addObject("list",list);
		return mav;
	}
	
	// 글쓰기 눌렀을 때 넘겨주는 컨트롤러
	@GetMapping("/boardwrite")
	public ModelAndView bulletinWriteGetHandle() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardNo", 10);

		mav.setViewName("boardwrite");
		return mav;
	}
	
	// 글작성 눌렀을때 보내주는 컨트롤러 
	@PostMapping("/boardwrite")
	public ModelAndView bulletinWritePostHandle(@ModelAttribute PostVo vo,HttpSession session,HttpServletResponse response) {
		System.out.println(vo.toString());
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.getSubject());
		vo.setNo(6);
		MemberVo mvo=(MemberVo) session.getAttribute("memberVo");
		vo.setWriter(mvo.getNickname());
		vo.setPublished("y");
		System.out.println(vo.getSubject());
		boolean result = bulletinboadrdao.insertPost(vo);
		System.out.println(result);
		if(result) {
			try {
				response.sendRedirect("bulletinboard?no=10");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//		mav.setViewName("bulletinboard");
		}else {
			mav.setViewName("error");
		}
		
		return mav;
	}
	
	
	
	// 게시판 게시글 보여주는 컨트롤러
	@RequestMapping("/boardview")
	public ModelAndView bulletinViewHandle(@RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardview");
		PostVo vo = bulletinboadrdao.selectPost(no);
		mav.addObject("PostVo",vo);
		return mav;
	}
}
