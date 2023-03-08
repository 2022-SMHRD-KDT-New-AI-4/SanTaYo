package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class CommentDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int commentInsert(CommentVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);

		int cnt = session.insert("commentInsert", vo);

		session.close();

		return cnt;
	}

	
	
	public List<CommentVO> commentSel(String board_seq) {

		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<CommentVO> list = session.selectList("commentSel",board_seq);

		session.close(); 
		

		return list;

	}
	
	public int deleteComment(CommentVO cmt_seq) {
	      SqlSession session = sqlSessionFactory.openSession(true);

	      int cnt = session.delete("deleteComment", cmt_seq);

	      session.close();

	      return cnt;
	   }
}
