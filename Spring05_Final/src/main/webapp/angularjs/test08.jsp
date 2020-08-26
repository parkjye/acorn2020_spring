<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<!-- html전체를 모듈로 관리 -->
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>/angularjs/test08.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>
	var myApp=angular.module("myApp", []);
	myApp.controller("one", function($scope, $http){
		//$http는 서버와 통신을 할 수 있는 함수이다.
		console.log($http);
		
		$scope.send=function(){
			$http({
				url:"send.jsp",
				method:"post",
				//post방식으로 데이터를 보낼 때는 데이터를 직렬화하고(ex. x=0)
				params:{msg:$scope.msg},
				//헤더 정보도 적어야한다.
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				//data : {toClient:"hello"} 구조의 object이다.
				console.log(data);
				$scope.result=data.toClient;
			});
		};
		
		$scope.send2=function(){
			$http({
				url:"send.jsp",
				method:"get",
				params:{msg:$scope.msg2},
			}).success(function(data){
				console.log(data);
				$scope.result2=data.toClient;
			});
		};
	});
</script>
</head>
<body ng-controller="one">
<div class="container"> 
	<h3>$http 서비스 테스트</h3>
	
	<input type="text" ng-model="msg" placeholder="서버에 할말 입력"/>
	<button ng-class="['btn', 'btn-outline-success']" ng-click="send()">Ajax 전송(post)</button>
	<p ng-bind="result"></p>
	
	<input type="text" ng-model="msg2" placeholder="서버에 할말 입력"/>
	<button ng-class="['btn', 'btn-outline-success']" ng-click="send2()">Ajax 전송(get)</button>
	<p ng-bind="result2"></p>
	
</div><!-- container -->
</body>
</html>