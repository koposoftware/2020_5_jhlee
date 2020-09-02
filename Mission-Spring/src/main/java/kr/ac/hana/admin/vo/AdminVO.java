package kr.ac.hana.admin.vo;

public class AdminVO {
	
	private String empno;
	private String password;
	private String admin_name;
	private String gender;
	private String consulting_channel;
	private String branch_no;	
	private String type;
	private int add_consulting_cnt;
	private int all_consulting_cnt;
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getConsulting_channel() {
		return consulting_channel;
	}
	public void setConsulting_channel(String consulting_channel) {
		this.consulting_channel = consulting_channel;
	}
	public String getBranch_no() {
		return branch_no;
	}
	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAdd_consulting_cnt() {
		return add_consulting_cnt;
	}
	public void setAdd_consulting_cnt(int add_consulting_cnt) {
		this.add_consulting_cnt = add_consulting_cnt;
	}
	public int getAll_consulting_cnt() {
		return all_consulting_cnt;
	}
	public void setAll_consulting_cnt(int all_consulting_cnt) {
		this.all_consulting_cnt = all_consulting_cnt;
	}
	
	@Override
	public String toString() {
		return "AdminVO [empno=" + empno + ", password=" + password + ", admin_name=" + admin_name + ", gender="
				+ gender + ", consulting_channel=" + consulting_channel + ", branch_no=" + branch_no + ", type=" + type
				+ ", add_consulting_cnt=" + add_consulting_cnt + ", all_consulting_cnt=" + all_consulting_cnt + "]";
	}
	
	
}