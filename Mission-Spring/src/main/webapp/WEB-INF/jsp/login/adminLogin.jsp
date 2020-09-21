<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>로그인</title>
 <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
 <link href="/resources/assets/css/jin.css" rel="stylesheet">
 <link href="/resources/assets/css/style.css" rel="stylesheet"> 
 
<jsp:include page="/resources/assets/include/headCSS.jsp"></jsp:include>  


<script>
   function isNull(obj, msg) {
      if (obj.value == '') {
         alret(msg);
         obj.focus();
         return true;
      }
      return false;
   }

   function checkForm() {
      var f = document.lform;
      if (isNull(f.id, '사원번호를 입력해주세요'))
         return false;
      if (isNull(f.password, '비밀번호를 입력해주세요'))
         return false;
      /* if(f.id.value == ''){
         alert('아이디를 입력해주세요')
         f.id.focus();
         return false;
      }
      
      if(f.password.value==''){
         alert('패스워드를 입력해주세요')
         f.password.focus();
         return false;
      } */

      return true;
   }
    
/*   function goAdminInfo(){ 
	  location.href="${ pageContext.request.contextPath }/adminAlert";	
  }  */
   
</script>
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
	<div align="center">

    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="#"> <h3>관리자 로그인</h3></a>
        							
                                <form class="mt-5 mb-5 login-input" action="${ pageContext.request.contextPath }/adminLogin" method="post" onsubmit="return checkForm()" name="lform">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="사원번호" name="empno">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="비밀번호" name="password">
                                    </div>
                                    <button type="submit" class="btn login-form__btn submit w-100">Sign In</button>  <!-- onclick="goAdminInfo" -->
                                </form>
                                <p class="mt-5 login-form__footer" style="font-size:18px"> 관리자님 오늘도 화이팅입니다! 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	</div>
</section> 
	<br><br><br><br><br><br><br><br>
   <br><br><br><br><br><br><br><br>
   	<br><br><br><br><br><br><br><br>
   <br><br><br><br><br><br><br><br>
   <footer id="footer">
		<%@ include file="/resources/assets/include/footer.jsp"%>
	</footer>
    <jsp:include page="/resources/assets/include/jsFiles.jsp"></jsp:include> 
</body>
</html>