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
import com.smhrd.model.MemberVO;

@WebServlet("/BoardInsertService")
public class BoardInsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String group_name = request.getParameter("group_name");
		String group_seq = request.getParameter("group_seq");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		HttpSession session = request.getSession();
		MemberVO loginM = (MemberVO) session.getAttribute("loginM");
		
//		HttpSession session = request.getSession();
//		
//		MemberVO lvo = (MemberVO) session.getAttribute("loginM");
//		user_id = lvo.getUser_id();
	
		

		
		BoardVO vo = new BoardVO(group_seq, board_title, board_content, loginM.getUser_id());
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardInsert(vo);
		
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
        
		if(cnt>0) {
			System.out.println("입력성공");
			response.setContentType("text/html;charset=UTF-8");
			out.print("<script>");
			out.print("alert('게시글이 작성 완료되었습니다.');");
			out.print("location.href='MoimSangseGesipan.jsp?group_name="+group_name+"'");
			out.print("</script>");
		}else {
			System.out.println("입력실패");
			
		}
	}

}
