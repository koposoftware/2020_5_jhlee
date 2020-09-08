<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>고객 정보조회</title>
 <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  
 
 <script>

function doAction(customerInformId){
	
	location.href="${ pageContext.request.contextPath }/myPage/" + customerInformId;
}

</script>	

<style>

#inform:hover tbody tr:hover td {
    background: #5f9ea0;
    color: white;
    opacity:0.8;
}

 .thead-dark th{
	background-color:#5f9ea0 !important;
	border-color:#5f9ea0!important;
} 

.table thead th{
 font-weight:900px!important;
 color:#2C4964!important;
}

.btn-primary{
    background-color:#5f9ea0 !important;
}

.table-sm td, .table-sm th {
    padding: .3rem;


</style>
</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
</header>
   <br>
	<br>
	<br>
	<section style="align:center">
	<br>
	<br>
  <!-- 관리자 로그인 시 ui  -->
    
      <div align="center">
         <div class="section-title">
          <h2>손님 리스트</h2>
        </div>
		<div class="table-responsive" align="center">
            <table class="table table-hover table-sm" style="width:89%; height:15%" id="inform">
              <thead> 
               <tr class="jj">
			   <th></th>
               <th>이름</th>
               <th>아이디</th>
               <th>비밀번호</th>
               <th>생년월일</th>
               <th>성별</th>
               <th>전화번호</th>
               <th>직업</th>
               <th>주소</th>
               <th>이메일</th>
               <th>디지털교육</th>
               <th>관심사</th>
               <th>나이대</th>
               <th>유형</th>
               <th>고객 유형</th>
              </tr>
             </thead>
             
			<c:forEach items="${ allInformList }" var="customerInform">
				<tbody>
				<tr>
					<td><c:out value='☆'/></td>
					<td><c:out value='${ customerInform.name }'/></td>
					<td><strong><a href="javascript:doAction('${ customerInform.id }')">
					<c:out value='${ customerInform.id }'/></a></strong></td>
					<td><c:out value='${ customerInform.password }'/></td>
					<td><c:out value='${ customerInform.birth }'/></td>
					<td align="center"><c:out value='${ customerInform.gender }'/></td>
					<td><a href='tel:${ customerInform.phoneNo }'><c:out value='${ customerInform.phoneNo }'/></a></td>
					<td><c:out value='${ customerInform.job }'/></td>
					<td><c:out value='${ customerInform.address }'/></td>
					<td><c:out value='${ customerInform.emailId }'/>@<c:out value='${ customerInform.emailDomain }'/></td>
					<td align="center"><c:out value='${ customerInform.digitalEdu }'/></td>
					<td><c:out value='${ customerInform.interest }'/></td>
					<td><c:out value='${ customerInform.age }'/></td>
					<td align="center"><c:out value='${ customerInform.type }'/></td>
					<td align="center"><c:out value='${ customerInform.customerType }'/></td>
				</tr>
				</tbody> 
		</c:forEach>	
		</table>
		<br>
		 <input type="button"  style="align:right" class="btn btn-primary px-3 ml-4" value="손님등록" onclick="enrollAction()">
		<br>
		<br>
		<br>
		<!--  <input type="button" class="btn btn-primary px-3 ml-4" value="정보 수정" onclick="updateAction()">
		 <input type="button" class="btn btn-primary px-3 ml-4" value="회원 탈퇴" onclick="deleteAction()">
		 --><br><br><br>
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