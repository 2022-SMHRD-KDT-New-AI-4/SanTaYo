package com.smhrd.model;

public class calendarVO {
   private String id;
   private int groupid;
   private String title;
   private String writer;
   private String content;
   private String start1;
   private String end1;
   private int allDay;
   private String textColor;
   private String backgroundColor;
   private String borderColor;

public calendarVO() {
   
}

public calendarVO(String id, int groupid, String title, String writer, String content, String start1, String end1,
      int allDay, String textColor, String backgroundColor, String borderColor) {
   this.id = id;
   this.groupid = groupid;
   this.title = title;
   this.writer = writer;
   this.content = content;
   this.start1 = start1;
   this.end1 = end1;
   this.allDay = allDay;
   this.textColor = textColor;
   this.backgroundColor = backgroundColor;
   this.borderColor = borderColor;
}

public String getId() {
   return id;
}

public void setId(String id) {
   this.id = id;
}

public int getGroupid() {
   return groupid;
}

public void setGroupid(int groupid) {
   this.groupid = groupid;
}

public String getTitle() {
   return title;
}

public void setTitle(String title) {
   this.title = title;
}

public String getWriter() {
   return writer;
}

public void setWriter(String writer) {
   this.writer = writer;
}

public String getContent() {
   return content;
}

public void setContent(String content) {
   this.content = content;
}

public String getStart1() {
   return start1;
}

public void setStart1(String start1) {
   this.start1 = start1;
}

public String getEnd1() {
   return end1;
}

public void setEnd1(String end1) {
   this.end1 = end1;
}

public int getAllDay() {
   return allDay;
}

public void setAllDay(int allDay) {
   this.allDay = allDay;
}

public String getTextColor() {
   return textColor;
}

public void setTextColor(String textColor) {
   this.textColor = textColor;
}

public String getBackgroundColor() {
   return backgroundColor;
}

public void setBackgroundColor(String backgroundColor) {
   this.backgroundColor = backgroundColor;
}

public String getBorderColor() {
   return borderColor;
}

public void setBorderColor(String borderColor) {
   this.borderColor = borderColor;
}




   
}