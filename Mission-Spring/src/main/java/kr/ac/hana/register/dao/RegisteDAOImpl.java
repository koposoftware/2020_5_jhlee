package kr.ac.hana.register.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.register.service.RegisterService;
import kr.ac.hana.register.vo.RegisterVO;


@Repository
public class RegisteDAOImpl implements RegisterDAO {

	@Autowired //자동주입 객체 찾는것
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<RegisterVO> selectAllRegister() {
		
		List<RegisterVO> registerList = sqlSession.selectList("register.dao.RegisterDAO.selectAllRegister");
		
		return registerList;
	}

	@Override
	public void insert(RegisterVO register) {
		
		sqlSession.insert("register.dao.RegisterDAO.insert",register);
		
	}
	
	

}
