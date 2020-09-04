<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>추가상담 리스트</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  
<link href="/resources/assets/css/album.css" rel="stylesheet">
</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
	</header>
	<br>
	<br>
	<br>
	<section>
      <div class="album py-5 bg-light">
        <div class="container">
 	 <div align="center">
 	<c:if test="${ empty adminLoginVO and not empty loginVO}">
       <hr>	
          <h4 class="titles">&nbsp;&nbsp;<strong>${ loginVO.id }</strong>님의 추가 상담 리스트</h4>
      <hr>
    </c:if>
    	<c:if test="${ not empty adminLoginVO and empty loginVO}">
       <hr>	
          <h4 class="titles">관리자&nbsp;&nbsp;<strong>${ adminLoginVO.empno }</strong>님의 추가 상담 리스트</h4>
      <hr>
    </c:if>
    </div>
      <br>
      <div class="row">
      <c:forEach items="${ consultingList }" var="register" varStatus="loop">
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail">
                <div class="card-body">
                  <p class="card-text">
				 <strong>상담번호</strong>: ${ register.consultingNo }<br>
				 <strong>대분류</strong>: ${ register.mainCategory }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				 <strong>중분류</strong>: ${ register.middleCategory }<br>
				<strong>손님ID</strong>: ${ register.id } <br>
				<strong>손님 성함</strong>: ${ register.name }<br>
				<strong>제목</strong>: ${ register.title }<br>
				<strong>상담채널</strong>: ${ register.consultingChannel }<br>                   
                <strong>담당직원</strong>: ${ register.adminName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>사원번호</strong>:  ${ register.empno }<br>
                <strong>추가 상담 예약일시</strong>: ${ register.registerationYmd }<br> 
                  </p>
                  <div class="d-flex justify-content-between align-items-center">
                  <c:if test="${ not empty adminLoginVO and empty loginVO}">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">상세보기</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">상태</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">알림, 메시지</button>
                    </div>
                  </c:if>
                  <c:if test="${ empty adminLoginVO and not empty loginVO}">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">진행상태[${ register.progress }] </button>
                    </div>
                  </c:if>
                    <small class="text-muted">${ register.no }</small>
                  </div>
                </div>
              </div>
            </div>
                  </c:forEach>
                  </div>
                </div>
              </div>
            
	</section>
	<br>
	<br>  
	<br>
	<br>
	<br> 
	<footer id="footer">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
    
</body>
</html>