<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>상담 노트</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  

<!-- Custom styles for this template -->
<link href="/resources/assets/css/form-validation.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script>
  function goMember(customerId){
		location.href="${ pageContext.request.contextPath }/myPage/" + customerId;
}
  
  function goWrite(frm) {
	   var mainCategory = frm.mainCategory.value;
	   var middleCategory = frm.middleCategory.value;
	   var title = frm.title.value;
	   var content = frm.content.value;
	   
	   if (mainCategory.trim() == ''){
	      alert("대분류를 선택해주세요");
	      return false;
	   }
	    if (middleCategory.trim() == ''){
	      alert("중분류를 입력해주세요");
	      return false;
	   } 
	   if (title.trim() == ''){
	      alert("제목을 입력해주세요");
	      return false;
	   }
	   if (content.trim() == ''){
		      alert("내용을 입력해주세요");
		      return false;
		   }
	   frm.submit();
	 /*   location.href="${ pageContext.request.contextPath }/consultingNote"; */
	}
 
  
  
  
  $(document).ready(function(){
		var pr=['예금','적금','카드','대출','연금','펀드','보험','외환','수표','금'];
		var ex=['모바일','인터넷','콜센터','창구','원격'];
		var et=['기타'];
			$('.f0').change(function(){
				var sel = $(this).val();
				console.log(sel);
				if(sel == '금융상품'){
					$('.op').remove();
					$.each(pr,function(i,item){
						$('.f1').append('<option class="op">'+item+'</option>');
					});
				}
				if(sel == '금융경험'){
					$('.op').remove();
					$.each(ex,function(i,item){
						$('.f1').append('<option class="op">'+item+'</option>');
					});
				}
				if(sel == '기타'){
					$('.op').remove();
					$.each(et,function(i,item){
						$('.f1').append('<option class="op">'+item+'</option>');
					});
				}
			});
	});  
  
  
 
</script>
<style>
button, input{
font-size:20px;
}
p{
font-size:20px;
}
textarea{
font-size:20px;
}
select{
font-size:20px;
}


