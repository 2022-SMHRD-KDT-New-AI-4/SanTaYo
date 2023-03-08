package com.smhrd.model;

public class scheduleDTO {
	private String join_seq;
	private String sche_seq;
	private String user_id;
	private String join_dt;
	private String group_seq;
	private String mountain_nm;
	private String course;
	private String climb_level;
	private String sche_sdt;
	private String sche_edt;
	private String start_time;
	private String end_time;
	private String sche_title;
	private String sche_contents;
	private String joining_mem;
	private String maden_id;

	private String moim_nm;

	public scheduleDTO(String sche_seq) {
		super();
		this.sche_seq = sche_seq;
	}

	public scheduleDTO() {
		super();
	}

	public scheduleDTO(String join_seq, String sche_seq, String user_id, String join_dt, String group_seq,
			String mountain_nm, String course, String climb_level, String sche_sdt, String sche_edt, String start_time,
			String end_time, String sche_title, String sche_contents, String joining_mem, String maden_id) {
		super();
		this.join_seq = join_seq;
		this.sche_seq = sche_seq;
		this.user_id = user_id;
		this.join_dt = join_dt;
		this.group_seq = group_seq;
		this.mountain_nm = mountain_nm;
		this.course = course;
		this.climb_level = climb_level;
		this.sche_sdt = sche_sdt;
		this.sche_edt = sche_edt;
		this.start_time = start_time;
		this.end_time = end_time;
		this.sche_title = sche_title;
		this.sche_contents = sche_contents;
		this.joining_mem = joining_mem;
		this.maden_id = maden_id;
	}

	public scheduleDTO(String sche_seq, String group_seq, String mountain_nm, String course, String climb_level,
			String sche_sdt, String sche_edt, String start_time, String end_time, String sche_title,
			String sche_contents, String join_seq, String user_id, String join_dt) {
		super();
		this.sche_seq = sche_seq;
		this.group_seq = group_seq;
		this.mountain_nm = mountain_nm;
		this.course = course;
		this.climb_level = climb_level;
		this.sche_sdt = sche_sdt;
		this.sche_edt = sche_edt;
		this.start_time = start_time;
		this.end_time = end_time;
		this.sche_title = sche_title;
		this.sche_contents = sche_contents;
		this.join_seq = join_seq;
		this.user_id = user_id;
		this.join_dt = join_dt;
	}

	public scheduleDTO(String join_seq, String sche_seq, String user_id, String join_dt, String group_seq,
			String mountain_nm, String course, String climb_level, String sche_sdt, String sche_edt, String start_time,
			String end_time, String sche_title, String sche_contents, String joining_mem) {
		super();
		this.join_seq = join_seq;
		this.sche_seq = sche_seq;
		this.user_id = user_id;
		this.join_dt = join_dt;
		this.group_seq = group_seq;
		this.mountain_nm = mountain_nm;
		this.course = course;
		this.climb_level = climb_level;
		this.sche_sdt = sche_sdt;
		this.sche_edt = sche_edt;
		this.start_time = start_time;
		this.end_time = end_time;
		this.sche_title = sche_title;
		this.sche_contents = sche_contents;
		this.joining_mem = joining_mem;
	}

	public String getJoining_mem() {
		return joining_mem;
	}

	public void setJoining_mem(String joining_mem) {
		this.joining_mem = joining_mem;
	}

	public String getSche_seq() {
		return sche_seq;
	}

	public void setSche_seq(String sche_seq) {
		this.sche_seq = sche_seq;
	}

	public String getGroup_seq() {
		return group_seq;
	}

	public void setGroup_seq(String group_seq) {
		this.group_seq = group_seq;
	}

	public String getMountain_nm() {
		return mountain_nm;
	}

	public void setMountain_nm(String mountain_nm) {
		this.mountain_nm = mountain_nm;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getClimb_level() {
		return climb_level;
	}

	public void setClimb_level(String climb_level) {
		this.climb_level = climb_level;
	}

	public String getSche_sdt() {
		return sche_sdt;
	}

	public void setSche_sdt(String sche_sdt) {
		this.sche_sdt = sche_sdt;
	}

	public String getSche_edt() {
		return sche_edt;
	}

	public void setSche_edt(String sche_edt) {
		this.sche_edt = sche_edt;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getSche_title() {
		return sche_title;
	}

	public void setSche_title(String sche_title) {
		this.sche_title = sche_title;
	}

	public String getSche_contents() {
		return sche_contents;
	}

	public void setSche_contents(String sche_contents) {
		this.sche_contents = sche_contents;
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

	public String getJoin_dt() {
		return join_dt;
	}

	public void setJoin_dt(String join_dt) {
		this.join_dt = join_dt;
	}

	public String getMaden_id() {
		return maden_id;
	}

	public void setMaden_id(String maden_id) {
		this.maden_id = maden_id;
	}

	public String getMoim_nm() {
		return moim_nm;
	}

	public void setMoim_nm(String moim_nm) {
		this.moim_nm = moim_nm;
	}

}
