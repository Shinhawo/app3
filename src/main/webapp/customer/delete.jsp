<%@page import="VO.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 삭제 기능을 구현하세요.
	//요청 URL = localhost/app3/customer/delete.jsp?id=xxx
	// 요청 파라미터값 조회
	String id = request.getParameter("id");
	
	// 업무로직 수행 - 요청파라미터로 전달받은 상품번호에 해당하는 상품정보를 삭제하기.
	CustomerDao dao = new CustomerDao();
	// 요청 URL을 알면 탈퇴하지 않은 고객정보도 삭제할 수 있다.
	Customer customer = dao.getCustomerById(id);
	if("No".equals(customer.getDisabled())){ // 사용중인 고객인지 체크
		response.sendRedirect("detail.jsp?id="+id+"&err=fail");
		return;
	}
	
	dao.deleteCustomerById(id);
	
	// 재요청 URL 응답보내기
	response.sendRedirect("list.jsp");
%>