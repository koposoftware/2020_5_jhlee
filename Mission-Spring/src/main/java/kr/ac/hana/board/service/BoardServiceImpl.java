package kr.ac.hana.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hana.board.dao.BoardDAO;
import kr.ac.hana.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> selectAllBoard() {
		
		List<BoardVO> boardList = boardDAO.selectAll();
		return boardList;
	}

	@Override
	public BoardVO selectByNo(int no) {
		BoardVO board = boardDAO.selectByNo(no);
//		boardDAO.selectByNo(no);
		boardDAO.incrementViewCnt(no);
		
		
		
		return board;
	}
	
	 @Override
	   public void insert(BoardVO board) {
	      boardDAO.insert(board);      
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
}
