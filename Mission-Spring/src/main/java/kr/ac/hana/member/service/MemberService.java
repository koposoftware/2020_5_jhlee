package kr.ac.hana.member.service;

import java.util.List;
import java.util.Map;

import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.vo.MemberVO;

public interface MemberService {
	
	MemberVO login(MemberVO member);

    //회원 등록
	void insertMember(MemberVO member);
	
	//전체 회원 조회 서비스 
	List<MemberVO> selectAllInform();
	
	//고객별 회원 정보 조회 서비스 
	List<MemberVO> selectCustomerInform(String id);
	
	//상담건수
	int cntMember();
	
	//전체 상담 조회(페이징포함)
	List<MemberVO> selectPageMember(int pageNo,int boardCntPerPage);

	//고객정보검색
	List<MemberVO> selectSearchMember(Map<String,String> searchMap);
	
}
