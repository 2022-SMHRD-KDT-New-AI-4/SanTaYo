package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardVO;
import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;


@WebServlet("/BoardDeleteService")
public class BoardDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String board_seq = request.getParameter("board_seq");
		String group_name = request.getParameter("group_name");
		
		HttpSession session = request.getSession();
		
		
	
		

		
		BoardVO vo = new BoardVO(board_seq);

		BoardDAO dao = new BoardDAO();
		

	
		
		
		
		dao.commentAllDelete(board_seq);// 댓글 삭제하는 메소드
		
		int cnt = dao.boardDelete(vo); // 글 삭제하는 메소드
		


		
		

		if (cnt > 0) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			out.print("<script>");
			out.print("alert('게시글이 삭제되었습니다');");
			out.print("location.href='MoimSangseGesipan.jsp?board_seq=" + board_seq + "&group_name=" + group_name + "'");
			out.print("</script>");

		} else {
			System.out.println("삭제 실패..");

		}
	}

}
