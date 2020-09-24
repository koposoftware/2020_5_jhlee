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
  	  <div class="section-title">
          <h2>${ customer.name }님의 상담 노트</h2>
         
        </div>
  	
  	<form autocomplete="off" action="${ pageContext.request.contextPath }/consultingNote"
  			method="post"><%--  action="${ pageContext.request.contextPath }/consultingNote --%>
    <div class="row"> 
      <div class="col-lg-10 mx-auto">
        <div class="p-5 shadow rounded content">
          <h2>${ customer.id }님의 상담</h2>
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
                 </select> <br>
                             
                             고객ID : ${ customer.id }
                     <input type="hidden" name="id" value=${ customer.id } ><br>
                             
                             고객이름 : <a href="javascript:goMember('${ customer.id }')" style="color:#2C4964">${ customer.name }</a>
                     <input type="hidden" name="name" value=${ customer.name } ><br>
                           
                             생년월일 : ${ customer.birth } 
                     <input type="hidden" name="birth" value=${ customer.birth } ><br>   
             <hr>
                           
                             대분류 :  <select name="mainCategory" class="f0" style="width:20%">
                     <option>선택하세요</option>
                     <option value="금융상품">금융상품</option>
                     <option value="금융경험">금융경험</option>
                     <option value="기타">기타</option>
                    </select> <br><br>
                   
                            중분류 :  <select name="middleCategory" class="f1" style="width:20%">
                     <option>선택하세요</option>
	                </select><br><hr>
	               
                 
                             제목    : <input type="text" name="title" style="width:100%" placeholder="*문의내역을 요약한 한 줄 제목을 입력해주세요">
                    <br><br>
                    
                             상담리포트 :  <textarea name="consultingReport" style="text-align: left; width:100%; height:100%" placeholder="*필수입력 [ 문의 내용, 고객 성향, 상품가입유무, 추가 관심사항 또는 불만사항 (만족 /불만족 표기) ]"></textarea>
          </p>
	    <button type="submit" class="btn btn-primary px-3 ml-4" onclick="goWrite(this.form)" >등록</button>
		<input type="button"  class="btn btn-primary px-3 ml-4" value="취소" onClick="history.go(-1)"> 
		</div>
	</div>
	</div>
	</form>
		</c:forEach>
          </div>
	
</section> 
	<footer id="footer" style="margin-top:200px">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include>
      
</body>
</html>