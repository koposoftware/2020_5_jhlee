package kr.ac.kopo.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.member.vo.MemberVO;

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
	public void updateMember(MemberVO member) {
		
		sqlSession.update("member.dao.MemberDAO.updateMember", member);
		
	}
	
	

	
}
