package org.timetable.univ.model.vo;

import java.util.List;

public class SubjectVo {
	private String no;
	private String name;
	private int units;
	private int grade;
	private int department;
	private String info;
	private List<ClassVo> classList;
	
	public List<ClassVo> getClassList() {
		return classList;
	}
	public void setClassList(List<ClassVo> classList) {
		this.classList = classList;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUnits() {
		return units;
	}
	public void setUnits(int units) {
		this.units = units;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
	
}
