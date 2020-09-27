package kr.ac.hana.consulting.service;

import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.consulting.vo.ConsultingVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ConsultingService {
	
	
	//전체 상담리스트 조회
	List<ConsultingVO> selectAllConsulting();
	
	//고객별 상담리스트 조회서비스(session id) 
	List<ConsultingVO> selectById(String id);

	//사원번호별 상담리스트 조회서비스
	ConsultingVO selectByEmpno(String empno);

	//상담 노트에 상담등록 서비스
	void insert(ConsultingVO consulting);
	
    //상담 노트 번호로 상세 조회 서비스 
	ConsultingVO selectByConsultingNo(int no);
	
	/*
	 * 추가상담 컬럼의 N값을 Y값으로 업데이트 
	 * @param no 업데이트시킬 상담게시물 번호 
	 */
	void updateAddConsulting(int no);
	//추가 상담 컬럼의 Y값을 N값으로 업데이트 
	void updateAddConsulting2(int no);
	
	//고객 정보 검색
	List<ConsultingVO> selectSearchInfoList(Map<String,String> searchMap);
	
	//상담건수
	int cntConsulting();
	
	//전체 상담 조회(페이징포함)
	List<ConsultingVO> selectPageConsulting(int pageNo,int boardCntPerPage);

	//고객별 상담조회(페이징포함 )
	List<ConsultingVO> selectPageConsultingById(int pageNo,int boardCntPerPage,String id);
	
	// 즐겨찾기
	public void favorite(ConsultingVO consulting);
	
	//즐겨찾기만 조회 
	List<ConsultingVO> selectFavorites(Map<String, String> searchMap);
	
	//메인차트 만들기1
	List<ConsultingVO> selectMainChart(); 
	
	//메인차트 만들기2
//	public List<HashMap<String, Object>> selectMainChart2(); 
	
	//메인차트 만들기3
//	public List<HashMap<String, Object>> selectMainChart2(); 
	
	//오늘 상담건수 알리기 
	public ConsultingVO cntAddConsulting(String empno);

}
