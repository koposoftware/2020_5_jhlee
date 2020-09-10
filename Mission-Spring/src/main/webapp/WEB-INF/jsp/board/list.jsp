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
 
 <link href="/resources/assets/css/board.css" rel="stylesheet">
 <link href="/resources/assets/css/jin.css" rel="stylesheet">
 <link href="/resources/assets/css/style.css" rel="stylesheet"> 
 
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  

<script>
   function goWriteForm(){
      location.href = "${ pageContext.request.contextPath }/board/write"; 
   }
   
   
   function doAction(boardNo){   //가상의 url 찾을 때는  ${ pageContext.request.contextPath } 써야함!   
   // location.href = "${ pageContext.request.contextPath }/board/detail?no=" + boardNo;   
      location.href = "${ pageContext.request.contextPath }/board/" + boardNo;   //이런 방식으로 보내주기
   }
   


</script>

<style>
.jj{
	border-bottom:1px solid #4F76A3;
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
      <div align = "center">
      <hr width="60%">
      <h4>Q&A</h4>
      <hr width="60%">      
      <br>
      <br>
      <table style="width: 60%">
         <tr class="jj">
            <th width="7%">번호</th>
            <th width="10%">대분류</th>
            <th width="8%">중분류</th>
            <th>제목</th>
            <th width="10%"></th>
            <th width="8%" align="center">글쓴이</th>
            <th width="14%">등록일</th>
            <c:if test="${not empty adminLoginVO and empty loginVO }"> 
            <th width="7%">접수</th>
            </c:if>
         </tr>
         
         <c:forEach items="${ boardList }" var="board" varStatus="loop">
            <tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
               <td class="jj">${ board.no }</td>
               <td class="jj">${ board.mainCategory }</td>
               <td class="jj">${ board.middleCategory }</td>
               <td class="jj">
                  <!-- 로그인 해야 상세 페이지 보게끔! board.no를 보내줌 -->
                  <a href="javascript:doAction(${ board.no })">
                     <c:out value= "${ board.title }" />
                  </a>
                 </td> 
               <td class="jj" style="padding-right: 8px; font-size: 14px; color:red; align:right">   
                                 댓글 ${ board.replyCnt }건
               </td>
               <td class="jj">${ board.writer }</td>
               <td class="jj">${ board.regDate }</td>
               
               <c:if test="${not empty adminLoginVO and empty loginVO }"> 
               <td class="jj"><input type="button" value="접수"></td>
               </c:if>
               
            </tr>
         </c:forEach>       
      </table>
      <br>

      
      <%-- <button>새글등록</button>  이렇게 버튼을 통해서 가게 해주려면 javascript나 jquery 문법 필요함 --%>
      <!-- 로그인 되어있을 때만 새 글 등록하게! -->
      <c:if test="${ not empty loginVO }">
         <button onclick="goWriteForm()" class="btn btn-outline-light text-dark" style="align:write">문의하기</button>  
      <br>
      </c:if>
  <!-- 검색기능  -->
  <br>
   <div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType" id="searchType">

					<option value="title">제목</option>

					<option value="Content">본문</option>

					<option value="reg_id">작성자</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>

			<div>
				<button class="btn btn-outline-light text-dark" name="btnSearch" style="width:100pt" id="btnSearch">검색</button>
			</div>
		</div>
   </div>
   </section>
   
   <footer>
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
</body>
</html>