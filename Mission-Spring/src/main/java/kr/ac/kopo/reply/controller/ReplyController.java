package kr.ac.kopo.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.reply.service.ReplyService;
import kr.ac.kopo.reply.vo.ReplyVO;

@CrossOrigin //크로스도메인 정책 위배되도 들어올 수 있게 하는 어노테이션 
/*@RequestMapping("/reply")*/
@RestController //컨테이너가 라이프사이클을 관리하는 객체로 들어감, 모든 메소드들은 곧장 포워드나 센드리다렉트하지 않고 곧장 정보들을 응답해줄거야 라는 의미 
//@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	//@ResponseBody //포워드시키는게 아니라 이 자체값을 리턴하겠어~근데 이건 메소드 하나하나에 다 붙여야해서 이거 대신에 RESTCONTROLLER씀 
	@PostMapping("/reply") //WEB-INF/jsp/reply.jsp 찾는  //insert
	public void addReply(ReplyVO replyVO) {
		replyService.insertReply(replyVO); //서비스에게  새로운 댓글 추가시켜줘 호출

	}
	
	
	@GetMapping("/reply/{inquiryNo}") //조회
	public List<ReplyVO> getList(@PathVariable("inquiryNo") int inquiryNo) {
		
		List<ReplyVO> replyList = replyService.selectAllByInquiryNo(inquiryNo);
		
		return replyList;
	}
	
	//@RequestMapping(value="/reply/{replyNo}", method=RequestMethod.DELETE)
	@DeleteMapping("/reply/{replyNo}") //삭제
	public void delete(@PathVariable("replyNo") int replyNo) {
		//System.out.println("boardNo :" + boardNo);
		//System.out.println("삭제할 댓글번호:" + replyNo);
		System.out.println("/reply/{replyNo} 얘가됨?");
		replyService.removeReply(replyNo); //번호 넘겨주기 
	}
	
	@DeleteMapping("/reply/{replyNo}/{inquiryNo}")
	public void deleteReply(@PathVariable("replyNo") int replyNo
			,@PathVariable("inquiryNo") int inquiryNo) {
		//System.out.println(replyNo +":" + boardNo);
		
		//두개가 날라가야하니까 vo에 묶음 
		ReplyVO replyVO = new ReplyVO();
		replyVO.setNo(replyNo);
		replyVO.setInquiryNo(inquiryNo);
		System.out.println("컨트롤러에서 보드넘버: " +inquiryNo);
		
		System.out.println("/reply/{replyNo}/{inquiryNo} 그럼 얘가 되나?");
		
		replyService.removeReply(replyVO);
	}
	
}





