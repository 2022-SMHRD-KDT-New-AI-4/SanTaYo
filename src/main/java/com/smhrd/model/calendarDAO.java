package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class calendarDAO {
   
   private SqlSessionFactory SqlSessionFactory = SqlSessionManager.getSqlSession();

   public List<calendarVO> select() {
      
      SqlSession session = SqlSessionFactory.openSession(true);
      
      List<calendarVO> list = session.selectList("select");
      
      session.close();
      
      return list;
   }
  

}