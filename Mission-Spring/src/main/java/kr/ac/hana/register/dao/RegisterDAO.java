package kr.ac.hana.register.dao;

import java.util.List;

import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.register.vo.RegisterVO;

public interface RegisterDAO {
	
	/*
	 * 전체 추가상담 조회서비스 
	 */
	
	public List<RegisterVO> selectAllRegister();
}
