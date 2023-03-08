package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

/**
 * Servlet implementation class JoinService
 */
@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("pw");
		String pwcheck = request.getParameter("pwcheck");
		String user_nm = request.getParameter("name");
		String user_birthdate = request.getParameter("birth");
		String user_gender = request.getParameter("gender");
		String user_addr = request.getParameter("addr");
		String user_level = request.getParameter("level");

		
		
		if(user_pw.equals(pwcheck)) {
		
		MemberVO vo = new MemberVO(user_id, user_pw, user_nm, user_birthdate, user_gender, user_addr, user_level);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(vo);
		
		if (cnt > 0) { 
			System.out.println("회원가입 성공");
			RequestDispatcher rd = request.getRequestDispatcher("Tayochuka.jsp");
			request.setAttribute("joinEmail", user_id);
			rd.forward(request, response);
			//join_success.jsp 이동
		}else {
			System.out.println("중복된아이디");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('중복된아이디 입니다.');");
			out.print("location.href='TayoJoin.jsp'");
			out.print("</script>");
//			main.jsp 이동
//			response.sendRedirect("main.jsp");
		}
		}else {
			System.out.println("비밀번호가 일치하지않습니다.");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지않습니다.');");
			out.print("location.href='TayoJoin.jsp'");
			out.print("</script>");
		}
	}

}
