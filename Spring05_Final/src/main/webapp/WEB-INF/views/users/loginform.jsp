<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<!-- animate.min.css에서 min을 삭제하면 압축되지 않은 소스로딩 가능 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.animate__shakeX{
		animation-duration: 0.5s;
	}
	
	#submitBtn:hover{
		/* animate.css를 로딩했기 때문에, 해당 코드 내의 키프레임을 가져와서 사용할 수 있다. 
			https://animate.style/ 내의 anination 이름이 키프레임이기도 하다.	
		*/
		animation-name: heartBeat;
		animation-duration: 0.4s;
		animation-timign-function: ease-out;
		animation-iteration-count: 1;
	}
	
	#loginForm{
		box-shadow: 24px 10px 12px 7px rgba(131,131,199,1);
		padding: 10px;
		border-radius: 10px;
	}
</style>
</head>
<body>
<div class="container animate__animated animate__fadeInLeft">
	<h1>로그인 폼</h1>
	<form action="login.do" method="post" id="loginForm">
		<%-- 원래 가려던 목적지 정보를 url 이라는 파라미터 명으로 가지고 간다 --%>
		<input type="hidden" name="url" value="${url }" />
		
		<div class="form-group animate__animated">
			<label for="id">아이디</label>
			<input class="form-control animate__animated" type="text" name="id" id="id"/>
		</div>
		
		<div class="form-group animate__animated">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd" />
		</div>
		
		<button id="submitBtn" class="btn btn-primary" type="submit">로그인</button>
	</form>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script>
	$("#loginForm").on("submit", function(){
		//1. ID입력했는지 검증
		var inputId=$("#id").val();
		
		if(inputId==""){
			$("#id")
			.parent()
			.addClass("animate__shakeX")
			.one("animationend", function(){
				$(this).removeClass("animate__shakeX");
			});
			
			return false;
		}
		
		//2. PWD를 입력했는지 검증
		var inputPwd=$("#pwd").val();
		
		if(inputPwd==""){
			$("#pwd")
			.parent()
			.addClass("animate__shakeY")
			.one("animationend", function(){
				$(this).removeClass("animate__shakeY");
			});
			
			return false;
		}
	});
</script>
</body>
</html>