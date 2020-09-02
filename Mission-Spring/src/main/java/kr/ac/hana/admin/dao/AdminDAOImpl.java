package kr.ac.hana.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hana.admin.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public AdminVO login(AdminVO admin) {
		
		AdminVO adminLoginVO = sqlSession.selectOne("admin.dao.AdminDAO.login",admin);
		
		return adminLoginVO;
	}

	
}
