<%@page import="VO.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 사용자 인증하기
	CustomerDao customerDao = new CustomerDao();
	// 요청 파라미터로 전달받은 아이디로 사용자 정보를 조회
	Customer customer = customerDao.getCustomerById(id);
	
	// 사용자 정보가 존재하는지 체크
	if (customer == null) {
		response.sendRedirect("loginform.jsp?err=fail");
		return;
	}
	
	// 사용자가 탈퇴처리된 사용자인지 체크
	if ("Yes".equals(customer.getDisabled())) {
		response.sendRedirect("loginform.jsp?err=disabled");
		return;
	}
	
	// 비밀번호가 일치하는지 체크
	if (!customer.getPassword().equals(password)){
		response.sendRedirect("loginform.jsp?err=fail");
		return;
	}

	// 여기까지 왔다면 인증된 고객이다
	// 인증된 고객의 정보를 세션에 저장한다. 
	// -> 세션에 저장되면 url이 바뀌어도 파괴만 안하면 유지되기 때문.
	session.setAttribute("loginId", customer.getId());
	
	// home.jsp를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("home.jsp");
%>