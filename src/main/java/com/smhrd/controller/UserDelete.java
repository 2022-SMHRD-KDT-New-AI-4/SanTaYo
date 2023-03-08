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
 * Servlet implementation class UserDelete
 */
@WebServlet("/UserDelete")
public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberVO loginM = (MemberVO) session.getAttribute("loginM");
		
		MemberDAO dao = new MemberDAO();
		
		int cnt1 = dao.user_del_com(loginM.getUser_id());
		int cnt2 = dao.user_del_bor(loginM.getUser_id());
		int cnt3 = dao.user_del_join(loginM.getUser_id());
		int cnt4 = dao.user_del_group(loginM.getUser_id());
		int cnt5 = dao.user_del_joining(loginM.getUser_id());
		int cnt6 = dao.user_del_sche(loginM.getUser_id());
		int cnt7 = dao.user_del_user(loginM.getUser_id());
		
		if(cnt7 > 0) {
			System.out.println("유저 탈퇴 성공");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원탈퇴 되었습니다.');");
			out.print("location.href='TayoMain.jsp'");
			out.print("</script>");
			
		}else {
			System.out.println("유저 탈퇴 실패");
		}
		
		
	}

}
