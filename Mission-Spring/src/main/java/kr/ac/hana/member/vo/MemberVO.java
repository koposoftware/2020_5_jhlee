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
	private String phoneNo;
	@NotEmpty(message = "필수항목입니다")
	private String job;
	private String address;
	private String emailId;
	private String emailDomain;
	@NotEmpty(message = "필수항목입니다")
	private String digitalEdu;
	@NotEmpty(message = "필수항목입니다")
	private String interest;
	@NotEmpty(message = "필수항목입니다")
	private String age;
	private String type;
	private String customerType;
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
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
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
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getDigitalEdu() {
		return digitalEdu;
	}
	public void setDigitalEdu(String digitalEdu) {
		this.digitalEdu = digitalEdu;
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
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", birth=" + birth + ", gender="
				+ gender + ", phoneNo=" + phoneNo + ", job=" + job + ", address=" + address + ", emailId=" + emailId
				+ ", emailDomain=" + emailDomain + ", digitalEdu=" + digitalEdu + ", interest=" + interest + ", age="
				+ age + ", type=" + type + ", customerType=" + customerType + "]";
	}
	
}

