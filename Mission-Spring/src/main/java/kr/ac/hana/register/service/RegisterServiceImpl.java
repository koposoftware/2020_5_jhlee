package kr.ac.hana.register.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hana.board.dao.BoardDAO;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.consulting.dao.ConsultingDAO;
import kr.ac.hana.register.dao.RegisterDAO;
import kr.ac.hana.register.vo.RegisterVO;
import kr.ac.hana.reply.vo.ReplyVO;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private RegisterDAO registerDAO;
	
	@Autowired
	private ConsultingDAO consultingDAO;
	
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


	@Override
	public void insertAdminSchedule(RegisterVO register) {
		
		registerDAO.insertAdminSchedule(register);
	}


	@Override
	public void updateProgress(int consultingNo) {
		registerDAO.updateProgress(consultingNo);
		
	}

	@Override
	public void delSchedule(int consultingNo) {
		registerDAO.delSchedule(consultingNo);
		
	}


	@Override
	public List<RegisterVO> selectAllById(String id) {
		List<RegisterVO> userList = registerDAO.selectAllById(id);
		return userList;
	}
	
	//일정 삭제(관리자단)
	@Override
	public void removeRegister(RegisterVO register) {
	  registerDAO.removeRegister(register);
	}
}
