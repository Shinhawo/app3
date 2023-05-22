<%@page import="VO.Category"%>
<%@page import="dao.ProductDao"%>
<%@page import="VO.Product"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%-- 저장만하는 update, delete, insert 등은 디자인이 필요없음  
	 따라서 다 지우고 이렇게만 한다.
--%>

<%
	// 요청파라미터 조회
	int catNo = Integer.parseInt(request.getParameter("catNo"));
	String name = request.getParameter("name");
	String maker = request.getParameter("maker");
	int amount = Integer.parseInt(request.getParameter("amount"));
	int price = Integer.parseInt(request.getParameter("price"));
	String description = request.getParameter("description");
	
	Product product = new Product();
	product.setName(name);
	product.setMaker(maker);
	product.setStock(amount);
	product.setPrice(price);
	product.setDiscountPrice((int) (product.getPrice()*0.9));
	product.setDesciption(description);
	
	// 번호만 받는 생성자
	product.setCategory(new Category(catNo));
	
	
	// 업무로직 수행 - 새 상품정보를 db에 저장시킨다.
	ProductDao dao = new ProductDao();
	dao.insertProduct(product);
	
	// 재요청 URL응답
	// 현재 요청 URL http://localhost/app3/product/insert.jsp
	// 재요청 URL http://localhost/app3/product/list.jsp
	response.sendRedirect("list.jsp");
	
%>