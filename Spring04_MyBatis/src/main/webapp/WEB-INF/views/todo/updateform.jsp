<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/todo/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>목록 수정 폼</h1>
	<form action="update.do" method="post">
		<input type="hidden" name="num" value="${dto.num }"/>
		
		<div class="form-group">
			<label for="num">번호</label>
			<input type="text" id="num" class="form-control" value="${dto.num }" disabled/>
		</div>
		
		<div class="form-group">
			<label for="content">할 일</label>
			<input type="text" name="content" id="content" class="form-control" value="${dto.content }" />
		</div>
		
		<input type="hidden" name="regdate" value="${dto.regdate }"/>
		
		<div class="form-group">
			<label for="regdate">날짜</label>
			<input type="text" id="regdate" class="form-control" value="${dto.content }" disabled/>
		</div>
	</form>
</div>
</body>
</html>