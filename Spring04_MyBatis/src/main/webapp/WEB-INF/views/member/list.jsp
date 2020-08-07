<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/member/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>회원목록입니다.</h1>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<c:forEach var="tmp" items="${list }">
					<th>${tmp.num }</th>
					<th>${tmp.name }</th>
					<th>${tmp.addr }</th>
				</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>