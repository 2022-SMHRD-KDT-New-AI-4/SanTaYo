package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.GroupDAO;
import com.smhrd.model.GroupVO;

@WebServlet("/GroupUpdateService")
public class GroupUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String group_name = request.getParameter("group_name");
		String group_info = request.getParameter("group_info");
		String group_level = request.getParameter("group_level");
		String[] group_age = request.getParameterValues("group_age");
		String group_gender = request.getParameter("group_gender");
		
		PrintWriter out = response.getWriter();
		GroupDAO dao = new GroupDAO();
		
		HttpSession session = request.getSession();
		String group_ages = "";

		for (int i = 0; i < group_age.length; i++) {
			group_ages += group_age[i] + " ";
			if (group_age[i].equals("상관없음")) {
				break;
			}
		}

		GroupVO vo = new GroupVO(group_name,group_info, group_level, group_ages, group_gender);
		System.out.println(vo);

		int cnt = dao.groupUpdate(vo);

		if (cnt > 0) {
			System.out.println("모임변경 성공");

			session.setAttribute("groupM", group_name);
			out.print("<script>");
			out.print("alert('모임변경에 성공하셨습니다!');");
			out.print("location.href='MoimSangseSogae.jsp?group_name=" + vo.getGroup_name() + "'");
			out.print("</script>");

		} else {
			System.out.println("모임변경 실패...");
			// main.jsp이동
			response.sendRedirect("TayoMoim.jsp");
		}
	}
}
