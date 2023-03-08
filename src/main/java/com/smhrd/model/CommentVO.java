package com.smhrd.model;

public class CommentVO {

	private String cmt_seq;
	private String board_seq;
	private String cmt_content;
	private String cmt_dt;
	private String user_id;

	@Override
	public String toString() {
		return "CommentVO [cmt_seq=" + cmt_seq + ", board_seq=" + board_seq + ", cmt_content=" + cmt_content
				+ ", cmt_dt=" + cmt_dt + ", user_id=" + user_id + "]";
	}

	public CommentVO() {

	}

	
	
	public CommentVO(String cmt_seq, String board_seq) {
		super();
		this.cmt_seq = cmt_seq;
		this.board_seq = board_seq;
	}

	public CommentVO(String cmt_seq, String board_seq, String cmt_content, String cmt_dt, String user_id) {
		this.cmt_seq = cmt_seq;
		this.board_seq = board_seq;
		this.cmt_content = cmt_content;
		this.cmt_dt = cmt_dt;
		this.user_id = user_id;
	}

	public String getCmt_seq() {
		return cmt_seq;
	}

	public void setCmt_seq(String cmt_seq) {
		this.cmt_seq = cmt_seq;
	}

	public String getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public String getCmt_dt() {
		return cmt_dt;
	}

	public void setCmt_dt(String cmt_dt) {
		this.cmt_dt = cmt_dt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
