<%--회원가입 폼, 고객정보를 입력해서 전달한다. --%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String err = request.getParameter("err");
	
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
         <li class="nav-item"><a class="nav-link" href="/app3/product/list.jsp">상품관리</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/customer/list.jsp">고객 관리</a></li>
         <li class="nav-item"><a class="nav-link disabled" href="">게시판 관리</a></li>
      </ul>
      <ul class="navbar-nav">
         <li class="nav-item"><a class="nav-link disabled" href="">로그인</a></li>
         <li class="nav-item"><a class="nav-link active" href="/app3/customer/form.jsp">회원가입</a></li>
      </ul>
   </div>
</nav>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">회원가입</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>신규 고객정보를 입력하세요.</p>
<% 
	if("id".equals(err)) {
	%>
			<div class="alert alert-danger">
				<strong>회원가입 실패</strong> 이미 사용중인 아이디로 가입할 수 없습니다.
			</div>
<% 
	} else if("email".equals(err)) { 
%>
			<div class="alert alert-danger">
				<strong>회원가입 실패</strong> 이미 사용중인 이메일로 가입할 수 없습니다.
			</div>
<%
	} 
%>
			<%--http://localhost/app3/customer/form.jsp --%>
			<form class="border bg-light p-3" method="post" action="insert.jsp">
				<div class="form-group mb-2">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="id"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">이름</label>
					<input type="text" class="form-control" name="name"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">전화번호</label>
					<input type="text" class="form-control" name="tel"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">이메일</label>
					<input type="text" class="form-control" name="email"/>
				</div>
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
					<button type="submit" class="btn btn-primary btn-sm">가입</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>