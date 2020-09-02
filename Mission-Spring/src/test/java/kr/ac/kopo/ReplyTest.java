package kr.ac.kopo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.hana.reply.vo.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class ReplyTest {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Test
	public void 전체댓글조회() throws Exception{
		
		List<ReplyVO> list = sqlSession.selectList("reply.dao.ReplyDAO.selectAll", 45);
		
		for(ReplyVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Test
	public void 게시물번호조회ByReplyNo() throws Exception{
		int boardNo =sqlSession.selectOne("reply.dao.ReplyDAO.selectBoardNo", 9);
		assertEquals(45, boardNo); //날라오는 boardNo가 45와 같니?
		//assertNotEquals(, );
	}
}
