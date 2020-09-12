package kr.ac.hana.board.service;

import java.util.List;
import java.util.Map;

import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.member.vo.MemberVO;

public interface BoardService {
	/*
	 * 전체게시글 조회
	 * @return
	 */
	List<BoardVO> selectAllBoard();
	
    //상세게시글 조회
	BoardVO selectByNo(int no);
	
	//새글등록
    void insert(BoardVO board);
    
    //댓글증가
    void incrementReplyCnt(int no);
    
    //댓글감소
    void reduceReplyCnt(int no);
    
    //조회수증가
    void incrementViewCnt(int no);
    
     //상담건수
  	int cntInquiry();
  	
  	//전체 상담 조회(페이징포함)
  	List<BoardVO> selectPageInquiry(int pageNo,int boardCntPerPage);

  	//고객정보검색
  	List<BoardVO> selectSearchInquiry(Map<String,String> searchMap);
  	
    
    
}
