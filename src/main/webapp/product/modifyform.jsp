<%@page import="VO.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="VO.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//요청 URL - http://localhost/app3/product/modifyForm.jsp?no=xxx

	// 요청파라미터 정보를 조회 - 상품번호 획득
	int no = Integer.parseInt(request.getParameter("no"));
	
	// 요청 파라미터로 전달받은 상품번호에 해당하는 상품정보 조회
	ProductDao productDao = new ProductDao();
	Product product = productDao.getProductByNo(no);
	int categoryNo = product.getCategory().getNo();

	// 모든 카테고리 목록정보 조회하기
	CategoryDao dao = new CategoryDao();
	List<Category> catList = dao.getCategories();
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
<%@ include file="../nav.jsp" %>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">상품정보 수정</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>상품 정보를 확인하고, 수정하세요</p>
			<form class="border bg-light p-3" method="post" action="modify.jsp">
				<input type="hidden" name="no" value="<%=no %>">
				
				<div class="form-group mb-2">
					<label class="form-label">상품카테고리</label>
					<select class="form-select" name="catNo">
<%
	for(Category category : catList){
%>
					<option value="<%=category.getNo() %>"<%=category.getNo() == categoryNo ? "selected" : ""%> ><%=category.getName() %></option>
<%
	}
%>
					</select>
				</div>
				
				<div class="form-group mb-2">
					<label class="form-label">상품이름</label>
					<input type="text" class="form-control" name="name" value="<%=product.getName() %>"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">제조회사</label>
					<input type="text" class="form-control" name="maker" value="<%=product.getMaker() %>"/>
				</div>
				
				<div class="form-group mb-2">
					<label class="form-label">상품가격</label>
					<input type="text" class="form-control" name="price" value="<%=product.getPrice() %>"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">할인가격</label>
					<input type="text" class="form-control" name="discountPrice" value="<%=product.getDiscountPrice() %>"/>
				</div>
				
				<div class="form-group mb-2">
					<label class="form-label">상품 설명</label>
					<textarea class="form-control" rows="5" name="description" ><%=product.getDesciption() %></textarea>
				</div>
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
					<button type="submit" class="btn btn-primary btn-sm">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>