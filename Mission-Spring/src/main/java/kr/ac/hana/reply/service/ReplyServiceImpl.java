package kr.ac.hana.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hana.board.dao.BoardDAO;
import kr.ac.hana.reply.dao.ReplyDAO;
import kr.ac.hana.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDao;
	
	@Autowired
	private BoardDAO boardDao;
	
	/*서비스가 여러개의 dao를 움직이면서 테이블의 애들을 access할 수 있다. 
	 * 댓글 추가
	 * 1.db에 t_board에 해당 레코드의 댓글 카운트 컬럼값을 1 증가  
	 * 2.db에 t_reply에 새로운 댓글 추가 
	 */
	
	@Transactional
	@Override
	public void insertReply(ReplyVO replyVO) {
		boardDao.incrementReplyCnt(replyVO.getInquiryNo()); //DETAIL에서 inquiryNO로 넘겨줘서 알고 있음
		replyDao.insert(replyVO);
		
	}

	@Override
	public List<ReplyVO> selectAllByInquiryNo(int inquiryNo) {
		
		List<ReplyVO> replyList = replyDao.selectAll(inquiryNo);
		
		return replyList;
	}

	/*
	 * 0. DB에서 삭제할 댓글의 게시물 번호 조회(t_reply) 
	 * 1. DB에서 해당 댓글 삭제(t_reply)
	 * 2. DB에서 해당 게시물의 댓글 카운트 감소 (t_board) 
	 */
	@Transactional
	@Override
	public void removeReply(int replyNo) {
		int inquiryNo = replyDao.selectInquiryNo(replyNo); //게시물번호 몰라서 조회해오기 
		System.out.println("인콰리넘버 찍기 : " + inquiryNo); 
		replyDao.delete(replyNo);
		boardDao.reduceReplyCnt(inquiryNo); //게시물번호에 cnt지워주기 
		
	}
	
	/*
	 * 1. DB에서 해당 댓글 삭제(t_reply)
	 * 2. DB에서 해당 게시물의 댓글 카운트 감소 (t_board) 
	 */
	@Transactional
	@Override
	public void removeReply(ReplyVO replyVO) {
		System.out.println("DAO에서 얘가 먹히겠지?");
		boardDao.reduceReplyCnt(replyVO.getInquiryNo());
		replyDao.delete(replyVO.getNo());
		System.out.println("DAO에서 보드넘버: " +replyVO.getInquiryNo());

		
	}
	
	
	
}