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
 

<style>
.btn1{animation:bgcolor 1s both;
}

@keyframes bgcolor{
  from{background:white;} to {background:white; color:red;}
}

.btn .fa.fa-3x {
    font-size: 3em;
}
.btn .fa.fa-2x {
    font-size: 2em;
}

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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>


	// 즐겨찾기
	$(document).ready(function(){
		$('.star').click(function(){
			/* alert('누름'); */
			$(this).toggleClass("btn1")
			let btn = this;
			let fav = $(this).attr('id').split('-');
			alert( fav[3]+ "님을 즐겨찾기로 등록하였습니다.");
			
			$.ajax ({
				url : '${pageContext.request.contextPath}/addFavorite',
				type : 'post',
				data : {
					adminName : fav[0],
					empno : fav[1],
					name :fav[2],
					id :fav[3]
				}, success : function() {
					$(btn).attr('', true);
				}, error : function() {
					alert('다시시도해주세요');
				}
			})
				
			
		})
	})
		
</script>
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
          <select id="gender" name="gender" style="width:6%">
                      <option>성별</option>
                     <option value="M">남성</option>
                     <option value="F">여성</option>
	      </select>
	      <select id="digitalEdu" name="digitalEdu" style="width:8%">
                     <option>디지털교육</option>
                     <option value="Y">교육 받음</option>
                     <option value="N">교육 받지 않음</option>
	      </select>
	       <select id="interest" name="interest" style="width:8%">
                      <option>관심사</option>
                    <option value="예금">예금</option>
                    <option value="적금">적금</option>
                    <option value="대출">대출</option>
                    <option value="카드">카드</option>
                    <option value="보험">보험</option>
                    <option value="펀드">펀드</option>
                    <option value="외환">외환</option>
                    <option value="연금">연금</option>
                    <option value="기타">기타</option>
	      </select>
	      <select id="age" name="age" style="width:8%">
	      			 <option>연령</option>
                     <option value="20대">20대</option>
                     <option value="30대">30대</option>
                     <option value="40대">40대</option>
                     <option value="50대">50대</option>
                     <option value="60대이상">60대 이상</option>
	      </select>
	      <select id="job" name="job" style="width:8%">
	      			 <option>직업</option>
                    <option value="회사원">회사원</option>
                    <option value="주부">주부</option>
                    <option value="학생">학생</option>
                    <option value="기타">기타</option>
	      </select>
	      <select id="customerType" name="customerType" style="width:8%">
	      			 <option>유형</option>
                    <option value="잠재">잠재</option>  <!-- 상품가입안함, 상담만 진행 -->
                    <option value="일반">일반</option>  <!-- 상품 가입하고 이용중 -->
                    <option value="VIP">VIP</option> <!-- 다수의 상품 가입, 5년이상 이용 -->
                    <option value="블랙">블랙</option>  <!-- 이유없는 폭언, 영업장 피해 ETC -->
	      </select>
	      
          <input type="text" id="searchWord" placeholder=" ID/이름 /생년월일  조회" style="width:20%">
          <button style="height: 29px;" class="btn btn-primary px-3 ml-4" onclick="searchMember()">검색</button>
      	<br><br>
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
               <th>손님유형</th>
              </tr>
             </thead>
             
				<tbody id="memberList">
			<c:forEach items="${ allInformList }" var="customerInform">
				<tr>
					<td><input type="button" value="☆" class = "star btn btn-default" id="${ adminLoginVO.admin_name }-${ adminLoginVO.empno }-${ customerInform.name }-${ customerInform.id }" style="border:0; background-color:white"></td>
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
		</c:forEach>	
				</tbody> 
		</table>
		<br>
<!-- ====페이징======================================================================================= -->
	<div><!--style="margin-left: 10%"  -->
<!-- ---------이전 버튼 구현 --------------------------- -->
			<c:if test="${blockNo != 1 }"> 
				<a href= "${pageContext.request.contextPath}/customerInform/${blockNo - 1}/${blockStartPageNo-1 }">이전</a> &nbsp;
			</c:if>
			
