package kr.ac.hana.member.dao;

import java.util.List;
import java.util.Map;

import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO member);
	
	//회원 등록 서비스 
	public void insertMember(MemberVO member);
	
	//전체 회원 조회 서비스 
	public List<MemberVO> selectAllInform();
	
	//고객별 회원 정보 조회 서비스 
	public List<MemberVO> selectCustomerInform(String id);
	
	//멤버수 
	int cntMember();
	
	//페이징(전체상담조회)
	List<MemberVO> selectPageMember(Map<String, Object> map);
	
	//고객정보 검색 
	List<MemberVO> selectSearchMember(Map<String, String> searchMap);

		
}
