<%@page import="dao.BoardDao"%>
<%@page import="vo.Board"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//요청 URL - http://localhost/app3/product/modifyForm.jsp?no=xxx

	// 요청파라미터 정보를 조회 - 상품번호 획득
	int no = Integer.parseInt(request.getParameter("no"));
	
	// 요청 파라미터로 전달받은 상품번호에 해당하는 상품정보 조회
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(no);


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
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="상품"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">게시글 수정</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>게시글을 수정하세요</p>
			<form class="border bg-light p-3" method="post" action="modify.jsp">
				<input type="hidden" name="no" value="<%=no %>">
				
				
				<div class="form-group mb-2">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="title" value="<%=board.getTitle() %>"/>
				</div>
				
				<div class="form-group mb-2">
					<label class="form-label">내용</label>
					<textarea rows="15" class="form-control" name="content"><%=board.getContent() %></textarea>
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