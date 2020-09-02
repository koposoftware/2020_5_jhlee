package kr.ac.hana.board.service;

import java.util.List;

import kr.ac.hana.board.vo.BoardVO;

public interface BoardService {
	/*
	 * 전체게시글 조회
	 * @return
	 */
	List<BoardVO> selectAllBoard();
	
	
	/*
	 *상세게시글 조회 
	 */
	BoardVO selectByNo(int no);
	
	
	/*
	 * 새글 등록
	 */
	
    void insert(BoardVO board);
    
    /*
     * 댓글증가
     */
    
    void incrementReplyCnt(int no);
    
    /*
     * 댓글감소
     */
    void reduceReplyCnt(int no);
    
    /*
     * 조회수증가
     */
    void incrementViewCnt(int no);
}
