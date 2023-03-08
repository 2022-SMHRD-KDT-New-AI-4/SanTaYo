package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class GroupJoinDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<GroupJoinVO> groupList(String group_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);

		List<GroupJoinVO> list = session.selectList("groupList", group_seq);

		session.close();

		return list;
	}

	public String findgroup_seq(String group_nm) {

		SqlSession session = sqlSessionFactory.openSession(true);

		String group_seq = session.selectOne("findgroup_seq", group_nm);

		session.close();

		return group_seq;

	}

	public MemberVO user_sel(String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		// 하나의 값만 확인하고 반환
		// -> DB 값을 확인했을 때 같은 값이 여러개이면 오류발생!!!
		MemberVO lvo = session.selectOne("user_sel", user_id);

		session.close(); // sql 호출 마무리 되면 세션도 마무리
		// 자원이 계속해서 사용되기 때문에 꼭 닫아주기

		return lvo;
	}

	public int gjoin(GroupJoinVO vo) {
		// TODO Auto-generated method stub
		// SqlSessionFactory에서 Connection(SqlSession) 하나 빌려오기
		// 매개변수 : true -> auto commit
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("gjoin", vo);
		session.close();
		return cnt;
	}

	public int groupOut(GroupJoinVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("groupOut", vo);
		session.close();
		return cnt;
	}
}
