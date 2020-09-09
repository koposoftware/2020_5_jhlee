package kr.ac.hana.consulting.controler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hana.admin.vo.AdminVO;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.consulting.dao.ConsultingDAO;
import kr.ac.hana.consulting.service.ConsultingService;
import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.vo.MemberVO;

@Controller
public class ConsultingController {
	
	@Autowired
	private ConsultingService consultingService;
	
	
	//상담리스트 전체 조회 
	@RequestMapping("/consultingList/admin")
	public ModelAndView consultingList(){
	
	List<ConsultingVO> consultingList = consultingService.selectAllConsulting();
	;
	ModelAndView mav =new ModelAndView("consulting/consultingList"); //spring-mvc.xml에 view-resolvers태그에 정해둠 
	mav.addObject("consultingList", consultingList);
	
	return mav;
	}
	
	
	//고객별 상담리스트 전체 조회 
	@RequestMapping("/consultingList")
	public ModelAndView customerConsultingList(HttpSession session){
		
	MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
	
	List<ConsultingVO> customerConsultingList = consultingService.selectById(loginVO.getId());
	
	ModelAndView mav =new ModelAndView("consulting/consultingList"); //spring-mvc.xml에 view-resolvers태그에 정해둠 
	mav.addObject("customerConsultingList", customerConsultingList);
	
	return mav;
	}

	//고객 정보 검색
	@ResponseBody
	@RequestMapping("/searchConsulting")
	public List<ConsultingVO> searchConsulting(HttpServletRequest request){
		
		String mainCategory = request.getParameter("mainCategory");
		String middleCategory = request.getParameter("middleCategory");
		String searchWord= request.getParameter("searchWord");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		System.out.println(mainCategory);
		System.out.println(middleCategory);
		System.out.println(searchWord);
		System.out.println(startDate);
		System.out.println(endDate);
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("mainCategory", mainCategory);
		searchMap.put("middleCategory", middleCategory );
		searchMap.put("searchWord", searchWord);
		searchMap.put("startDate", startDate);
		searchMap.put("endDate", endDate);
		
		List<ConsultingVO> searchInfoList = consultingService.selectSearchInfoList(searchMap);
		
		return searchInfoList;
	}

	
	
	//상담기록 번호로 상세조회 
	@RequestMapping("/consulting/admin/{no}") //pstmt가 아닌 주소값 그대로 가져오기  {써주고싶은이름} 가변적일때 {}로묶기
	public ModelAndView detail(@PathVariable("no")int consultingNo) { //주소값 이름 no를 int boardNo로 설정 밑에 메소드 안에서 쓸거다!
		System.out.println(consultingNo);
	ConsultingVO consulting = consultingService.selectByConsultingNo(consultingNo);
	System.out.println(consulting);		
	ModelAndView mav = new ModelAndView("consulting/consultingReport");
	
	mav.addObject("consulting",consulting);
	
	return mav;
 }
	
	
	//고객별 상담기록 id로 상세조회 
	  @RequestMapping("/consultingList/{id}") //pstmt가 아닌 주소값 그대로 가져오기 {써주고싶은이름}
	  public ModelAndView consultingList(@PathVariable("id")String
	  paId) { //주소값 이름 no를 int boardNo로 설정 밑에 메소드 안에서 쓸거다!
	  
	  List<ConsultingVO> consultingList = consultingService.selectById(paId);
	  
	  ModelAndView mav = new ModelAndView("consulting/consultingList");
	  mav.addObject("consultingList", consultingList); //공유영역에 올림
	  
	  return mav; 
	  }
	  
	
	 //상담등록 화면 보여주기 
	  @RequestMapping("/consultingEnrollment")
	  public String enrollment() {
			/* ConsultingVO consulting = new ConsultingVO(); */
		  return "consulting/consultingEnrollment";
	  }
	  
	  
	 //캘린더 화면 보여주기 
	  @RequestMapping("/calendar")
	  public String calendar() {
			
		  return "consulting/calendar";
	  }
	  
	  
		
	//상담노트 작성 서비스1
	@GetMapping("/consultingNote")
	//public void writeForm(Model model) { //void면 mapping 내 uri값으로 포워드함
	public String writeForm(Model model, HttpSession session) { 
	 
	 ConsultingVO consulting = new ConsultingVO();
	 AdminVO adminLoginVO  = (AdminVO)session.getAttribute("adminLoginVO");
	 if (adminLoginVO != null)
	     consulting.setEmpno(adminLoginVO.getEmpno()); //자동으로 글쓴이 보여지게 등록 

	 model.addAttribute("consultingVO", consulting);
	 System.out.println("컨설팅 컨트롤러:"+ consulting);
	 return "/consulting/consultingNote";  //viewer에 의해서 /jsp로  포워드 보내줌 
	}

	
	//상담노트 작성 서비스2
	@PostMapping("/consultingNote")
	public String write(@Valid ConsultingVO consultingVO, BindingResult result, HttpSession session) {
	 //유효성 검사, boardVO boardVo 에 대한 validationcheck
	AdminVO adminLoginVO  = (AdminVO)session.getAttribute("adminLoginVO");
	consultingVO.setAdminName(adminLoginVO.getAdmin_name());
	 System.out.println("찍어보자: "+consultingVO);
	// System.out.println("result: " + result.hasErrors());
	 if (result.hasErrors()) {
	    System.out.println("오류발생...");
	    
	    return "/consulting/consultingNote";
	 }
	 
	 consultingService.insert(consultingVO);//바꿈 
	 return "redirect:/consultingList/admin";
	}

}
