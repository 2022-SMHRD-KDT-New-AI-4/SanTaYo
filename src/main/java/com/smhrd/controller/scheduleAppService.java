package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.joiningDAO;
import com.smhrd.model.joiningVO;


@WebServlet("/scheduleAppService")
public class scheduleAppService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      PrintWriter out = response.getWriter();
      HttpSession session = request.getSession();
      
      String user_id = request.getParameter("user_id");
      String sche_seq = (String)session.getAttribute("schedule_seq");
      String group_name = request.getParameter("group_name");
      
      

      joiningDAO dao = new joiningDAO();
      joiningVO vo= new joiningVO(sche_seq, user_id);
      
      joiningVO fvo=dao.findJoining(vo);
      System.out.println(vo.getSche_seq()+vo.getUser_id());
      System.out.println(group_name);
      
      if(fvo==null) {
         int cnt = dao.addJoining(vo);
         if(cnt>0) {
            response.setContentType("text/html;charset=UTF-8");
            out.print("<script>");
            out.print("alert('일정 신청이 완료되었습니다.');");
            out.print("location.href='MoimSangseiljeong.jsp?group_name="+group_name+"'");
            out.print("</script>");
         }
      }else {
         int cnt = dao.scheduleAppRemove(vo);
         if(cnt>0) {
         response.setContentType("text/html;charset=UTF-8");
         out.print("<script>");
         out.print("alert('일정 신청 취소가 완료되었습니다.');");
         out.print("location.href='MoimSangseiljeong.jsp?group_name="+group_name+"'");
         out.print("</script>");
      }}
      

      
      
      
      
      
   }

}