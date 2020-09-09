package kr.ac.hana.consulting.service;

import kr.ac.hana.consulting.vo.ConsultingVO;

import java.util.List;
import java.util.Map;

public interface ConsultingService {
	
	/*
	 * 전체 상담리스트 조회
	 */
	List<ConsultingVO> selectAllConsulting();
	
	/*
	 * 고객별 상담리스트 조회서비스(session id) 
	 */
	List<ConsultingVO> selectById(String id);


	/*
	 * 상담 노트에 상담등록 서비스
	 */
	void insert(ConsultingVO consulting);
	
	
	/*
	 * 상담 노트 번호로 상세 조회 서비스 
	 */
	ConsultingVO selectByConsultingNo(int no);
	
	/*
	 * 추가상담 컬럼의 N값을 Y값으로 업데이트 
	 * @param no 업데이트시킬 상담게시물 번호 
	 */
	void updateAddConsulting(int no);
	
	/*
	 * 고객 정보 검색
	*/
	List<ConsultingVO> selectSearchInfoList(Map<String,String> searchMap);
	
	
}
