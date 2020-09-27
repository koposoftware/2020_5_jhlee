package kr.ac.hana.register.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hana.admin.vo.AdminVO;
import kr.ac.hana.board.service.BoardService;
import kr.ac.hana.board.vo.BoardVO;
import kr.ac.hana.consulting.service.ConsultingService;
import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.vo.MemberVO;
import kr.ac.hana.register.service.RegisterService;
import kr.ac.hana.register.vo.RegisterVO;
import kr.ac.hana.reply.vo.ReplyVO;

@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;
	@Autowired
	private ConsultingService consultingService;

	// 고객별 추가상담리스트 전체 조회
	@RequestMapping("/addConsulting") // 이 메소드를 실행해라
	public ModelAndView userAddConsultingList(HttpSession session) {

		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		List<RegisterVO> userAddConsultingList = registerService.selectAllRegisterById(loginVO.getId());

		ModelAndView mav = new ModelAndView("consulting/addConsulting"); // spring-mvc.xml에 view-resolvers태그에 정해둠
		mav.addObject("userAddConsultingList", userAddConsultingList);

		return mav;
	}

	// 관리자별 추가상담리스트 조회
	@RequestMapping("/addConsulting/admin")
	public ModelAndView adminAddConsultingList(HttpSession session) {

		AdminVO adminLoginVO = (AdminVO) session.getAttribute("adminLoginVO");
		System.out.println(adminLoginVO.getEmpno());

		List<RegisterVO> adminAddConsultingList = registerService.selectAllRegisterByEmpno(adminLoginVO.getEmpno());

		ModelAndView mav = new ModelAndView("consulting/addConsulting"); // spring-mvc.xml에 view-resolvers태그에 정해둠
		mav.addObject("adminAddConsultingList", adminAddConsultingList);

		return mav;
	}

	// 추가상담 등록
	@RequestMapping("/register")
	public String registerForm(Model model, HttpSession session) {

		RegisterVO register = new RegisterVO();

		RegisterVO registerVO = (RegisterVO) session.getAttribute("registerVO");
		model.addAttribute("registerVO", register);

		return "/register";
	}

	@PostMapping("/register")
	public String register(@Valid RegisterVO registerVO, BindingResult result) {
		System.out.println(registerVO);
		if (result.hasErrors()) {
			System.out.println("오류 발생...");

			return "/register";
		}

		registerService.insert(registerVO);
		return "redirect:/addConsulting";
	}

	// 캘린더 화면 보여주기 (사원별로 예약 가능 일정 보여주기)
	@ResponseBody // ajax쓰겠다.
	@GetMapping("/schedule/{empno}")
	public List<RegisterVO> getList(@PathVariable("empno") String empno) {
		List<RegisterVO> reservationList = registerService.selectAllByEmpno(empno);
		/*
		 * System.out.println("읽긴읽을텐데");
		 * 
		 * for (RegisterVO r : reservationList) { System.out.println("캘린더테스트:" + r); }
		 */
		return reservationList;
	}

	//유저 예약 일정 캘린더 보여주기
	@ResponseBody
	@GetMapping("/userSchedule/{id}")
	public List<RegisterVO> userList(@PathVariable("id") String id) {
		List<RegisterVO> reservationList = registerService.selectAllById(id);
		return reservationList;
	}
	
	@RequestMapping("/userSchedule")
	public String userSchedule() {
		return "consulting/userSchedule";
	}
	
	// 관리자 일정관리 캘린더 보여주기 (관리자용)
	@RequestMapping("/adminSchedule")
	public String enrollment() {

		return "consulting/adminSchedule";

	}

	// 캘린더 화면 보여주기 (상담리스트 값을 달력에서 가져다 쓰기 위해 가져오기 + 포워드)
	@RequestMapping("/schedulePage/{no}") // pstmt가 아닌 주소값 그대로 가져오기 {써주고싶은이름} 가변적일때 {}로묶기
	public ModelAndView detail(@PathVariable("no") int no) { // 주소값 이름 no를 int boardNo로 설정 밑에 메소드 안에서 쓸거다!

		ConsultingVO consulting = consultingService.selectByConsultingNo(no);

		ModelAndView mav = new ModelAndView("consulting/schedule");
		mav.addObject("consulting", consulting);
		return mav;

	}

	// 캘린더에 일정 등록하기(유저)
	@ResponseBody
	@PostMapping("/enrollmentSchedule") // WEB-INF/jsp/reply.jsp 찾는 //insert
	public void addEnrollment(RegisterVO registerVO) {

		System.out.println(registerVO);
		registerService.insertSchedule(registerVO);
        consultingService.updateAddConsulting(registerVO.getConsultingNo());
        System.out.println(registerVO.getNo());
	}
	
	// 캘린더에 일정 등록하기(관리자)
	@ResponseBody
	@PostMapping("/enrollmentByAdmin") // WEB-INF/jsp/reply.jsp 찾는 //insert
	public void addAdminSchedule(RegisterVO registerVO) {

		System.out.println(registerVO);
		registerService.insertAdminSchedule(registerVO);
        System.out.println(registerVO.getNo());
	}
	
	//추가상담 진행상태 업데이트 
    @GetMapping("/updateProgress/{consultingNo}")
	public String updateProgress(@PathVariable("consultingNo") int no, ConsultingVO consulting ) {
		registerService.updateProgress(no);
		return "redirect://addConsulting/admin";
	}
	
	//추가상담 접수 취소 (유저)
    @RequestMapping("/delSchedule/{consultingNo}")
  	public String delSchedule(@PathVariable("consultingNo") int no ) {
  		 registerService.delSchedule(no);
  		 consultingService.updateAddConsulting2(no);
  		return "redirect://consultingList/1/1";
  	}
    
	//일정 삭제 하기(관리자단)
	@RequestMapping("/deleteSchedule/{empno}/{title}")
	public String delete(@PathVariable("empno") String empno, @PathVariable("title") String title) {
		
		RegisterVO register = new RegisterVO();
		register.setEmpno(empno);
		register.setTitle(title);
		System.out.println("deleteControl : empno : " + empno + ", title : " + title);
		registerService.removeRegister(register);
		return "redirect://adminSchedule";
	}
	
	// 관리자 일정삭제 캘린더 보여주기 (관리자용)
	@RequestMapping("/deleteSchedule")
	public String delete() {
		return "consulting/deleteSchedule";

	}
	
}
