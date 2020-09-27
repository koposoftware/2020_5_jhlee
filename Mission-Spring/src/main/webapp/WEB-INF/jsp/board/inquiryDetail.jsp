<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>

	function getReplyList(){ //댓글 있는 곳 로드시, 댓글 추가 시 댓글리스트가 뜨게끔 
		//ajax통해서 해당 게시물의 댓글리스트를 조회  => <div id="replyList"></div> 조회데이터 업데이트 
		$.ajax({
			url : '${ pageContext.request.contextPath }/reply/${ inquiry.no }',
			type : 'get',
			success : function(data){ //db에서 가져와

			
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
				inquiryNo : ${ inquiry.no }, 
				content : content, 
				writer : writer
			}, 
			success : function(){
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
				url: '${ pageContext.request.contextPath }/reply/' + replyNo + '/${inquiry.no}',
				type: 'delete',
				success : function(){
					//alert('성공')
					getReplyList()
				},error: function(){
					alert('실패') 
				}
			});
			
		})
	})	
	
	function doAction(type){
		switch(type){
		case 'U' :    
			location.href = "'${ pageContext.request.contextPath }/updateBoardForm"
			break;
		case 'D' :
			if(confirm('삭제하시겠습니까?')){
				location.href="'${ pageContext.request.contextPath }/deleteBoardForm"; /*el은 자바스크립트에서 쌍따옴표 안에 집어 넣어야 한다 */
			}
			break;
		 case 'E' :
			if(confirm('해당 문의를 접수하시겠습니까?')){
				location.href="${ pageContext.request.contextPath }/enrollmentInquiry"; /*el은 자바스크립트에서 쌍따옴표 안에 집어 넣어야 한다 */
			}
			break;	
		case 'L' :
			location.href ="${ pageContext.request.contextPath }/inquiry/1/1";
			break;
		}
	}

</script>

</head>
<body>
<header>	
		<jsp:include page="/resources/assets/include/topMenu.jsp" />
	</header>
