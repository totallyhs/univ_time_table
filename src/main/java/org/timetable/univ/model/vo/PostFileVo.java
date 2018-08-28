package org.timetable.univ.model.vo;

public class PostFileVo {
	private int no;
	private int postNo;
	private String filePath;
	private double fileSize;
	private int downloadCnt;
	private String fileName;
	
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
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	public int getDownloadCnt() {
		return downloadCnt;
	}
	public void setDownloadCnt(int downloadCnt) {
		this.downloadCnt = downloadCnt;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "PostFileVo [no=" + no + ", postNo=" + postNo + ", filePath=" + filePath + ", fileSize=" + fileSize
				+ ", downloadCnt=" + downloadCnt + "]";
	}
	
	
	
}
