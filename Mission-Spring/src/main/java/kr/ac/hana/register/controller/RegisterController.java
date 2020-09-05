package kr.ac.hana.register.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hana.admin.vo.AdminVO;
import kr.ac.hana.board.service.BoardService;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.vo.MemberVO;
import kr.ac.hana.register.service.RegisterService;
import kr.ac.hana.register.vo.RegisterVO;

@Controller 
public class RegisterController {

	@Autowired
 	private RegisterService registerService;
	
	//고객별 추가상담리스트 전체 조회
	@RequestMapping("/addConsulting") //이 메소드를 실행해라
	public ModelAndView userAddConsultingList(HttpSession session){
			
	   MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
	  
	   List<RegisterVO> userAddConsultingList = registerService.selectAllRegisterById(loginVO.getId());
			
	   ModelAndView mav =new ModelAndView("consulting/addConsulting"); //spring-mvc.xml에 view-resolvers태그에 정해둠 
	   mav.addObject("userAddConsultingList", userAddConsultingList);
			
	  return mav;
	}
	
	//관리자별 추가상담리스트 조회 
	@RequestMapping("/addConsulting/admin")
	public ModelAndView adminAddConsultingList(HttpSession session){
	
	AdminVO adminLoginVO = (AdminVO)session.getAttribute("adminLoginVO");
	System.out.println(adminLoginVO.getEmpno());
	
	List<RegisterVO>  adminAddConsultingList = registerService.selectAllRegisterByEmpno(adminLoginVO.getEmpno());
	
	ModelAndView mav =new ModelAndView("consulting/addConsulting"); //spring-mvc.xml에 view-resolvers태그에 정해둠 
	mav.addObject("adminAddConsultingList",  adminAddConsultingList);
	
	return mav;
	}
	
	//추가상담 등록 
	@RequestMapping("/register")
	public String registerForm(Model model, HttpSession session) {
		
		
	RegisterVO register = new RegisterVO();
	
	RegisterVO registerVO = (RegisterVO)session.getAttribute("registerVO");
	model.addAttribute("registerVO", register);
	
	return "/register";
	}
	
	@PostMapping("/register")
	public String register(@Valid RegisterVO registerVO,BindingResult result ) {
		System.out.println(registerVO);
		if (result.hasErrors()) {
			System.out.println("오류 발생...");
			
			return "/register";
		}
		
		registerService.insert(registerVO);
		return "redirect:/addConsulting";
	}
	
}

