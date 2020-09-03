package kr.ac.hana.board.dao;

import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hana.board.vo.BoardVO;

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

	
}
