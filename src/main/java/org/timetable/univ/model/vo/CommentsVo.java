package org.timetable.univ.model.vo;

import java.util.Date;

public class CommentsVo {
	private int no;
	private int postNo;
	private String commentator;
	private String content;
	private String published;
	private String ip;
	private Date writtenDate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getCommentator() {
		return commentator;
	}
	public void setCommentator(String commentator) {
		this.commentator = commentator;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPublished() {
		return published;
	}
	public void setPublished(String published) {
		this.published = published;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getDate() {
		return writtenDate;
	}
	public void setDate(Date date) {
		this.writtenDate = date;
	}
	
	
	

	
}
