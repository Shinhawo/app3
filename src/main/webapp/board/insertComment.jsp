<%@page import="dao.BoardDao"%>
<%@page import="dao.commentDao"%>
<%@page import="vo.Board"%>
<%@page import="vo.Customer"%>
<%@page import="vo.Comment"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job="+URLEncoder.encode("댓글작성","utf-8"));
		return;
	}

	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String content = request.getParameter("content"); 
	
	Comment comment = new Comment();
	
	comment.setContent(content);
	comment.setCustomer(new Customer(loginId));
	comment.setBoard(new Board(boardNo));
	
	commentDao commentDao = new commentDao();
	commentDao.insertComment(comment);
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	board.setCommentCnt(board.getCommentCnt() + 1);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no="+boardNo);
	
%>