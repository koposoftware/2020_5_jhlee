package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.hana.board.dao.BoardDAO;
import kr.ac.hana.board.service.BoardService;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.register.service.RegisterService;
import kr.ac.hana.register.vo.RegisterVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})  // config.xml 파일 로드하기  //컨테이너에 실제 객체들을 올려줌 
public class MyBatisTest {
   
   @Autowired
   private DataSource ds;
   
   @Autowired
   private SqlSessionTemplate session;
   
   @Autowired
   private BoardDAO boardDAO;
   
   @Autowired
   private BoardService boardService;
   
   @Autowired
   private RegisterService registerService;
   
   
   
   
   @Test
   public void 관리자_상담리스트_불러오기() {
		List<RegisterVO>  adminAddConsultingList = registerService.selectAllRegisterByEmpno("hnc1002");
		
		for (RegisterVO r : adminAddConsultingList) {
			System.out.println(r);
		}
		

   }
   
   @Ignore //얘는 테스트에서 제외하겠다. 
   @Test
   public void dsTest() throws Exception {
      assertNotNull(ds);
   }
   @Ignore
   @Test
   public void sqlSession테스트() throws Exception{
	   assertNotNull(session);
   }
   
   @Ignore
   @Test
   public void 전체게시글조회테스트() throws Exception{
	//   List<BoardVO> list = session.selectList("board.dao.BoardDAO.selectAll");
	//    List<BoardVO> list = boardDAO.selectAll();
	   List<BoardVO> list = boardService.selectAllBoard();
	   for(BoardVO board : list) {
		   System.out.println(board);
	   }
	   
   }
   @Ignore
   @Test
   public void 게시판상세Test() throws Exception{
	   BoardVO board = boardDAO.selectByNo(38);
	   System.out.println(board);
   }
   
   @Test
   public void 댓글증가test() throws Exception{
	   boardDAO.incrementReplyCnt(45);
   }

}






