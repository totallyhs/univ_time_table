package org.timetable.univ.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.model.vo.PostVo;

@Repository
public class CHSAdminDao {

	@Autowired
	SqlSessionTemplate template;
	

	
	public List<MemberVo> memberList(){
		return template.selectList("chs_admin.memberlist");
	}
	
	public MemberVo memberDeleteSelect(int no) {
		return template.selectOne("chs_admin.memberdeleteselect",no);
	}
	
	public boolean memberDelete(int no) {
		return template.delete("chs_admin.memberdelete",no)==1?true:false;
	}
	
	public boolean memberDeleteMany(String id) {
		return template.delete("chs_admin.memberdeletemany",id)==1?true:false;
	}
	
	public int userCount() {
		return template.selectOne("chs_admincount.usercount");
		
	}
	public int postCount() {
		return template.selectOne("chs_admincount.postcount");
	}
	
	public int replyCount() {
		return template.selectOne("chs_admincount.replycount");
	}
	
	public List<PostVo> postList(int boardno){
		return template.selectList("chs_admin.boardpostlist",boardno);
	}
	
	public boolean postDelete(int no) {
		return template.delete("chs_admin.postdelete",no)==1?true:false;
	}
	
	public boolean postDeleteMany(int postno) {
		return template.delete("chs_admin.postdeletemany",postno)==1?true:false;
	}
	
	
	//자유게시판 검색
	public List<PostVo> boardSubjectList(String subject){
		return template.selectList("chs_admin.boardsubjectlist",subject);
	}
	
	public List<PostVo> boardNoList(int no){
		return template.selectList("chs_admin.boardnolist",no);
	}
	
	public List<PostVo> boardPublishedList(String published){
		return template.selectList("chs_admin.boardpublishedlist",published);
	}
	
	public List<PostVo> boardContentList(String content){
		return template.selectList("chs_admin.boardcontentlist",content);
	}
	
	public List<PostVo> boardWriterList(String writer){
		return template.selectList("chs_admin.boardwriterlist",writer);
	}
	// 동아리게시판 검색

	public List<PostVo> CircleboardSubjectList(String subject){
		return template.selectList("chs_admin.circleboardsubjectlist",subject);
	}
	
	public List<PostVo> CircleboardNoList(int no){
		return template.selectList("chs_admin.circleboardnolist",no);
	}
	
	public List<PostVo> CircleboardPublishedList(String published){
		return template.selectList("chs_admin.circleboardpublishedlist",published);
	}
	
	public List<PostVo> CircleboardContentList(String content){
		return template.selectList("chs_admin.circleboardcontentlist",content);
	}
	
	public List<PostVo> CircleboardWriterList(String writer){
		return template.selectList("chs_admin.circleboardwriterlist",writer);
	}

	public List<MemberVo> membersIdList(String id){
		return template.selectList("chs_admin.membersidlist",id);
	}
	
	public List<MemberVo> membersNameList(String name){
		return template.selectList("chs_admin.membersnamelist",name);
	}
	
	public List<MemberVo> membersNickNameList(String nickname){
		return template.selectList("chs_admin.membersnicknamelist",nickname);
	}
	
	public List<MemberVo> membersDepartmentList(String department){
		return template.selectList("chs_admin.membersdepartmentlist",department);
	}
	
	public List<ClassVo> classesList(){
		return template.selectList("chs_admin.classeslist");
	}
	
	public ClassVo classesSelect(int no) {
		return template.selectOne("chs_admin.classesSelect",no);
	}
	
	public boolean classesupdate(ClassVo vo) {
		return template.update("chs_admin.classesupdate",vo)==1?true:false;
	}
	
	public boolean classesdelete(int id) {
		return template.delete("chs_admin.classesdelete",id)==1?true:false;
	}
	
	public boolean classesDeleteMany(int id) {
		return template.delete("chs_admin.classesdeletemany",id)==1?true:false;
	}
}
