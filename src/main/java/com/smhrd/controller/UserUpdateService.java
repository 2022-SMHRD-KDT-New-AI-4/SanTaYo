package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

/**
 * Servlet implementation class UserUpdateService
 */
@WebServlet("/UserUpdateService")
public class UserUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("pw");
		String user_nm = request.getParameter("name");
		String user_birthdate = request.getParameter("birth");
		String user_gender = request.getParameter("gender");
		String user_addr = request.getParameter("addr");
		String user_level = request.getParameter("level");
		
		MemberVO vo = new MemberVO(user_id, user_pw, user_nm, user_birthdate, user_gender, user_addr, user_level);
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.update(vo);
		
		if(cnt>0) {
			HttpSession session = request.getSession();
			session.removeAttribute("loginM");
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원정보 수정이 완료되었습니다.');");
			out.print("location.href='TayoMain.jsp'");
			out.print("</script>");
		}else {
			System.out.println("로그인실패");
		}
	}

}
