package kr.ac.hana.member.service;

import kr.ac.hana.member.vo.MemberVO;

public interface MemberService {
	
	MemberVO login(MemberVO member);

	
	/*
	 * 회원 등록
	 */
	void updateMember(MemberVO member);
}
