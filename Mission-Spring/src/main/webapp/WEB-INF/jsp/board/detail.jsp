<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
 <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
 <link href="/resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
 <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
 <link href="/resources/assets/vendor/venobox/venobox.css" rel="stylesheet">
 <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
 <link href="/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
 <link href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
 <link href="/resources/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

 <link href="/resources/assets/css/jin.css" rel="stylesheet">
 <link href="/resources/assets/css/style.css" rel="stylesheet"> 
 
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>

	function getReplyList(){ //댓글 있는 곳 로드시, 댓글 추가 시 댓글리스트가 뜨게끔 
		//ajax통해서 해당 게시물의 댓글리스트를 조회  => <div id="replyList"></div> 조회데이터 업데이트 
		$.ajax({
			url : '${ pageContext.request.contextPath }/reply/${ board.no }',
			type : 'get',
			success : function(data){

			
// 				$('#replyList').empty(); //조회에 있던것 지우기 위해
				$('#replyCnt').empty(); //조회에 있던것 지우기 위해 

				console.log(typeof data)
				
				let list = JSON.parse(data); //datatype : string--> json으로 바꾸자 
				//console.log(list)
				//console.log(list.length)
				let replyCnt = list.length
				let st = '';
				st += '<hr style="width:70%">';
		        st += '<img src="/Mission-Spring/resources/assets/img/reply2.JPG" />댓글'+ replyCnt +'건 '
		        st += '<hr style="width:70%">';
		       // st +='<br>';
		        $("#replyCnt").append(st);
		        
				$('#replyList').html('');
				
				$(list).each(function(){ //반복문 돌림
// 					console.log(this)
					let str = '';
					//str += '<hr style="width:70%">';
					//str += '<div>' + replyCnt + "건</div>"
					str += '<div>' 
					//str += '<br>'
					str += "<img src=' /Mission-Spring/resources/assets/img/reply.JPG' />";
					str += '<strong>' + this.content +'</strong>';
					str += '<div align="right">'
					str += '&nbsp;(' + this.writer +')'
					str += '&nbsp;&nbsp;&nbsp;' + this.regDate +'&nbsp;&nbsp;&nbsp;'
					str += '</div>'
					str += '<button class="btn btn-outline-secondary" id=' + this.no +'>삭제 </button>'  /* class="btn btn-outline-light text-dark" */
					str += '<br>'
					str += '<hr>';
					str += '<div>'
					
				$('#replyList').append(str); //str값 넣어주기 밑에 id가 replylist인 자리에 
// 				$('#replyList').append("<img src=' /Mission-Spring/resources/assets/img/reply.JPG' />");	
				})				
				
			},
			error : function(){
				alert('실패')
			}
		})
	}

$(document).ready(function(){
	
	$('#replyAddBtn').click(function(){
		let content = document.rform.content.value;
		let writer = document.rform.writer.value;
		
		//  /reply/insert?boardNo=12&content=aaa&writer=bbb 
				
		$.ajax({
			url : '${ pageContext.request.contextPath }/reply',
			type : 'post',
			data : {
				inquiryNo : ${ board.no }, 
				content : content, 
				writer : writer 
			}, 
			success : function(){
			
// 				window.location.reload();
				getReplyList(); //전체 댓글리스트 호출
			}, 
			error : function(){
				alert('실패')
			}, complete : function(){
				//성공하던 실패하던 경우 값 지워주기 화면단에서
				document.rform.content.value ='';
				/* document.rform.writer.value =''; */
			}
			
		})		
	})
})

	$(document).ready(function(){
		getReplyList();
	})
	
	
	$(document).ready(function(){
		$(document).on('click','.btn-outline-secondary', function(){ //delBtn클릭했을 때 ---해라 동적으로 만든애는 그냥 안붙고 on을 써줘야 함. 
			
			if(!confirm('댓글을 삭제하시겠습니까?'))return;
			
			let replyNo = $(this).attr('id'); //버튼객체의 id = no를 가져옴 
			
			$.ajax({ //삭제하기 위해서 ajax통신 다시 
				url: '${ pageContext.request.contextPath }/reply/' + replyNo + '/${board.no}',
				type: 'delete',
				success : function(){
					//alert('성공')
					getReplyList()
				},error: function(){
					alert('실패')
				}
			});
			
/* 			$.ajax({ //삭제하기 위해서 ajax통신 다시 
				url: '${ pageContext.request.contextPath }/reply/' + replyNo,
				type: 'delete',
				success : function(){
					//alert('성공')
					getReplyList()
				},error: function(){
					alert('실패')
				}
			}); */
		})
	})	
	
	function doAction(type){
		switch(type){
		case 'U' :    
			location.href = "/IntegratedAccountSystem/updateBoardForm.do?no=${ param.no }"
			break;
		case 'D' :
			if(confirm('삭제하시겠습니까?')){
				location.href="/IntegratedAccountSystem/delete.do?no=${ param.no }"; /*el은 자바스크립트에서 쌍따옴표 안에 집어 넣어야 한다 */
			}
			break;
		case 'L' :
			location.href ="${ pageContext.request.contextPath }/board";
			break;
		}
	}

