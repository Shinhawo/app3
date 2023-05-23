<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 세션에서 로그인된 사용자아이디를 조회
	String loginId = (String) session.getAttribute("loginId");
	System.out.println("로그인 아이디: " + loginId);
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
   <div class="container">
      <ul class="navbar-nav me-auto">
         <li class="nav-item"><a class="nav-link active" href="/app3/home.jsp">홈</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/product/list.jsp">상품관리</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/customer/list.jsp">고객 관리</a></li>
         <li class="nav-item"><a class="nav-link" href="">게시판 관리</a></li>
      </ul>
      <ul class="navbar-nav">
<%
	if (loginId != null) {
%>
         <li class="nav-item"><a class="nav-link" href="/app3/logout.jsp">로그아웃</a></li>
<%
	} else {
%>
         <li class="nav-item"><a class="nav-link" href="/app3/loginform.jsp">로그인</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/customer/form.jsp">회원가입</a></li>
<%	
	}
%>
      </ul>
   </div>
</nav>