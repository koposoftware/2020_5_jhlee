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

<script>
   function goWriteForm(){
      location.href = "${ pageContext.request.contextPath }/board/inquiryWrite"; 
   }
   
   
   function doAction(inquiryNo){   //가상의 url 찾을 때는  ${ pageContext.request.contextPath } 써야함!   
   // location.href = "${ pageContext.request.contextPath }/board/detail?no=" + boardNo;   
      location.href = "${ pageContext.request.contextPath }/inquiry/" + inquiryNo;   //이런 방식으로 보내주기
   }
   
   function doAlert(){
	   alert('작성자 본인만 확인할 수 있습니다. 글쓴이를 확인해주세요!')
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
	<br><br><br>
	<section>
	<br>
	<br>
      <div align = "center">  
        <div class="section-title">
          <h2>Q&A</h2>
       <c:if test="${ not empty loginVO }">
         <button onclick="goWriteForm()" class="btn btn-primary px-3 ml-4" style="align:write; margin-left: 63%!important;">문의하기</button>  
      </c:if>
        </div>    
      <table style="width:70%;font-size:large;">
         <tr class="jj" style="font-size:20px">
            <th width="7%">번호</th>
            <th width="10%">대분류</th>
            <th width="8%">중분류</th>
            <th>제목</th>
            <th width="10%"></th>
            <th width="8%" align="center">글쓴이</th>
            <th width="14%">등록일</th>
          <%--   <c:if test="${not empty adminLoginVO and empty loginVO }"> 
            <th style="width:7%; padding-left:35px">접수</th>
            </c:if> --%>
         </tr>
         
         <c:forEach items="${ inquiryList }" var="inquiry" varStatus="loop">
            <tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
               <td class="jj">${ inquiry.no }</td>
               <td class="jj">${ inquiry.mainCategory }</td>
               <td class="jj">${ inquiry.middleCategory }</td>
               <c:choose>
               <c:when test="${ inquiry.writer eq loginVO.id }">
               <td class="jj">
                  <!-- 로그인 해야 상세 페이지 보게끔! board.no를 보내줌 -->
                  <a href="javascript:doAction(${ inquiry.no })">
                     <c:out value= "${ inquiry.title }" />
                  </a>
               </td> 
               </c:when>
               <c:when test="${ not empty adminLoginVO and empty loginVO }">
               <td class="jj">
                  <!-- 로그인 해야 상세 페이지 보게끔! board.no를 보내줌 -->
                  <a href="javascript:doAction(${ inquiry.no })">
                     <c:out value= "${ inquiry.title }" />
                  </a>
               </td> 
               </c:when>
               <c:otherwise>
               <td class="jj">
                 <a href="javascript:doAlert()"> 
                    <c:out value= "${ inquiry.title }" />
                 </a> 
                </td>  
                </c:otherwise>
                </c:choose>
               <td class="jj" style="padding-right: 8px; font-size: 14px; color:#D70037; align:right">   
                                 댓글 ${ inquiry.replyCnt }건
               </td>
               <td class="jj"><strong>${ inquiry.writer }</strong></td>
               <td class="jj">${ inquiry.regDate }</td>
               
               <%-- <c:if test="${not empty adminLoginVO and empty loginVO }"> 
               <td class="jj"><input type="button" class="btn btn-primary px-3 ml-4" value="접수" style="align:center"></td>
               </c:if> --%>
               
            </tr>
         </c:forEach>       
      </table>
      <br>
<!-- ====페이징======================================================================================= -->
	<div><!--style="margin-left: 10%"  -->
<!-- ---------이전 버튼 구현 --------------------------- -->
			<c:if test="${blockNo != 1 }"> 
				<a href= "${pageContext.request.contextPath}/inquiry/${blockNo - 1}/${blockStartPageNo-1 }">이전</a> &nbsp;
			</c:if>
			
<!-- ---------페이지 구현 --------------------------- -->			
			<c:forEach var="i" begin="${blockStartPageNo }" end="${blockEndPageNo }">
				<c:choose>
				
					<c:when test="${pageNo == i }"> <!-- 현 페이지 넘버와 클릭할수있는 페이지 넘버가 같으면 링크없애줌 -->
						${i }&nbsp;|&nbsp;
					</c:when>
					
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/inquiry/${blockNo}/${i }">${i }&nbsp;</a>|&nbsp;
					</c:otherwise>
					
				</c:choose>
			</c:forEach>
			
<!-- ---------다음 버튼 구현 --------------------------- -->	
			<c:if test="${blockNo != totalBlockCnt}">&nbsp;
				<a href="${pageContext.request.contextPath}/inquiry/${blockNo + 1}/${blockEndPageNo+1 }">다음</a> &nbsp;
			</c:if>
	</div>	
<!-- ==== 페이징 끝! ================================================================== -->	

      
      <%-- <button>새글등록</button>  이렇게 버튼을 통해서 가게 해주려면 javascript나 jquery 문법 필요함 --%>
      <!-- 로그인 되어있을 때만 새 글 등록하게! -->
    
  <!-- 검색기능  -->
  <br>
   <div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select>
			</div>
			
			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-primary px-3 ml-4" name="btnSearch" style="width:100pt" id="btnSearch">검색</button>
			</div>
		</div>
   </div>
   </section>
   
 <script>

function searchInquiry() {
	let title = $("#title").val()
	let writer = $("#writer").val()

	console.log(title)
	console.log(writer)
	

	if(title != '' || writer != '' ) {
	
	$.ajax({
		url : "${pageContext.request.contextPath}/searchInquiry",
		type : 'get',
		data : {
			title :  writer,
			digitalEdu : digitalEdu
			
		},
		success : function(data) {
			console.log("성공")
			let md = JSON.parse(data) 
			console.log(md)
			$("#boardList").empty()
			for (key in md) {
				
				console.log(md[key]["id"])
				
				let str = ""
				
				str += "<tr>";
				str += '<td>' + '☆' +'</td>'
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
                
                $("#boardList").append(str)

			}
			
		},
		error : function() {
			console.log("실패")
		}
	
	})
} else {
	location.href = "${pageContext.request.contextPath}/inquiry"
    
    }		
  }


</script>  
   
    <br><br><br><br><br><br><br><br>
     <br><br><br><br><br><br><br><br>
   <footer id="footer">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
</body>
</html>