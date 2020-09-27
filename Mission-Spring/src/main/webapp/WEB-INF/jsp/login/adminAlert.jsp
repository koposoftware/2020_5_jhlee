<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>로그인</title>
 <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
 <link href="/resources/assets/css/jin.css" rel="stylesheet">
 <link href="/resources/assets/css/style.css" rel="stylesheet"> 
 
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  

<meta charset="UTF-8">
<title>관리자 알림</title>
</head>
<script>
function goQNA(){
	location.href="${ pageContext.request.contextPath }/inquiry/1/1";
}

 function goSchedule(){
	 location.href="${ pageContext.request.contextPath }/adminSchedule";
	 
 } 
 function goEnrollment(){
	 location.href="${ pageContext.request.contextPath }/consultingEnrollment";
	 
 } 

</script>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
	</header>
  <section>
 
  <div align="center" style="margin-top:270px">
  <c:if test="${ adminLoginVO.type eq 'C' }">
  <h1> <i class="icofont-support" style="font-size:60px"></i> 안녕하세요, ${ adminLoginVO.empno } 직원님 </h1><br>
  </c:if>
  <c:if test="${ adminLoginVO.type eq 'B' }">
  <h1> <i class="icofont-support" style="font-size:60px"></i> 안녕하세요, ${ adminLoginVO.empno } 행원님 </h1><br>
  </c:if>
    <h3> 오늘의 추가 상담 예약 건수는 <strong style="color:red"> ${ consulting.consultingNo } 건</strong>입니다. <br><br>
          하나만의 친절함으로 손님과 함께 하세요<strong>,</strong> 오늘도 화이팅!</h3><br><br>
  <input type="button" class="btn btn-outline-secondary px-3 " onclick="goQNA()" style="height:100px; width:190px; margin-right:520px; font-size:30px!important; font-weight:580" value="문의 확인 ">
  <input type="button" class="btn btn-outline-secondary px-3 " onclick="goSchedule()" style="height:100px; width:190px; margin-right:100px; font-size:30px!important;font-weight:580" value="일정 조회">
  <input type="button" class="btn btn-outline-secondary px-3 " onclick="goEnrollment()" style="height:100px; width:190px; margin-right:100px; font-size:30px!important;font-weight:580" value="상담 등록 ">
  </div>
  
  
</section> 
	
 	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
</body>
</html>