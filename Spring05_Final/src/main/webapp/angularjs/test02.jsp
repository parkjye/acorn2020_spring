<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/angularjs/test02.jsp</title>
<!-- angularjs 로딩 --> 
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
</head>
<!-- ng-app body에서 일어나는 일은 angular로 관리를 하겠다는 의미이다. -->
<body ng-app> 
<!-- 
	count라는 이름의 모델을 만들고 초기값을 0으로 부여한다. 
	ng-init="count=0"은 {count:0}과 같은 의미이다.
		angular가 관리하는 오브젝트(=count)에 0을 넣는다.
-->
<h1 ng-init="count=0">이벤트 처리</h1>

<!-- 버튼에 클릭 이벤트가 일어나면 count=count+1이 수행된다. -->
<button ng-click="count=count+1">클릭+1</button>
<button ng-click="count=count-1">클릭-1</button>
<button ng-click="count=0">리셋</button>

<!-- count모델안에 있는 값을 출력하기 -->
<p>{{count}}</p>

<!-- ng-bind는 innerText와 같은 의미 -->
<p ng-bind="count"></p>
</body>
</html>