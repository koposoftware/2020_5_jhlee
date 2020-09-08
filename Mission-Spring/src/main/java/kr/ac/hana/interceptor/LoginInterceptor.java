package kr.ac.hana.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.hana.admin.vo.AdminVO;
import kr.ac.hana.member.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		/*
		 * 이걸로 로그 파일 만들 수 있음, 로그로  몇시몇분 --가 접근했음 log4j
		 * HandlerMethod method= (HandlerMethod)handler; System.out.println("메소드: " +
		 * method); System.out.println("controller: "+method.getBean()); //어느 컨트롤러의
		 * 메소드것을 호출하느냐
		 * 몇시몇분에 접근하려고 한다~~ 해서 db에 저장할 수 있음. 
		 */		

		
		//로그인 여부 체크 
		HttpSession session = request.getSession();

		
		// 항시 로그인 상태 만들기
//		MemberVO vo = new MemberVO();
//		vo.setId("user");
//		vo.setPassword("user");
//		session.setAttribute("loginVO", vo);
		// 여기까지 항시 로그인 상태 만들기
		
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		AdminVO adminLoginVO = (AdminVO)session.getAttribute("adminLoginVO");
		
		
		
		if(loginVO == null && adminLoginVO == null) {
			
			String uri = request.getRequestURI(); //uri값 가져오기 
			uri = uri.substring(request.getContextPath().length()); //프로젝트 이후 uri값 가져오기 
			System.out.println(uri);
			
			//쿼리는 물음표로 날라가는것 그래서 rest방식을 쓰면 null이 나오게 된다.
			String query = request.getQueryString();
			System.out.println(query);
			
			if(query != null && query.length() != 0) 
				uri = uri + "?" + query;
			
			session.setAttribute("dest", uri); //uri값 membercontroller 로그인 성공 시 에 알려주려고 설정해놓음 
			
			response.sendRedirect(request.getContextPath() +"/login");
			//그런데 위에서 sendredirect 했기 때문에 아래의 false결과 의미 x(화면아무내용 안떠도됨)
			return false; //필터같은 아이라 해당 컴포넌트로 가는 것을 막아줌 , 화면이 텅비어 있음.
		}
		
		return true; //로그인 vo객체가 세션에 등록되어 잇으면 리퀘스트 메핑 밑에 메소드 실행 
		
	}	

}
