package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.scheduleDAO;
import com.smhrd.model.scheduleDTO;
import com.smhrd.model.scheduleVO;

@WebServlet("/MoimSangseiljeong")
public class MoimSangseiljeong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String sche_seq = request.getParameter("sche_seq");
		session.setAttribute("schedule_seq", sche_seq);
		scheduleDAO dao = new scheduleDAO();
		scheduleVO vo = dao.scheduleAll(sche_seq);
		List<scheduleDTO> dto = dao.sche_sel(sche_seq);

		for (int i = 0; i < dto.size(); i++) {
			String usernm = dao.find_usernm(dto.get(i).getMaden_id());
			dto.get(i).setJoining_mem(dao.find_usernm(dto.get(i).getUser_id()));
			dto.get(i).setMaden_id(usernm + "(" + dto.get(i).getMaden_id() + ")");
			dto.get(i).setMoim_nm(dao.group__sel(dto.get(0).getGroup_seq()));
		}

		Gson gson = new Gson();
		response.setCharacterEncoding("UTF-8");

		String result = gson.toJson(dto);
		response.getWriter().print(result);

	}

}