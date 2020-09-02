package kr.ac.hana.member.dao;

import kr.ac.hana.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO member);
	
	/*
	 * 회원 등록 서비스 
	 */
	
	public void updateMember(MemberVO member);
}
