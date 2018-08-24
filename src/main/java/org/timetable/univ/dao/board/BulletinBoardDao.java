package org.timetable.univ.dao.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.BoardVo;
import org.timetable.univ.model.vo.PostVo;

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
	
	// 게시판선택
	public List<PostVo> selectBoardPage(Map map){
		return template.selectList("chs_bulletinboard.boardpage",map);
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

}
