<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/todo/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>To do list</h1>
	<form action="insert.do" method="post">
		<div class="form-group">
			<label for="todo">할 일 추가</label>
			<input type="text" name="todo" placeholder="할 일을 추가하세요."/>
			<button type="submit" class="btn btn-primary">추가</button>
		</div>
	</form>
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>할일</td>
				<td>날짜</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.content }</td>
				<td>${tmp.regdate }</td>
				<td><a href="updateform.do?num=${tmp.num }">수정</a></td>
				<td><a href="delete.do?num=${tmp.num }">삭제</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>