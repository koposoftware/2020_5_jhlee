package kr.ac.hana.register.service;

import java.util.List;

import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.register.vo.RegisterVO;

public interface RegisterService {
	
	
	//고객별 추가상담 전체 리스트 조회
	List<RegisterVO> selectAllRegisterById(String id);
	
	// 직원별 추가 상담리스트 조회 서비스 
	List<RegisterVO> selectAllRegisterByEmpno(String empno);

	//추가 상담 등록 서비스
	void insert(RegisterVO register); 
	
	//직원별 예약일정리스트 조회서비스
	List<RegisterVO> selectAllByEmpno(String empno);
	
	//예약 등록서비스(유저)
	void insertSchedule(RegisterVO register);
	
	//일정 등록서비스(관리자)
	void insertAdminSchedule(RegisterVO register);
	
	//추가상담 업데이트 
	void updateProgress(int consultingNo);
	
	//추가상담 취소 
	void delSchedule(int consultingNo);
	
	//유저 예약 달력 조회 서비스 
	List<RegisterVO> selectAllById(String id);
	
	//일정 삭제(관리자단)
	void removeRegister(RegisterVO register);
}
