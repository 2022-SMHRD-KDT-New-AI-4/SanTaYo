package com.smhrd.model;

public class GroupJoinVO {
     private String join_seq;
     private String user_id;
     private String group_id;
     private String join_dt;
     
     
     
	@Override
	public String toString() {
		return "GroupJoinVO [join_seq=" + join_seq + ", user_id=" + user_id + ", group_id=" + group_id + ", join_dt="
				+ join_dt + "]";
	}



	public GroupJoinVO() {
	}



	public GroupJoinVO(String user_id, String group_id) {
		super();
		this.user_id = user_id;
		this.group_id = group_id;
	}



	public GroupJoinVO(String join_seq, String user_id, String group_id, String join_dt) {
		this.join_seq = join_seq;
		this.user_id = user_id;
		this.group_id = group_id;
		this.join_dt = join_dt;
	}



	public String getJoin_seq() {
		return join_seq;
	}



	public void setJoin_seq(String join_seq) {
		this.join_seq = join_seq;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getGroup_id() {
		return group_id;
	}



	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}



	public String getJoin_dt() {
		return join_dt;
	}



	public void setJoin_dt(String join_dt) {
		this.join_dt = join_dt;
	}
     
     
     
     
}
