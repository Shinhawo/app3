<%@page import="dao.BoardDao"%>
<%@page import="vo.Customer"%>
<%@page import="vo.Board"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 세션에 속성으로 저장된 로그인한 고객의 아이디 조회하기
	String loginId = (String) session.getAttribute("loginId");
	if(loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job="+URLEncoder.encode("게시물등록","utf-8"));
		return;
	}

	// 요청 파라미터 조회
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// Board객체를 생성해서 요청파라미터및 고객정보 저장하기
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setCustomer(new Customer(loginId));
	
	// Board객체에 저장된 게시글 정보를 테이블에 저장시킨다.
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	// 게시글목록을 재요청하는 URL을 응답으로 보낸다
	response.sendRedirect("list.jsp");
	
%>