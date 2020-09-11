<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//callback이라는 파라미터 명으로 전달되는 문자열 읽어오기
	String callback=request.getParameter("callback");

	//jqeury가 임의로 콜백함수명을 만들어서 데이터 전달(서버에 'callback' 약속어가 있다.)
	System.out.println("callback 함수명: "+callback);

	//msg라는 파라미터 명으로 전달되는 문자열 읽어오기
	String msg=request.getParameter("msg");
	System.out.println("msg: "+msg);
	
%>
<%if(callback != null){ %>
	<%=callback %>({isSuccess:true});
<%} else {%>
	<%--json으로 응답한다.  --%>
	{"isSuccess":true}
<%} %>