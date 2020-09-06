package kr.ac.hana.board.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hana.board.service.BoardService;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.member.vo.MemberVO;
import kr.ac.hana.reply.vo.ReplyVO;

@Controller 
public class BoardController {

		@Autowired
	 	private BoardService boardService;
		
		/*
		 * @RequestMapping("/") public String home() { return "index2"; }
		 */
		
		@RequestMapping("/inquiry") //이 메소드를 실행해라
		public ModelAndView list() { //모델앤뷰가 포워드+공융영역에 객체 등록시킴 httpservletRequest request영역에 올림
			
			List<BoardVO> inquiryList = boardService.selectAllBoard();
			
			ModelAndView mav =new ModelAndView("board/inquiry"); //spring-mvc.xml에 view-resolvers태그에 정해둠 
			mav.addObject("inquiryList", inquiryList);
			
			return mav;
		}
		
		
		
		//http://localhost:9999/Mission-Spring/board/12
		@RequestMapping("/inquiry/{no}") //pstmt가 아닌 주소값 그대로 가져오기  {써주고싶은이름} 가변적일때 {}로묶기
		public ModelAndView detail(@PathVariable("no")int inquiryNo) { //주소값 이름 no를 int boardNo로 설정 밑에 메소드 안에서 쓸거다!
		
		//int boardNo = Integer.parseInt(request.getParameter("no"));
		
		BoardVO inquiry = boardService.selectByNo(inquiryNo);
				
		ModelAndView mav = new ModelAndView("board/inquiryDetail");
		mav.addObject("inquiry",inquiry);
		return mav;
			
	}
		

		@GetMapping("/board/inquiryWrite")
		//public void writeForm(Model model) { //void면 mapping 내 uri값으로 포워드함
		public String writeForm(Model model, HttpSession session) { 
		 
		 BoardVO inquiry = new BoardVO();
		 MemberVO loginVO  = (MemberVO)session.getAttribute("loginVO");
		 if (loginVO != null)
		     inquiry.setWriter(loginVO.getId()); //자동으로 글쓴이 보여지게 등록 
		
		 model.addAttribute("boardVO", inquiry);
		 return "/board/inquiryWrite";  //viewer에 의해서 /jsp로  포워드 보내줌 
		}
		
		@PostMapping("/board/inquiryWrite")
		public String write(@Valid BoardVO inquiryVO, BindingResult result) {
		 //유효성 검사, boardVO boardVo 에 대한 validationcheck
		 System.out.println(inquiryVO);
		// System.out.println("result: " + result.hasErrors());
		 if (result.hasErrors()) {
		    System.out.println("오류발생...");
		    
		    return "/board/inquiryWrite";
		    
		 }
		 
		 boardService.insert(inquiryVO);//바꿈 
		 return "redirect:/inquiry";
		}
   }











