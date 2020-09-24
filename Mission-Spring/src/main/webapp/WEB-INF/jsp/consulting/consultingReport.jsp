<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>상담리포트</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  
</head>
<script>
	function goList(){
		location.href="${ pageContext.request.contextPath }/consultingList/admin/1/1";
	}

	 function goNote(id){
		 location.href="${ pageContext.request.contextPath }/consultingNote/" + id;
		 
	 } 
	 function doAction(customerInformId){
			
			location.href="${ pageContext.request.contextPath }/myPage/" + customerInformId;
		}
</script>
<style>
a{
    color: #2C4964!important;;
  /*   text-decoration: underline; */
}

</style>
 <body class="bg-light">
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
	</header>
	<br>
	<br>
	<br>
<section class="section">
 <a href="#" class="back-to-top"></a>
  <div class="container">
  <br><br>
   <div class="section-title">
          <h2>${ consulting.name }님의 상담리포트</h2>
        </div>
    <div class="row">
      <div class="col-lg-10 mx-auto">
        <div class="p-5 shadow rounded content">
          <h3> ${ consulting.reportYmd } &nbsp;&nbsp; ${ consulting.mainCategory } [${ consulting.middleCategory }]</h3>
          <p>
       		   상담번호 : [${ consulting.consultingNo }]  &nbsp;&nbsp;&nbsp;&nbsp; 
       		   담당직원 : ${ consulting.adminName } (${ consulting.empno }) <br>
  
                            
          </p>
           <hr>
          <div class="mt-5">
            <!-- changelog post -->
            <h3 id="february-updates"> [${ consulting.title }] </h3> 
            <p><strong>고객ID : <a href="javascript:doAction('${ consulting.id }')" style="text-decoration: underline";>${ consulting.id }</a> &nbsp;&nbsp;&nbsp;&nbsp; 손님유형 : ${ consulting.customerType }&nbsp;&nbsp;&nbsp;&nbsp;
                            생년월일 : ${ consulting.birth } &nbsp;&nbsp;&nbsp;&nbsp; </strong></p>
            <p>
            </p>
            <div class="mt-4">
              <div class="badge changed">상담 리포트</div>
              <ul>
                <li>
                  <p> ${ consulting.consultingReport }</p>
                </li>
              </ul>
            </div>
            <hr>
            <br>
            <!-- changelog post -->
            <h3 id="changelog-label">하나 손님을 위한 추천 상품</h3>
            <div class="mt-4">
              <div class="badge added">하나 원큐 대출  하나 적금  하나 보험  핀크</div>
          </div>
          <br>
           <input type="button" value="목록" class="btn btn-primary px-3 ml-4" onclick="goList()">&nbsp;&nbsp;
           <input type="button"  class="btn btn-primary px-3 ml-4" value="돌아가기" onClick="history.go(-1)"> 
    <br>
    </div>
  </div>
 </div>
 </div>
 </div>
</section>
 <input type="button" value="상담노트 " style="border-radius:50%; font-size: 0.9rem!important; margin-left: 77%!important; margin-right:1%; height:60px; width:65px" class="btn btn-outline-secondary" onclick="goNote( '${ consulting.id }' )">
	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
</body>
</html>