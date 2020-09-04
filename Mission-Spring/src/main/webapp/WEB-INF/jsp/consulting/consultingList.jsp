<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>상담리스트</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="/resources/assets/css/offcanvas.css" rel="stylesheet">
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include> 

 
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
	 <c:if test="${ not empty adminLoginVO and empty loginVO}">  
       <main role="main" class="container">
      <div class="my-3 p-3 bg-white rounded box-shadow">
        <h6 class="border-bottom border-gray pb-2 mb-0">최근 상담 업데이트</h6>
        <div class="media text-muted pt-3">
          <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
          <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <strong class="d-block text-gray-dark">@username</strong>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
          </p>
        </div>
        <div class="media text-muted pt-3">
          <img data-src="holder.js/32x32?theme=thumb&bg=e83e8c&fg=e83e8c&size=1" alt="" class="mr-2 rounded">
          <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <strong class="d-block text-gray-dark">@username</strong>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
          </p>
        </div>
        <div class="media text-muted pt-3">
          <img data-src="holder.js/32x32?theme=thumb&bg=6f42c1&fg=6f42c1&size=1" alt="" class="mr-2 rounded">
          <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <strong class="d-block text-gray-dark">@username</strong>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
          </p>
        </div>
        <small class="d-block text-right mt-3">
          <a href="#">All updates</a>
        </small>
      </div>
      </main>
     </c:if>
      
      <div align="center">
      <c:if test="${ empty adminLoginVO and  not empty loginVO}">  
       <hr width="70%">	
          <h4 class="titles"> <strong>${ loginVO.id }</strong>님의 상담 리스트</h4>
      <hr width="70%">
      <br>
      <br>
      <br>
      	 <select name="mainCategory" class="f0" style="width:20%">
                    <option>대분류</option>
                    <option value="금융상품">금융상품</option>
                    <option value="금융경험">금융경험</option>
                    <option value="기타">기타</option>
          </select><button>검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<input type="text"><button>검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date">-<input type="date"><button>검색</button>
      	<br>
      </c:if>
      <c:if test="${ not empty adminLoginVO and empty loginVO}">  
       <hr width="70%">	
          <h4 class="titles">상담 리스트 조회</h4>
      <hr width="70%">
      </c:if>
      <br>
          <div class="table-responsive" align="center">
            <table class="table table-striped table-sm" style="width:80%">
              <thead>
                <tr class="jj">
                  <th>상담번호</th>
                  <th>등록일시</th>
                  <th>고객유형</th>
                  <th>ID</th>
                  <th>생일</th>
                  <th>대분류</th>
                  <th>중분류</th>
                  <th>제목</th>
                  <th>담당직원</th>
                  <th>사원번호</th>
                  <th>진행상태</th>
                  <th>추가상담</th>
                  <th></th>
				 
                </tr>
              </thead>
              <c:forEach items="${ customerConsultingList }" var="consulting" varStatus="loop">
              <tbody>
                  <form>                  
                <tr>
                  <td>${ consulting.consultingNo }</td>
                  <td>${ consulting.reportYmd }</td>
                  <td>${ consulting.customerType }</td>
                  <td>${ consulting.id }</td>
                  <td>${ consulting.birth }</td>
                  <td>${ consulting.mainCategory }</td>
                  <td>${ consulting.middleCategory }</td>
                  <td>${ consulting.title }</td>
                  <td>${ consulting.adminName }</td>
                  <td>${ consulting.empno }</td>
                  <td>${ consulting.progress }</td>
                  <td>${ consulting.addConsulting } <button onclick="reserveForm(${ consulting.consultingNo })">신청</button></td>
                  <td id="${ consulting.consultingNo }" style="display: none;">
                  	<input type="datetime-local" name="date${ consulting.consultingNo }"  style="width: 3.5rem;" value="reserveDate">
                  	<button onclick="reserve(${ consulting.consultingNo })">예약</button> </td>
                  
                </tr>
                  </form>
              </tbody>
              </c:forEach>
            </table>
        <br>
        </div>
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
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include>
    <script type="text/javascript">
    
    function reserveForm(no) {
    	$("#"+no).show();
	}
    
    function reserve(no) {
    	console.log(no)
		
	}
    
    
    </script> 
</body>
</html>