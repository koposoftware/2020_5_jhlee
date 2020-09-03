package kr.ac.hana.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hana.admin.service.AdminService;
import kr.ac.hana.admin.vo.AdminVO;


@SessionAttributes({"adminLoginVO"}) //MAV객체에 등록되는 이름이 로그인 객체인경우에는  세션에 등록시켜 
@Controller
public class AdminController {

		@Autowired
		private AdminService adminService;

		@GetMapping("/adminLogin") // 로그인 uri들어왔을 때 최초 포워드
		public String loginForm() {

			return "/login/adminLogin";
		}

		@PostMapping("/adminLogin") // 로그인 폼태그에서 submit눌렀을 때 여기로 가라
		public ModelAndView login(AdminVO admin, HttpSession session) { /* @RequestParam("id")String id, @RequestParam("password")String password */
			// session 객체 달라고 하면 파라미터로 날라감
			
			AdminVO adminLoginVO = adminService.login(admin);
			ModelAndView mav = new ModelAndView();
			
			// 로그인 실패
			if (adminLoginVO == null) {
				mav.setViewName("redirect:/adminLogin");
				
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
				mav.addObject("adminLoginVO", adminLoginVO);	
				//request영역에 등록해놓고 클래스 위에 @SESSIONATTRIBUTE해놓으면 세션에 등록됨. 
				//또는 바로 SESSION객체에 등록가능?  SESSION.SETATTRIBUTE("LOGINVO", LOGINVO) 됨. 
			}			
			return mav; 
		}
		
		@GetMapping("/adminLogout")
		public String logout(SessionStatus status) {
			status.setComplete();
			return "redirect:/";
		}
		 
}
