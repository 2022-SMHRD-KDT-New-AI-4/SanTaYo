package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<BoardVO> selectAll(String group_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BoardVO> list = session.selectList("board_sel_all", group_seq);
		session.close();
		return list;
	}

	public BoardVO boardConSel(String board_seq) {

		SqlSession session = sqlSessionFactory.openSession(true);
		// 하나의 값만 확인하고 반환
		// -> DB 값을 확인했을 때 같은 값이 여러개이면 오류발생!!!
		BoardVO lvo = session.selectOne("board_con_sel", board_seq);

		session.close(); // sql 호출 마무리 되면 세션도 마무리
		// 자원이 계속해서 사용되기 때문에 꼭 닫아주기

		return lvo;

	}

	public int boardUpdate(BoardVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);

		int cnt = session.update("boardUpdate", vo);

		session.close();

		return cnt;
	}

	public int boardInsert(BoardVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);

		int cnt = session.insert("boardInsert", vo);

		session.close();

		return cnt;
	}

	public int boardDelete(BoardVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);

		int cnt = session.delete("boardDelete", vo);

		session.close();

		return cnt;
	}

	public int commentAllDelete(String board_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);

		int cnt2 = session.delete("commentAllDelete", board_seq);

		session.close();

		return cnt2;
	}
}
