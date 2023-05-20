<%--횐원가입 완료 메세지르 출력한다. --%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
			<h1 class="border bg-light fs-4 p-2">회원가입 완료</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>회원가입이 완료되었습니다.</p>
		</div>
	</div>
</div>
</body>
</html>