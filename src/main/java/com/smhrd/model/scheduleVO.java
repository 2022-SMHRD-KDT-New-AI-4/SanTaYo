package com.smhrd.model;

public class scheduleVO {
   
   private String sche_seq;
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
   private String user_id;   
   
   public scheduleVO() {
   }

   
   
   public scheduleVO(String sche_seq, String group_seq, String mountain_nm, String course, String climb_level,
         String sche_sdt, String sche_edt, String start_time, String end_time, String sche_title,
         String sche_contents, String user_id) {
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
      this.user_id = user_id;
   }



   public scheduleVO(String mountain_nm, String course, String climb_level, String sche_sdt, String sche_edt,
         String start_time, String end_time, String sche_title, String sche_contents, String user_id) {
      super();
      this.mountain_nm = mountain_nm;
      this.course = course;
      this.climb_level = climb_level;
      this.sche_sdt = sche_sdt;
      this.sche_edt = sche_edt;
      this.start_time = start_time;
      this.end_time = end_time;
      this.sche_title = sche_title;
      this.sche_contents = sche_contents;
      this.user_id = user_id;
   }



   public scheduleVO(String group_seq, String mountain_nm, String course, String climb_level, String sche_sdt,
         String sche_edt, String start_time, String end_time, String sche_title, String sche_contents,
         String user_id) {
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
      this.user_id = user_id;
   }

   
   
   
   @Override
   public String toString() {
      return "scheduleVO [sche_seq=" + sche_seq + ", group_seq=" + group_seq + ", mountain_nm=" + mountain_nm
            + ", course=" + course + ", climb_level=" + climb_level + ", sche_sdt=" + sche_sdt + ", sche_edt="
            + sche_edt + ", start_time=" + start_time + ", end_time=" + end_time + ", sche_title=" + sche_title
            + ", sche_contents=" + sche_contents + ", user_id=" + user_id + "]";
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

   public String getuser_id() {
      return user_id;
   }

   public void setuser_id(String user_id) {
      this.user_id = user_id;
   }

   
   
   
   
   
}