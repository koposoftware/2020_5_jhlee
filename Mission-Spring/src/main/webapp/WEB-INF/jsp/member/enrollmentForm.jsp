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
	
	
	function getAuthNo(){
      
		let phoneNo =$("#phoneNo").val()
		
		$.ajax({
    	url: "${pageContext.request.contextPath}/getAuthNo",
    	type:"post",
    	data : {
    		phoneNo : phoneNo
    	},
    	success:function(){
    		console.log('인증번호 보내기 성공!')
    	},
    	error : function(){
    		console.log('문자보내기 실패')
    	}
      })
		
	}
	
   function submitAuthNo(){
	 let inputAuthNo = $("#inputAuthNo").val()
	 
	 		$.ajax({
    	url: "${pageContext.request.contextPath}/submitAuthNo",
    	type:"post",
    	data : {
    		inputAuthNo : inputAuthNo
    	},
    	success:function(data){
    		console.log('인증번호 입력 성공!')
    		if (data == 'true') {
				alert("본인인증에 성공하였습니다.")
			} else {
				alert("인증번호가 틀립니다.다시 입력해주세요.")
			}
    		
    	},
    	error : function(){
    		console.log('인증번호 입력 실패')
    	}
      })
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


.btn-outline-primary{
border-width:0px!important;
font-size:20px!important;
font-weight:600;
height:35px;
}

.btn-outline-secondary{
height:35px!important;
font-weight:600;
font-size:20px!important;
}
th{
font-size:18px;
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
     
         <!-- r = $('input[name=password]').val(); -->
        <table class="table table-boardered">
        
            <tr>    
                <th>이름</th>
                <td ><input type="text" class="form-control" name="name" placeholder="이름을 입력하세요"></td>      
            </tr>
            <tr>
                <th>아이디</th>
                 <c:if test="${ empty adminLoginVO and empty loginVO}">     
                <td ><input type="text" class="form-control" name="id" placeholder="id를 입력하세요"></td> 
                </c:if>
                <c:if test="${ not empty adminLoginVO and empty loginVO}">          
                 <td ><input type="text" value="QUXZ098" class="form-control" name="id" style="color:blue"></td> 
                </c:if>
            </tr>
            <tr>
               <th>패스워드</th>
             <c:if test="${ empty adminLoginVO and empty loginVO}">     
                <td><input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요"></td> 
             </c:if>  
              <c:if test="${ not empty adminLoginVO and empty loginVO}">          
                 <td ><input type="text" value="ADSPX99"class="form-control" name="password" style="color:blue"></td> 
              </c:if>   
            </tr>
<!--              
            <tr>
                <th>패스워드확인</th>
                <td><input type="password" class="form-control" name="password2"></td>        
            </tr> -->
             <tr>
                <th>생년월일</th>
                <td><input type="text" class="form-control" name="birth" placeholder="ex)1994.08.08 -> 940808"></td>        
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
              
                <td>
                <select style="width:80px;height:35px;font-size:17px"> 
                <option>통신사</option>
                <option>KT</option>
                <option>SKT</option>
                <option>LGU+</option>
                <option>SKT(알뜰폰)</option>
                <option>KT(알뜰폰)</option>
                <option>LGU+(알뜰폰)</option>
                </select>
                
                <input id="phoneNo" type="text" class="form-control" name="phoneNo" placeholder="-표시 없이 입력" style="width:170px; margin-right:3px; display:inline-block;">
                 <button onclick="getAuthNo()"class="btn btn-outline-secondary">인증번호 받기</button>
                <br> 
                <input type="text" class="form-control" id="inputAuthNo" placeholder=" 인증번호입력 " style="display:inline-block; width:150px; align:right!important; margin-top:8px;margin-left:30px">
                <button onclick="submitAuthNo()"class="btn btn-outline-primary">인증하기</button></td>     
               
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
             <td> 
             <input type="text" name="post" id="post"  required="required" class="form-control">
             <button onclick="execDaumPostcode();" class="btn btn-outline-secondary" style="display:inline-block; width:150px!important; margin-top:5px; margin-bottom:5px;">주소검색</button>
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
            <tr>
                <th>개인정보 수집 목적 및 이용 목적 </th>	 
            	<td>
            	<textarea name="textarea" readonly="readonly" style="width:400px!important; height:100px!important">
[개인정보처리방침]       	 
하나은행(이하 “당행”이라 합니다)은 개인정보보호법 제30조에 따라 고객의 개인정보 및 권익을 보호하고 개인정보와 관련한 고객의
고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.

제1조(개인정보의 처리 목적)
당행은 개인정보를 다음 각 호의 목적을 위해 처리합니다. 수집된 개인정보는 다음의 목적 외의 용도로는 사용되지 않으며 이용 목적이
변경될 시에는 사전동의를 구할 예정입니다.

1. (금융)거래 관계 관련
(금융)거래와 관련하여 신용정보회사 또는 신용정보집중기관에 대한 개인신용정보의 조회, (금융)거래 관계의 설정 여부의 판단,
(금융)거래 관계의 설정·유지·이행·관리, 금융사고 조사, 분쟁 해결, 민원 처리 및 법령상 의무이행 등의 목적으로 개인정보를 처리합니다.

※ (금융)거래라 함은 은행업무(여신, 수신, 내·외국환), 겸영업무(펀드, 신탁, 파생상품, 방카슈랑스, 신용카드 등) 및
부수업무(팩토링, 보호예수, 수납 및 지급대행, 대여금고, 상품권 등 판매대행 등)와 이와 관련된 거래를 의미합니다.

2. 상품 및 서비스 홍보 및 판매 권유
고객 만족도 조사를 통한 신규 서비스 개발 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고의 게재, 서비스의 유효성 확인,
경품지급, 사은행사 등 고객의 편의 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계 등의 목적으로 개인정보를 처리합니다.

3. 회원 가입 및 관리
회원가입, 회원제 서비스 이용, 제한적 본인 확인제에 따른 본인확인, 개인식별, 부정이용방지, 비인가 사용방지, 가입의사 확인,
만14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인, 추후 법정 대리인 본인확인, 사고조사, 분쟁해결, 민원처리 및
고지사항 전달 등의 목적으로 개인정보를 처리합니다.

4. 온라인 거래 관련 목적
전자금융거래법 제21조, 제22조에 의해 전자금융거래의 내용 추적 및 검색, 보안정책 수립용 통계 자료로 활용 등을 목적으로 개인정보를
처리합니다.

제2조(개인정보의 처리 및 보유 기간)
(금융)거래와 관련한 개인(신용)정보는 수집·이용에 관한 동의일로부터 (금융)거래 종료일로부터 5년까지 위 이용목적을 위하여 보유·이용됩니다.

단, (금융)거래 종료일 이후에는 금융사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 및 당행의 리스크 관리업무만을 위하여 보유·이용됩니다.
개인(신용)정보의 조회를 목적으로 수집된 개인(신용)정보는 수집·이용에 대한 동의일로부터 고객에 대한 신용정보 제공·조회 동의의 효력
기간까지 보유·이용됩니다.

단, 신용정보 제공ㆍ조회 동의의 효력 기간 종료 후에는 금융사고 조사, 분쟁 해결, 민원처리 및 법령상 의무이행만을 위하여 보유·이용됩니다.
상품 및 서비스 홍보 및 판매 권유 등과 관련한 개인(신용)정보는 수집·이용에 관한 동의일로부터 동의 철회일까지 보유·이용됩니다.

단, 동의 철회일 후에는 제1조의 목적과 관련된 사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행만을 위하여 보유·이용됩니다.
회원 가입 및 관리 목적으로 수집된 개인(신용)정보는 고객의 회원 가입일로부터 회원 탈퇴일까지 보유·이용됩니다.
단 회원 탈퇴일 후에는 제1조의 목적과 관련된 사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 만을 위하여 보유·이용됩니다.
온라인 거래 관련한 개인(신용)정보는 전자금융거래법 시행령 제12조에서 정하는 기간까지 보유·이용됩니다.

제3조(개인정보 수집 출처 등 고지)
당행은 정보주체 이외로부터 수집한 개인정보를 처리하는 때에는 정당한 사유가 없는 한 정보주체의 요구가 있은 날로부터 3영업일 이내에
수집 출처, 처리 목적, 개인정보 처리의 정지를 요구할 권리가 있다는 사실을 정보주체에게 알립니다.
개인정보 보호법 제20조제4항 각 호에 근거하여 제1항에 따른 정보주체의 요구를 거부하는 경우에는, 정당한 사유가 없는 한 정보주체의
요구가 있은 날로부터 3영업일 이내에 그 거부의 근거와 사유를 정보주체에게 알립니다. 			 		
	 			 </textarea>
	 			 <input name="" type="checkbox" value="" style="border:0;background-color:#ffffff;">
	 			 <font color="#776091;"><b> 개인정보 취급방침에 동의함</b></font>
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