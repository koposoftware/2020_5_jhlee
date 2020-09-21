package kr.ac.hana.map.dao;

import java.util.List;

import kr.ac.hana.map.vo.BranchLatLngVO;

public interface MapDAO {

	//지점 지도 
	public List<BranchLatLngVO> selectLatLng();
	
	//지점번호로 지점 조회서비스 
	public BranchLatLngVO selectBranch(String no);
}
 