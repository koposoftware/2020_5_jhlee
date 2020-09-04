package kr.ac.hana.consulting.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import kr.ac.hana.consulting.vo.ConsultingVO;

@Repository
public class ConsultingDAOImpl implements ConsultingDAO {
	
	@Autowired
	private SqlSessionTemplate SqlSession;
	
	@Override
	public List<ConsultingVO> selectAll() {
		
		List<ConsultingVO> consultingList = SqlSession.selectList("consulting.dao.ConsultingDAO.selectAll");
		
		return consultingList;
	}

	
	
	@Override
	public List<ConsultingVO> selectById(String id) {
		List<ConsultingVO> customerConsultingList = SqlSession.selectList("consulting.dao.ConsultingDAO.selectById",id);
		
		return customerConsultingList;
	}



	@Override
	public void insert(ConsultingVO consulting) {
		
		SqlSession.insert("consulting.dao.ConsultingDAO.insert",consulting);
		
	}

	@Override
	public ConsultingVO selectByNo(int no) {
		ConsultingVO consulting = SqlSession.selectOne("consulting.dao.CounsultingDAO.selectByNo", no);
		
		return consulting;
	}

	@Override
	public void updateAddConsulting(int no) {
		SqlSession.update("consulting.dao.ConsultingDAO.updateAddConsulting",no);
		
	}
}
