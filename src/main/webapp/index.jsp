<%--
	<%@ page 속성명="속성값" %>
		페이지 지시어는 jsp페이지에 대한 설정을 정의한다.
		
		
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body>

	<h1>홈</h1>
<%
	String[] depts = {"하린", "하원", "자매", "최강"};
%>

	<h3>부서목록</h3>
	<ul>
<%
	for (String name : depts){
%>
		<li><%=name %></li>
<%
	}
%>
	</ul>
</body>
</html>