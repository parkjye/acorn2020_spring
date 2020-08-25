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
	<!-- novalidate는 웹 브라우저가 자체 유효성 검증을 하지 못하도록 하는 설정 
		웹 브라우저의 간섭을 제거한다.
	-->
	<form name="myForm" action="insert.jsp" method="post" novalidate>
		<div class="form-group">
			<label for="id">아이디</label>
			<input ng-model="id" ng-required="true" type="text" type="text" name="id" id="id" class="form-control" 
				ng-class="{'is-invalid': myForm.id.$invalid && myForm.id.$dirty, 
							'is-valid': myForm.id.$valid}"/>
							
				<!-- class="is-invalid"이면 class="invalid-feedback"도 자동으로 같이 보여진다. -->
			<div class="invalid-feedback">아이디는 반드시 입력하세요.</div>
			<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
		</div>
		
		<button type="submit" ng-disabled="myForm.id.$invalid">제출</button>
	</form>
	
	<p>입력한 아이디: <strong>{{id}}</strong></p>
	<p>유효한 아이디 인가요?: <strong>{{myForm.id.$valid}}</strong></p>
	<p>유효하지 않은 아이디 인가요?: <strong>{{myForm.id.$invalid}}</strong></p>
	<p>아이디의 청결(순결) 여부: <strong>{{myForm.id.$pristine}}</strong></p>
	<p>아이디의 더렵혀졌는지 여부: <strong>{{myForm.id.$dirty}}</strong></p>
</div>
</body>
</html>