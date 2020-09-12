package kr.ac.hana.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.consulting.service.ConsultingService;
import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.service.MemberService;
import kr.ac.hana.member.vo.MemberVO;


@SessionAttributes({"loginVO"}) //MAV객체에 등록되는 이름이 로그인 객체인경우에는  세션에 등록시켜 
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// @RequestMapping(value = "/login", method = RequestMethod.GET)
	@GetMapping("/login") // 로그인 uri들어왔을 때 최초 포워드
	public String loginForm() {

		return "/login/login";
	}

	// @RequestMapping(value="/login", method = RequestMethod.POST)
	@PostMapping("/login") // 로그인 폼태그에서 submit눌렀을 때 여기로 가라
	public ModelAndView login(MemberVO member, HttpSession session , Model model){ /* @RequestParam("id")String id, @RequestParam("password")String password */
		// session 객체 달라고 하면 파라미터로 날라감
		
		MemberVO loginVO = memberService.login(member);
		ModelAndView mav = new ModelAndView();
		
		// 로그인 실패
		if (loginVO == null) { 
			mav.setViewName("redirect:/login");
			
		}else {
			// 로그인 성공
		String dest = (String)session.getAttribute("dest");
		
		
		
		//바로 로그인을 한 상황 
		if(dest == null) {//프리핸들 거친것  로그인을 한 뒤에 누른것 
			
			mav.setViewName("redirect:/");//매인페이지로 			
		
		//상세게시물을 클릭하고 로그인한 경우 	
		}else { //프리핸들 거치지 않은것 -메인페이지로   dest /board/2
			mav.setViewName("redirect:/" + dest); 
			session.removeAttribute("dest");//이제 이 정보가 필요 없기 때문에  dest객체 지우기  로그인 해서 바로 볼 수 있으니까
		   }		
			mav.addObject("loginVO", loginVO);	
			//request영역에 등록해놓고 클래스 위에 @SESSIONATTRIBUTE해놓으면 세션에 등록됨. 
			//또는 바로 SESSION객체에 등록가능?  SESSION.SETATTRIBUTE("LOGINVO", LOGINVO) 됨. 
		}			
		return mav; 
	}


	@RequestMapping("/logout")
	public String logout(SessionStatus status) { //세션에 등록된애가 있는지 
		
		System.out.println(status.isComplete());
		status.setComplete(); //다지워  fals였던 값이 true로 바뀜  이걸로 지운다  세션종결명령
		System.out.println(status.isComplete());
	
		return "redirect:/";
	}
	
	@RequestMapping("/enrollmentForm") //getmapping과 같다.
	public String enrollmentForm() {
		
		 return "member/enrollmentForm"; //어떤 jsp랑 연동시킬건지 
	  }
	
	@PostMapping("/enrollmentForm")
	public String enrollmentForm(@Valid MemberVO memberVO, BindingResult result) {
		 //유효성 검사,memberVO 에 대한 validationcheck
		 System.out.println(memberVO);
		 System.out.println("result: " + result.hasErrors());
		 if (result.hasErrors()) {
		    System.out.println("오류발생...");
		    
		    return "member/enrollmentForm"; 		    
		 }
		 memberService.insertMember(memberVO);//바꿈 	
		 
			/* return "redirect:/login"; */
		 return "redirect:/";
		}
	

	//손님별 정보조회 
	@RequestMapping("/myPage")
	public ModelAndView customerInform(HttpSession session) {
	
	MemberVO loginVO =(MemberVO)session.getAttribute("loginVO");
	
	List<MemberVO> customerInform = memberService.selectCustomerInform(loginVO.getId());	
	
	ModelAndView mav = new ModelAndView("member/myPage");
	
	mav.addObject("customerInform",customerInform);
	
	return mav;
	
	}
	
	
	//param id로 손님별 정보조회 
	@RequestMapping("/myPage/{id}")
	public ModelAndView customerInform(@PathVariable("id")String cuId) {
	
	
	List<MemberVO> customerInform = memberService.selectCustomerInform(cuId);	
	
	ModelAndView mav = new ModelAndView("member/myPage");
	
	mav.addObject("customerInform",customerInform);
	
	return mav;
	
	}
	
	
	  //상담노트로 값 넘겨주기위한 mypage단 url
	
	  @RequestMapping("/consultingNote/{id}")
	  
	  public ModelAndView write(@PathVariable("id")String cuId) {
	  
	  List<MemberVO> customerInform = memberService.selectCustomerInform(cuId);
	  
	  ModelAndView mav = new ModelAndView("consulting/consultingNote");
	  
	  mav.addObject("customerInform",customerInform);
	  System.out.println("멤버컨트롤러:"+customerInform); return mav;
	  
	  }
	 

	
	//전체 손님 조회 (관리자단)
	@RequestMapping("/customerInform")
	public ModelAndView allInformList() {
		
	List<MemberVO> allInformList = memberService.selectAllInform();	
		
	ModelAndView mav = new ModelAndView("member/customerInform");
	mav.addObject("allInformList", allInformList);
	
	return mav;
	
	}
	
	
	//전체 손님 조회 with 페이징(관리자단)
	@RequestMapping(value = { "/customerInform/{blockNo}/{pageNo}"})
	public String consultingList(@PathVariable("blockNo")int blockNo, @PathVariable("pageNo")int pageNo,  HttpServletRequest request) {

		System.out.println("블럭넘"+blockNo);
		System.out.println("페이지넘"+pageNo);

		// 임의 설정이 필요한 부분
		int boardCntPerPage = 10;
		int pageCntPerBlock = 3;

		// 블록의 시작 페이지와 끝 페이지 (등차수열 적용)
		int blockStartPageNo = 1 + pageCntPerBlock * (blockNo - 1);
		int blockEndPageNo = pageCntPerBlock * blockNo;

		//// 전체 게시글 수 구하는 코드(dao로 db에 접근해서 cnt 얻어옴) 
		int totalBoardCnt = memberService.cntMember();

		//// 전체 페이지 수 구하는 코드
		int totalPageCnt = totalBoardCnt / boardCntPerPage;
		if (totalBoardCnt % boardCntPerPage > 0) {
			totalPageCnt++; // 나머지가 있으면 페이지가 다 돌고 남은 게시글이 있는 것이기에 전체 페이지 수에 +1 해줌
		}

		//// 만약 위 연산으로 계산한 해당 블록 끝 번호가 전체 페이지 번호 수 보다 크다면 블록 끝 번호는 전체 페이지 번호 수 (블록 끝 번호가
		//// 계속 전체 페이지 번호수보다 작다가 마지막에만 커지거나 같아짐)
		if (blockEndPageNo > totalPageCnt) {
			blockEndPageNo = totalPageCnt;
		}

		// 전체 블록 개수 구하기 (다음 버튼 기능을 구현해주기 위해)
		int totalBlockCnt = totalPageCnt / pageCntPerBlock;
		if (totalPageCnt % pageCntPerBlock > 0) {
			totalBlockCnt++;

		}

		// 해당 페이지에서 필요한만큼의 게시글 데이터 얻어오기
		List<MemberVO> allInformList = memberService.selectPageMember(pageNo, boardCntPerPage); // 이거 dao 설명 필요 (rownum)

		request.setAttribute("blockStartPageNo", blockStartPageNo);
		request.setAttribute("blockEndPageNo", blockEndPageNo);
		request.setAttribute("blockNo", blockNo);
		request.setAttribute("totalBlockCnt", totalBlockCnt);
		request.setAttribute("pageNo", pageNo);

		request.setAttribute("allInformList", allInformList);

		return "member/customerInform";
	}

	//손님 정보 검색 
	
	// 고객 정보 검색(관리자 ui)
	@ResponseBody
	@RequestMapping("/searchMember")
	public List<MemberVO> searchMember(HttpServletRequest request) {

		String gender = request.getParameter("gender");
		String digitalEdu = request.getParameter("digitalEdu");
		String interest = request.getParameter("interest");
		String age = request.getParameter("age");
		String job = request.getParameter("job");
		String customerType = request.getParameter("customerType");
		String searchWord = request.getParameter("searchWord");

		System.out.println(gender);
		System.out.println(digitalEdu);
		System.out.println(interest);
		System.out.println(age);
		System.out.println(job);
		System.out.println(customerType);
		System.out.println(searchWord);

		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("gender", gender);
		searchMap.put("digitalEdu", digitalEdu);
		searchMap.put("interest", interest);
		searchMap.put("age", age);
		searchMap.put("job", job);
		searchMap.put("customerType", customerType);
		searchMap.put("searchWord", searchWord);

		List<MemberVO> searchMember = memberService.selectSearchMember(searchMap);

		return searchMember;
	}
	
	//일정관리 스케줄
	
	@RequestMapping("/schedule") //getmapping과 같다.
	public String schedule() {
		
		 return "member/schedule"; //어떤 jsp랑 연동시킬건지 
	  }

	
 }

