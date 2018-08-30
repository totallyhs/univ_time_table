
package org.timetable.univ.model.vo;

import java.util.Date;

public class PostVo {
	private int no;
	private int boardNo;
	private String subject;
	private String writer;
	private String content;
	private String ip;
	private Date writtenDate;
	private int hit;
	private String published;
	private int count;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getPublished() {
		return published;
	}
	public void setPublished(String published) {
		this.published = published;
	}
	
	
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "PostVo [no=" + no + ", boardNo=" + boardNo + ", subject=" + subject + ", writer=" + writer
				+ ", content=" + content + ", ip=" + ip + ", writtenDate=" + writtenDate + ", hit=" + hit
				+ ", published=" + published + "]";
	}
	
	
	
	
	
	
	
	
}
