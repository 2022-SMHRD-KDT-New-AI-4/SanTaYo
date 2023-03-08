package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class GroupDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int groupinsert(GroupVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("groupinsert", vo); // sql문 실행성공시 1을 반환 / join은 맵퍼와 연결

		session.close();

		return cnt;
	}

	public List<GroupVO> selectAll() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<GroupVO> list = session.selectList("selectAll");
		session.close();
		return list;
	}

	public String check(String group_name) {

		SqlSession session = sqlSessionFactory.openSession(true);
		// 하나의 값만 확인하고 반환
		// -> DB 값을 확인했을 때 같은 값이 여러개이면 오류발생!!!
		String lvo = session.selectOne("gcheck", group_name);

		session.close(); // sql 호출 마무리 되면 세션도 마무리
		// 자원이 계속해서 사용되기 때문에 꼭 닫아주기

		return lvo;

	}

	public GroupVO select(String group_name) {

		SqlSession session = sqlSessionFactory.openSession(true);
		// 하나의 값만 확인하고 반환
		// -> DB 값을 확인했을 때 같은 값이 여러개이면 오류발생!!!
		GroupVO lvo = session.selectOne("group_sel", group_name);

		session.close(); // sql 호출 마무리 되면 세션도 마무리
		// 자원이 계속해서 사용되기 때문에 꼭 닫아주기

		return lvo;

	}

	public List<GroupVO> mymakeselectAll(String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<GroupVO> list = session.selectList("mymakeselectAll", user_id);
		session.close();
		return list;
	}

	public List<GroupVO> myjoinselectAll(String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<GroupVO> list = session.selectList("myjoinselectAll", user_id);
		session.close();
		return list;
	}

	public int groupCommentAllDelete(GroupVO bvo) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt2 = session.delete("groupCommentAllDelete", bvo);
		session.close();
		return cnt2;
	}

	public int groupBoardAllDelete(GroupVO bvo) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt3 = session.delete("groupBoardAllDelete", bvo);
		session.close();
		return cnt3;
	}

	public GroupVO adminSelect(GroupVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);
		// 하나의 값만 확인하고 반환
		// -> DB 값을 확인했을 때 같은 값이 여러개이면 오류발생!!!
		GroupVO lvo = session.selectOne("adminSelect", vo);

		session.close(); // sql 호출 마무리 되면 세션도 마무리
		// 자원이 계속해서 사용되기 때문에 꼭 닫아주기

		return lvo;

	}

	public int groupUpdate(GroupVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("groupUpdate", vo); // sql문 실행성공시 1을 반환 / join은 맵퍼와 연결

		session.close();

		return cnt;
	}

}
