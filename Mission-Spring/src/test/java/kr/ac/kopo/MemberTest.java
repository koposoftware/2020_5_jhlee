package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.swing.text.DefaultEditorKit.CutAction;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.dao.MemberDAO;
import kr.ac.hana.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class MemberTest {
	
	
	
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private SqlSessionTemplate SqlSession;
	
	
	
	@Ignore
	@Test
	public void 로그인테스트() throws Exception {
		
		MemberVO member = new MemberVO();
		member.setId("user");
		member.setPassword("user");
		
		MemberVO loginVO = memberDAO.login(member);
		
		assertNotNull(loginVO);
	}
	@Ignore
	@Test
	public void 회원상담리스트불러오기() {
		List<ConsultingVO> customerConsultingList = SqlSession.selectList("consulting.dao.CounsultingDAO.selectById","user");
		
		
		for(ConsultingVO c : customerConsultingList ) {
			System.out.println(c);
		}
		
	}
	
	@Test
	public void 상담상세() {
		ConsultingVO consulting = SqlSession.selectOne("consulting.dao.CounsultingDAO.selectByConsultingNo",2);

			System.out.println(consulting);
		
		
	}
	
}