a:hover{
color:blue;
}
h5{
color:black;
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
	<br>
	<section class="section">
  	<div class="container">
  	<br><br>
  	 <c:forEach items="${ customerInform }" var="customer" end="0">
  <%-- 	  <div class="section-title">
          <h2>${ customer.name }님의 상담 노트</h2>
         
        </div> --%>
  	
  	<form autocomplete="off" action="${ pageContext.request.contextPath }/consultingNote"
  			method="post"><%--  action="${ pageContext.request.contextPath }/consultingNote --%>
    <div class="row"> 
      <div class="col-lg-10 mx-auto">
        <div class="p-5 shadow rounded content">
          <h2> <i class="icofont-pencil-alt-5"></i> ${ customer.name }님의 상담을 기록하세요</h2> <hr>
<%--             <input type="hidden" name="id" value=${ customer.id } >  --%>
            <input type="hidden" name="customerType" value=${ customer.customerType } >
          <p>
       		   담당직원사번 : ${ adminLoginVO.empno } 
       		           <input type="hidden" name="empno" value=${ adminLoginVO.empno } > 
       	     			<br>
       	     			
       	            상담채널 :  <select name="consultingChannel" style="width:20%">
                    <option>선택하세요</option>
                    <option value="창구">창구</option>
                    <option value="콜센터">콜센터</option>
                    <option value="원격">원격</option>
                    <option value="인터넷">인터넷</option>
                 </select> <br>
                             
                             고객ID : ${ customer.id }
                     <input type="hidden" name="id" value=${ customer.id } ><br>
                             
                             고객이름 : <a href="javascript:goMember('${ customer.id }')" style="color:#2C4964">${ customer.name }</a>
                     <input type="hidden" name="name" value=${ customer.name } ><br>
                           
                             생년월일 : ${ customer.birth } 
                     <input type="hidden" name="birth" value=${ customer.birth } ><br>   
             <hr>
                           
       <h5> 대분류 :  <select name="mainCategory" class="f0" style="width:20%">
                     <option>선택하세요</option>
                     <option value="금융상품">금융상품</option>
                     <option value="금융경험">금융경험</option>
                     <option value="기타">기타</option>
                    </select> &nbsp;&nbsp;&nbsp;
                    
                중분류 : <select name="middleCategory" class="f1" style="width:20%">
                     <option>선택하세요</option>
	                </select><br></h5><hr>
	               
                 
         <h5>제목    :</h5> <input type="text" name="title" style="width:100%" placeholder="*문의내역을 요약한 한 줄 제목을 입력해주세요">
                    <br><br>
                    
         <h5>상담리포트 :</h5>  <textarea name="consultingReport" id="report" style="text-align: left; width:100%; height:200%" placeholder="*필수입력 [ 문의 내용, 손님 성향, 상품가입유무, 추가 관심사항 또는 불만사항 (만족 /불만족 표기) ]"></textarea>
          </p>
          <hr>
          <input type="hidden" name="ha" value="문의내용:"><input type="hidden" name="hb" value="#손님성향:">
          <input type="hidden" name="hc" value="#안정추구형"><input type="hidden" name="hd" value="#중립형">
          <input type="hidden" name="he" value="#적극투자형"><input type="hidden" name="hf" value="#블랙">
          <input type="hidden" name="hg" value="#상품가입완료"><input type="hidden" name="hh" value="#상품가입미완료"> 
          <input type="hidden" name="hi" value="#추후가입희망"><input type="hidden" name="hj" value="추가관심사항:">
          <input type="hidden" name="hk" value="#추가불만사항:"><input type="hidden" name="hl" value="#관심도높음">
          <input type="hidden" name="hm" value="#만족"><input type="hidden" name="hn" value="#불만족">
         <div style="font-size:20px"> 
         <a href="#" onclick="ha()">문의내용:</a>
         <a href="#" onclick="hb()">#손님 성향 :</a> <a href="#" onclick="hc()"> #안정추구형 </a> 
         <a href="#" onclick="hd()">#중립형</a> <a href="#" onclick="he()">#적극투자형</a>
         <br><a href="#" onclick="hf()">#블랙</a> <a href="#" onclick="hg()">#상품가입유</a> 
         <a href="#" onclick="hh()">#상품가입무</a> <a href="#" onclick="hi()">#추후가입희망</a> 
         <br><a href="#" onclick="hj()">#추가관심사항:</a> <a href="#" onclick="hk()">#추가불만사항</a> 
         <a href="#" onclick="hl()">#관심도높음</a> <a href="#" onclick="hm()">#만족</a> <a href="#" onclick="hn()">#불만족 </a> </div>
          <br><br>
	    <button type="submit" class="btn btn-primary px-3 ml-4" onclick="goWrite(this.form)" >등록</button>
		<input type="button"  class="btn btn-primary px-3 ml-4" value="취소" onClick="history.go(-1)"> 
		</div>
	</div>
	</div>
	</form>
		</c:forEach>
          </div>

<script>
function ha(){
	  var text =$('input[name=ha]').val();
	  document.getElementById("report").value +=text; 
}


function hb(){
	  var text =$('input[name=hb]').val();
	  document.getElementById("report").value +=text;
}
function hc(){
	  var text =$('input[name=hc]').val();
	  document.getElementById("report").value +=text;
} 
function hd(){
	  var text =$('input[name=hd]').val();
	  document.getElementById("report").value +=text;
} 
function he(){
	  var text =$('input[name=he]').val();
	  document.getElementById("report").value +=text;
} 
function hf(){
	  var text =$('input[name=hf]').val();
	  document.getElementById("report").value +=text; 
} 
function hg(){
	  var text =$('input[name=hg]').val();
	  document.getElementById("report").value +=text;
} 
function hh(){
	  var text =$('input[name=hh]').val();
	  document.getElementById("report").value +=text;
} 
function hi(){
	  var text =$('input[name=hi]').val();
	  document.getElementById("report").value +=text;
} 
function hj(){
	  var text =$('input[name=hj]').val();
	  document.getElementById("report").value +=text;
}  
function hk(){
	  var text =$('input[name=hk]').val();
	  document.getElementById("report").value +=text;  
} 
function hl(){
	  var text =$('input[name=hl]').val();
	  document.getElementById("report").value +=text; 
} 
function hm(){
	  var text =$('input[name=hm]').val();
	  document.getElementById("report").value +=text; 
}
function hn(){
	  var text =$('input[name=hn]').val();
	  document.getElementById("report").value +=text; 
}

</script>	
</section> 
	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include>
      
</body>
</html>