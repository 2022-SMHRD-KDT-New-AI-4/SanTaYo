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

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		MemberVO vo = new MemberVO(user_id, user_pw);


		MemberDAO dao = new MemberDAO();
		// 로그인 처리 (db에 값이 있는지 확인) -> 사용자의 정보 가져오기
		MemberVO lvo = dao.login(vo);

		System.out.println(lvo);
		// 로그인 성공 / 실패 판단
		


		if (lvo != null) { // 로그인 성공
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();

			
			session.setAttribute("loginM",lvo);
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('"+lvo.getUser_nm()+"님 환영합니다!');");
			out.print("location.href='TayoMain.jsp'");
			out.print("</script>");
		} else { // 로그인 실패
			System.out.println("로그인 실패");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('아이디 또는 비밀번호를 잘 못 입력했습니다.');");
			out.print("location.href='TayoLogin.jsp'");
			out.print("</script>");
		}

	}

}
