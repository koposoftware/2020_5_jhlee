package kr.ac.kopo.board.vo;


import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
public class BoardVO {

	private int no;
	//@NotEmpty(message = "필수항목입니다")
	private String writer;
	/* @Pattern(regexp = "^[A-Za-z0-9]*$", message = "특수기호는 사용하실 수 없습니다.") */
	@NotEmpty(message = "필수항목입니다")
	private String mainCategory;
	@NotEmpty(message = "필수항목입니다")
	private String middleCategory;
	@Length(min = 2, max = 100, message = "제목은 2글자 이상 입력하셔야 합니다.")
	private String title ;
	private String content;
	private int viewCnt;
	private String regDate;
	private String likeIt;
	private String adminName;
	private String empno;
	private String consultingChannel;
	private int replyCnt;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getMiddleCategory() {
		return middleCategory;
	}
	public void setMiddleCategory(String middleCategory) {
		this.middleCategory = middleCategory;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getLikeIt() {
		return likeIt;
	}
	public void setLikeIt(String likeIt) {
		this.likeIt = likeIt;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getConsultingChannel() {
		return consultingChannel;
	}
	public void setConsultingChannel(String consultingChannel) {
		this.consultingChannel = consultingChannel;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", writer=" + writer + ", mainCategory=" + mainCategory + ", middleCategory="
				+ middleCategory + ", title=" + title + ", content=" + content + ", viewCnt=" + viewCnt + ", regDate="
				+ regDate + ", likeIt=" + likeIt + ", adminName=" + adminName + ", empno=" + empno
				+ ", consultingChannel=" + consultingChannel + ", replyCnt=" + replyCnt + "]";
	}

	
}