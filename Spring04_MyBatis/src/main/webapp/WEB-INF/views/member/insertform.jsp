<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/member/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>회원 추가 폼 입니다</h1>
		<form action="insert.do" method="post">
			<div class="form-group">
				<input type="text" name="name" placeholder="이름을 입력하세요"/>
				<input type="text" name="addr" placeholder="주소를 입력하세요"/>
				
				<button type="submit" class="btn btn-primary">추가</button>
			</div>
		</form>
	</div>
</body>
</html>