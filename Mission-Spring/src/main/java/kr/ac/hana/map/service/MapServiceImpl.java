package kr.ac.hana.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hana.map.dao.MapDAO;
import kr.ac.hana.map.vo.BranchLatLngVO;

@Service
public class MapServiceImpl implements MapService {

	 @Autowired
	 private MapDAO mapDAO;
	 
	 @Override
	 public List<BranchLatLngVO> selectLatLng(){
		 List<BranchLatLngVO> branchLatLng = mapDAO.selectLatLng();
		 return branchLatLng;
	 }

	@Override
	public BranchLatLngVO selectBranch(String no) {
	    BranchLatLngVO branchList = mapDAO.selectBranch(no);
	    
		return branchList;
	}
	 
	 
}
