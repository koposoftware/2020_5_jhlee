package kr.ac.hana.register.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hana.board.service.BoardService;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.register.service.RegisterService;
import kr.ac.hana.register.vo.RegisterVO;

@Controller 
public class RegisterController {

	@Autowired
 	private RegisterService registerService;

	@RequestMapping("/addConsulting") //이 메소드를 실행해라
	public ModelAndView list() { //모델앤뷰가 포워드+공융영역에 객체 등록시킴 httpservletRequest request영역에 올림
		
		List<RegisterVO> consultingList = registerService.selectAllRegister();
		
		ModelAndView mav =new ModelAndView("consulting/addConsulting"); //spring-mvc.xml에 view-resolvers태그에 정해둠 
		mav.addObject("consultingList", consultingList);
		
		return mav;
	}
}
