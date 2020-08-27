<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test03.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
</head>
<body ng-app> 
<div class="container">
	<!--$scope.a='btn-primary'; {a:'btn-primary'}  -->
	<h1 ng-init="a='btn-outline-primary'">클래스 속성 조작하기</h1>
	<!-- 입력 or 선택을 할 수 있는 UI는 model(데이터)로 관리할 수 있다. ex.input, textarea ... .
			
			$scope.b를 만들고 (model로 지정했기 때문에) input-text 필드에 입력된 값을 자동으로 대입된다.
			대입된 값은 {{b}}에 실시간으로 반영된다.
	-->
	<input type="text" ng-model="b"/>
	<button class="btn btn-outline-primary">버튼 1</button>
	<button class="btn {{a}}">버튼 2</button>
	<button class="btn {{b}}">버튼 3</button>
	
	<button ng-class="['btn', 'btn-success']">버튼 4</button> <!-- 배열 형태 -->
	<!-- object 형태, 해당 클래스 추가여부를 boolean값으로 관리한다. -->
	<button ng-class="{'btn':true, 'btn-success':true, 'btn-lg':false}">버튼 5</button> 
	<br/>
	
	<!-- model 하나에 $scope.isLarge=true/false가 실시간으로 대입된다. -->
	<input type="checkbox" ng-model="isLarge"/><!-- true or false -->
	<button class="btn btn-danger" ng-class="{'btn-lg':isLarge}">버튼 6</button>
</div>
</body>
</html>