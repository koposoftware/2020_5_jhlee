<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<%-- <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include> 
 --%>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  

<script>
function goWrite(frm) {
   var title = frm.title.value;
 //  var writer = frm.writer.value;
   var content = frm.content.value;
   
   if (title.trim() == ''){
      alert("제목을 입력해주세요");
      return false;
   }
/*    if (writer.trim() == ''){
      alert("작성자를 입력해주세요");
      return false;
   } */
   if (content.trim() == ''){
      alert("내용을 입력해주세요");
      return false;
   }
   frm.submit();
}


$(document).ready(function(){
	var pr=['예금','적금','카드','대출','연금','펀드','보험','외환','수표','금'];
	var ex=['모바일','인터넷','콜센터','창구','원격'];
	var et=['기타'];
		$('.f0').change(function(){
			var sel = $(this).val();
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

  $(document).ready(function() {
	  $('#summernote').summernote({
	    	placeholder: '문의 내용을 입력해주세요',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	        fontNames: ['verdana','Arial','Arial Black','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });
	}); 
 
 /*  $(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({

		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });
});   */
	 
</script>

<style>
.panel-default {
    width: 80%;
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
   <br>
   <br>
      <div align = "center" style="font-size:15px">
      <hr width="60%">
      <h1 style="font-size: 25px;">문의하기</h1>
      <hr width="60%">      
      <br>
      
      <form method="post" autocomplete="off">
      <table style="width:60%"> <!--  -->
                <tr>
                   <th width="23%">제목</th>
                   <td>
                      <input type="text" name="title" style="width:80%" placeholder="제목을 입력해주세요">
                   </td>
                </tr>
                <tr>
                   <th>글쓴이 </th>
                   <td>
                      ${loginVO.id }
                      <input type="hidden" name="writer" value=${loginVO.id} >
                   </td>
                </tr>
             <tr>
                <th>대분류</th>
                <td>
                 <select name="mainCategory" class="f0" style="width:20%">
                    <option>선택하세요</option>
                    <option value="금융상품">금융상품</option>
                    <option value="금융경험">금융경험</option>
                    <option value="기타">기타</option>
                 </select>
                 </td> 
            </tr>        
            <tr>
            	<th>중분류</th> 
            	<td>
                  <select name="middleCategory" class="f1" style="width:20%">
                    <option>선택하세요</option>
                 </select>
                </td>     
            </tr>
              
                <tr>
                   <th>내용</th>
                   <td>
                      <textarea id="summernote" width="60%" name="content" style="text-align: left;"></textarea>
                   </td>
                </tr>
             </table>
             <button type="submit" class="btn btn-outline-light text-dark" onclick="goWrite(this.form)">등록</button>
      </form>
      
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
 <%--    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include>  --%>
</body>
</html>