package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {
	// 세션 : 회원가입 / 로그인 기능들을 수행해주는 단위
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(MemberVO vo) {
		// TODO Auto-generated method stub
		// SqlSessionFactory에서 Connection(SqlSession) 하나 빌려오기
		// 매개변수 : true -> auto commit
		SqlSession session = sqlSessionFactory.openSession(true);
		String cvo = session.selectOne("check", vo.getUser_id());
		System.out.println(cvo);
		if (cvo != null) {
			session.close();
			return 0;
		} else {
			int cnt = session.insert("join", vo);
			session.close();
			return cnt;
		}
	}

	public MemberVO login(MemberVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);
		// 하나의 값만 확인하고 반환
		// -> DB 값을 확인했을 때 같은 값이 여러개이면 오류발생!!!
		MemberVO lvo = session.selectOne("login", vo);

		session.close(); // sql 호출 마무리 되면 세션도 마무리
		// 자원이 계속해서 사용되기 때문에 꼭 닫아주기

		return lvo;

	}

	public int update(MemberVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);

		int cnt = session.update("update_mem", vo);
		session.close();

		return cnt;
	}

	
	//유저 탈퇴 메소드들
	public int user_del_com(String user_id) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("user_del_com", user_id);
		session.close();
		return cnt;
	}

	public int user_del_bor(String user_id) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("user_del_bor", user_id);
		session.close();
		return cnt;
	}
	
	public int user_del_join(String user_id) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("user_del_join", user_id);
		session.close();
		return cnt;
	}
	
	public int user_del_group(String user_id) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("user_del_group", user_id);
		session.close();
		return cnt;
	}
	
	public int user_del_joining(String user_id) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("user_del_joining", user_id);
		session.close();
		return cnt;
	}
	
	public int user_del_sche(String user_id) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("user_del_sche", user_id);
		session.close();
		return cnt;
	}
	
	public int user_del_user(String user_id) {

		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("user_del_user", user_id);
		session.close();
		return cnt;
	}

}