</script>

</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
	</header>
	<div id="jb-sidebar">
        <h4>손님과 함께 smile~!</h4>
        <ul>
          <li>상담노트</li>
          <li>고객정보조회</li>
          <li>미정</li>
        </ul>
      </div>
	<br>
	<br>
	<br>
	<section>
	<br>
	<br>
	<br>
      <div align="center">
         <hr width="70%">
         <h2 class="titles">손님의 소중한 문의</h2>
         <hr width="70%">
         <br>
         <div class="container">
         <table style="width: 70%">
        <%--  <input type="hidden" value="${ board.replyCnt }"> --%>
            <tr>
               <th width="15%">번호</th>
               <td class="jj">${ board.no }</td>
            </tr>
             <tr>
               <th width="15%">대분류</th>
               <td class="jj"><c:out value="${ board.mainCategory }" /></td>
            </tr>
            <tr>
               <th width="15%">중분류</th>
               <td class="jj"><c:out value="${ board.middleCategory }" /></td>
            </tr>
            <tr>
               <th width="15%">제목</th>
               <td class="jj"><c:out value="${ board.title }" /></td>
            </tr>
            <tr>
               <th width="15%">글쓴이</th>
               <td class="jj"><c:out value="${ board.writer }" /></td>
            </tr>
            <tr>
               <th width="15%">내용</th>
               <td class="jj">${ board.content }</td>
            </tr>
            <tr>
               <th width="15%">조회수</th>
               <td class="jj">${ board.viewCnt }</td>
            </tr>
            <tr>
               <th width="15%">등록일</th>
               <td class="jj">${ board.regDate } </td>
            </tr>
            <c:if test="${ not empty fileList }">
                  <tr>
                     <th>첨부파일</th>
                  <td>
                     <c:forEach items="${ fileList }" var="file">
                        <a href="${ pageContext.request.contextPath }/upload/${ file.fileSaveName }">
                           ${ file.fileOriName } 
                        </a>
                        (${ file.fileSize } bytes)<br>
                     </c:forEach>
                  </td>
               </tr>
               
            </c:if>
         </table>
         </div>
         
         <br>
         <input type="button" value="수정" class="btn btn-outline-light text-dark" onclick="doAction('U')">&nbsp;&nbsp; 
         &nbsp;&nbsp;<input type="button"  value="삭제" class="btn btn-outline-light text-dark" onclick="doAction('D')">&nbsp;&nbsp; 
         &nbsp;&nbsp;<input type="button"  value="목록" class="btn btn-outline-light text-dark"onclick="doAction('L')">&nbsp;&nbsp;
         
         <br>
         <br>
         <br>
      <%--   <hr style="width:70%">
        <img src="/Mission-Spring/resources/assets/img/reply2.JPG" /><div class="reply"> 댓글 ${ board.replyCnt }건 </div> --%>
        <div id="replyCnt"></div>
		고객님의 문의 내역을 접수한 ${ board.adminName }[${board.empno}]( ${ board.consultingChannel})입니다.
		<br>
		<br>	
		<div id="replyList" style="width:70%" align="left"></div> 
		<br>
		<br>
		<table frame="box" style="width:70%" class="dd" >
		<td class="jj">
		<form name="rform" class="titles" style="height:100px" autocomplete="off">
		&nbsp;&nbsp;<strong> 댓글 :</strong> 
		<textarea class="btn btn-outline-light text-dark" cols="50" name="content" style="text-align: left; height: 100px; resize: none;"></textarea>
		&nbsp; 
		<strong>작성자:</strong>
		<input type="hidden" class="btn btn-outline-light text-dark" name="writer" value="${ loginVO.id }" size="10"> ${ loginVO.id }&nbsp;
		<input type="button" class="btn btn-outline-light text-dark" value="댓글추가 " id="replyAddBtn" name="replyAddBtn">
		</form>       
		</td>
		</table>
      </div>
   </section>
   
   <footer>
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 

</body>
</html>