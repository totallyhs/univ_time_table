package org.timetable.univ.tiles.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.timetable.univ.dao.admin.CHSAdminDao;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.model.vo.PostVo;

@Controller
@RequestMapping("/admin")
public class CHSAdminController {

	@Autowired
	CHSAdminDao CHSAdminDao;
	
	
	
	// 관리자 member 처리
	@RequestMapping("/members/list")
	public String adminMemberHandler(WebRequest webRequest) {
		
		webRequest.setAttribute("content","members.list", WebRequest.SCOPE_REQUEST);
		List<MemberVo> list = new ArrayList();
		list = CHSAdminDao.memberList();
		webRequest.setAttribute("memberlist", list, WebRequest.SCOPE_REQUEST);
		
		return "admin.members.list";
	}
	
	@GetMapping("/members/delete")
	public String adminMemberDeleteGetHandle(WebRequest webRequest,@RequestParam int no) {
		webRequest.setAttribute("content", "members.delete", WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		MemberVo vo = CHSAdminDao.memberDeleteSelect(no);
		webRequest.setAttribute("memberVo", vo, webRequest.SCOPE_REQUEST);
		
		return "admin.members.delete";
	}
	
	@PostMapping("/members/delete")
	public String adminMemberDeletePostHandle(WebRequest webRequest,@RequestParam int no) {
		boolean result = CHSAdminDao.memberDelete(no);
		webRequest.setAttribute("result", result, webRequest.SCOPE_REQUEST);
		
		return "admin.members.delete";
	}
	
	@GetMapping("/members/delete/many")
	public String adminMembersDeleteManyGetHandle(@RequestParam(name="checkbox") List list,WebRequest webRequest) {
		webRequest.setAttribute("content", "members.delete.many", WebRequest.SCOPE_REQUEST);
		webRequest.setAttribute("checkbox", list, webRequest.SCOPE_REQUEST);
	
		
		return "admin.members.delete.many";
	}
	
	@PostMapping("/members/delete/many")
	public String adminMembersDeleteManyPostHandle(WebRequest webRequest,@RequestParam(name="checkbox") List<String> list) {
		boolean result;
			for(int i=0; i<list.size();i++) {
				String id = list.get(i);
				result = CHSAdminDao.memberDeleteMany(id);
				webRequest.setAttribute("result", result, webRequest.SCOPE_REQUEST);
			}
			
		return "admin.members.delete.many";
	}
	
	@RequestMapping("/posts/list")
	public String adminPostHandle(WebRequest webRequest) {
			webRequest.setAttribute("content", "posts.list", webRequest.SCOPE_REQUEST);
			List<PostVo> list = new ArrayList<PostVo>();
			int boardno = 10;
			list = CHSAdminDao.postList(boardno);
			webRequest.setAttribute("postslist", list, webRequest.SCOPE_REQUEST);
		return "admin.posts.list";
	}
	
	@GetMapping("/posts/delete")
	public String adminGetPostDelete(WebRequest webRequest,@RequestParam int no) {
		webRequest.setAttribute("content", "posts.delete", webRequest.SCOPE_REQUEST);
		webRequest.setAttribute("postno", no, webRequest.SCOPE_REQUEST);
		
		return "admin.posts.delete";
	}
	
	@PostMapping("posts/delete")
	public String adminPostPostsDelete(WebRequest webRequest,@RequestParam int no) {
			boolean result = CHSAdminDao.postDelete(no);
			System.out.println("postdelete" + no);
			webRequest.setAttribute("result", result, webRequest.SCOPE_REQUEST);
		return "admin.posts.delete";
	}
	
	@GetMapping("posts/delete/many")
	public String adminGetPostManyDelete(WebRequest webRequest,@RequestParam(name="checkbox") List<String> list) {
		webRequest.setAttribute("content", "posts.delete.many", webRequest.SCOPE_REQUEST);
		List<Integer> postdelete = new ArrayList<Integer>();
		
		for(String a : list) {
			postdelete.add(Integer.parseInt(a));
		}
		webRequest.setAttribute("postno", postdelete, webRequest.SCOPE_REQUEST);
		
		return "admin.posts.delete.many";
	}
	
	@PostMapping("posts/delete/many")
	public String adminPostPostManyDelete(WebRequest webRequest,@RequestParam(name="postno") List<String> list) {
		
		boolean result = true;
		for(String a : list) {
			System.out.println("deletemany"+a);
			result = CHSAdminDao.postDeleteMany(Integer.parseInt(a));
		}
		webRequest.setAttribute("result", result, webRequest.SCOPE_REQUEST);
		return "admin.posts.delete.many";
	}
	
	//member find list
	
	@GetMapping("members/find/list")
	public String adminGetMembersFindList(WebRequest webRequest,@RequestParam(name="findselect") String findselect, @RequestParam(name="find") String find) {
		webRequest.setAttribute("findtype", "membersfind", webRequest.SCOPE_REQUEST);
		webRequest.setAttribute("content", "members.find.list", webRequest.SCOPE_REQUEST);
		List<MemberVo> list = new ArrayList<MemberVo>();
		if(findselect.equals("id")) {
			String id = find+"%";
			list = CHSAdminDao.membersIdList(id);
		}else if(findselect.equals("name")) {
			String name = find+"%";
			list = CHSAdminDao.membersNameList(name);
		}else if(findselect.equals("nickname")) {
			String nickname = find+"%";
			list = CHSAdminDao.membersNickNameList(nickname);
		}else {
			String department = find+"%";
			list = CHSAdminDao.membersDepartmentList(department);
		}
		
		webRequest.setAttribute("memberlist", list, webRequest.SCOPE_REQUEST);
		return "admin.members.list";
	}
		//
	@GetMapping("posts/find/list")
	public String adminGetPostFindList(WebRequest webRequest,@RequestParam(name="findselect") String findselect, @RequestParam(name="find") String find) {
			webRequest.setAttribute("findtype", "boardfind", webRequest.SCOPE_REQUEST);
			webRequest.setAttribute("content", "posts.find.list", webRequest.SCOPE_REQUEST);
			List<PostVo> list = new ArrayList<PostVo>();
			if(findselect.equals("subject")) {
				String subject = find+"%";
				list = CHSAdminDao.boardSubjectList(subject);
			}else if(findselect.equals("no")) {
				try {
					int no = Integer.parseInt(find);
					list = CHSAdminDao.boardNoList(no);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(findselect.equals("published")) {
				list = CHSAdminDao.boardPublishedList(find);
			}else if(findselect.equals("content")) {
				String content = find+"%";
				list = CHSAdminDao.boardContentList(content);
	
			}else {
				String writer = find+"%";
				list = CHSAdminDao.boardWriterList(writer);
			}
			
			webRequest.setAttribute("postslist", list, webRequest.SCOPE_REQUEST);
		return "admin.posts.list";
	}
		
	
	// circleboard
	
	@RequestMapping("/circleposts/list")
	public String adminCirclePostHandle(WebRequest webRequest) {
			webRequest.setAttribute("content", "circleposts.list", webRequest.SCOPE_REQUEST);
			List<PostVo> list = new ArrayList<PostVo>();
			int boardno = 40;
			list = CHSAdminDao.postList(boardno);
			webRequest.setAttribute("postslist", list, webRequest.SCOPE_REQUEST);
		return "admin.circleposts.list";
	}
	
	@GetMapping("circleposts/find/list")
	public String adminGetCirclePostFindList(WebRequest webRequest,@RequestParam(name="findselect") String findselect, @RequestParam(name="find") String find) {
			webRequest.setAttribute("findtype", "circleboardfind", webRequest.SCOPE_REQUEST);
			webRequest.setAttribute("content", "circleposts.find.list", webRequest.SCOPE_REQUEST);
			List<PostVo> list = new ArrayList<PostVo>();
			if(findselect.equals("subject")) {
				String subject = find+"%";
				list = CHSAdminDao.CircleboardSubjectList(subject);
			}else if(findselect.equals("no")) {
				try {
					int no = Integer.parseInt(find);
					list = CHSAdminDao.CircleboardNoList(no);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(findselect.equals("published")) {
				list = CHSAdminDao.CircleboardPublishedList(find);
			}else if(findselect.equals("content")) {
				String content = find+"%";
				list = CHSAdminDao.CircleboardContentList(content);
	
			}else {
				String writer = find+"%";
				list = CHSAdminDao.CircleboardWriterList(writer);
			}
			
			webRequest.setAttribute("postslist", list, webRequest.SCOPE_REQUEST);
		return "admin.circleposts.list";
	}
	
}
