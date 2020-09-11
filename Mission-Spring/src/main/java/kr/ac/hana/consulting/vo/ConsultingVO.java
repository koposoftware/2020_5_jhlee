package kr.ac.hana.consulting.vo;

public class ConsultingVO {

	private int consultingNo;
	private String reportYmd;
	private String customerType;
	private String id;
	private String name;
	private String birth;
	private String mainCategory;
	private String middleCategory;
	private String title;
	private String consultingReport;
	private String consultingChannel;
	private String adminName;
	private String empno;
	private String progress;
	private String addConsulting;
	
	
	public int getConsultingNo() {
		return consultingNo;
	}
	public void setConsultingNo(int consultingNo) {
		this.consultingNo = consultingNo;
	}
	public String getReportYmd() {
		return reportYmd;
	}
	public void setReportYmd(String reportYmd) {
		this.reportYmd = reportYmd;
	}
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	public String getConsultingReport() {
		return consultingReport;
	}
	public void setConsultingReport(String consultingReport) {
		this.consultingReport = consultingReport;
	}
	public String getConsultingChannel() {
		return consultingChannel;
	}
	public void setConsultingChannel(String consultingChannel) {
		this.consultingChannel = consultingChannel;
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
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getAddConsulting() {
		return addConsulting;
	}
	public void setAddConsulting(String addConsulting) {
		this.addConsulting = addConsulting;
	}
	@Override
	public String toString() {
		return "ConsultingVO [consultingNo=" + consultingNo + ", reportYmd=" + reportYmd + ", customerType="
				+ customerType + ", id=" + id + ", name=" + name + ", birth=" + birth + ", mainCategory=" + mainCategory
				+ ", middleCategory=" + middleCategory + ", title=" + title + ", consultingReport=" + consultingReport
				+ ", consultingChannel=" + consultingChannel + ", adminName=" + adminName + ", empno=" + empno
				+ ", progress=" + progress + ", addConsulting=" + addConsulting + "]";
	}
	
}
