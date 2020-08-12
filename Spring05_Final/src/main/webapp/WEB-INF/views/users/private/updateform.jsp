<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* 프로필 업로드 폼을 화면에서 숨긴다. */
	#profileForm {
		display:none;
	}
	
	/* 이미지를 작은 원형으로 만든다. */
	#profileImage{
		width:50px;
		height:50px;
		border:1px solid #cecece;
		border-radius:50%;
		curser: pointer;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>회원정보 수정 폼 입니다.</h1>
	<%--image 전체에 link를 감싼다. img수정과 keyboard를 받기 위함 --%>
	<a href="javascript:" id="profileLink">
		<c:choose>
			<%--empty연산자는 null과 ""빈문자열을 true를 리턴한다. --%>
			<c:when test="${empty dto.profile }">
				<svg id="profileImage" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
				</svg>
			</c:when>
			<c:otherwise>
				<img id="profileImage" src="${pageContext.request.contextPath }${dto.profile }"/>
			</c:otherwise>
			</c:choose>
	</a>
	
	<form action="update.do" method="post">
		<input type="hidden" name="profile" id="profile" value="${dto.profile }"/>
		<div class="form-grop">
			<label for="id">아이디</label>
			<input class="form-control" type="text" id="id" value="${dto.id }" disabled/>
		</div>
		<div class="form-grop">
			<label for="email">e-mail</label>
			<input class="form-control" type="text" name="email" id="email" value="${dto.email }" />
		</div>
		<div class="btnWrap">
			<button class="btn btn-outline-primary" type="submit">수정</button>
			<button class="btn btn-outline-warning" type="reset">취소</button>
		</div><!-- btnWrap -->
	</form>
	
	<%--img를 클릭하면 ajax로 강제 제출 /users/private/profile_upload.do --%>
	<form action="profile_upload.do" method="post" enctype="mulipart/form-data" id="profileForm">
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG" id="image"/>
	</form>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<script>
	//프로필 링크를 클릭했을 때 실행할 함수 등록
	$("#profileLink").on("click", function(){
		//input type="file"을 강제 클릭한다.
		$("#image").click();
	});
	
	//이미지를 클릭했을 때 실행할 함수 등록
	$("#image").on("change", function(){
		//폼을 강제로 제출한다.
		$("#profileForm").submit();
	});
	
	//폼이 ajax로 제출될 수 있도록 플러그인을 동작 시킨다.
	$("#profileForm").ajaxForm(function(data){
		
		//기존 프로필 이미지 요소를 제거한다.
		$("#profileImage").remove();
		
		//새로운 img요소를 만들어서 #profileLink에 추가한다.
		$("<img/>")
		.attr("id", "profileImage")
		.attr("src", "${pageContext.request.contextPath }"+data.imageSrc)
		.appendTo("#profileLink");
		
		//회원정보 수정 폼 전송될 때 같이 전송 되도록 한다.
		$("#profile").val(data.imageSrc); //input type="hidden"의 value값
	});
</script>
</body>
</html>