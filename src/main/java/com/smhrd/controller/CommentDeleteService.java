package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;

@WebServlet("/CommentDeleteService")
public class CommentDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String board_seq = request.getParameter("board_seq");

		String group_name = request.getParameter("group_name");
		String cmt_seq = request.getParameter("cmt_seq");

	
		
		
		CommentVO vo = new CommentVO(cmt_seq, board_seq);

		CommentDAO dao = new CommentDAO();

		int cnt = dao.deleteComment(vo);


		
		

		if (cnt > 0) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			out.print("<script>");
			out.print("alert('댓글 삭제가 완료되었습니다.');");
			out.print("location.href='Board_content.jsp?board_seq=" + board_seq + "&group_name=" + group_name + "'");
			out.print("</script>");

		} else {
			System.out.println("삭제 실패..");

		}

	}
}
