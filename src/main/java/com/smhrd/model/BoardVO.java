package com.smhrd.model;

public class BoardVO {

	private String board_seq;
    private String group_seq;
    private String board_title;
    private String board_content;
    private String board_file;
    private String board_dt;
    private String user_id;
    
    
    public BoardVO(String group_seq, String board_title, String board_content, String user_id) {
        super();
        this.group_seq = group_seq;
        this.board_title = board_title;
        this.board_content = board_content;
        this.user_id = user_id;
     }
    
	public BoardVO() {
		super();
	}
	
	
	public BoardVO(String board_seq, String board_title, String board_content) {
		super();
		this.board_seq = board_seq;
		this.board_title = board_title;
		this.board_content = board_content;
	}

	public BoardVO(String board_seq, String group_seq, String board_title, String board_content, String board_file,
			String board_dt, String user_id) {
		super();
		this.board_seq = board_seq;
		this.group_seq = group_seq;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_dt = board_dt;
		this.user_id = user_id;
	}
	
	
	public BoardVO(String board_seq) {
		super();
		this.board_seq = board_seq;
	}

	public String getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
	public String getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(String group_seq) {
		this.group_seq = group_seq;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public String getBoard_dt() {
		return board_dt;
	}
	public void setBoard_dt(String board_dt) {
		this.board_dt = board_dt;
	}
	public String getuser_id() {
		return user_id;
	}
	public void setuser_id(String user_id) {
		this.user_id = user_id;
	}
    
    
	
}
