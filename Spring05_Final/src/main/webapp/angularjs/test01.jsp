<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test01.jsp</title>
<!-- angularjs 로딩 --> 
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
</head>
<body ng-app>
<h1>hello Angular js!</h1>
<input ng-model="msg" type="text" placeholder="메세지 입력"/>
<p>{{msg}}</p>
<h1 ng-init="friends=['김구라','해골','원숭이']">친구 목록 입니다.</h1>
<ul>
	<li ng-repeat="tmp in friends">{{tmp}}</li>
</ul>
<h1>체크박스를 선택하세요</h1>
<input type="checkbox" ng-model="isShow" /> <strong>{{isShow}}</strong><br/>
<img src="../resources/images/kim1.png" ng-show="isShow"/>
<!-- 
	[ Angularjs는 구글에서 만든 자바스크립트 프레임워크이다. ]
	
	* MVVM Framwork (model-view-view-model)
		model과 view가 양방향 데이터 바인딩을 하기 때문에 controller가 없어도 작성 가능하다. 
	
	* 양방향 데이터 바인딩이 가능하다.
		Model의 데이터와 view 데이터가 양방향 바인딩이 되서 Model이 변경되면 view도 변경 된다.

	* javascript로 작성할 코드량을 줄여준다.
	
	* 개발 영역을 명확히 분리한다.
		html, css, 로직 등 view코드와 login영역을 명확히 구분.
 -->
</body>
</html>