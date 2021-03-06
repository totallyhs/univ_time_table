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
public class BulletinBoardDao {
	@Autowired
	SqlSessionTemplate template;
	// 게시판 목록 보여주는 리스트
	public List<BoardVo> boardList(){
		return template.selectList("chs_board.boardList");
	}
	
	public PostVo selectPost(int no) {
		return template.selectOne("chs_bulletinboard.selectpost",no);
	}
	
	public boolean insertPost(PostVo vo) {
		return template.insert("chs_bulletinboard.insertpost",vo)==1?true:false;
	}
	public boolean insertReply(CommentsVo vo) {
		return template.insert("chs_bulletinboard.insertreply",vo)==1?true:false;
	}
	
	public List<CommentsVo> replyList(int postno) {
		return template.selectList("chs_bulletinboard.replylist",postno);
	}
	// 게시판선택
	public List<PostVo> selectBoardPage(Map map){
		return template.selectList("chs_bulletinboard.boardpage",map);
	}
	
	public int replyCount(int no) {
		return template.selectOne("chs_bulletinboard.replycount", no);
	}
	
	
	public int boardHit(Map map) {
		return template.update("chs_bulletinboard.boardhit",map);
	}
	
	public int pageCount(int no) {
		int count = template.selectOne("chs_bulletinboard.pagecount",no);
		if(count%10 == 0) {
			return count/10;
		}else {
			return count/10+1;
		}
	}
	
	public boolean replyDelete(Map map) {
		return template.update("chs_bulletinboard.replydelete",map)==1?true:false;
	}
	
	public boolean postDelete(Map map) {
		return template.update("chs_bulletinboard.postdelete",map)==1?true:false;
	}
	
	
	// file 
	public boolean fileUpload(PostFileVo fvo) {
		return template.insert("chs_bulletinboard.fileupload",fvo)==1?true:false;
	}

	public int getSquence() {
		return template.selectOne("chs_bulletinboard.getSquence");
	}
	
	public List<PostFileVo> fileView(int postno){
		return template.selectList("chs_bulletinboard.fileview",postno);
	}
	
	public boolean postLike(PostlikeVo vo) {
		return template.insert("chs_bulletinboard.postlike",vo)==1?true:false;
	}
	
	public List<PostlikeVo> likeList(int postno){
		return template.selectList("chs_bulletinboard.likelist",postno);
	}
	
	public int PostLikeCount(int postno) {
		return template.selectOne("chs_bulletinboard.postlikecount",postno);
	}
	
	public boolean reWriteUpdate(Map map) {
		return template.update("chs_bulletinboard.rewriteupdate",map)==1?true:false;
	}
	
}
