package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.GroupJoinDAO;
import com.smhrd.model.GroupJoinVO;

/**
 * Servlet implementation class GroupJoinService
 */
@WebServlet("/GroupJoinService")
public class GroupJoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String group_name = request.getParameter("group_name");
		
		GroupJoinDAO dao = new GroupJoinDAO();
		String group_id = dao.findgroup_seq(group_name);
		
		GroupJoinVO vo = new GroupJoinVO(user_id, group_id);
		
		int cnt = dao.gjoin(vo);
		
		if(cnt>0) {
			System.out.println("가입성공");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('그룹가입에 성공하셨습니다!');");
			out.print("location.href='MoimSangseSogae.jsp?group_name="+group_name+"'");
			out.print("</script>");
		}else {
			System.out.println("가입실패");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('오류');");
			out.print("location.href='TayoMain.jsp'");
			out.print("</script>");
		}

	}

}
