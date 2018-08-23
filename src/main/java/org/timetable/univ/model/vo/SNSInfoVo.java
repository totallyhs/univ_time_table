package org.timetable.univ.model.vo;

import java.util.Date;

public class SNSInfoVo {

	private int no;
	private String snsId;
	private String snsType;
	private String snsName;
	private String snsProfile;
	private String snsNickname;
	private Date snsConnectDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getSnsType() {
		return snsType;
	}
	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}
	public String getSnsName() {
		return snsName;
	}
	public void setSnsName(String snsName) {
		this.snsName = snsName;
	}
	public String getSnsProfile() {
		return snsProfile;
	}
	public void setSnsProfile(String snsProfile) {
		this.snsProfile = snsProfile;
	}
	public String getSnsNickname() {
		return snsNickname;
	}
	public void setSnsNickname(String snsNickname) {
		this.snsNickname = snsNickname;
	}
	public Date getSnsConnectDate() {
		return snsConnectDate;
	}
	public void setSnsConnectDate(Date snsConnectDate) {
		this.snsConnectDate = snsConnectDate;
	}
	
	
}
