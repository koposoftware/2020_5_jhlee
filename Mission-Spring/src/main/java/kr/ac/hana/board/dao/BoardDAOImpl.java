package kr.ac.hana.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.member.vo.MemberVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired //자동주입 객체 찾는것
	private SqlSessionTemplate sqlSession;	//sqlsession템플릿 객체가 필요했음  필요한 인스턴스 객체를 미리 만들어서 컨테이너에서 관리 
	
	@Override
	public List<BoardVO> selectAll() {
		
		List<BoardVO> inquiryList = sqlSession.selectList("board.dao.BoardDAO.selectAll");		
		
		return inquiryList;
	}

	@Override
	public void insert(BoardVO inquiry) {
		
		sqlSession.insert("board.dao.BoardDAO.insert", inquiry);
		
	}

	@Override
	public BoardVO selectByNo(int no) {
		BoardVO inquiry = sqlSession.selectOne("board.dao.BoardDAO.selectByNo", no);
		
		return inquiry;
	}

	@Override
	public void incrementReplyCnt(int no) {
     sqlSession.update("board.dao.BoardDAO.incrementReplyCnt", no);
     
	}

	@Override
	public void reduceReplyCnt(int no) {
		//System.out.println("보드 DAO:" + no);
		sqlSession.update("board.dao.BoardDAO.reduceReplyCnt", no);
		
	}

	@Override
	public void incrementViewCnt(int no) {
		sqlSession.update("board.dao.BoardDAO.incrementViewCnt", no);
		
	}

	@Override
	public int cntInquiry() {
		
		int totalInquiryCnt = sqlSession.selectOne("board.dao.BoardDAO.cntInquiry");
		
		return totalInquiryCnt;
	}

	@Override
	public List<BoardVO> selectPageInquiry(int pageNo, int boardCntPerPage) {
		
	//파라미터 두개가 필요한데 넘어갈 때 하나로 넘어가야 해서 map으로 넘겨줌 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("boardCntPerPage", boardCntPerPage);
				
		List<BoardVO>  boardList = sqlSession.selectList("board.dao.BoardDAO.selectPageInquiry",map);

		return  boardList;	
		
	}

	@Override
	public List<BoardVO> selectSearchInquiry(Map<String, String> searchMap) {
		
		List<BoardVO> boardList = sqlSession.selectList("board.dao.BoardDAO.selectSearchInquiry",searchMap);
		
		return boardList;
	}    
	
	

	
}
