<%--폼에서 입력받은 고객정보를 저장시킨다.registered를 재요청한다. --%>
<%@page import="dao.CustomerDao"%>
<%@page import="VO.Customer"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 회원가입 기능을 구현하세요.
	//요청 파라미터 조회
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	Customer customer = new Customer();
	customer.setId(id);
	customer.setPassword(password);
	customer.setName(name);
	customer.setTel(tel);
	customer.setEmail(email);
	
	//업무로직 수행 - 새 회원정보를 db에 저장시킨다.
	CustomerDao dao = new CustomerDao();
	dao.insertCustomer(customer);
	
	//재요청 URL응답
	// 현재 :  http://localhost/app3/customer/insert.jsp
	// 재요청 : http://localhost/app3/customer/registered.jsp
	response.sendRedirect("registered.jsp");
%>