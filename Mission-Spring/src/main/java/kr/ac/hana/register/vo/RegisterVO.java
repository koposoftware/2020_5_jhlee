package kr.ac.hana.register.vo;

public class RegisterVO {
	
	private int no;
	private int consultingNo;
	private String mainCategory;
	private String middleCategory;
	private String id;
	private String name;
	private String title;
	private String consultingChannel;
	private String empno;
	private String adminName;
	private String registerationYmd;
	private String reportYmd;
	private String progress;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getConsultingNo() {
		return consultingNo;
	}
	public void setConsultingNo(int consultingNo) {
		this.consultingNo = consultingNo;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getConsultingChannel() {
		return consultingChannel;
	}
	public void setConsultingChannel(String consultingChannel) {
		this.consultingChannel = consultingChannel;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getRegisterationYmd() {
		return registerationYmd;
	}
	public void setRegisterationYmd(String registerationYmd) {
		this.registerationYmd = registerationYmd;
	}
	public String getReportYmd() {
		return reportYmd;
	}
	public void setReportYmd(String reportYmd) {
		this.reportYmd = reportYmd;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	@Override
	public String toString() {
		return "RegisterVO [no=" + no + ", consultingNo=" + consultingNo + ", mainCategory=" + mainCategory
				+ ", middleCategory=" + middleCategory + ", id=" + id + ", name=" + name + ", title=" + title
				+ ", consultingChannel=" + consultingChannel + ", empno=" + empno + ", adminName=" + adminName
				+ ", registerationYmd=" + registerationYmd + ", reportYmd=" + reportYmd + ", progress=" + progress
				+ "]";
	}
	
}