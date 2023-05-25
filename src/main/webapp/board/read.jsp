<%@page import="dao.BoardDao"%>
<%@page import="vo.Board"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	
	int no = Integer.parseInt(request.getParameter("no"));

	//글 번호에 해당하는 게시글 정보 조회
	BoardDao boardDao = new BoardDao();
	
	Board board = boardDao.getBoardByNo(no);
	
	board.setReadCnt(board.getReadCnt() + 1);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no=" + no);
%>