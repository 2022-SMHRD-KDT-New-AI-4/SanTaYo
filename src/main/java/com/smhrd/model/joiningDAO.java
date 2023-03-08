package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class joiningDAO {
   private SqlSessionFactory SqlSessionFactory = SqlSessionManager.getSqlSession();

   public joiningVO findJoining(joiningVO vo) {
      SqlSession session = SqlSessionFactory.openSession(true);

      joiningVO jvo = session.selectOne("findJoining", vo);

      session.close();

      return jvo;
   }
   
   public int addJoining(joiningVO vo) {
      SqlSession session = SqlSessionFactory.openSession(true);

      int cnt = session.insert("addJoining", vo);

      session.close();

      return cnt;
   }
   
   public int scheduleAppRemove(joiningVO vo) {
      SqlSession session = SqlSessionFactory.openSession(true);

      int cnt = session.delete("reMoveJoiningUser", vo);

      session.close();

      return cnt;
   }
   public List<String> findJoiningmember(String sche_seq) {

		SqlSession session = SqlSessionFactory.openSession(true);

		List<String> user_ids = session.selectOne("findJoiningmember", sche_seq);

		session.close();
		user_ids.toString();
		return user_ids;

	}
   
}