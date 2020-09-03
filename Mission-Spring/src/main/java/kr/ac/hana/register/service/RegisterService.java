package kr.ac.hana.register.service;

import java.util.List;

import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.register.vo.RegisterVO;

public interface RegisterService {
	
	/*
	 * 추가상담 전체 리스트 조회
	 */
	List<RegisterVO> selectAllRegister();

}
