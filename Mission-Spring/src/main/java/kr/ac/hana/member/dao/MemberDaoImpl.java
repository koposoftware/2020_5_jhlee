package kr.ac.hana.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hana.consulting.vo.ConsultingVO;
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

	@Override
	public int cntMember() {
		int totalBoardCnt = sqlSession.selectOne("member.dao.MemberDAO.cntMember");
		
		return totalBoardCnt;
	}

	@Override
	public List<MemberVO> selectPageMember(int pageNo, int boardCntPerPage) {

		//파라미터 두개가 필요한데 넘어갈 때 하나로 넘어가야 해서 map으로 넘겨줌 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("boardCntPerPage", boardCntPerPage);
		
		List<MemberVO>  memberList = sqlSession.selectList("member.dao.MemberDAO.selectPageMember",map);

		return  memberList;
	}

	@Override
	public List<MemberVO> selectSearchMember(Map<String, String> searchMap) {
		
		List<MemberVO> memberList = sqlSession.selectList("member.dao.MemberDAO.selectSearchMember",searchMap);
		
		return memberList;
	}
	
}
