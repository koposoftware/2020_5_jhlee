package kr.ac.hana.consulting.dao;

import java.util.ArrayList;
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

	
	
}
