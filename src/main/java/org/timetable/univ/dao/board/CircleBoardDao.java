package org.timetable.univ.dao.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.BoardVo;
import org.timetable.univ.model.vo.CommentsVo;
import org.timetable.univ.model.vo.PostFileVo;
import org.timetable.univ.model.vo.PostVo;
import org.timetable.univ.model.vo.PostlikeVo;

@Repository
public class CircleBoardDao {
	@Autowired
	SqlSessionTemplate template;
	// 게시판 목록 보여주는 리스트
	public List<BoardVo> boardList(){
		return template.selectList("chs_circleboard.circleboardList");
	}
	
	public PostVo selectPost(int no) {
		return template.selectOne("chs_circleboard.circleselectpost",no);
	}
	
	public boolean insertPost(PostVo vo) {
		return template.insert("chs_circleboard.circleinsertpost",vo)==1?true:false;
	}
	public boolean insertReply(CommentsVo vo) {
		return template.insert("chs_circleboard.circleinsertreply",vo)==1?true:false;
	}
	
	public List<CommentsVo> replyList(int postno) {
		return template.selectList("chs_circleboard.circlereplylist",postno);
	}
	// 게시판선택
	public List<PostVo> selectBoardPage(Map map){
		return template.selectList("chs_circleboard.circleboardpage",map);
	}
	
	public int replyCount(int no) {
		return template.selectOne("chs_circleboard.circlereplycount", no);
	}
	
	
	public int boardHit(Map map) {
		return template.update("chs_circleboard.circleboardhit",map);
	}
	
	public int pageCount(int no) {
		int count = template.selectOne("chs_circleboard.circlepagecount",no);
		if(count%10 == 0) {
			return count/10;
		}else {
			return count/10+1;
		}
	}
	
	public boolean replyDelete(Map map) {
		return template.update("chs_circleboard.circlereplydelete",map)==1?true:false;
	}
	
	public boolean postDelete(Map map) {
		return template.update("chs_circleboard.circlepostdelete",map)==1?true:false;
	}
	
	
	// file 
	public boolean fileUpload(PostFileVo fvo) {
		return template.insert("chs_circleboard.circlefileupload",fvo)==1?true:false;
	}

	public int getSquence() {
		return template.selectOne("chs_circleboard.circlegetSquence");
	}
	
	public List<PostFileVo> fileView(int postno){
		return template.selectList("chs_circleboard.circlefileview",postno);
	}
	
	public boolean postLike(PostlikeVo vo) {
		return template.insert("chs_circleboard.circlepostlike",vo)==1?true:false;
	}
	
	public List<PostlikeVo> likeList(int postno){
		return template.selectList("chs_circleboard.circlelikelist",postno);
	}
	
	public int PostLikeCount(int postno) {
		return template.selectOne("chs_circleboard.circlepostlikecount",postno);
	}
	
	public boolean reWriteUpdate(Map map) {
		return template.update("chs_circleboard.circlerewriteupdate",map)==1?true:false;
	}
	
}
