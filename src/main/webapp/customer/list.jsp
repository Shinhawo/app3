<%@page import="VO.Customer"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//요청파라미터 조회 -> 없음
	// 업무로직 수행 - 전체 상품목록조회
	CustomerDao dao = new CustomerDao();
	List<Customer> custList = dao.getAllCustomers();
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
   <div class="container">
      <ul class="navbar-nav me-auto">
         <li class="nav-item"><a class="nav-link" href="/app3/home.jsp">홈</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/product/list.jsp">상품관리</a></li>
         <li class="nav-item"><a class="nav-link active" href="/app3/customer/list.jsp">고객 관리</a></li>
         <li class="nav-item"><a class="nav-link disabled" href="">게시판 관리</a></li>
      </ul>
      <ul class="navbar-nav">
         <li class="nav-item"><a class="nav-link disabled" href="">로그인</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/customer/form.jsp">회원가입</a></li>
      </ul>
   </div>
</nav>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">고객 목록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>전체 고객 목록을 확인하세요.</p>
			
			<table class="table table-sm">
				<colgroup>
					<col width="10%">
					<col width="20">
					<col width="20%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>탈퇴여부</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
<%
	for (Customer customer : custList) {
%>
					<tr>
						<td><%=customer.getId() %></td>
						<td><a href="detail.jsp?id=<%=customer.getId() %>"><%=customer.getName() %></a></td>
						<td><%=customer.getTel() %></td>
						<td><%=customer.getEmail() %></td>
						<td><%=customer.getDisabled() %></td>
<% if(customer.getDisabled().equals("No")) { %>
						<td><a href="disable.jsp?id=<%=customer.getId() %>" class="btn btn-danger btn-xs">탈퇴처리</a></td>
<% } else{ %>
						<td><a href="enable.jsp?id=<%=customer.getId() %>" class="btn btn-success btn-xs">복구처리</a></td>
<% } %>
					</tr>
<%
	}
%>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>