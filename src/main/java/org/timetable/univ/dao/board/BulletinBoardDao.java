package org.timetable.univ.dao.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.BoardVo;
import org.timetable.univ.model.vo.PostVo;

@Repository
public class BulletinBoardDao {
	@Autowired
	SqlSessionTemplate template;
	
	public List<BoardVo> boardList(){
		return template.selectList("chs_board.boardList");
	}
	
	public PostVo selectPost(int no) {
		return template.selectOne("chs_bulletinboard.selectpost",no);
	}
	
	public boolean insertPost(PostVo vo) {
		return template.insert("chs_bulletinboard.insertpost",vo)==1?true:false;
	}
	public List<PostVo> selectBoardPost(int no){
		return template.selectList("chs_bulletinboard.selectboardpost",no);
	}
}
