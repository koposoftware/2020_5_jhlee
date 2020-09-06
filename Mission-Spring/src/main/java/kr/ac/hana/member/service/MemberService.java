package kr.ac.hana.member.service;

import java.util.List;

import kr.ac.hana.member.vo.MemberVO;

public interface MemberService {
	
	MemberVO login(MemberVO member);

	
	/*
	 * 회원 등록
	 */
	void updateMember(MemberVO member);
	

	/*
	 * 전체 회원 조회 서비스 
	 */
	List<MemberVO> selectAllInform();
	
	
	/*
	 * 고객별 회원 정보 조회 서비스 
	 */
	List<MemberVO> selectCustomerInform(String id);
}
