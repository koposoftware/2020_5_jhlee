package kr.ac.hana.register.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.hana.board.dao.BoardDAO;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.register.dao.RegisterDAO;
import kr.ac.hana.register.vo.RegisterVO;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private RegisterDAO registerDAO;
	
	@Override
	public List<RegisterVO> selectAllRegister() {
		
		List<RegisterVO> registerList = registerDAO.selectAllRegister();
		
		return registerList;
	}

	
}
