package com.smhrd.model;

public class GroupVO {
	private String group_seq;
	private String group_name;
	private String user_id;
	private String group_info;
	private String group_level;
	private String group_age;
	private String group_gender;
	private String group_dt;

	public GroupVO(String group_name, String user_id, String group_info, String group_level, String group_age,
			String group_gender, String group_dt) {
		this.group_name = group_name;
		this.user_id = user_id;
		this.group_info = group_info;
		this.group_level = group_level;
		this.group_age = group_age;
		this.group_gender = group_gender;
		this.group_dt = group_dt;
	}

	public GroupVO(String group_name, String group_info, String group_level, String group_age, String group_gender) {
		this.group_name = group_name;
		this.group_info = group_info;
		this.group_level = group_level;
		this.group_age = group_age;
		this.group_gender = group_gender;
	}

	public GroupVO(String group_name, String user_id) {
		this.group_name = group_name;
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "GroupVO [group_name=" + group_name + ", user_id=" + user_id + ", group_info=" + group_info
				+ ", group_level=" + group_level + ", group_age=" + group_age + ", group_gender=" + group_gender
				+ ", group_dt=" + group_dt + "]";
	}

	public GroupVO() {

	}

	public GroupVO(String group_seq, String group_name, String user_id, String group_info, String group_level,
			String group_age, String group_gender, String group_dt) {
		this.group_seq = group_seq;
		this.group_name = group_name;
		this.user_id = user_id;
		this.group_info = group_info;
		this.group_level = group_level;
		this.group_age = group_age;
		this.group_gender = group_gender;
		this.group_dt = group_dt;
	}

	public String getGroup_seq() {
		return group_seq;
	}

	public void setGroup_seq(String group_seq) {
		this.group_seq = group_seq;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGroup_info() {
		return group_info;
	}

	public void setGroup_info(String group_info) {
		this.group_info = group_info;
	}

	public String getGroup_level() {
		return group_level;
	}

	public void setGroup_level(String group_level) {
		this.group_level = group_level;
	}

	public String getGroup_age() {
		return group_age;
	}

	public void setGroup_age(String group_age) {
		this.group_age = group_age;
	}

	public String getGroup_gender() {
		return group_gender;
	}

	public void setGroup_gender(String group_gender) {
		this.group_gender = group_gender;
	}

	public String getGroup_dt() {
		return group_dt;
	}

	public void setGroup_dt(String group_dt) {
		this.group_dt = group_dt;
	}

}