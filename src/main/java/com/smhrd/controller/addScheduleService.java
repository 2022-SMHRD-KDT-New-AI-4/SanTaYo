package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberVO;
import com.smhrd.model.joiningDAO;
import com.smhrd.model.joiningVO;
import com.smhrd.model.scheduleDAO;
import com.smhrd.model.scheduleVO;

@WebServlet("/addScheduleService")
public class addScheduleService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      response.setCharacterEncoding("UTF-8");
      PrintWriter out = response.getWriter();
      HttpSession session = request.getSession();
      MemberVO loginM = (MemberVO) session.getAttribute("loginM");
      
      String group_seq = request.getParameter("group_seq");
      String mountain_nm = request.getParameter("mountain_nm");
      String course = request.getParameter("course");
      String climb_level = request.getParameter("climb_level");
      String sche_sdt = request.getParameter("sche_sdt");
      String sche_edt = request.getParameter("sche_edt");
      String start_time = request.getParameter("start_time");
      String end_time = request.getParameter("end_time");
      String sche_title = request.getParameter("sche_title");
      String sche_contents = request.getParameter("sche_contents");
      String user_id = loginM.getUser_id();
      
      
      scheduleDAO dao=new scheduleDAO();
      joiningDAO jdao = new joiningDAO();
      
      String user_nm=dao.find_usernm(user_id);
      
      
      
      scheduleVO vo = new scheduleVO(group_seq,mountain_nm,course,climb_level,sche_sdt,sche_edt,start_time,end_time,sche_title,sche_contents,user_id);   
      int cnt = 0;
	try {
		cnt = dao.addSchedule(vo);
	} catch (SQLException e) {
		e.printStackTrace(); 
	}
      
      System.out.println("\n스케쥴시퀀스=" +vo.getSche_seq());
      
      joiningVO jvo= new joiningVO(vo.getSche_seq(), user_id);
      int cnt2 = jdao.addJoining(jvo);
        
      if(cnt>0 && cnt2>0) {
           out.print("<script>");
            out.print("location.href='TayoBasic.jsp'");
            out.print("alert(`일정추가 완료!`);");
            out.print("</script>");   
      }else {
         out.print("<script>");
            out.print("alert(`일정추가 실패ㅠㅠ`);");
            out.print("</script>");   
      }
   }

}