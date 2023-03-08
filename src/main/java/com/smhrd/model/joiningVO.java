package com.smhrd.model;

public class joiningVO {
   private String join_seq;
   private String sche_seq;
   private String user_id;
   private String join_dt;
   
   public joiningVO() {
      
   }
   
   public joiningVO(String join_seq, String sche_seq, String user_id, String join_dt) {
      this.join_seq = join_seq;
      this.sche_seq = sche_seq;
      this.user_id = user_id;
      this.join_dt = join_dt;
   }

   public joiningVO(String sche_seq, String user_id) {
      this.sche_seq = sche_seq;
      this.user_id = user_id;
   }

   public String getJoin_seq() {
      return join_seq;
   }

   public void setJoin_seq(String join_seq) {
      this.join_seq = join_seq;
   }

   public String getSche_seq() {
      return sche_seq;
   }

   public void setSche_seq(String sche_seq) {
      this.sche_seq = sche_seq;
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

   @Override
   public String toString() {
      return "joiningVO [join_seq=" + join_seq + ", sche_seq=" + sche_seq + ", user_id=" + user_id + ", join_dt="
            + join_dt + "]";
   }
   
   
   
}