<!-- ---------페이지 구현 --------------------------- -->			
			<c:forEach var="i" begin="${blockStartPageNo }" end="${blockEndPageNo }">
				<c:choose>
				
					<c:when test="${pageNo == i }"> <!-- 현 페이지 넘버와 클릭할수있는 페이지 넘버가 같으면 링크없애줌 -->
						${i }&nbsp;|&nbsp;
					</c:when>
					
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/customerInform/${blockNo}/${i }">${i }&nbsp;</a>|&nbsp;
					</c:otherwise>
					
				</c:choose>
			</c:forEach>
			
<!-- ---------다음 버튼 구현 --------------------------- -->	
			<c:if test="${blockNo != totalBlockCnt}">&nbsp;
				<a href="${pageContext.request.contextPath}/customerInform/${blockNo + 1}/${blockEndPageNo+1 }">다음</a> &nbsp;
			</c:if>
	</div>	
	
<!-- ==== 페이징 끝! ================================================================== -->	

		 <input type="button"  style="align:right; margin-left: 82%!important;" class="btn btn-primary px-3 ml-4" value="손님등록" onclick="enrollAction()">
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

<script>

function searchMember() {
	let gender = $("#gender").val()
	let digitalEdu = $("#digitalEdu").val()
	let interest = $("#interest").val()
	let age = $("#age").val()
	let job = $("#job").val()
	let customerType = $("#customerType").val()
	let searchWord = $("#searchWord").val()

	console.log(gender)
	console.log(digitalEdu)
	console.log(interest)
	console.log(age )
	console.log(job)
	console.log(customerType)
	console.log(searchWord)
	

	if(gender != '' || digitalEdu != '' || interest != '' || age != '' || job != '' || customerType != '' || searchWord != '' ) {
	
	$.ajax({
		url : "${pageContext.request.contextPath}/searchMember",
		type : 'get',
		data : {
			gender :  gender,
			digitalEdu : digitalEdu, 
			interest : interest, 
			age : age, 
			job : job,
			customerType : customerType,
			searchWord : searchWord
			
		},
		success : function(data) {
			console.log("성공")
			let md = JSON.parse(data) 
			console.log(md)
			$("#memberList").empty()
			for (key in md) {
				
				console.log(md[key]["id"])
				
				let str = ""
				
				str += "<tr>";
				str += '<td>' + '<input type="button">' +'</td>'
				str += '<td>' + md[key]['name'] + '</td>'
				str += '<td>' + '<a href="javascript:doAction(' + md[key]['id'] + ')">' + md[key]['id'] +'</a>' + '</td>'
				str += '<td>' + md[key]['password'] + '</td>'
				str += '<td>' + md[key]['birth'] + '</td>'
				str += '<td align="center">' + md[key]['gender'] + '</td>'
				str += '<td>' + '<a href=tel:'+ md[key]['phoneNo'] + '>'+ md[key]['phoneNo'] +'</a>'+ '</td>'
				str += '<td>' + md[key]['job'] + '</td>'
				str += '<td>' + md[key]['address'] + '</td>'
                str += '<td>' + md[key]['emailId'] + '@' + md[key]['emailDomain'] +'</td>'
                str += '<td align="center">' + md[key]['digitalEdu'] + '</td>'
                str += '<td>' + md[key]['interest'] + '</td>'
                str += '<td>' + md[key]['age'] + '</td>'
                str += '<td align="center">' + md[key]['type'] + '</td>'
                str += '<td align="center">' + md[key]['customerType'] +'</td>'
                str += '<tr>';
                
                $("#memberList").append(str)

			}
			
		},
		error : function() {
			console.log("실패")
		}
	
	})
} else {
	location.href = "${pageContext.request.contextPath}/customerInform"
 }		
}

function doAction(customerInformId){
			
			location.href="${ pageContext.request.contextPath }/myPage/" + customerInformId;
		}
		
function enrollAction(){
	 location.href="${ pageContext.request.contextPath }/enrollmentForm"
}

</script>
	<footer id="footer">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
   
</body>
</html>