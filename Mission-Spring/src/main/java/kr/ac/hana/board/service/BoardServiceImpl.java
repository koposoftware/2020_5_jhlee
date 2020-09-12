package kr.ac.hana.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hana.board.dao.BoardDAO;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.member.vo.MemberVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> selectAllBoard() {
		
		List<BoardVO> inquiryList = boardDAO.selectAll();
		return inquiryList;
	}

	@Override
	public BoardVO selectByNo(int no) {
		BoardVO inquiry = boardDAO.selectByNo(no);
		boardDAO.incrementViewCnt(no);
		return inquiry;
	}
	
	 @Override
	   public void insert(BoardVO inquiry) {
	      boardDAO.insert(inquiry);      
	   }

	@Override
	public void incrementReplyCnt(int no) {
		boardDAO.incrementReplyCnt(no);
		
	}

	@Override
	public void reduceReplyCnt(int no) {
		System.out.println("보드 서비스 :" + no);
		boardDAO.reduceReplyCnt(no);
	}

	@Override
	public void incrementViewCnt(int no) {
		boardDAO.incrementViewCnt(no);
	}

	@Override
	public int cntInquiry() {

		int totalInquiryCnt = boardDAO.cntInquiry();
		
		return totalInquiryCnt;
	}

	@Override
	public List<BoardVO> selectPageInquiry(int pageNo, int boardCntPerPage) {

		List<BoardVO> boardList = boardDAO.selectPageInquiry(pageNo, boardCntPerPage);
				
		return boardList;
	}

	@Override
	public List<BoardVO> selectSearchInquiry(Map<String, String> searchMap) {

		List<BoardVO> searchBoardList = new ArrayList<BoardVO>();
		
		searchBoardList = boardDAO.selectSearchInquiry(searchMap);
		
		return  searchBoardList;
	}
	
	
}
