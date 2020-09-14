package kr.ac.hana.register.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.hana.board.dao.BoardDAO;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.register.dao.RegisterDAO;
import kr.ac.hana.register.vo.RegisterVO;
import kr.ac.hana.reply.vo.ReplyVO;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private RegisterDAO registerDAO;
	
	@Override
	public List<RegisterVO> selectAllRegisterById(String id) {
		
		List<RegisterVO> userAddConsultingList = registerDAO.selectAllRegisterById(id);
		
		return userAddConsultingList;
	}
	

	@Override
	public List<RegisterVO> selectAllRegisterByEmpno(String empno) {

		List<RegisterVO> adminAddConsultingList  = registerDAO.selectAllRegisterByEmpno(empno);
		
		return adminAddConsultingList;
	}


	@Override
	public void insert(RegisterVO register) {
		registerDAO.insert(register);
		
	}


	@Override
	public List<RegisterVO> selectAllByEmpno(String empno) {
	List<RegisterVO> reservationList = registerDAO.selectAllByEmpno(empno);
		
		return reservationList;
	}


	@Override
	public void insertSchedule(RegisterVO register) {
		
		registerDAO.insertSchedule(register);

	}

}
