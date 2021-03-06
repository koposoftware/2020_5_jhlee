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
         <c:if test="${ not empty loginVO }">
        <strong>${ loginVO.id }</strong>님 환영합니다 
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
          <li class="drop-down"><a href="#">상담스토리</a>
          <ul>          
          <li><a href="${ pageContext.request.contextPath }/consultingList1">상담리스트</a></li>
          <li><a href="${ pageContext.request.contextPath }/addConsulting">추가상담</a></li>
          </ul>
          </li>
          
          <c:if test="${ loginVO.type eq 'S' }">
          <li><a href="${ pageContext.request.contextPath }/consultingNote">상담노트</a></li>
          </c:if>
          
          <li><a href="${ pageContext.request.contextPath }/board">Q&A</a></li>
          <li><a href="${ pageContext.request.contextPath }/myPage">마이페이지 </a></li>
<!--           <li class="drop-down"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">í µê³ </a></li>
              <li class="drop-down"><a href="#"> Deep Drop Down</a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li> -->
          <li><a href="#contact">영업점찾기</a></li>

        </ul>
      </nav><!-- .nav-menu -->

     	<c:choose>
				<c:when test="${ empty loginVO }">
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