<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 삭제 기능을 구현하세요.
	//요청 URL = localhost/app3/customer/delete.jsp?no=xxx
	// 요청 파라미터값 조회
	String id = request.getParameter("id");
	
	// 업무로직 수행 - 요청파라미터로 전달받은 상품번호에 해당하는 상품정보를 삭제하기.
	CustomerDao dao = new CustomerDao();
	dao.deleteCustomerById(id);
	
	// 재요청 URL 응답보내기
	response.sendRedirect("list.jsp");
%>