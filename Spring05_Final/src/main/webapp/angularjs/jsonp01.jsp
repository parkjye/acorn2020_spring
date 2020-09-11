<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//callback이라는 파라미터 명으로 전달되는 문자열 읽어오기
	String callback=request.getParameter("callback");

	//클라이언트에게 응답할 데이터라고 가정
	int num=1;
	String name="김구라";
	
	// jqeury가 임의로 콜백함수명을 만들어서 데이터 전달(서버에 'callback' 약속어가 있다.)
	System.out.println("callback 함수명: "+callback);
	
%>
<%if(callback != null){ %>
	<%=callback %>({num:<%=num %>, name:"<%=name %>"});
<%} else {%>
	<%--json으로 응답한다.  --%>
	{"num":<%=num --%>, "name":"<%=name %>"}
<%} %>