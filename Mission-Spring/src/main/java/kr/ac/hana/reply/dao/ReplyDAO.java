package kr.ac.hana.reply.dao;

import java.util.List;

import kr.ac.hana.reply.vo.ReplyVO;

/**
 * 댓글관련 CRUD 인터페이스
 * @author DA
 *
 */
public interface ReplyDAO {

	/**
	 * 댓글등록 
	 */
	void insert(ReplyVO replyVO);
	
	/**
	 * 해당게시물의 댓글 조회
	 * @param boardNo 조회할 게시물번호
	 * @return 조회된 댓글VO목록
	 */
	List<ReplyVO> selectAll(int inquiryNo);
	
	/*
	 * 댓글삭제
	 * @param replyNo 삭제할 댓글번호
	 */
	void delete(int replyNo);
	
	/*
	 *댓글 번호에 해당 게시물 번호 조회
	 * @param replyNo 댓글번호
	 * @return 댓글번호에 해당 게시물 번호
	 */
	int selectInquiryNo(int replyNo);
}

