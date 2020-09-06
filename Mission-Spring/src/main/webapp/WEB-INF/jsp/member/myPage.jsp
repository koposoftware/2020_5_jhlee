<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>마이페이지</title>
 <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  

 <script>

function doAction(customerInformId){
	
	location.href="${ pageContext.request.contextPath }/consultingList/" + customerInformId;
}

</script>	
</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
</header>

	<section style="align:center">
	  <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
 
       <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden" style="width:50%">
        <div class="my-3 p-3">
	     <div align="center">
			<hr>
			<h4 class="title"><strong>손님 상세 정보</strong></h4>
			<hr>
			<br>
			<br>
			<div class="container">
			<table>
			<c:forEach items="${ customerInform }" var="customerInform">
				
				<tr>
					<th>이름</th>
					<td><c:out value='${ customerInform.name }'/></td>
				</tr>
			 	<tr>
					<th>아이디</th>
					<td><c:out value='${ customerInform.id }'/></td>
				</tr>  
				<tr>
					<th>비밀번호</th>
					<td><c:out value='${ customerInform.password }'/></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><c:out value='${ customerInform.birth }'/></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><c:out value='${ customerInform.gender }'/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><c:out value='${ customerInform.phoneNo }'/></td>
				</tr>
				<tr>
					<th>직업</th>
					<td><c:out value='${ customerInform.job }'/></td>
				</tr>
			<%-- 	<tr>
					<th>우편번호</th>
					<td><c:out value='${ customerInform.post}'/></td>
				</tr> --%>
				<tr>
					<th>주소</th>
					<td><c:out value='${ customerInform.address }'/></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><c:out value='${ customerInform.emailId }'/>@<c:out value='${ customerInform.emailDomain }'/></td>
				</tr>
				<tr>
					<th>디지털 교육 유무</th>
					<td><c:out value='${ customerInform.digitalEdu }'/></td>
				</tr>
				<tr>
					<th>관심사</th>
					<td><c:out value='${ customerInform.interest }'/></td>
				</tr> 
		    <c:if test="${ not empty adminLoginVO and empty loginVO}"> 
				<tr>
					<th> 상담 리스트 </th>
				<td><strong>
				<a style="color:#008C8C" href="javascript:doAction('${ customerInform.id }')">${ customerInform.name }님의 상담리스트 바로가기</a>
				</strong>
			</td>
			</tr>
		  </c:if>
		</c:forEach>		
		</table>
		<br>
 		 
 		 <input type="button" class="btn btn-primary px-3 ml-4" value="정보 수정" onclick="updateAction()">
		 <input type="button" class="btn btn-primary px-3 ml-4" value="회원  삭제" onclick="deleteAction()">
			 	

<br><br><br>
	</div>
	</div>
      </div>
      </div>

 		<div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden" style="width:50%">
        <div class="my-3 p-3">
        
	<!-- 유저로그인 시 ui  -->	
    <!-- 차트  -->
      <hr>	
          <h4 class="titles"> <strong>상담 문의 유형 별 관심도</h4>
      <hr>
      <br><br><br>
	  <canvas class="my-4" id="myChart" width="600" height="300"></canvas>
     
     
   <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
  
   <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
      var ctx = document.getElementById("myChart");
      var myChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
          datasets: [{
            data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
            lineTension: 0,
            backgroundColor: 'transparent',
            borderColor: '#008C8C',
            borderWidth: 4,
            pointBackgroundColor: '#008C8C'
          }]
        },
        options: {
        responsive: false,
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: false
              }
            }]
          },
          legend: {
            display: false,
          }
        }
      });
    </script>
	 </div>
       <!--  <div class="bg-dark box-shadow mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div> -->
      </div>
	</div>
</section>
	<br>
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