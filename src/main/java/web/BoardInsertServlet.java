package web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.Board;
import vo.Customer;


@MultipartConfig(
		fileSizeThreshold = 1024*1024*10,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*100)
@WebServlet(urlPatterns = "/board/insert")
public class BoardInsertServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest reqest, HttpServletResponse response) throws ServletException, IOException {
		
		// ! 세션에서 로그인된 고객아이디 조회하기 !
		HttpSession session = reqest.getSession();
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null){
			response.sendRedirect("../loginform.jsp?err=req&job="+URLEncoder.encode("게시글등록","utf-8"));
			return;
		}
		
		// ! 요청파라미터 조회 !
		// 일반 입력필드의 값 조회
		String title = reqest.getParameter("title");
		String content = reqest.getParameter("content");
		// 첨부파일 입력필드의 처리
		Part upfilePart = reqest.getPart("upfile");
		
		String fileName = null;
		if (!upfilePart.getSubmittedFileName().isEmpty()) {
			fileName = System.currentTimeMillis() + upfilePart.getSubmittedFileName();

			// 저장할 경로 지정하기
			// upfilePart.write("C:\\workspace\\files");
			InputStream in = upfilePart.getInputStream();
			OutputStream out = new FileOutputStream(new File("C:\\workspace\\files", fileName));
			IOUtils.copy(in, out);
		}
		
		// ! 업무로직 수행 ! 
		Board board = new Board();
		board.setTitle(title);
		board.setContent(content);
		board.setCustomer(new Customer(loginId));
		board.setFilename(fileName);
		
		BoardDao boardDao = new BoardDao();
		boardDao.insertBoardFile(board);
		
		// ! 재요청 URL 전송 !
		response.sendRedirect("list.jsp");
	}
}
