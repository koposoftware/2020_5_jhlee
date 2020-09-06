package kr.ac.hana.consulting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hana.consulting.dao.ConsultingDAO;
import kr.ac.hana.consulting.vo.ConsultingVO;

@Service
public class ConsultingServiceImpl implements ConsultingService {

	@Autowired
	private ConsultingDAO consultingDAO;

	@Override
	public List<ConsultingVO> selectAllConsulting() {
		
		
		List<ConsultingVO> consultingList = consultingDAO.selectAllConsulting();
		
		return consultingList;
	}
	


	@Override
	public List<ConsultingVO> selectById(String id) {
		
		List<ConsultingVO> customerConsultingList = consultingDAO.selectById(id);
		
		return customerConsultingList;
	}


	/*
	 * @Override public List<ConsultingVO> selectByPaId(String id) {
	 * 
	 * List<ConsultingVO> customerConsulting = consultingDAO.selectByPaId(id);
	 * 
	 * return customerConsulting; }
	 */

	
	

	@Override
	public void insert(ConsultingVO consulting) {
		consultingDAO.insert(consulting);
		
	}

	@Override
	public ConsultingVO selectByConsultingNo(int no) {
		
		ConsultingVO consulting = consultingDAO.selectByConsultingNo(no);
		
		return consulting;
	}

	@Override
	public void updateAddConsulting(int no) {
		consultingDAO.updateAddConsulting(no);
		
	}
	
	
	
}
