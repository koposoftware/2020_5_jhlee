package kr.ac.hana.consulting.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hana.consulting.vo.ConsultingVO;

@Repository
public class ConsultingDAOImpl implements ConsultingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	@Override
	public List<ConsultingVO> selectSearchInfoList(Map<String, String> searchMap) {
		// TODO Auto-generated method stub
		List<ConsultingVO> consultingList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectSearchInfoList",searchMap);
		return consultingList;
	}



	@Override
	public List<ConsultingVO> selectSearchInfoListById(Map<String, String> searchMap) {
		
		List<ConsultingVO> consultingList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectSearchInfoListById",searchMap);
		
		return consultingList;
	}





	@Override
	public List<ConsultingVO> selectAllConsulting() {
		
		List<ConsultingVO> consultingList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectAllConsulting");
		
		return consultingList;
	}

	
	
	@Override
	public List<ConsultingVO> selectById(String id) {
		List<ConsultingVO> customerConsultingList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectById",id);
		
		return customerConsultingList;
	}

	

	@Override
	public ConsultingVO selectByEmpno(String empno) {
	ConsultingVO consulting = sqlSession.selectOne("consulting.dao.ConsultingDAO.selectByEmpno",empno);
		
		return consulting;
	}

	
	@Override
	public void insert(ConsultingVO consulting) {
		
		sqlSession.insert("consulting.dao.ConsultingDAO.insert",consulting);
		
	}

	@Override
	public ConsultingVO selectByConsultingNo(int no) {
		
		ConsultingVO consulting = sqlSession.selectOne("consulting.dao.ConsultingDAO.selectByConsultingNo",no);
		
		return consulting;
	}

	@Override
	public void updateAddConsulting(int no) {
		sqlSession.update("consulting.dao.ConsultingDAO.updateAddConsulting",no);
		
	}
   
	@Override
	public void updateAddConsulting2(int no) {
		sqlSession.update("consulting.dao.ConsultingDAO.updateAddConsulting2",no);
		
	}

	@Override
	public int cntConsulting() {
		
		int totalBoardCnt = sqlSession.selectOne("consulting.dao.ConsultingDAO.cntConsulting");
		return totalBoardCnt;
	}



	@Override
	public List<ConsultingVO> selectPageConsulting(int pageNo, int boardCntPerPage) {
		// TODO Auto-generated method stub
		
		//파라미터 두개가 필요한데 넘어갈 때 하나로 넘어가야 해서 map으로 넘겨줌 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("boardCntPerPage", boardCntPerPage);
		
		List<ConsultingVO> consultingList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectPageConsulting",map);

		return consultingList;
	}



	@Override
	public List<ConsultingVO> selectPageConsultingById(int pageNo, int boardCntPerPage, String id) {
		
		//파라미터 여러개가 필요한데 넘어갈 때 하나로 넘어가야 해서 map으로 넘겨줌 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("boardCntPerPage", boardCntPerPage);
		map.put("id", id);
		
		
		List<ConsultingVO> consultingList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectPageConsultingById",map);

		return consultingList;
	}



	// 즐겨찾기
	@Override
	public void favorite(ConsultingVO consulting) {
		sqlSession.insert("consulting.dao.ConsultingDAO.fav",consulting);
	}



	//즐겨찾기 조회 
	@Override
	public List<ConsultingVO> selectFavorites(Map<String, String> searchMap) {
		List<ConsultingVO> favorites = sqlSession.selectList("consulting.dao.ConsultingDAO.selectFavorites");	
		return favorites;
	}


	@Override
	public List<ConsultingVO> selectMainChart() {
		
		List<ConsultingVO> chartList = sqlSession.selectList("consulting.dao.ConsultingDAO.selectMainChart");
		
//		for(ConsultingVO a : chartList) { //vo형 리스트를 for문 하나 돌때마다 a라고 alias로 붙여줌
//			System.out.println(a);
//		}
		
		return chartList;
	}



	/*
	 * @Override public List<HashMap<String, Object>> selectMainChart2() { return
	 * sqlSession.selectList("consulting.dao.ConsultingDAO.selectMainChart2"); }
	 */
	

}
