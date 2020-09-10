package kr.ac.kopo.reply.service;

import java.util.List;

import kr.ac.kopo.reply.vo.ReplyVO;

public interface ReplyService {
	
	void insertReply(ReplyVO replyVO);
	List<ReplyVO>selectAllByInquiryNo(int inquiryNo);
	void removeReply(int replyNo);
	void removeReply(ReplyVO replyVO);
}
