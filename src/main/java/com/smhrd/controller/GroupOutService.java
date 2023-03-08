package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.GroupDAO;
import com.smhrd.model.GroupJoinDAO;
import com.smhrd.model.GroupJoinVO;
import com.smhrd.model.GroupVO;

@WebServlet("/GroupOutService")
public class GroupOutService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String user_id = request.getParameter("user_id");
		String group_id = request.getParameter("group_id");
		String group_seq = request.getParameter("group_seq");

		GroupJoinVO vo = new GroupJoinVO(user_id, group_id);
		GroupJoinDAO dao = new GroupJoinDAO();

		GroupVO bvo = new GroupVO(group_seq, user_id);
		GroupDAO bao = new GroupDAO();

		int cnt2 = bao.groupCommentAllDelete(bvo);

		int cnt3 = bao.groupBoardAllDelete(bvo);

		int cnt = dao.groupOut(vo);

		PrintWriter out = response.getWriter();
		if (cnt > 0) {
	
			System.out.println("탈퇴성공");
			out.print("<script>");
			out.print("alert(`모임 탈퇴완료`);");
			out.print("location.href='TayoMain.jsp?user_id="+user_id+"'");
			out.print("</script>");
		} else {
			System.out.println("탈퇴실패");
			System.out.println("탈퇴성공");
			out.print("<script>");
			out.print("alert(`모임 탈퇴실패`);");
			out.print("location.href='TayoMain.jsp?user_id="+user_id+"'");
			out.print("</script>");

		}
	}

}
