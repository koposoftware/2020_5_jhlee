package kr.ac.hana.member.dao;

import java.util.List;

import kr.ac.hana.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO member);
	
	/*
	 * 회원 등록 서비스 
	 */
	
	public void updateMember(MemberVO member);
	
	/*
	 * 전체 회원 조회 서비스 
	 */
	public List<MemberVO> selectAllInform();
	
	/*
	 * 고객별 회원 정보 조회 서비스 
	 */
	
	public List<MemberVO> selectCustomerInform(String id);
	
}
