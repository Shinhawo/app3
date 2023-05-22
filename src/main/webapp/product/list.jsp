<%@page import="VO.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회 => 없는디요
	
	// 업무로직 수행 - 전체 상품목록 조회
	ProductDao dao = new ProductDao();
	List<Product> productList = dao.getProducts();
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
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link" href="/app3/home.jsp">홈</a></li>
			<li class="nav-item"><a class="nav-link active" href="/app3/product/list.jsp">상품관리</a></li>
			<li class="nav-item"><a class="nav-link " href="/app3/customer/list.jsp">고객 관리</a></li>
			<li class="nav-item"><a class="nav-link " href="">게시판 관리</a></li>
		</ul>
	</div>
</nav>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">전체 상품 리스트</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>전체 상품 목록을 확인하세요.</p>
			<table class="table table-sm">
				<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>제조사</th>
						<th>가격</th>
						<th>할인가격</th>
					</tr>
				</thead>
				<tbody>
<%
	for(Product product : productList){
%>
					<tr>
						<td><%=product.getNo() %></td>
						<td><a href="detail.jsp?no=<%=product.getNo() %>" class="text-black text-decoration-none"><%=product.getName() %></a></td>
						<td><%=product.getMaker() %></td>
						<td><%=product.getPrice() %>원</td>
						<td><%=product.getDiscountPrice() %>원</td>
					</tr>
<%
	} 
%>
				</tbody>
			</table>
			
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary btn-sm">새 상품 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>