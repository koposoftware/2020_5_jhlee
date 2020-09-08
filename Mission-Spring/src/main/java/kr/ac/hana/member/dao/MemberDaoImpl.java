package kr.ac.hana.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hana.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDAO{

	//마이바티스 이용해서 로그인 연동하고 싶으니 템플릿 필요
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO login(MemberVO member) {
		
		MemberVO loginVO = sqlSession.selectOne("member.dao.MemberDAO.login", member);
	
		return loginVO;
	}

	@Override
	public void insertMember(MemberVO member) {
		
		sqlSession.insert("member.dao.MemberDAO.insertMember", member);
		
	}

	@Override
	public List<MemberVO> selectAllInform() {
		
		List<MemberVO> allInformList =sqlSession.selectList("member.dao.MemberDAO.selectAllInform");
		
	    return allInformList;
	}

	@Override
	public List<MemberVO> selectCustomerInform(String id) {
		
		List<MemberVO> customerInform =sqlSession.selectList("member.dao.MemberDAO.selectCustomerInform",id);
		
		return customerInform;
	}
	
	
	
	

	
}
