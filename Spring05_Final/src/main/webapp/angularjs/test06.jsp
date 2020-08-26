<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test06.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>

	/*
		[ flow ]
		1. 모듈 만들기
		2. 만들어둔 모듈 컨트롤러 만들기
		3. 컨트롤러 내에 모델, 함수 등을 준비
		4. 원하는 때에 호출해서 사용
	*/
	
	// "myApp"이라는 이름의 모듈 만들기
	var myApp = angular.module("myApp", []);
	
	// 모듈을 이용해서 myCtrl이라는 이름의 컨트롤러 만들기
	myApp.controller("myCtrl", function($scope){
		/*
			- 이 함수는 페이지가 로딩되는 시점에 최초 한 번 호출된다.
			
			- $scope에는 angular가 관리하는 특별한 객체가 전달된다.
			- $scope는 해당 컨트롤러에서 사용하는 영역 객체이다.
			- $scope에는 각각의 컨트롤러에서 사용하는 모델(데이터)이 저장된다.
		*/
		console.log("myCtrl에 있는 함수 호출됨");
		console.log($scope);
		
		//$scope object에 nick이라는 방(모델)을 만들고 문자열 저장하기
		$scope.nick="김구라";
		
		//$scope object에 btnClicked라는 방에 함수 저장하기
		$scope.btnClicked=function(){
			alert("버튼을 눌렀어요");
		};
		
	});
	
	//모듈을 이용해서 yourCtrl이라는 이름의 컨트롤러 만들기
	myApp.controller("yourCtrl", function($scope){
		console.log("yourCtrl에 있는 함수 호출됨");
		console.log($scope);
		$scope.nick="해골";
		
		$scope.onMouseover=function(){
			alert("마우스를 올렸어요");
		}
	});
</script>
</head>
<body ng-app="myApp">
<div class="container">

	<div ng-controller="myCtrl">
		<h3>myCtrl 컨트롤러가 관리하는 영역</h3>
		<p>별명: <strong>{{nick}}</strong></p>
		
		<!-- ng-click="nick=''" $scope.nick이라는 의미이다. -->
		<!-- ng-model로 만들어지는 것은 $scope에 만들어지는 것이다. -->
		<button ng-click="nick='개구라'">click</button>
		<button ng-click="btnClicked()">click 2</button>
	</div>
	
	<div ng-controller="yourCtrl">
		<h3>yourCtrl 컨트롤러가 관리하는 영역</h3>
		<p>별명: <strong ng-bind="nick"></strong></p>
		
		<button ng-click="nick='원숭이'">눌러보셈</button>
		<button ng-mouseover="onMouseover()">마우스를 올렸네요</button>
	</div>
	
</div><!-- container -->
</body>
</html>