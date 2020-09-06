package kr.ac.hana.consulting.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import kr.ac.hana.consulting.vo.ConsultingVO;

@Repository
public class ConsultingDAOImpl implements ConsultingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ConsultingVO> selectAllConsulting() {
		
		List<ConsultingVO> consultingList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectAllConsulting");
		
		return consultingList;
	}

	
	
	@Override
	public List<ConsultingVO> selectById(String id) {
		List<ConsultingVO> customerConsultingList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectById",id);
		
		return customerConsultingList;
	}


	@Override
	public void insert(ConsultingVO consulting) {
		
		sqlSession.insert("consulting.dao.ConsultingDAO.insert",consulting);
		
	}

	@Override
	public ConsultingVO selectByConsultingNo(int no) {
		
		ConsultingVO consulting = sqlSession.selectOne("consulting.dao.ConsultingDAO.selectByConsultingNo",no);
		
		return consulting;
	}

	@Override
	public void updateAddConsulting(int no) {
		sqlSession.update("consulting.dao.ConsultingDAO.updateAddConsulting",no);
		
	}
}
