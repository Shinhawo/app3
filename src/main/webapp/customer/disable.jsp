<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 탈퇴여부를 Yes로 변경해서 탈퇴처리 시키세요.
	// 요청 URL = http://localhost/app3/customer/disable.jsp?id=xxx
	String id = request.getParameter("id");
	
// customer/disable.jsp - 고객정보의 CUST_DIABLED 값을 'Yes'로 변경해서 탈퇴처리 시킵니다.
	CustomerDao dao = new CustomerDao();
	Customer customer = dao.getCustomerById(id);
	customer.setDisabled("Yes");
	dao.updateCust(customer);
// 탈퇴처리 후 list.jsp를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("list.jsp");

%>