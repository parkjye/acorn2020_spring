<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test04.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
</head>
<body ng-app> 
<div class="container">
	<h1>form 검증</h1>
	<!-- novalidate는 웹 브라우저가 자체 유효성 검증을 하지 못하도록 한다.
		웹 브라우저의 간섭을 제거한다.
	-->
	<form name="myForm" action="insert.jsp" method="post" novalidate>
	
		<!-- 입력한 문자열을 id라는 모델명으로 관리, 반드시 입력해야 한다. -->
		<input type="text" name="id" ng-model="id" ng-required="true" />
		<button type="submit" ng-disabled="myForm.id.$invalid">제출</button>
		
		<!-- [ 아래 문구를 보여줄 조건 2가지 ]
		
			1. id가 유효하지 않고(입력X), id를 입력했다가 삭제하면(필드가 수정된 적이 있으면 $dirty)
				페이지가 처음 뿌려질 때는 아래 문구를 보여주지 않는다.
				
			2. id가 유효하거나(입력O), 페이지가 처음 뿌려진(로딩된) 상태면(=필드가 수정된 적이 없으면 $pristine)
				아래 문구를 숨겨놓는다.
			-->
		<p ng-show="myForm.id.$invalid && myForm.id.$dirty" style="color:red;">아이디는 반드시 입력하세요</p>
		<p ng-hide="myForm.id.$valid || myForm.id.$pristine" style="color:blue;">아이디는 반드시 입력하세요</p>
	</form>
	
	<p>입력한 아이디: <strong>{{id}}</strong></p>
	
	<!-- $valid, $invalid는 필드에 내용이 valid인지 invalid인지 판단한다. -->
	<p>유효한 아이디 인가요?: <strong>{{myForm.id.$valid}}</strong></p>
	<p>유효하지 않은 아이디 인가요?: <strong>{{myForm.id.$invalid}}</strong></p>
	
	<!-- 필드가 초기 상태면 $pristine, 한 번이라도 입력된 경험이 있으면 $dirty -->
	<p>아이디의 pristine 여부: <strong>{{myForm.id.$pristine}}</strong></p>
	<p>아이디의 dirty 여부: <strong>{{myForm.id.$dirty}}</strong></p>
</div>
</body>
</html>