<%-- 	<c:if test="${ not empty adminLoginVO and empty loginVO}">
	<div id="jb-sidebar">
        <h4>손님과 함께 웃어요~!</h4>
        <ul>
          <li>상담 노트</li>
          <li>손님 정보 조회</li>
          <li>손님 상담 리스트</li>
        </ul>
      </div>
      </c:if> --%>
	<br>
	<br>
	<br>
	<section style="font-size:large">
	<br>
	<br><br><br>
      <div align="center">
          <div class="section-title">
          <h2>손님의 소중한 문의</h2>
        </div>
         <br>
         
         <div class="container">
         <form action="${ pageContext.request.contextPath }/enrollmentInquiry" method="post">
               <%--  <input type="hidden" value="${ inquiry.no }" name="consultingNo"> --%>
            	<input type="hidden" value="${ inquiry.writer }" name="id">
            	<input type="hidden" value="${ inquiry.writerName }" name="name">
            	<input type="hidden" value="${ inquiry.birth }" name="birth">
                <input type="hidden" value="${ inquiry.mainCategory }" name="mainCategory">
                <input type="hidden" value="${ inquiry.middleCategory }" name="middleCategory">
                <input type="hidden" value="${ inquiry.title }" name="title">
                <input type="hidden" value='${ inquiry.content }' name='consultingReport'>
                <input type="hidden" value="${ inquiry.consultingChannel}" name="consultingChannel">
                <input type="hidden" value="${ adminLoginVO.admin_name }" name="adminName">
                <input type="hidden" value="${ adminLoginVO.empno }" name="empno">
                <input type="hidden" value="${ inquiry.regDate }" name="reportYmd"> 
         <table style="width: 70%">
        <%--  <input type="hidden" value="${ board.replyCnt }"> --%>
            <tr>
               <th width="15%">번호</th>
               <td class="jj">${ inquiry.no }</td>
            </tr>
             <tr>
               <th width="15%">대분류</th>
               <td class="jj"><c:out value="${ inquiry.mainCategory }" /></td>
            </tr>
            <tr>
               <th width="15%">중분류</th>
               <td class="jj"><c:out value="${ inquiry.middleCategory }" /></td>
            </tr>
            <tr>
               <th width="15%">제목</th>
               <td class="jj"><c:out value="${ inquiry.title }" /></td>
            </tr>
            <tr>
               <th width="15%">글쓴이</th>
               <td class="jj"><c:out value="${ inquiry.writer }" /></td>
            </tr>
            <tr>
               <th width="15%">내용</th>
               <td class="jj">${ inquiry.content }</td>
            </tr>
            <tr>
               <th width="15%">조회수</th>
               <td class="jj">${ inquiry.viewCnt }</td>
            </tr>
            <tr>
               <th width="15%">등록일</th>
               <td class="jj">${ inquiry.regDate } </td>
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
         <br><br>
         <c:if test="${ not empty adminLoginVO and empty loginVO}"> 
         <input type="submit" value="접수" class="btn btn-primary px-3 ml-4" onclick="doAction('E')">&nbsp;&nbsp; 
         </c:if>
         &nbsp;&nbsp;<input type="button"  value="삭제" class="btn btn-primary px-3 ml-4" onclick="doAction('D')">&nbsp;&nbsp; 
         &nbsp;&nbsp;<input type="button"  value="목록" class="btn btn-primary px-3 ml-4" onclick="doAction('L')">&nbsp;&nbsp;
         <c:if test="${ empty adminLoginVO and  not empty loginVO}"> 
         <input type="button" value="수정" class="btn btn-primary px-3 ml-4" onclick="doAction('U')">&nbsp;&nbsp; 
         </c:if>
            </form>
         </div>
       
         
       
         <%-- <c:if test="${ not empty adminLoginVO and empty loginVO}"> 
         <input type="submit" value="접수" class="btn btn-primary px-3 ml-4" onclick="doAction('E')">&nbsp;&nbsp; 
         </c:if> --%>
 
         <c:if test="${ not empty adminLoginVO and empty loginVO}"> 
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <!--  <input type="button"  style="align:right" value="상담접수" class="btn btn-primary px-3 ml-4" onclick="doAction('R')">&nbsp;&nbsp; -->
         </c:if>
         <br>
         <br>
         <br>
      <%--   <hr style="width:70%">
        <img src="/Mission-Spring/resources/assets/img/reply2.JPG" /><div class="reply"> 댓글 ${ board.replyCnt }건 </div> --%>
        <div id="replyCnt"></div>
		<%-- 고객님의 문의 내역을 접수한 ${ inquiry.adminName }[${inquiry.empno}]( ${ inquiry.consultingChannel})입니다. --%>
		<br>
		<br>	
		<div id="replyList" style="width:70%" align="left"></div> 
		<br>
		<br>
		
		 <div class="col-lg-8 col-xl-9">
                        <div class="card">
                            <div class="card-body">
                                <form name="rform" class="form-profile">
                                    <div class="form-group">
                                        <textarea class="form-control" id="textarea" cols="30" rows="2" placeholder="댓글 작성" name="content"></textarea>
                                    </div>
                                    <div class="d-flex align-items-center">
                                    <c:if test="${ not empty adminLoginVO and empty loginVO}">  
                                      <input type="hidden" class="btn btn-outline-light text-dark" name="writer" value="${ adminLoginVO.empno }"> 
                                    </c:if>
                                    <c:if test="${ empty adminLoginVO and not empty loginVO}">  
                                      <input type="hidden" class="btn btn-outline-light text-dark" name="writer" value="${ loginVO.id }"> 
                                    </c:if>     
                                        <input type="button" class="btn btn-primary px-3 ml-4" id="replyAddBtn" name="replyAddBtn" value="Send"></button>
                                    </div>
                                </form>
                            </div>
                        </div>
      </div>
      </div>
   </section>
   	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
   <footer>
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 

</body>
</html>