package kr.ac.hana.consulting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hana.consulting.dao.ConsultingDAO;
import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.register.dao.RegisterDAO;
import kr.ac.hana.register.dao.RegisterDAO;

@Service
public class ConsultingServiceImpl implements ConsultingService {

	@Autowired
	private ConsultingDAO consultingDAO;

	@Override
	public List<ConsultingVO> selectAllConsulting() {

		List<ConsultingVO> consultingList = consultingDAO.selectAllConsulting();

		return consultingList;
	}

	@Override
	public List<ConsultingVO> selectById(String id) {

		List<ConsultingVO> customerConsultingList = consultingDAO.selectById(id);

		return customerConsultingList;
	}

    

	@Override
	public ConsultingVO selectByEmpno(String empno) {
		
		ConsultingVO consulting = consultingDAO.selectByEmpno(empno);

		return consulting;
	}

	@Override
	public void insert(ConsultingVO consulting) {
		consultingDAO.insert(consulting);

	}

	@Override
	public ConsultingVO selectByConsultingNo(int no) {

		ConsultingVO consulting = consultingDAO.selectByConsultingNo(no);

		return consulting;
	}

	@Override
	public void updateAddConsulting(int no) {
	  
		consultingDAO.updateAddConsulting(no);
	}

	@Override
	public void updateAddConsulting2(int no) {
		
		consultingDAO.updateAddConsulting2(no);
		
	}

	@Override
	public List<ConsultingVO> selectSearchInfoList(Map<String, String> searchMap) {// 맵이라는 객체의 변수명 searchMap
		// TODO Auto-generated method stub

		List<ConsultingVO> searchInfoList = new ArrayList<ConsultingVO>();

		if (searchMap.get("id") != "") {
			searchInfoList = consultingDAO.selectSearchInfoListById(searchMap);

		} else {

			searchInfoList = consultingDAO.selectSearchInfoList(searchMap);
		}

//		if (searchMap.get("mainCategory") != null) {
//			searchInfoList = consultingDAO.selectSearchInfoByMainCategory(searchMap.get("mainCategory"));
//		} else if (searchMap.get("middleCategory") != null) {
//			searchInfoList = consultingDAO.selectSearchInfoByMiddleCategory(searchMap.get("middleCategory"));
//			
//		}

		return searchInfoList;
	}

	@Override
	public int cntConsulting() {
		// TODO Auto-generated method stub
		int totalBoardCnt = consultingDAO.cntConsulting();

		return totalBoardCnt;
	}

	@Override
	public List<ConsultingVO> selectPageConsulting(int pageNo, int boardCntPerPage) {
		// TODO Auto-generated method stub
		List<ConsultingVO> consultingList = consultingDAO.selectPageConsulting(pageNo, boardCntPerPage);
		
		return consultingList;
	}

	@Override
	public List<ConsultingVO> selectPageConsultingById(int pageNo, int boardCntPerPage, String id) {
		
		List<ConsultingVO> consultingList = consultingDAO.selectPageConsultingById(pageNo, boardCntPerPage, id);
		
		return consultingList;
	}

	
	// 즐겨찾기
	@Override
	public void favorite(ConsultingVO consulting) {
		consultingDAO.favorite(consulting);
	}

	//즐겨찾기 조회
	@Override
	public List<ConsultingVO> selectFavorites(Map<String, String> searchMap) {
		List<ConsultingVO> favorites = consultingDAO.selectFavorites(searchMap);

		return favorites;
	}

	@Override
	public List<ConsultingVO> selectMainChart() {
		
		List<ConsultingVO> chartList = consultingDAO.selectMainChart();
		return chartList;
	}

//	@Override
//	public List<HashMap<String, Object>> selectMainChart2() {
//		return consultingDAO.selectMainChart2();
//	}
//	
	
	

}
