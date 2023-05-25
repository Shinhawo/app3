<%@page import="dao.BoardDao"%>
<%@page import="vo.Board"%>
<%@page import="vo.Comment"%>
<%@page import="dao.commentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	/*
	요청 URL 
		localhost/app3/board/deleteComment.jsp?no=상품번호&cno=댓글번호
	*/
	
	
	// 세션에서 로그인한 사용자 정보 조회하기
	String loginId = (String) session.getAttribute("loginId");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job" +URLEncoder.encode("댓글삭제", "utf-8"));
		return;
	}

	int boardNo = Integer.parseInt(request.getParameter("no"));
	int commentNo = Integer.parseInt(request.getParameter("cno"));
	
	commentDao commentDao = new commentDao();
	Comment comment = commentDao.getCommentByNo(commentNo);
	
	if(!loginId.equals(comment.getCustomer().getId())){
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id");
		return;
	}
	
	commentDao.deleteCommentByNo(commentNo);
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	board.setCommentCnt(board.getCommentCnt() - 1);
	
	boardDao.updateBoard(board);
	
	
	response.sendRedirect("detail.jsp?no=" + boardNo);
%>