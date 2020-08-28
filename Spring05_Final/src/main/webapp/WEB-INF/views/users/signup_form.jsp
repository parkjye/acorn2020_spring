<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>
	//모듈은 컨트롤러보다 상위개념이기 때문에 일반적으로 html에 선언한다.
	var myApp = angular.module("myApp", []);
	
	//ajax를 통해서 서버에 데이터를 보내기 위해 $http
	myApp.controller("formCtrl", function($scope, $http){
		//angularjs가 초기화 될 때 최초 한 번만 호출된다.
		
		$scope.idChanged=function(){
			$http({
				url:"checkid.do",
				method:"get",
				params:{inputId:$scope.id}, //input요소의 ng-model:id의 값을 읽어온다.
			}).success(function(data){
				//data => {isExist:true} or {isExist:false} 인 object 이다.
				//입력한 ID가 DB에 존재하지 않아야 사용할수 있다.
				//$scope.canUseId=!data.isExist;
				
				//이전에 사용한 canUseId를 사용하지 않는 방식
				//(자동으로 반대 개념을 인식하지 못하기 때문에) valid와 invalid 조건을 각각 넣어줘야 한다. 
				$scope.myForm.id.$valid = !data.isExist;
				$scope.myForm.id.$invalid= data.isExist;
			});	
		};
		
		//비밀번호 입력란을 입력했을 때 호출되는 함수
		$scope.pwdChanged=function(){
			//비밀번호를 같게 입력했는지 여부를 모델로 관리한다.
			$scope.myForm.pwd.$valid = $scope.pwd==$scope.pwd2;
			$scope.myForm.pwd.$invalid = $scope.pwd!=$scope.pwd2;
		}
	});
</script>
</head>
<body>
<div class="container" ng-controller="formCtrl" novalidate>
	<h1>회원 가입 폼 입니다.</h1>
	<!--  <p>아이디 사용가능 여부: {{canUseId}}</p>-->
	<form action="signup.do" method="post" name="myForm">
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id" 
				ng-model="id"
				ng-required="true"
				ng-pattern="/^[a-z].{4,9}$/"
				ng-class="{'is-invalid': myForm.id.$invalid && myForm.id.$dirty,'is-valid': myForm.id.$valid}" 
				ng-change="idChanged()"/>
			<small class="form-text text-muted">영문자 소문자로 시작하고 최소 5글자~10글자 이내로 입력 하세요.</small>
			<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
			<div class="invalid-feedback" ng-show="!canUseId">이미 존재하는 아이디 입니다.</div>
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd"
				ng-model="pwd"
				ng-required="true" 
				ng-minlength="5" 
				ng-maxlength="10"
				ng-class="{'is-invalid': myForm.pwd.$invalid && myForm.pwd.$dirty , 'is-valid': myForm.pwd.$valid}"
				ng-change="pwdChanged()" />
			<small class="form-text text-muted">최소 5글자~10글자 이내로 입력 하세요.</small>
			<div class="invalid-feedback">비밀번호가 동일하지 않습니다.</div>
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" name="pwd2" id="pwd2"
				ng-model="pwd2"
				ng-change="pwdChanged()" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="text" name="email" id="email"
				ng-model="email",
				ng-required="true",
				ng-pattern="/^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i",
				ng-class="{'is-invalid':myForm.email.$invalid && myForm.email.$dirty, 'is-valid':myForm.email.$valid }" />
			<div class="invalid-feedback">이메일 형식에 맞게 입력해 주세요.</div>
		</div>
		<button ng-disabled="myForm.$invalid" class="btn btn-primary" type="submit">가입</button>
		<button class="btn btn-danger" type="reset">취소</button>
	</form>
</div>
</body>
</html>