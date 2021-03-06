<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>로그인</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
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
      if (isNull(f.id, '아이디를 입력해주세요'))
         return false;
      
      if (isNull(f.password, '패스워드를 입력해주세요'))
         return false;
      
      if(f.id.value != '${loginVo.id}') {
         alert('아이디와 패스워드를 확인해주세요')
        
         return false;
         
      if(f.password.value != '${loginVO.password}'){
    	  alert('아이디와 패스워드를 확인해주세요');
    	  return false;
      }

    return true;
   } 

      
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
                                <a class="text-center" href="#"> <h3>로그인</h3></a>
        							
                                <form class="mt-5 mb-5 login-input" action="${ pageContext.request.contextPath }/login" method="post" onclick="checkForm()" name="lform">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="ID" name="id" autofocus="autofocus" autocomplete="off" >
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="Password" name="password">
                                    </div>
                                    <button type="submit" class="btn login-form__btn submit w-100">Sign In</button> 
                                    <br><br>
                                    <a href="${ pageContext.request.contextPath }/adminLogin" class="text-primary">관리자 로그인</a>
                                </form>
                                <p class="mt-5 login-form__footer">Dont have account? <a href="${ pageContext.request.contextPath }/enrollmentForm" class="text-primary">Sign Up</a> now</p>
                            </div>
                        </div>
                    </div>
                </div>
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