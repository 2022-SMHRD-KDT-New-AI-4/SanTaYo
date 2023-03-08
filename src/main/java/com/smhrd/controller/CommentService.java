package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;
import com.smhrd.model.MemberVO;

@WebServlet("/CommentService")
public class CommentService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cmt_seq = request.getParameter("cmt_seq");
		String board_seq = request.getParameter("board_seq");
		String cmt_content = request.getParameter("cmt_content");
		String cmt_dt = request.getParameter("cmt_dt");
		String user_id = request.getParameter("user_id");
		String group_name = request.getParameter("group_name");
		
		HttpSession session = request.getSession();
		
		
		

		CommentVO vo = new CommentVO(cmt_seq, board_seq, cmt_content, cmt_dt, user_id);

		CommentDAO dao = new CommentDAO();

		int cnt = dao.commentInsert(vo);

		response.setCharacterEncoding("UTF-8");

		

		if (cnt > 0) {
			System.out.println("입력성공");
		PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			out.print("<script>");
			out.print("location.href='Board_content.jsp?board_seq="+board_seq+"&group_name="+group_name+"'");
			out.print("</script>");
		} else {
			System.out.println("입력실패");
			
		}
	}

}
