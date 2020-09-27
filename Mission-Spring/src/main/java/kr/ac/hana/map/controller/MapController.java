package kr.ac.hana.map.controller;

import java.util.List;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hana.map.service.MapService;
import kr.ac.hana.map.vo.BranchLatLngVO;

@RequestMapping("/map")
@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping("/branchMap")
	public String branchMap() {
		System.out.println("branchMap");
		return "map/branchMap";
	}
	
	@RequestMapping("/branchLatLng.json")
	@ResponseBody
	public Map<String, List<BranchLatLngVO>> resJsonBody(){
		Map<String, List<BranchLatLngVO>> branchLatLng = new HashMap<>();
		List<BranchLatLngVO> result = mapService.selectLatLng();
		branchLatLng.put("positions",result);
		/*
		 * System.out.println("branchLatLng"); for(BranchLatLngVO vo : result) {
		 * System.out.println(vo); }
		 */
		return branchLatLng;
	}
	
	
	/*
	@RequestMapping("/searchBranch/{branchNo}")
	@ResponseBody
	public ModelAndView branchList(@PathVariable("branchNo") String no) {
		
		BranchLatLngVO branchList = mapService.selectBranch(no);
		
		ModelAndView mav = new ModelAndView("map/searchBranch");
		mav.addObject("branchList", branchList);
		
		return mav;
	}
	*/
	
	@RequestMapping("/searchBranch/{branchNo}")
	@ResponseBody
	public BranchLatLngVO branchList(@PathVariable("branchNo") String no) {
		
		BranchLatLngVO branch = mapService.selectBranch(no);
		System.out.println(branch);
		return branch;
	}
	
	
}
