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
	public List<RegisterVO> selectAllRegisterById(String id) {
		
		List<RegisterVO> userAddConsultingList = sqlSession.selectList("register.dao.RegisterDAO.selectAllRegisterById",id);
		
		return userAddConsultingList;
	}

	@Override
	public List<RegisterVO> selectAllRegisterByEmpno(String empno) {
		List<RegisterVO> adminAddConsultingList = sqlSession.selectList("register.dao.RegisterDAO.selectAllRegisterByEmpno",empno);
		
		return adminAddConsultingList;
	}

	@Override
	public void insert(RegisterVO register) {
		
		sqlSession.insert("register.dao.RegisterDAO.insert",register);
		
	}
	

}





