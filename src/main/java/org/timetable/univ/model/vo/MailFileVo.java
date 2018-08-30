package org.timetable.univ.model.vo;

public class MailFileVo {
	private int no;
	private int mailNo;
	private double fileSize;
	private String filePath;
	private String fileName;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMailNo() {
		return mailNo;
	}
	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "MailFileVo [no=" + no + ", mailNo=" + mailNo + ", fileSize=" + fileSize + ", filePath=" + filePath
				+ ", fileName=" + fileName + "]";
	}
	
	
	
}
