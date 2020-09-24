<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<br><br>
<c:if test="${ not empty adminLoginVO and empty loginVO}">
<title>손님 등록</title>
</c:if>
<c:if test="${ empty adminLoginVO and not empty loginVO}">
<title>회원 가입</title>
</c:if>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script type="text/javascript">

function goEnrollment(frm) {
	   var name = frm.name.value;
	   var id = frm.id.value;
	   var password = frm.password.value;
	   var birth = frm.birth.value;
	   var phoneNo = frm.phoneNo.value;
	   var job = frm.job.value;
	   var digitalEdu = frm.digitalEdu.value;
	   var interest = frm.interest.value;
	   var age = frm.age.value;
	   
	   if (name.trim() == ''){
	      alert("이름을 입력해주세요");
	      return false;
	   }
	   if (id.trim() == ''){
	      alert("id를 입력해주세요");
	      return false;
	   } 
	   if (password.trim() == ''){
	      alert("password을 입력해주세요");
	      return false;
	   }
	   if (birth.trim() == ''){
		      alert("생년월일을 입력해주세요");
		      return false;
		   }
	   if (phoneNo.trim() == ''){
		      alert("전화번호를 입력해주세요");
		      return false;
		   }
	   if (job.trim() == ''){
		      alert("직업을 선택해주세요");
		      return false;
		   }
	   if (digitalEdu.trim() == ''){
		      alert("디지털교육을 선택해주세요");
		      return false;
		   }
	   if (interest.trim() == ''){
		      alert("관심사를 선택해주세요");
		      return false;
		   }
	   if (age.trim() == ''){
		      alert("나이대를 선택해주세요");
		      return false;
		   }
	  frm.submit();
	   alert("하나의 손님이 되신 걸 환영합니다. 로그인 후 이용해주세요"); 
	}
	
/* $('#enrollmentBtn').click(function(e){
	if(this.form.trim() != ''){
	 e.preventDefault(); 
	$('#enrollmentModal').modal("show");
	} */
	

	
	 function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullRoadAddr;
            }
        }).open();
    }	
	
</script>
<style>

.col-sm-7{
margin-left:200px;
}

.error{
		color:red;
	}
/* .col-sm-12 {
margin-left:5px;
} */
	
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
	<br>
	<br>
 <div class="container">
 <c:if test="${ not empty adminLoginVO and empty loginVO}">
  <div class="section-title">
          <h2>손님 등록</h2>
   </div>
   </c:if>
  <c:if test="${ empty adminLoginVO and empty loginVO}">
  <div class="section-title">
          <h2>회원 가입</h2>
   </div>
   </c:if>
 
   <div class="row">
   <div class="col-sm-12 text-center" >
   <div class="col-sm-3"></div> 
    <div class="col-sm-7">
    <br>
    <form method="post" autocomplete="off"> <%-- action="${ pageContext.request.contextPath }/login" --%>
    
        <table class="table table-boardered">
            <tr>    
                <th>이름</th>
                <td ><input type="text" class="form-control" name="name" placeholder="이름을 입력하세요"></td>      
            </tr>
            <tr>
                <th>아이디</th>
                <td ><input type="text" class="form-control" name="id" placeholder="id를 입력하세요">
                </td>  
            </tr>
            <tr>
                <th>패스워드</th>
                <td><input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요"></td>      
            </tr>
<!--              
            <tr>
                <th>패스워드확인</th>
                <td><input type="password" class="form-control" name="password2"></td>        
            </tr> -->
             <tr>
                <th>생년월일</th>
                <td><input type="text" class="form-control" name="birth" placeholder="ex)19940808 -> 940808"></td>        
           	 </tr>
           	 <tr>	
           		<th>성별</th>
                <td>
                <input type="radio"  name="gender" value="M">M &nbsp;&nbsp;
                <input type="radio"  name="gender" value="F">F &nbsp;&nbsp;
                </td>    
            </tr>
             <tr>
                <th>전화번호</th>
                <td><input type="text" class="form-control" name="phoneNo" placeholder="-표시 없이 입력하세요"></td>      
            </tr>
            <tr>
                <th>당신의 직업은</th>
                <td>
                 <select name="job" class="form-control">
                 	<option>선택하세요</option>
                    <option value="회사원">회사원</option>
                    <option value="주부">주부</option>
                    <option value="학생">학생</option>
                    <option value="기타">기타</option>
                 </select>
                </td>     
            </tr>
              
              <tr>
                <th>주소</th>
            <td><input type="text" name="post" id="post"  required="required" class="form-control">
            <button onclick="execDaumPostcode();" class="btn btn-outline-info py-2 px-1 px-md-3 w3-button w3-green">주소검색</button>
             <input type="text" name="address" id="address"  required="required" class="form-control"></td> 
            
              </tr>
               <tr>
                <th>이메일</th>
                <td ><input type="text" class="form-control" name="emailId" placeholder="이메일 ID"> @              
                	<input type="text" class="form-control" name="emailDomain" placeholder="이메일주소">
                </td>                 
                  <!--  <td> <input type="radio" name="email_domain" value="naver.com">naver.com 
                   		<input type="radio" name="email_domain" value="naver.com">daum.net 
                   		<input type="radio" name="email_domain" value="naver.com">gmail.com
              		</td> -->
      		</tr>

			<tr>
                <th>디지털 교육 유무</th>
                <td>
                	<input type="radio"  name="digitalEdu" value="Y">Y &nbsp;&nbsp;
                	<input type="radio"  name="digitalEdu" value="N">N &nbsp;&nbsp;
                </td>     
            </tr>  
            <tr>
                <th>당신의 관심분야</th>
                <td>
                   <select name="interest" class="form-control">
                    <option>선택하세요</option>
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
                </td>     
            </tr>
            <tr>
                <th>연령</th>
                <td>
                 <select name="age" class="form-control">
                    <option>선택하세요</option>
                    <option value="10대">10대</option>
                    <option value="20대">20대</option>
                    <option value="30대">30대</option>
                    <option value="40대">40대</option>
                    <option value="50대">50대</option>
                    <option value="60대이상">60대이상</option>
                 </select>
                </td>     
            </tr> 
             
            <tr align="right">
                <td colspan="2">
               <c:if test="${ empty adminLoginVO and empty loginVO}">
                <button type="submit" class="btn btn-primary px-3 ml-4" onclick="goEnrollment(this.form)">가입</button>
               </c:if>
               <c:if test="${ not empty adminLoginVO and empty loginVO}">
                <button type="submit" class="btn btn-primary px-3 ml-4" onclick="goEnrollment(this.form)">등록</button>
               </c:if>
                <input type="button"  class="btn btn-primary px-3 ml-4" value="취소" onClick="history.go(-1)"> 
                <input type="reset" class="btn btn-primary px-3 ml-4" value="초기화">
                </td>
            </tr>     
        </table>
        
 
        
    <!-- 모달 창 -->  
<!-- 	 <div class="modal fade" id="enrollmentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	 -->
        
    </form>
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