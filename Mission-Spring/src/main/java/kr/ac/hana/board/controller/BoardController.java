package kr.ac.hana.board.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		
		
		//전체 문의 조회 with 페이징(관리자단)
		@RequestMapping(value = { "/inquiry/{blockNo}/{pageNo}"})
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
			int totalInquiryCnt = boardService.cntInquiry();

			//// 전체 페이지 수 구하는 코드
			int totalPageCnt = totalInquiryCnt / boardCntPerPage;
			if (totalInquiryCnt % boardCntPerPage > 0) {
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
			List<BoardVO> inquiryList = boardService.selectPageInquiry(pageNo, boardCntPerPage); // 이거 dao 설명 필요 (rownum)

			request.setAttribute("blockStartPageNo", blockStartPageNo);
			request.setAttribute("blockEndPageNo", blockEndPageNo);
			request.setAttribute("blockNo", blockNo);
			request.setAttribute("totalBlockCnt", totalBlockCnt);
			request.setAttribute("pageNo", pageNo);

			request.setAttribute("inquiryList", inquiryList);

			return "board/inquiry";
		}

		//손님 정보 검색 
		
		// 문의 검색(관리자 ui)
		@ResponseBody
		@RequestMapping("/searchInquiry")
		public List<BoardVO> searchInquiry(HttpServletRequest request) {

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

			List<BoardVO> searchInquiry = boardService.selectSearchInquiry(searchMap);

			return searchInquiry;
		}	
		
   }











