package kr.ac.hana.map.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hana.map.vo.BranchLatLngVO;

@Repository
public class MapDAOImpl implements MapDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BranchLatLngVO> selectLatLng(){
		List<BranchLatLngVO> branchLatLng = sqlSession.selectList("map.dao.MapDAO.selectLatLng");
		
		return branchLatLng;	
	}

	@Override
	public BranchLatLngVO selectBranch(String no) {
		
		BranchLatLngVO branchList = sqlSession.selectOne("map.dao.MapDAO.selectBranch",no);
		
		return branchList;
	}
	
}
