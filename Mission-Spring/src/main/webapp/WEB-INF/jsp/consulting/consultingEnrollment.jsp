<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 등록</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  

<script>
function doSelect(){
	
	location.href="${ pageContext.request.contextPath }/customerInform/1/1";
}

function doEnrollment(){
	
	location.href="${ pageContext.request.contextPath }/enrollmentForm";
}
</script>
</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
</header>
	<br>
	<br>
	<br><br><br>
<section id="services" class="services">
      <div class="container">
		<br>
		<br>
		<br>
        <div class="section-title">
          <h2>상담 등록</h2>
          <p><h6><strong>상담을 등록하기 위해 첫 손님과 기존 손님을 구분하여 업무를 시작하세요.</strong></h6></p>
        </div>
        <div class="row" style="padding-left:120px">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="icon-box">
              <div class="icon"><i class="icofont-ui-user"></i></div>
              <h4><a href="javascript:doEnrollment()">손님 등록</a></h4>
              <p>ONEHANA가 처음인 손님을 등록해주세요.</p>
            </div>
          </div>

          <div class="col-lg-2 d-flex align-items-stretch mt-4 mt-md-0">
    
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><i class="icofont-ui-search"></i></div>
              <h4><a href="javascript:doSelect()">손님 조회</a></h4>
              <p>기존 ONEHANA 손님의 상세페이지에서 상담노트를 작성해 주세요.</p>
            </div>
          </div>
          </div>
          </div>
 </section> 
	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include>
</body>
</html>