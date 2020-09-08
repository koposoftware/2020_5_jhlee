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
<script>

$('#enrollmentBtn').click(function(e){
	if(this.form.trim() != ''){
	 e.preventDefault(); 
	$('#enrollmentModal').modal("show");
	}
});	
	
	
function goReport(reportNo){
		location.href="${ pageContext.request.contextPath }/consulting/admin/" + reportNo;
	}	
	
function goMember(customerId){
	location.href="${ pageContext.request.contextPath }/myPage/" + customerId;
}

</script>
<style>
a#ho:hover{
	color:#008C8C;
	text-decoration: underline;
}
</style>
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
 	 <br>
 	<c:if test="${ empty adminLoginVO and not empty loginVO}">
 	  <div class="section-title">
          <h2>${ loginVO.id }님의  추가 상담 리스트</h2>
        </div>
    </c:if>
    	<c:if test="${ not empty adminLoginVO and empty loginVO}">
        <div class="section-title">
          <h2>관리자 [${ adminLoginVO.empno }]님의  추가 상담 리스트</h2>
        </div>	
    </c:if>
    </div>
      <br>
      <div class="row">
      <!-- 유저 로그인 시 ui -->
      <c:if test="${ empty adminLoginVO and not empty loginVO}">
       <c:forEach items="${ userAddConsultingList }" var="register" varStatus="loop">
            <div class="col-md-4">
              <div class="card mb-4 shadow rounded content">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail">
                <div class="card-body">
                  <p class="card-text" style="color:#2C4964">
				 <strong>상담번호</strong>: ${ register.consultingNo }<br>
				 <strong>대분류</strong>: ${ register.mainCategory }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				 <strong>중분류</strong>: ${ register.middleCategory }<br>
				<strong>손님 ID</strong>: <a href="javascript:goMember('${ register.id }')" style="color:#2C4964" id="ho">${ register.id }</a><br>
				<strong>손님 성함</strong>: ${ register.name }<br>
				<strong>제목</strong>: ${ register.title }<br>
				<strong>상담채널</strong>: ${ register.consultingChannel }<br>                   
                <strong>담당직원</strong>: ${ register. adminName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>사원번호</strong>:  ${ register.empno }<br>
                <strong style="color:#008C8C">추가 상담 예약일시</strong>: ${ register.registerationYmd }<br> 
                  </p>
                  <hr>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary"><strong>수정</strong></button>
                      <button type="button" class="btn btn-sm btn-outline-secondary"><strong>취소</strong></button>
                    </div>
                    <small class="text-muted"><strong>${ register.no }</strong></small>
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>
           </c:if>
             
             
          <!-- 관리자 로그인 시 ui -->     
          <c:if test="${ not empty adminLoginVO and empty loginVO}">
      		<c:forEach items="${ adminAddConsultingList }" var="register" varStatus="loop">
            <div class="col-md-4">
              <div class="card mb-4 shadow rounded content">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail">
                <div class="card-body">
                  <p class="card-text" style="color:#2C4964">
				 <strong>상담번호</strong>: ${ register.consultingNo }<br>
				 <strong>대분류</strong>: ${ register.mainCategory }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				 <strong>중분류</strong>: ${ register.middleCategory }<br>
				<strong>손님 ID</strong>:  <a href="javascript:goMember('${ register.id }')" style="color:#2C4964" id="ho">${ register.id }</a><br>
				<strong>손님 성함</strong>: ${ register.name }<br>
				<strong>제목</strong>: <a href="javascript:goReport(${ register.consultingNo })" style="color:#2C4964" id="ho"><strong>${ register.title }</strong></a><br>
				<strong>상담채널</strong>: ${ register.consultingChannel }<br>                   
                <strong>담당직원</strong>: ${ register. adminName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>사원번호</strong>:  ${ register.empno }<br>
                <strong style="color:#008C8C">추가 상담 예약일시: ${ register.registerationYmd }</strong><br> 
                  </p>
                  <hr>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary"><strong>상세보기</strong></button>
                      <button type="button" class="btn btn-sm btn-outline-secondary"><strong>알림전송</strong></button>
                      <button type="button" class="btn btn-sm btn-outline-secondary"><strong>진행상태:[${ register.progress }]</strong></button>
                    </div>
                    <small class="text-muted"><strong>${ register.no }</strong></small>
                  </div>
                </div>
              </div>
             </div>
            </c:forEach>
           </c:if>     
            </div>
           </div>
         </div>
         
         
         <!-- 모달 창 -->  
	 <div class="modal fade" id="enrollmentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
						<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				
					<h6 class="modal-title" id="exampleModalLabel" align="center"><strong>회원 등록 확인</strong></h6>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close"> </button>
				</div>
				<div class="modal-body">하나만의 손님이 되신걸 환영합니다, 로그인 후 이용해주세요</div>
				<div class="modal-footer">
					 <input type="submit" id="enrollmentBtn" class="btn btn-outline-light text-dark" value="확인" align="center">
				</div>
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