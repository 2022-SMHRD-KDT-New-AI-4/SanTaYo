package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.GroupDAO;
import com.smhrd.model.GroupVO;

/**
 * Servlet implementation class GroupFindService
 */
@WebServlet("/GroupFindService")
public class GroupFindService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String group_name = request.getParameter("gname");
		String group_level = request.getParameter("level");
		String group_gender = request.getParameter("gender");
		String group_age = request.getParameter("age");

		GroupDAO dao = new GroupDAO();
		List<GroupVO> list = dao.selectAll();
		ArrayList<GroupVO> result = new ArrayList<GroupVO>();

		for (GroupVO vo : list) {
			if (vo.getGroup_name().contains(group_name)) {
				if (vo.getGroup_level().contains(group_level) || vo.getGroup_level().contains("상관")
						|| group_level.contains("상관")) {
					if (vo.getGroup_age().contains(group_age) || vo.getGroup_age().contains("상관")
							|| group_age.contains("상관")) {
						if (vo.getGroup_gender().contains(group_gender) || vo.getGroup_gender().contains("상관")
								|| group_gender.contains("상관")) {
							result.add(vo);
						}
					}

				}
			}

		}

		request.setAttribute("data_list", result);
		RequestDispatcher rd = request.getRequestDispatcher("TayoFind.jsp");
		rd.forward(request, response);

	}

}
