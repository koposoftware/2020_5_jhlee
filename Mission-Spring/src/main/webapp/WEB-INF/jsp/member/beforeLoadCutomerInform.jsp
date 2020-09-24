<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<table class="table table-hover table-sm" style="width:89%; height:15%" id="inform">
              <thead> 
               <tr class="jj" style="font-size:20px">
			   <th></th>
               <th>이름</th>
               <th>아이디</th>
               <th>비밀번호</th>
               <th>생년월일</th>
               <th>성별</th>
               <th>전화번호</th>
               <th>직업</th>
               <th>주소</th>
               <th>이메일</th>
               <th>디지털교육</th>
               <th>관심사</th>
               <th>나이대</th>
               <th>유형</th>
               <th>손님유형</th>
              </tr>
             </thead>
             
				<tbody id="memberList">
			<c:forEach items="${ allInformList }" var="customerInform">
				<tr style="font-size:large;">
					<td><input type="button" value="☆" class = "star btn btn-default" id="${ adminLoginVO.admin_name }-${ adminLoginVO.empno }-${ customerInform.name }-${ customerInform.id }" style="border:0; background-color:white"></td>
					<td><c:out value='${ customerInform.name }'/></td>
					<td><strong><a href="javascript:doAction('${ customerInform.id }')">
					<c:out value='${ customerInform.id }'/></a></strong></td>
					<td><c:out value='${ customerInform.password }'/></td>
					<td><c:out value='${ customerInform.birth }'/></td>
					<td align="center"><c:out value='${ customerInform.gender }'/></td>
					<td><a href='tel:${ customerInform.phoneNo }'><c:out value='${ customerInform.phoneNo }'/></a></td>
					<td><c:out value='${ customerInform.job }'/></td>
					<td><c:out value='${ customerInform.address }'/></td>
					<td><c:out value='${ customerInform.emailId }'/>@<c:out value='${ customerInform.emailDomain }'/></td>
					<td align="center"><c:out value='${ customerInform.digitalEdu }'/></td>
					<td><c:out value='${ customerInform.interest }'/></td>
					<td><c:out value='${ customerInform.age }'/></td>
					<td align="center"><c:out value='${ customerInform.type }'/></td>
					<td align="center"><c:out value='${ customerInform.customerType }'/></td>
				</tr>
		</c:forEach>	
				</tbody> 
		</table>
		<br>
		
<!-- ====페이징======================================================================================= -->
<!-- ---------이전 버튼 구현 --------------------------- -->
			<c:if test="${blockNo != 1 }"> 
				<a href= "${pageContext.request.contextPath}/customerInform/${blockNo - 1}/${blockStartPageNo-1 }">이전</a> &nbsp;
			</c:if>
			
<!-- ---------페이지 구현 --------------------------- -->			
			<c:forEach var="i" begin="${blockStartPageNo }" end="${blockEndPageNo }">
				<c:choose>
				
					<c:when test="${pageNo == i }"> <!-- 현 페이지 넘버와 클릭할수있는 페이지 넘버가 같으면 링크없애줌 -->
						${i }&nbsp;|&nbsp;
					</c:when>
					
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/customerInform/${blockNo}/${i }">${i }&nbsp;</a>|&nbsp;
					</c:otherwise>
					
				</c:choose>
			</c:forEach>
			
<!-- ---------다음 버튼 구현 --------------------------- -->	
			<c:if test="${blockNo != totalBlockCnt}">&nbsp;
				<a href="${pageContext.request.contextPath}/customerInform/${blockNo + 1}/${blockEndPageNo+1 }">다음</a> &nbsp;
			</c:if>
	
<!-- ==== 페이징 끝! ================================================================== -->	
