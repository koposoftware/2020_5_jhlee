package kr.ac.hana.member.vo;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class MemberVO {
	//boardVO처럼 validation체크 하기 
	@NotEmpty(message = "필수항목입니다")
	private String id;
	@NotEmpty(message = "필수항목입니다")
	private String name;
	@NotEmpty(message = "필수항목입니다")
	private String password;
	@Length(min = 1, max = 6, message = "생년월일은 6자리로 입력해주세요")
	private String birth;
	@NotEmpty(message = "필수항목입니다")
	private String gender;
	@NotEmpty(message = "필수항목입니다")
	private String phone_no;
	@NotEmpty(message = "필수항목입니다")
	private String job;
	private String address;
	private String email_id;
	private String email_domain;
	@NotEmpty(message = "필수항목입니다")
	private String digital_edu;
	@NotEmpty(message = "필수항목입니다")
	private String interest;
	@NotEmpty(message = "필수항목입니다")
	private String age;
	private String type;
	private String customer_type;
	
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getEmail_domain() {
		return email_domain;
	}
	public void setEmail_domain(String email_domain) {
		this.email_domain = email_domain;
	}
	public String getDigital_edu() {
		return digital_edu;
	}
	public void setDigital_edu(String digital_edu) {
		this.digital_edu = digital_edu;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCustomer_type() {
		return customer_type;
	}
	public void setCustomer_type(String customer_type) {
		this.customer_type = customer_type;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", birth=" + birth + ", gender="
				+ gender + ", phone_no=" + phone_no + ", job=" + job + ", address=" + address + ", email_id=" + email_id
				+ ", email_domain=" + email_domain + ", digital_edu=" + digital_edu + ", interest=" + interest
				+ ", age=" + age + ", type=" + type + ", customer_type=" + customer_type + "]";
	}
	
}

