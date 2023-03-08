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

@WebServlet("/BoardUpdateService")
public class BoardUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String board_title = request.getParameter("board_title");
		String board_seq = request.getParameter("board_seq");
		String board_content = request.getParameter("board_content");
		String group_name = request.getParameter("group_name");

		HttpSession session = request.getSession();

		BoardVO vo = new BoardVO(board_seq,board_title,board_content);

		BoardDAO dao = new BoardDAO();

		System.out.println(board_title+board_content+board_seq);
		
		int cnt = dao.boardUpdate(vo);
    
        System.out.println(cnt);
        
		PrintWriter out = response.getWriter();
     
		if (cnt > 0) {
			response.setContentType("text/html; charset=UTF-8");
			System.out.println("입력성공");
			out.print("<script>");
			out.print("alert('게시글이 수정되었습니다');");
			out.print("location.href='Board_content.jsp?board_seq=" + board_seq + "&group_name=" + group_name + "'");
			out.print("</script>");
		} else {
			System.out.println("수정실패");

		}
	}
}
