package org.timetable.univ.timetable.mongo;

import java.util.List;
import java.util.Map;

import org.bson.types.ObjectId;
import org.timetable.univ.model.vo.ClassVo;

public class TimetableMongoVo {
	public ObjectId id;
	
	public String cultureCombiStr;
	public String memberId;
	public ObjectId getId() {
		return id;
	}
	public void setId(ObjectId id) {
		this.id = id;
	}
	
	
	
	public String getCultureCombiStr() {
		return cultureCombiStr;
	}
	public void setCultureCombiStr(String cultureCombiStr) {
		this.cultureCombiStr = cultureCombiStr;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
}
