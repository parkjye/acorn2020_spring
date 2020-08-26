<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test07.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>
	var myApp = angular.module("myApp", []);
	
	myApp.controller("myCtrl", function($scope){
		$scope.nums=[10, 20, 30, 40, 50];
		$scope.men={num:1, name:"김구라"};
		$scope.msg="empty";
		$scope.obj={};
	});
</script>
</head>
<body ng-app="myApp">
<div class="container">

	<div ng-controller="myCtrl">
		<ul>
			<!-- ng-bind는 {{tmp}}와 같은 의미 이다. -->
			<li ng-repeat="tmp in nums" ng-bind="tmp"></li>
		</ul>
		
		<!-- model은 scope 안에 있다 -->
		<p>번호: {{men.num}}</p>
		<p>이름: <span ng-bind="men.name"></span></p>
		<input type="text" ng-model="msg"/>
		<p>msg: <strong ng-bind="msg"></strong></p>
		<p>obj: <strong>{{obj}}</strong></p>
		<input type="text" ng-model="obj.height" placeholder="키"/>
		<input type="text" ng-model="obj.weight" placeholder="몸무게"/>
	</div>
	
</div><!-- container -->
</body>
</html>