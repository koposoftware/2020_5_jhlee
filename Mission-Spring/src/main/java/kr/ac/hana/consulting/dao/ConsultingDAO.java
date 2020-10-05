package kr.ac.hana.consulting.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hana.consulting.vo.ConsultingVO;

public interface ConsultingDAO {

	
	//전체 상담리스트 조회서비스 
	public List<ConsultingVO> selectAllConsulting();
	
	//고객별 상담리스트 조회서비스 (session id)
	public List<ConsultingVO> selectById(String id);
	
	//관리자 empno로 리스트 조회서비스
	public ConsultingVO selectByEmpno(String empno);
    
	//상담 노트에 상담등록 서비스 
	public void insert(ConsultingVO consulting);
	
	//상담 노트 상세 조회 서비스 
	public ConsultingVO selectByConsultingNo(int no);
	
	/*
	 * 추가상담 컬럼의 N값을 Y값으로 업데이트 
	 * @param no 업데이트시킬 상담게시물 번호 
	 */
	public void updateAddConsulting(int no);
	
	//추가 상담 컬럼의 Y값을 N값으로 업데이트 
	public void updateAddConsulting2(int no);
	
	/*
	 * 메인카테고리로 고객정보 검색
	*/
	/* List<ConsultingVO> selectSearchInfoByMainCategory(String mainCategory); */
	
	
	List<ConsultingVO> selectSearchInfoList(Map<String, String> searchMap);

	// 고객id로 검색 
	List<ConsultingVO> selectSearchInfoListById(Map<String, String> searchMap);
	
    //상담건수  
	int cntConsulting();
	
	//페이징(전체상담조회)
	List<ConsultingVO> selectPageConsulting(int pageNo, int boardCntPerPage);
	
	//페이징(id별 전체상담조회)
	List<ConsultingVO> selectPageConsultingById(int pageNo, int boardCntPerPage, String id);

	// 즐겨찾기 추가
	public void favorite(ConsultingVO consulting);
	
	//즐겨찾기 조회 
	public List<ConsultingVO> selectFavorites(Map<String, String> searchMap);
	
	//메인차트 만들기1
	public List<ConsultingVO> selectMainChart(); 
	
	//마이페이지 차트 만들기 
	public List<ConsultingVO> selectMyChart(String id);
	
	//오늘 상담건수 알리기 
	public ConsultingVO cntAddConsulting(String empno);
	
	//메인차트 만들기2
	public List<ConsultingVO> selectMainChart2();
	
	//메인차트 만들기3
//	public List<HashMap<String, Object>> selectMainChart2(); 
	
}
