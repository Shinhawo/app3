<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job" +URLEncoder.encode("게시글수정", "utf-8"));
		return;
	}

	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(no);
	
	if (!board.getCustomer().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no=" + no +"&err=id&job="+URLEncoder.encode("게시글수정", "utf-8"));
		return;
	}
	
	board.setTitle(title);
	board.setContent(content);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no=" + no);
	
	
	
	

	
%>