<%@page import="VO.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 URL - http://localhost/app3/product/detail.jsp?no=xxx

	// 요청파라미터 조회
	int no = Integer.parseInt(request.getParameter("no"));
	
	// 업무로직 수행 - 요청 파라미터로 전달받은 상품번호에 해당하는 상품 상세정보 조회하기
	ProductDao dao = new ProductDao();
	Product product = dao.getProductByNo(no);
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
			<li class="nav-item"><a class="nav-link active" href="/app3/customer/list.jsp">고객 관리</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="">게시판 관리</a></li>
		</ul>
	</div>
</nav>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">상품 상세 정보</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>상품 상세정보를 확인하세요.</p>
			
			<table class="table table-bordered ">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th>상품이름</th>
						<td><strong class="text-danger"><%=product.getName() %></strong></td>
						<th>카테고리</th>
						<td><%=product.getCategory().getName() %></td>
					</tr>
					<tr>
						<th>상품번호</th>
						<td><%=product.getNo() %></td>
						<th>제조회사</th>
						<td><%=product.getMaker() %></td>
					</tr>
					<tr>
						<th>할인가격</th>
						<td><strong class="text-danger"><%=product.getDiscountPrice() %> </strong>원</td>
						<th>가격</th>
						<td><span class="text-decoration-line-through"><%=product.getPrice() %></span> 원</td>
					</tr>
					<tr>
						<th>판매여부</th>
						<td><%="Y".equals(product.getOnSell())? "판매중" : "판매종료" %></td>
						<th>재고수량</th>
						<td><%=product.getStock() %></td>
					</tr>
					<tr>
						<th>수정일자</th>
						<td><%=product.getUpdateDate() %></td>
						<th>등록일자</th>
						<td><%=product.getCreateDate()%></td>
					</tr>
					<tr>
						<th>상품설명</th>
						<td colspan="4"><%=product.getDesciption() %></td>
					</tr>
				</tbody>
			</table>
			<div class="text-end">
			<!-- 
				현재 URL = http://localhost/app3/product/detail.jsp?n0=xxx
				
				삭제 URL = http://localhost/app3/product/delete.jsp
			 -->
				<a href="delete.jsp?no=<%=product.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
			
				
			<!-- 
				현재 URL = http://localhost/app3/product/detail.jsp?n0=xxx
				
				수정 URL = http://localhost/app3/product/update.jsp
			 -->	
				<a href="modifyform.jsp?no=<%=product.getNo() %>" class="btn btn-warning btn-sm">수정</a>
				
				
			<!-- 
				현재 URL = http://localhost/app3/product/detail.jsp?n0=xxx
				
				목록 URL = http://localhost/app3/product/list.jsp
			 -->
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>