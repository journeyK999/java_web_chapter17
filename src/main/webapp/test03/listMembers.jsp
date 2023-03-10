<%@ page language="java" contentType="text/html; charset=UTF-8"	import=" java.util.*,sec01.ex01.*"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>  

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

	<c:choose>
	   <c:when test='${msg=="addMember" }'>
	      <script>
	         window.onload=function(){
	            alert("회원을 등록했습니다.");
	         }
	      </script>
	   </c:when>
	   <c:when test='${msg=="modified" }'>
	      <script>
	        window.onload=function(){
	          alert("회원 정보를 수정했습니다.");
	        }
	      </script>
	   </c:when>
	   <c:when test= '${msg=="deleted" }'>
	      <script>
	         window.onload=function(){
	            alert("회원 정보를 삭제했습니다.");
	        } 
	      </script>
		</c:when>
	</c:choose>	

	<meta charset="UTF-8">
	<title>회원 정보 출력창</title>
	<style type="text/css">
		.cls1 {
	       font-size:40px;
	       text-align:center;
	     }
    
	     .cls2 {
	       font-size:20px;
	       text-align:center;
	     }
	</style>
</head>
<body>
	<p class="cls1">회원정보</p>
   	<table style="float:center" border="1" >
      <tr align="center" bgcolor="lightgreen">
         <td width="7%" ><b>아이디</b></td>
         <td width="7%" ><b>비밀번호</b></td>
         <td width="7%" ><b>이름</b></td>
         <td width="7%"><b>이메일</b></td>
         <td width="7%" ><b>가입일</b></td>
         <td width="7%" ><b>수정</b></td>
         <td width="7%" ><b>삭제</b></td>
   	  </tr>

	<c:choose>
	    <c:when test="${ empty membersList}" >
	      <tr>
	        <td colspan=5 align="center">
	          <b>등록된 회원이 없습니다.</b>
	       </td>  
	      </tr>
	   </c:when>  
	   <c:when test="${not empty membersList }" >
		      <c:forEach  var="mem" items="${membersList }" >
		        <tr align="center">
		          <td>${mem.id }</td>
		          <td>${mem.pwd }</td>
		          <td>${mem.name}</td>     
		          <td>${mem.email }</td>     
		          <td>${mem.joinDate}</td>     
		          <td><a href="${contextPath}/member/modMemberForm.do?id=${mem.id}">수정</a></td>     
		          <td><a href="${contextPath}/member/delMember.do?id=${mem.id}">삭제</a></td>     
		       </tr>
		     </c:forEach>
		</c:when>
	</c:choose>
   </table>  
   <p class="cls2"><a href="${contextPath}/member/memberForm.do">회원 가입하기</a></p>
</body>
</html>