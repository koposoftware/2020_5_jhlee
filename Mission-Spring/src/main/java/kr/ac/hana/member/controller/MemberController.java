package kr.ac.hana.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
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

import kr.ac.hana.SMSUtil.Coolsms;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.consulting.service.ConsultingService;
import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.service.MemberService;
import kr.ac.hana.member.vo.MemberVO;

@SessionAttributes({ "loginVO" }) // MAV객체에 등록되는 이름이 로그인 객체인경우에는 세션에 등록시켜
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private ConsultingService consultingService;

	// @RequestMapping(value = "/login", method = RequestMethod.GET)
	@GetMapping("/login") // 로그인 uri들어왔을 때 최초 포워드
	public String loginForm() {

		return "/login/login";
	}

	// @RequestMapping(value="/login", method = RequestMethod.POST)
	@PostMapping("/login") // 로그인 폼태그에서 submit눌렀을 때 여기로 가라
	public ModelAndView login(MemberVO member, HttpSession session,
			Model model) { /* @RequestParam("id")String id, @RequestParam("password")String password */
		// session 객체 달라고 하면 파라미터로 날라감

		MemberVO loginVO = memberService.login(member);
		ModelAndView mav = new ModelAndView();

		// 로그인 실패
		if (loginVO == null) {
			mav.setViewName("redirect:/login");

		} else {
			// 로그인 성공
			String dest = (String) session.getAttribute("dest");
			System.out.println("Dest ? " + dest);

			// 바로 로그인을 한 상황
			if (dest == null) {// 프리핸들 거친것 로그인을 한 뒤에 누른것

				mav.setViewName("redirect:/");// 매인페이지로

				// 상세게시물을 클릭하고 로그인한 경우
			} else { // 프리핸들 거치지 않은것 -메인페이지로 dest /board/2
				mav.setViewName("redirect:/" + dest);
				session.removeAttribute("dest"); // 이제 이 정보가 필요 없기 때문에 dest객체 지우기 로그인 해서 바로 볼 수 있으니까
			}
			mav.addObject("loginVO", loginVO);
			// request영역에 등록해놓고 클래스 위에 @SESSIONATTRIBUTE해놓으면 세션에 등록됨.
			// 또는 바로 SESSION객체에 등록가능? SESSION.SETATTRIBUTE("LOGINVO", LOGINVO) 됨.
		}
		return mav;
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus status) { // 세션에 등록된애가 있는지

		System.out.println(status.isComplete());
		status.setComplete(); // 다지워 fals였던 값이 true로 바뀜 이걸로 지운다 세션종결명령
		System.out.println(status.isComplete());

		return "redirect:/";
	}

	@RequestMapping("/enrollmentForm") // getmapping과 같다.
	public String enrollmentForm() {

		return "member/enrollmentForm"; // 어떤 jsp랑 연동시킬건지
	}

	@PostMapping("/enrollmentForm")
	public String enrollmentForm(@Valid MemberVO memberVO, BindingResult result) {
		// 유효성 검사,memberVO 에 대한 validationcheck
		System.out.println(memberVO);
		System.out.println(memberVO.getPost());
		memberVO.setAddress("(" + memberVO.getPost() + ")" + memberVO.getAddress());
		System.out.println(memberVO.getAddress());
		System.out.println("result: " + result.hasErrors());
		if (result.hasErrors()) {
			System.out.println("오류발생...");

			return "member/enrollmentForm";
		}
		memberService.insertMember(memberVO);// 바꿈

		/* return "redirect:/login"; */
		return "redirect:/";
	}

	// 손님별 정보조회
	@RequestMapping("/myPage")
	public ModelAndView customerInform(HttpSession session) {

		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
	
		List<MemberVO> customerInform = memberService.selectCustomerInform(loginVO.getId());
           
		ModelAndView mav = new ModelAndView("member/myPage");

		mav.addObject("customerInform", customerInform);
		mav.addObject("consulting", consultingService.selectMyChart(loginVO.getId())); 
		return mav;

	}
	
	
	// param id로 손님별 정보조회
	@RequestMapping("/myPage/{id}")
	public ModelAndView customerInform(@PathVariable("id") String cuId) {

		List<MemberVO> customerInform = memberService.selectCustomerInform(cuId);

		ModelAndView mav = new ModelAndView("member/myPage");

		mav.addObject("customerInform", customerInform);
		mav.addObject("consulting", consultingService.selectMyChart(cuId)); 
		return mav;

	}

	// 상담노트로 값 넘겨주기위한 mypage단 url

	@RequestMapping("/consultingNote/{id}")

	public ModelAndView write(@PathVariable("id") String cuId) {

		List<MemberVO> customerInform = memberService.selectCustomerInform(cuId);

		ModelAndView mav = new ModelAndView("consulting/consultingNote");

		mav.addObject("customerInform", customerInform);
		System.out.println("멤버컨트롤러:" + customerInform);
		return mav;

	}

	// 전체 손님 조회 (관리자단)
	@RequestMapping("/customerInform")
	public ModelAndView allInformList() {

		List<MemberVO> allInformList = memberService.selectAllInform();

		ModelAndView mav = new ModelAndView("member/customerInform");
		mav.addObject("allInformList", allInformList);

		return mav;

	}

	////////////////////////////////////////////////////////
	//////////// 지니 할것 ///
	////////////////////////////////////////////////////////

	// 전체 손님 조회 with 페이징(관리자단)
	@RequestMapping(value = { "/customerInform/{blockNo}/{pageNo}" })
	public String consultingList(@PathVariable("blockNo") Integer blockNo, @PathVariable("pageNo") Integer pageNo,
			HttpServletRequest request) {

		System.out.println("블럭넘" + blockNo);
		System.out.println("페이지넘" + pageNo);

		// 임의 설정이 필요한 부분
		Integer boardCntPerPage = 10;
		Integer pageCntPerBlock = 3;

		// 블록의 시작 페이지와 끝 페이지 (등차수열 적용)
		Integer blockStartPageNo = 1 + pageCntPerBlock * (blockNo - 1);
		Integer blockEndPageNo = pageCntPerBlock * blockNo;

		//// 전체 게시글 수 구하는 코드(dao로 db에 접근해서 cnt 얻어옴)
		Integer totalBoardCnt = memberService.cntMember();

		//// 전체 페이지 수 구하는 코드
		Integer totalPageCnt = totalBoardCnt / boardCntPerPage;
		if (totalBoardCnt % boardCntPerPage > 0) {
			totalPageCnt++; // 나머지가 있으면 페이지가 다 돌고 남은 게시글이 있는 것이기에 전체 페이지 수에 +1 해줌
		}

		//// 만약 위 연산으로 계산한 해당 블록 끝 번호가 전체 페이지 번호 수 보다 크다면 블록 끝 번호는 전체 페이지 번호 수 (블록 끝 번호가
		//// 계속 전체 페이지 번호수보다 작다가 마지막에만 커지거나 같아짐)
		if (blockEndPageNo > totalPageCnt) {
			blockEndPageNo = totalPageCnt;
		}

		// 전체 블록 개수 구하기 (다음 버튼 기능을 구현해주기 위해)
		Integer totalBlockCnt = totalPageCnt / pageCntPerBlock;
		if (totalPageCnt % pageCntPerBlock > 0) {
			totalBlockCnt++;

		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("boardCntPerPage", boardCntPerPage);

		// 해당 페이지에서 필요한만큼의 게시글 데이터 얻어오기
		List<MemberVO> allInformList = memberService.selectPageMember(map); // 이거 dao 설명 필요 (rownum)

		request.setAttribute("blockStartPageNo", blockStartPageNo);
		request.setAttribute("blockEndPageNo", blockEndPageNo);
		request.setAttribute("blockNo", blockNo);
		request.setAttribute("totalBlockCnt", totalBlockCnt);
		request.setAttribute("pageNo", pageNo);

		request.setAttribute("allInformList", allInformList);

		return "member/customerInform";
	}

	// 전체 손님 조회 with 페이징 with 검색(관리자단)
	@RequestMapping(value = { "/customerInform/{blockNo}/{pageNo}/{memberSearch}" })
	public String consultingListSearch(@PathVariable("blockNo") Integer blockNo, @PathVariable("pageNo") Integer pageNo,
			@PathVariable("memberSearch") String memberSearch, HttpServletRequest request) {

		System.out.println("멤버 넘어오나요? : " + memberSearch);
		System.out.println("블럭넘" + blockNo);
		System.out.println("페이지넘" + pageNo);

		String[] memberSearchDetail = memberSearch.split("&", -1);

		String gender = memberSearchDetail[0];
		String digitalEdu = memberSearchDetail[1];
		String interest = memberSearchDetail[2];
		String age = memberSearchDetail[3];
		String job = memberSearchDetail[4];
		String customerType = memberSearchDetail[5];
		String searchWord = memberSearchDetail[6];

		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("gender", gender);
		searchMap.put("digitalEdu", digitalEdu);
		searchMap.put("interest", interest);
		searchMap.put("age", age);
		searchMap.put("job", job);
		searchMap.put("customerType", customerType);
		searchMap.put("searchWord", searchWord);
		List<MemberVO> memberList = memberService.selectSearchMember(searchMap);

		// 임의 설정이 필요한 부분
		Integer boardCntPerPage = 10;
		Integer pageCntPerBlock = 3;

		// 블록의 시작 페이지와 끝 페이지 (등차수열 적용)
		Integer blockStartPageNo = 1 + pageCntPerBlock * (blockNo - 1);
		Integer blockEndPageNo = pageCntPerBlock * blockNo;

		//// 전체 게시글 수 구하는 코드(dao로 db에 접근해서 cnt 얻어옴)
		// int totalBoardCnt = memberService.cntMember();
		Integer totalBoardCnt = memberList.size();

		//// 전체 페이지 수 구하는 코드
		Integer totalPageCnt = totalBoardCnt / boardCntPerPage;
		if (totalBoardCnt % boardCntPerPage > 0) {
			totalPageCnt++; // 나머지가 있으면 페이지가 다 돌고 남은 게시글이 있는 것이기에 전체 페이지 수에 +1 해줌
		}

		//// 만약 위 연산으로 계산한 해당 블록 끝 번호가 전체 페이지 번호 수 보다 크다면 블록 끝 번호는 전체 페이지 번호 수 (블록 끝 번호가
		//// 계속 전체 페이지 번호수보다 작다가 마지막에만 커지거나 같아짐)
		if (blockEndPageNo > totalPageCnt) {
			blockEndPageNo = totalPageCnt;
		}

		// 전체 블록 개수 구하기 (다음 버튼 기능을 구현해주기 위해)
		Integer totalBlockCnt = totalPageCnt / pageCntPerBlock;
		if (totalPageCnt % pageCntPerBlock > 0) {
			totalBlockCnt++;

		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("boardCntPerPage", boardCntPerPage);

		map.put("gender", gender);
		map.put("digitalEdu", digitalEdu);
		map.put("interest", interest);
		map.put("age", age);
		map.put("job", job);
		map.put("customerType", customerType);
		map.put("searchWord", searchWord);

		// 해당 페이지에서 필요한만큼의 게시글 데이터 얻어오기
		List<MemberVO> allInformList = memberService.selectPageMember(map); // 이거 dao 설명 필요 (rownum)

		request.setAttribute("blockStartPageNo", blockStartPageNo);
		request.setAttribute("blockEndPageNo", blockEndPageNo);
		request.setAttribute("blockNo", blockNo);
		request.setAttribute("totalBlockCnt", totalBlockCnt);
		request.setAttribute("pageNo", pageNo);

		request.setAttribute("allInformList", allInformList);

		return "member/customerInform";
	}

	// 손님 정보 검색(관리자 ui)
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

	// 실적관리 화면 보여주기
	@RequestMapping("/management")
	public ModelAndView management() {

		ModelAndView mav = new ModelAndView("member/management");
		mav.addObject("chart", consultingService.selectMainChart());
		mav.addObject("chart2", consultingService.selectMainChart2());
         
		return mav;
	}
	
	
	//문자인증하기 
	@ResponseBody
	   @PostMapping("/submitAuthNo")
	   public boolean submitAuthNo(HttpServletRequest request, HttpSession session) {
	      
	      System.out.println("인증번호 입력 거치기");
	      
	      String inputAuthNo = request.getParameter("inputAuthNo");
	      String authNo = (String)session.getAttribute("authNo");
	      
	      System.out.println("inputAuthNo " + inputAuthNo);
	      System.out.println("authNo " + authNo );
	      
	      boolean authResult = false;
	      
	      if (inputAuthNo.equals(authNo)) {
	         authResult = true;
	         session.removeAttribute("authNo");
	      }
	      return authResult;
	   }
	   
	   @ResponseBody
	   @PostMapping("/getAuthNo")
	   public void getAuthNo(HttpServletRequest request, HttpSession session) {

	      Random rand = new Random();
	      String authNo = ""; // 난수가 저장될 변수

	      // n자리 인증번호
	      int len = 6;
	      // 중복허용(1) 불허(2)
	      int dupCd = 1;
	      for (int i = 0; i < len; i++) {

	         // 0~9 까지 난수 생성
	         String ran = Integer.toString(rand.nextInt(10));

	         // 중복을 허용하지 않을시 중복된 값이 있는지 검사한다
	         if (dupCd == 1) {
	            // 중복 허용시 numStr에 append
	            authNo += ran;
	         } else if (dupCd == 2) {
	            // 중복을 허용하지 않을시 중복된 값이 있는지 검사한다
	            if (!authNo.contains(ran)) {
	               // 중복된 값이 없으면 numStr에 append
	               authNo += ran;
	            } else {
	               // 생성된 난수가 중복되면 루틴을 다시 실행한다
	               i -= 1;
	            }
	         }
	      }

	      String api_key = "NCSD3ETDGM25G7Q5";
	      String api_secret = "X5G4CT9UPJVKE2UDTJDENLTSUVF5CGVP";
	      String phoneNo = request.getParameter("phoneNo");
	      session.setAttribute("authNo", authNo);
	      String sendMsg = "[ONEHANA] 본인확인 인증번호는 [" + authNo + "] 입니다.";

	      Coolsms coolsms = new Coolsms(api_key, api_secret);

	      HashMap<String, String> set = new HashMap<String, String>();
	      set.put("to", phoneNo); // 수신번호

	      set.put("from", "01099342187"); // 발신번호
	      set.put("text", sendMsg); // 문자내용
	      set.put("type", "sms"); // 문자 타입

	      System.out.println(set);

	      JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	      if ((boolean) result.get("status") == true) {
	         // 메시지 보내기 성공 및 전송결과 출력
	         System.out.println("성공");
	         System.out.println(result.get("group_id")); // 그룹아이디
	         System.out.println(result.get("result_code")); // 결과코드
	         System.out.println(result.get("result_message")); // 결과 메시지
	         System.out.println(result.get("success_count")); // 메시지아이디
	         System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	      } else {
	         // 메시지 보내기 실패
	         System.out.println("실패");
	         System.out.println(result.get("code")); // REST API 에러코드
	         System.out.println(result.get("message")); // 에러메시지
	      }
	   }
 	
      //상담 예약일정 문자 보내기 (유저)
           

}
	
