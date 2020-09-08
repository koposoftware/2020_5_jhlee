package kr.ac.hana.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
		
		return mav; 
		
		}

	
	
	
	//전체 손님 조회 (관리자단)
	@RequestMapping("/customerInform")
	public ModelAndView allInformList() {
		
	List<MemberVO> allInformList = memberService.selectAllInform();	
		
	ModelAndView mav = new ModelAndView("member/customerInform");
	mav.addObject("allInformList", allInformList);
	
	return mav;
	
	}
 }

