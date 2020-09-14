package kr.ac.hana.register.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.register.vo.RegisterVO;

public interface RegisterDAO {
	
	//전체 추가상담 조회서비스 
	public List<RegisterVO> selectAllRegisterById(String id);
	
	//직원별 추가상담리스트 조회서비스 
	public List<RegisterVO> selectAllRegisterByEmpno(String empno);

	//추가상담 등록 서비스 
	public void insert(RegisterVO register);
	
	//직원별 상담예약 일정 조회서비스
	public List<RegisterVO> selectAllByEmpno(String empno);
	
	//직원별 상담예약 등록 서비스(유저 UI) 
	public void insertSchedule(RegisterVO register);
}
