package kr.ac.hana.map.service;

import java.util.List;

import kr.ac.hana.map.dao.MapDAO;
import kr.ac.hana.map.vo.BranchLatLngVO;

public interface MapService {

	 //지점지도
	 List<BranchLatLngVO> selectLatLng();
	 
	 //지점번호별 지점 조회서비스
	 BranchLatLngVO selectBranch(String no);
}
