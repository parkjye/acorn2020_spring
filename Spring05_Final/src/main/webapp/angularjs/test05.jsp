<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test05.jsp</title>
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
							'is-valid': myForm.id.$valid}"
				ng-pattern="/^[a-zA-Z0-9]+$/"/>
							
				<!-- class="is-invalid"이면 class="invalid-feedback"도 자동으로 같이 보여진다. -->
			<div class="invalid-feedback">아이디는 반드시 입력하세요. 특수문자를 제외한 영문자만 가능합니다.</div>
			<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
		</div>
		
		<div class="form-group">
			<label for="nick">닉네임</label>
			<input ng-model="nick" ng-required="true" type="text" name="nick" id="nick" class="form-control"
				ng-class="{'is-invalid': myForm.nick.$invalid && myForm.nick.$dirty, 'is-valid': myForm.nick.$valid}"
				ng-minlength="3"
				ng-maxlength="10" 
				ng-pattern="/^[가-힇]+$/"/>
			<div class="invalid-feedback">3글자 ~ 10글자 이내의 한글만 입력하세요.</div>
			<div class="valid-feedback">사용 가능한 닉네임 입니다.</div>
		</div>
		
		<!-- <button type="submit" ng-disabled="myForm.id.$invalid || myForm.nick.$invalid">제출</button> -->
		<button type="submit" ng-disabled="myForm.$invalid">제출</button>
	</form>
	
	<p>입력한 아이디: <strong>{{id}}</strong></p>
	<p>유효한 아이디 인가요?: <strong>{{myForm.id.$valid}}</strong></p>
	<p>유효하지 않은 아이디 인가요?: <strong>{{myForm.id.$invalid}}</strong></p>
	<p>아이디의 pristine 여부: <strong>{{myForm.id.$pristine}}</strong></p>
	<p>아이디의 dirty 여부: <strong>{{myForm.id.$dirty}}</strong></p>
	
	<p>입력한 닉네임: <strong>{{nick}}</strong></p>
	<p>유효한 닉네임 인가요?: <strong>{{myForm.nick.$valid}}</strong></p>
	<p>유효하지 않은 닉네임 인가요?: <strong>{{myForm.nick.$invalid}}</strong></p>
	<p>닉네임의 pristine 여부: <strong>{{myForm.nick.$pristine}}</strong></p>
	<p>닉네임의 dirty 여부: <strong>{{myForm.nick.$dirty}}</strong></p>
	
	<p>닉네임을 입력 안했는지 여부: <strong>{{myForm.nick.$error.required}}</strong></p>
	<p>닉네임을 입력했는지 여부: <strong>{{!myForm.nick.$error.required}}</strong></p>
	<p>닉네임을 최소 글자 이상 입력 안했는지 여부: 
		<strong>{{myForm.nick.$error.minlength}}</strong>
	</p>
	<p>닉네임을 최소 글자 이상 입력 했는지 여부: 
		<strong>{{!myForm.nick.$error.minlength}}</strong>
	</p>
	<p>닉네임을 최대 글자 이하로 입력 했는지 여부: 
		<strong>{{!myForm.nick.$error.maxlength}}</strong>
	</p>
	<p>닉네임을 최대 글자 이하로 입력 했는지 여부: 
		<strong>{{!myForm.nick.$error.maxlength}}</strong>
	</p>
	<p>
		닉네임을 정규표현식에 맞게 입력 안했는지 여부:
		<strong>{{!myForm.nick.$error.pattern}}</strong>
	</p>
	
	<p>폼 전체의 유효성 여부: <strong>{{myForm.$valid}}</strong></p>
	<p>폼 전체가 유효하지 않은지 여부: <strong>{{myForm.$invalid}}</p>
</div>
</body>
</html>