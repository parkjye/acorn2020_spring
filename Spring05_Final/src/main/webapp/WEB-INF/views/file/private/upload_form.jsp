<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.do</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>파일 업로드 폼 입니다.</h1>

		<form action="upload.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">제목(설명)</label>
				<input type="text" name="title" id="title"/>
			</div>

			<div class="form-group">
				<label for="myFile">첨부 파일</label>
				<input type="file" name="myFile" id="myFile"/>
			</div>
			
			<button class="btn btn-outline-primary" type="submit">업로드</button>
		</form>
	</div>
</body>
</html>