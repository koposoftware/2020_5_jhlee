package kr.ac.hana.consulting.dao;

import java.util.List;

import kr.ac.hana.consulting.vo.ConsultingVO;

public interface ConsultingDAO {

	/*
	 * 전체 상담리스트 조회서비스 
	 */
	
	public List<ConsultingVO> selectAll();
	
	/*
	 * 상담 노트에 상담등록 서비스 
	 */
	public void insert(ConsultingVO consulting);
	
	/*
	 *  상담 노트 상세 조회 서비스 
	 */
	public ConsultingVO selectByNo(int no);
	
	/*
	 * 추가상담 컬럼의 N값을 Y값으로 업데이트 
	 * @param no 업데이트시킬 상담게시물 번호 
	 */
	public void updateAddConsulting(int no);
	
}
