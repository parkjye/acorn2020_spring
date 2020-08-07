<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<!-- <link rel="stylesheet" href="resources/css/bootstrap.css" /> -->
</head>
<body>
	<div class="container">
		<h1>인덱스 입니다.</h1>
		<p>spring framework 동작중 ...</p>
		<ul>
			<li><a href="test/play.html">Spring 컨트롤러 거치지 않는 요청 1</a></li>
			<li><a href="test/game.jsp">Spring 컨트롤러 거치지 않는 요청 2</a></li>
			
			<li><a href="friends.do">친구 목록 보기 1</a></li>
			<li><a href="friends2.do">친구 목록 보기 2</a></li>
			<li><a href="friends3.do">친구 목록 보기 3</a></li>
			
			<li><a href="delete.do">친구 정보 삭제 1 (Redirect 이동)</a></li>
			<li><a href="delete2.do">친구 정보 삭제 2 (Redirect 이동)</a></li>
			
			<li><a href="users/signup_form.do">회원 가입 폼</a></li>
		</ul>
		
		<h2>오늘의 공지사항</h2>
		<ul>
		<c:forEach var="tmp" items="${noticeList }">
			<li>${tmp }</li>
		</c:forEach>
		</ul>
	</div>
</body>
</html>