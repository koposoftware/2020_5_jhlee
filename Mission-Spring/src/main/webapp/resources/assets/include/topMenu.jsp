<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <!-- ======= Top Bar ======= -->
   <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i> <a href="kebhana.com">kebhana.com</a>
        <i class="icofont-phone"></i> 1588(1599)-1111
        <i class="icofont-google-map"></i>서울특별시 중구 을지로2가 을지로 35
      </div>
      
      <div class="social-links">
       <c:if test="${ not empty loginVO}">
        <strong>${ loginVO.id }</strong>님 환영합니다 
       </c:if>
        
        <c:if test="${ not empty adminLoginVO}">
         <strong>${ adminLoginVO.empno }</strong>관리자님 환영합니다 
        </c:if>
        <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
        <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
        <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
        <a href="#" class="skype"><i class="icofont-skype"></i></a>
        <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
      </div>
    </div>
  </div> 

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">
       <img src="${ pageContext.request.contextPath }/resources/assets/img/hana4.png" width="40px" height="40px">
      <h1 class="logo mr-auto"><a href="${ pageContext.request.contextPath }/">ONEHANA</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

         <nav class="nav-menu d-none d-lg-block"> 
          <ul>
          <li class="active"><a href="${ pageContext.request.contextPath }/">Home</a></li>
          <li class="drop-down"><a href="#testimonials">상담 스토리</a>
          <ul> 
          <c:if test="${ not empty adminLoginVO and empty loginVO}">  
          <li><a href="${ pageContext.request.contextPath }/consultingEnrollment">상담 등록</a></li>
          </c:if>
          <c:if test="${ empty adminLoginVO and empty loginVO}">      
          <li><a href="${ pageContext.request.contextPath }/login">상담 리스트</a></li>
          </c:if>
          <c:if test="${ not empty adminLoginVO and empty loginVO}">          
          <li><a href="${ pageContext.request.contextPath }/consultingList/admin/1/1">상담 리스트</a></li>
          </c:if>
          <c:if test="${ empty adminLoginVO and not empty loginVO}">          
          <li><a href="${ pageContext.request.contextPath }/consultingList/1/1">상담 리스트</a></li>
          </c:if>
          <c:if test="${ empty adminLoginVO and empty loginVO}">      
          <li><a href="${ pageContext.request.contextPath }/login">추가 상담</a></li>
          </c:if>
          <c:if test="${ empty adminLoginVO and not empty loginVO}">   
          <li><a href="${ pageContext.request.contextPath }/addConsulting">추가 상담</a></li>
          </c:if>
          <c:if test="${ not empty adminLoginVO and empty loginVO}">   
          <li><a href="${ pageContext.request.contextPath }/addConsulting/admin">추가 상담</a></li>
          </c:if>
          </ul>
          </li>
          <li class="drop-down"><a href="${ pageContext.request.contextPath }/education">HANADO</a>
          <ul>          
          <li><a href="${ pageContext.request.contextPath }/education">HANADO</a></li>
          <li><a href="${ pageContext.request.contextPath }/inquiry/1/1">Q&A</a></li>
          </ul>
          </li>       
          <c:if test="${ empty adminLoginVO and not empty loginVO}">  
          <li><a href="${ pageContext.request.contextPath }/myPage">마이페이지 </a></li>
          </c:if>
          <c:if test="${ not empty adminLoginVO and empty loginVO}"> 
          <li class="drop-down"><a href="#testimonials">마이페이지</a>
          <ul>          
          <li><a href="${ pageContext.request.contextPath }/management">실적 관리</a></li>
          <li><a href="${ pageContext.request.contextPath }/customerInform/1/1">손님 관리</a></li>
          <li><a href="${ pageContext.request.contextPath }/adminSchedule">일정 관리</a></li>
          </ul>
          </li>
          </c:if>
         
          <li><a href="#contact">영업점 찾기</a></li>
	
        </ul>   
      </nav><!-- .nav-menu -->

    	<c:choose>
				<c:when test="${ empty loginVO and empty adminLoginVO}">  
					<a href="${ pageContext.request.contextPath }/login"
						class="appointment-btn scrollto">로그인</a>
				</c:when>
				<c:otherwise>
					<a href="${ pageContext.request.contextPath }/logout"
						class="appointment-btn scrollto">로그아웃</a>
				</c:otherwise>
				
			</c:choose>	
    </div>
  </header><!-- End Header -->