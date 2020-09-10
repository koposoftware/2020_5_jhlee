package kr.ac.kopo.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.reply.vo.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insert(ReplyVO replyVO) {
		System.out.println(replyVO);
		sqlSession.insert("reply.dao.ReplyDAO.insert", replyVO);
	}

	@Override
	public List<ReplyVO> selectAll(int inquiryNo) {
		
		List<ReplyVO> replyList 
				= sqlSession.selectList("reply.dao.ReplyDAO.selectAll", inquiryNo);
		
		return replyList;
	}

	@Override
	public void delete(int replyNo) {
		
		sqlSession.delete("reply.dao.ReplyDAO.delete", replyNo);
		
	}

	@Override
	public int selectInquiryNo(int replyNo) {
		int inquiryNo = sqlSession.selectOne("reply.dao.ReplyDAO.selectInquiryNo", replyNo);
		return inquiryNo;
	}

}
