package kr.ac.hana.register.service;

import java.util.List;


import kr.ac.hana.register.vo.RegisterVO;

public interface RegisterService {
	
	/*
	 * 고객별 추가상담 전체 리스트 조회
	 */
	List<RegisterVO> selectAllRegisterById(String id);
	

	/*
	 * 직원별 추가 상담리스트 조회 서비스 
	 */
	
	List<RegisterVO> selectAllRegisterByEmpno(String empno);

	
	/*
	 * 추가 상담 등록 서비스
	 */
	void insert(RegisterVO register); 
}
