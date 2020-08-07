<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/friends.do</title>
</head>
<body>
<h1>친구 목록 입니다.</h1>

<ul>
	<c:forEach var="i" items="${friendsList }">
		<li>${i }</li>
	</c:forEach>
</ul>

</body>
</html>