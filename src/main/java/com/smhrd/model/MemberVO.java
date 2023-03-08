package com.smhrd.model;

public class MemberVO {
	private String user_id;
	private String user_pw;
	private String user_nm;
	private String user_birthdate;
	private String user_gender;
	private String user_addr;
	private String user_level;
	
	
	
	
	
	public MemberVO(String user_id) {
		super();
		this.user_id = user_id;
	}
	public MemberVO(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}
	public MemberVO() {
		super();
	}
	
	
	
	public MemberVO(String user_pw, String user_nm, String user_birthdate, String user_gender, String user_addr,
			String user_level) {
		super();
		this.user_pw = user_pw;
		this.user_nm = user_nm;
		this.user_birthdate = user_birthdate;
		this.user_gender = user_gender;
		this.user_addr = user_addr;
		this.user_level = user_level;
	}
	public MemberVO(String user_id, String user_pw, String user_nm, String user_birthdate, String user_gender,
			String user_addr, String user_level) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nm = user_nm;
		this.user_birthdate = user_birthdate;
		this.user_gender = user_gender;
		this.user_addr = user_addr;
		this.user_level = user_level;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getUser_birthdate() {
		return user_birthdate;
	}
	public void setUser_birthdate(String user_birthdate) {
		this.user_birthdate = user_birthdate;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	
	

}
