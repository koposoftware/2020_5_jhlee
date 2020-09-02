package kr.ac.hana.reply.vo;

public class ReplyVO {

	private int no;
	private int inquiryNo;
	private String content;
	private String writer;
	private String regDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [no=" + no + ", inquiryNo=" + inquiryNo + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + "]";
	}
	
}