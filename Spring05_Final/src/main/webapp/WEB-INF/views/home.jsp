<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test = "${empty id }">
			<a href="/users/loginform.do">로그인</a>
			<a href="/users/signup_form.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<strong>${id }</strong>님 로그인 중
			<a href="/users/logout.do">로그아웃</a>
		</c:otherwise>
	</c:choose>

	<h1>인덱스 페이지 입니다.</h1>
	<p>Spring Framework 동작중 ...</p>
</div>
</body>
</html>