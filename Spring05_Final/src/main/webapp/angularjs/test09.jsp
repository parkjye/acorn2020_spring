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
		
		//폼에 입력한 내용을 담을 모델
		$scope.formData={};
		
		//전송 버튼을 눌렀을 때 호출되는 함수
		$scope.send=function(){
			$http({
				url:"member_insert.jsp",
				method:"post",
				params:$scope.formData,
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				console.log(data);
			});
		};
		
		
	}); //controller
</script>
</head>
<body ng-controller="one">
<div class="container"> 
	<h3>$http 서비스 테스트</h3>
	
	<!-- [ angularjs에서 form 데이터를 ajax로 전송하는 방법 ]
			ng-submit="send()"
			
			submit 전송이 일어날 때, send() 함수가 호출되면서,
			input 요소와 데이터를 object로 만들고 
			params:$scope.formData로 object 자체를 보낸다.
	-->
	<form ng-submit="send()"> <!--   -->
		이름<input type="text" ng-model="formData.name" />
		주소<input type="text" ng-model="formData.addr" />
	
		<button type="submit" ng-class="['btn', 'btn-outline-success']" >전송</button>
	</form>
	<p>{{formData}}</p>
</div><!-- container -->
</body>
</html>