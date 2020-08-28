<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test10.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
</head>
<body ng-app>
	<h1>과일을 선택하세요.</h1>
	<select ng-model="selectedFruit" ng-change="selectedFruit2=selectedFruit">
		<option value="">선택</option>
		<option value="orange">오렌지</option>
		<option value="apple">사과</option>
		<option value="banana">바나나</option>
	</select>
	<p>선택된 과일: <strong ng-bind="selectedFruit"></strong></p>
	
	<select ng-model="selectedFruit2">
		<option value="">선택</option>
		<option value="orange">오렌지</option>
		<option value="apple">사과</option>
		<option value="banana">바나나</option>
	</select>
	
	<h1>체크박스를 테스트 해보세요</h1>
	<label for="">
		<input type="checkbox" ng-model="isShow"/> isShow
	</label>
	<label>
		<input type="checkbox" ng-model="isMake"/> isMake
	</label>
	<p>요소검사를 열어두고 비교하면 됩니다.</p>
	<p ng-show="isShow">안녕하세요. ng-show는 문서 객체는 만들어져있고 그것을 보이거나 숨기면서 조작합니다.</p>
	<p ng-if="isMake">또 만났군요! ng-if는 문서를 동적으로 추가, 제거하면서 조작합니다.</p>
</body>
</html>