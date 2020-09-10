package kr.ac.kopo.board.controller;



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

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.reply.vo.ReplyVO;

@Controller 
public class BoardController {

		@Autowired
	 	private BoardService boardService;
		
		/*
		 * @RequestMapping("/") public String home() { return "index2"; }
		 */
		
		@RequestMapping("/board") //이 메소드를 실행해라
		public ModelAndView list() { //모델앤뷰가 포워드+공융영역에 객체 등록시킴 httpservletRequest request영역에 올림
			
			List<BoardVO> boardList = boardService.selectAllBoard();
			
			ModelAndView mav =new ModelAndView("board/list"); //spring-mvc.xml에 view-resolvers태그에 정해둠 
			mav.addObject("boardList", boardList);
			
			return mav;
		}
		
		
//		@PostMapping("/board/{no}") //WEB-INF/jsp/reply.jsp 찾는 //insert public void
//		public void incrementViewCnt(@PathVariable("no")int inquiryNo) {
//			boardService.incrementViewCnt(inquiryNo);
//		
//		}
		
		
		//http://localhost:9999/Mission-Spring/board/12
		@RequestMapping("/board/{no}") //pstmt가 아닌 주소값 그대로 가져오기  {써주고싶은이름} 가변적일때 {}로묶기
		public ModelAndView detail(@PathVariable("no")int inquiryNo) { //주소값 이름 no를 int boardNo로 설정 밑에 메소드 안에서 쓸거다!
			
		//int boardNo = Integer.parseInt(request.getParameter("no"));
		
		BoardVO board = boardService.selectByNo(inquiryNo);
				
		ModelAndView mav = new ModelAndView("board/detail");
		mav.addObject("board",board);
		return mav;
		
		
	/*	//http://localhost:9999/Mission-Spring/board/detail?no=12
		@RequestMapping("/board/detail")
		public ModelAndView detail(@RequestParam("no") int boardNo) {
			
		//int boardNo = Integer.parseInt(request.getParameter("no"));
		System.out.println("boardNo:" +boardNo);
			
		ModelAndView mav = new ModelAndView("board/detail");
		return mav;*/
			
	}
		
		
	/*
	 * @GetMapping("/board/write") //리턴값이 void면 포워드 시킬 주소를 괄호안에 있는애로 인식한다. public
	 * Public String writeForm(Model model) { //모델객체는 공유영역에 등록시키려는 객체만 갖고 있음.
	 * 
	 * BoardVO board = new BoardVO(); model.addAttribute("boardVo", board); //Model
	 * 객체에다가 boardVO라는 이름으로 새로운 객체 등록 /모델 객체가 request공유영역에 올려줌. //객체를 하나 만듦 모델에다 올리면
	 * 디스패처 서블릿이 공유영역에 이 이름으로 객체를 등록 시킴
	 * 
	 * return "board/write"; //포워드가 된 board/write.jsp는 }
	 * 
	 * 
	 * @PostMapping("/board/write") public String write(@Valid BoardVO boardVO,
	 * BindingResult result) {
	 * 
	 * System.out.println(boardVO); //System.out.println("result:"+
	 * result.hasErrors());
	 * 
	 * if(result.hasErrors()) { System.out.println("오류발생..."); return "board/write";
	 * } return "redirect:/board";
	 * 
	 * } }
	 */

@GetMapping("/board/write")
//public void writeForm(Model model) { //void면 mapping 내 uri값으로 포워드함
public String writeForm(Model model, HttpSession session) { 
 
 BoardVO board = new BoardVO();
 MemberVO loginVO  = (MemberVO)session.getAttribute("loginVO");
 if (loginVO != null)
     board.setWriter(loginVO.getId()); //자동으로 글쓴이 보여지게 등록 

 model.addAttribute("boardVO", board);
 return "board/write";  //viewer에 의해서 /jsp로  포워드 보내줌 
}

@PostMapping("/board/write")
public String write(@Valid BoardVO boardVO, BindingResult result) {
 //유효성 검사, boardVO boardVo 에 대한 validationcheck
 System.out.println(boardVO);
// System.out.println("result: " + result.hasErrors());
 if (result.hasErrors()) {
    System.out.println("오류발생...");
    
    return "board/write";
    
 }
 
 boardService.insert(boardVO);//바꿈 
 return "redirect:/board";
}


}











