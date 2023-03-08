package com.smhrd.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class scheduleDAO {
	private SqlSessionFactory SqlSessionFactory = SqlSessionManager.getSqlSession();

	public int addSchedule(scheduleVO vo) throws SQLException {
		SqlSession session = SqlSessionFactory.openSession(true);

		int cnt = session.insert("addSchedule", vo);

		session.close();

		return cnt;
	}

	public List<scheduleVO> select(String group_seq) {

		SqlSession session = SqlSessionFactory.openSession(true);

		List<scheduleVO> list = session.selectList("select", group_seq);

		session.close();

		return list;
	}

	public List<scheduleVO> user_schedule(String user_nm) {

		SqlSession session = SqlSessionFactory.openSession(true);

		List<scheduleVO> list = session.selectList("selectUserSchedule", user_nm);

		session.close();

		return list;
	}

	public scheduleVO scheduleAll(String sche_seq) {

		SqlSession session = SqlSessionFactory.openSession(true);

		scheduleVO svo = session.selectOne("scheduleAll", sche_seq);

		session.close();

		return svo;
	}

	public String findgroup_seq(String group_nm) {

		SqlSession session = SqlSessionFactory.openSession(true);

		String group_seq = session.selectOne("findgroup_seq", group_nm);

		session.close();

		return group_seq;

	}

	public String find_usernm(String user_id) {

		SqlSession session = SqlSessionFactory.openSession(true);

		String user_nm = session.selectOne("ScheduleUsernm", user_id);

		session.close();

		return user_nm;

	}

	public List<scheduleDTO> sche_sel(String sche_seq) {

		SqlSession session = SqlSessionFactory.openSession(true);

		List<scheduleDTO> dto = session.selectList("sel_sche", sche_seq);

		session.close();

		return dto;

	}

	public int scheDelete(String sche_seq) {
		SqlSession session = SqlSessionFactory.openSession(true);

		int cnt = session.delete("scheDelete", sche_seq);

		session.close();

		return cnt;
	}
	
	public String group__sel(String group_seq) {

	      SqlSession session = SqlSessionFactory.openSession(true);

	      String group_nm = session.selectOne("group__sel", group_seq);

	      session.close();

	      return group_nm;

	   }
	   
	   public List<scheduleVO> mySche(String user_id) {

	      SqlSession session = SqlSessionFactory.openSession(true);

	      List<scheduleVO> list = session.selectList("mySche", user_id);

	      session.close();

	      return list;

	   }
}
