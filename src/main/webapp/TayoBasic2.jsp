<%@page import="com.smhrd.model.scheduleVO"%>
<%@page import="com.smhrd.model.scheduleDAO"%>
<%@page import="com.smhrd.model.calendarVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.calendarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

    <!-- fullcalendar -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>

<script>
<% String group_seq = "1";%>
var calendar;
       document.addEventListener('DOMContentLoaded', function() {
           var calendarEl = document.getElementById('calendar');
           calendar = new FullCalendar.Calendar(calendarEl, {
               timeZone: 'UTC',
               initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
               headerToolbar: {
                  left: 'prev,next,today',
                  center: 'title',
                   right: 'addEventButton' // headerToolbar에 버튼을 추가
                   
               }, customButtons: {
                   addEventButton: { // 추가한 버튼 설정
                       text : "일정 추가",  // 버튼 내용
                       click : function(){ // 버튼 클릭 시 이벤트 추가
                           /* $("#calendarModal").modal("show"); // modal 나타내기

                           $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                               var content = $("#calendar_content").val();
                               var start_date = $("#calendar_start_date").val();
                               var end_date = $("#calendar_end_date").val();
                               
                               //내용 입력 여부 확인
                               if(content == null || content == ""){
                                   alert("내용을 입력하세요.");
                               }else if(start_date == "" || end_date ==""){
                                   alert("날짜를 입력하세요.");
                               }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                   alert("종료일이 시작일보다 먼저입니다.");
                               }else{ // 정상적인 입력 시
                                   var obj = {
                                       "title" : content,
                                       "start" : start_date,
                                       "end" : end_date
                                   }//전송할 객체 생성

                                   console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                               }
                           }); */
                           $(".modal").css("display","block");
                           
                           
                       }
                   }
               },               
               editable: true, // false로 변경 시 draggable 작동 x 
               displayEventTime: false // 시간 표시 x
               ,

               <%
               scheduleDAO dao = new scheduleDAO();
            	int j=0;
               List<scheduleVO> list = dao.select(group_seq);
               %>
                      events: [
                         <%for(int i=0;i<list.size();i++){
                         %>
                          {
                          title: '<%out.print(list.get(i).getSche_title());%>' ,
                          start: '<%out.print(list.get(i).getSche_sdt().replace(" 00:00:00","T01:00:00"));%>',
                          end: '<%out.print(list.get(i).getSche_edt().replace(" 00:00:00","T23:00:00"));%>'
                         },<%j++;}if(j==list.size()-1){%>
                             {
                                  title: '<%out.print(list.get(list.size()-1).getSche_title());%>' ,
                                  start: '<%out.print(list.get(list.size()-1).getSche_sdt().replace(" 00:00:00","T01:00:00"));%>',
                                  end: '<%out.print(list.get(list.size()-1).getSche_edt().replace(" 00:00:00","T23:00:00"));%>'
                                  
                                  }
                         <%}%>
                      ],
                      
                      
                      
                      
                      eventClick: function() {
                    	   <%
                    	   out.print("location.href='TayoMain.html'");
                    	   %>
                    	  }
           });
           
           $("#closebtn").click(function(){
              $(".modal").css("display","none");
           });
           
           $("#addschedule").click(function(){
        	   
        	 //입력 버튼을 클릭했을 때 실행되는 함수
               let group_seq = $('#group_seq').val();
               let mountain_nm = $('#mountain_nm').val();
               let course = $('#course').val();
               let climb_level = $('#climb_level').val();
               let sche_sdt = $('#sche_sdt').val();
               let sche_edt = $('#sche_edt').val();
               let start_time = $('#start_time').val();
               let end_time = $('#end_time').val();
               let sche_title = $('#sche_title').val();
               let sche_contents = $('#sche_contents').val();
               //console.log(chat);

               //비동기통신 함수 -> $.ajax();
               //함수안에 객체형식으로 요청사항을 넣는다
               //JavaScript에서의 객체표현 형태 
               /*{ "name" : 박병관,
                  "age" : "20",
                  eating : function()}*/

               $.ajax({
                  url : "addScheduleService",
                  method : "POST",
                  data : {
                     "group_seq" : group_seq,
                     "mountain_nm" : mountain_nm,
                     "course" : course,
                     "climb_level" : climb_level,
                     "sche_sdt" : sche_sdt,
                     "sche_edt" : sche_edt,
                     "start_time" : start_time,
                     "end_time" : end_time,
                     "mountain_nm" : mountain_nm,
                     "sche_title" : sche_title,
                     "sche_contents" : sche_contents
                  },
                  dataType : "JSON",
                  success : function(data) {
                     $('#group_seq').val("");
                     $('#mountain_nm').val("");
                     $('#course').val("");
                     $('#climb_level').val("");
                     $('#sche_sdt').val("");
                     $('#sche_edt').val("");
                     $('#start_time').val("");
                     $('#end_time').val("");
                     $('#mountain_nm').val("");
                     $('#sche_title').val("");
                     $('#sche_contents').val("");
                  },
                  error : function(err) {
                     console.log(err);
                  }
               });

           });
           
           calendar.render();

        });
      
    </script>
<style>

  #login a {
   float: right;
   margin: 10px;
}
.group ul{
     list-style: none;
}

#calendar{
max-width:1000px;
margin: auto;}
#calendar .fc-scroller {
  overflow-x: hidden !important;
  overflow-y: hidden !important;
}

</style>

</head>
<body class="is-preload">

<div class="modal" style="display:none;z-index:10998; background-color: black; opacity: 0.6;width:100%;height:100%;position: fixed;">
   
</div>
<div class="modal" style="display:none;z-index:10999;background-color: white; width:600px; height:800px;position: fixed; opacity: 1.0; top:30px; left: 50%; transform: translate(-50%, 0%);">
   <header><div style=" float:center; width: 600px;text-align: center; height: 50px;" ><span style="font-size: 30px">일정등록</span><button id="closebtn" style="float:right;">X</button>
        </div></header>
        <div style="height: 20px"></div>
        
                        <div class="col-6 col-12-xsmall" style="text-align: center">
                          <table>
                          	<tr>
                          		<td colspan= 2>
                          			 산 선택
                          		</td>
                          		<td  colspan= 2>
                          			<select name="mountain_nm" id="mountain_nm">
                           		<option>-산 선택-</option>
                           		<option value="무등산">무등산</option>
                           		<option value="앞산">앞산</option>
                           		<option value="뒷산">뒷산</option>
                           		<option value="맛동산">맛동산</option>
                           </select>
                          		</td>
                          	</tr>
                          	
                          	<tr>
                          		<td colspan= 2>
                          			 코스 선택
                          		</td>
                          		
                          		<td colspan= 2>
                          			<select name="course" id="course">
                           			<option>-코스 선택-</option>
                           			<option value="갈까">갈까</option>
                           			<option value="말까">말까</option>
                          			</select>
                          		</td>
                          	</tr>
                          	
                          	<tr>
                          		<td colspan= 2>
                          			 등산등급
                          		</td>
                          		
                          		<td colspan= 2>
                          			<select name="climb_level" id="climb_level">
                           			<option>-등산등급-</option>
                           			<option>탈줄몰랑</option>
                           			<option>나좀잘탐</option>
                           			</select>
                          		</td>
                          	</tr>
                          	
                          	<tr>
                          		<td style="font-size: 20px" colspan=2>
                          			 시작날짜<br>
                          			 <input type="date" name="sche_sdt" id="sche_sdt"/> 
                          		</td>
                          		<td style="font-size: 20px" colspan=2>
                          			 종료날짜<br>
                          			 <input type="date" name="sche_edt" id="sche_edt"/>
                          		</td>
                          	</tr>
                          	
                          	<tr>
                          		<td style="font-size: 15px">시작시간</td>
                          		
                          		<td>
                          			 <input type="text"  placeholder="18:00" name="start_time" id="start_time"> 
                          		</td>
                          		<td style="font-size: 15px">
                          			 종료시간
                          		</td>
                          		
                          		<td>
                          			<input type="text"  placeholder="21:00" name="end_time" id="end_time"> 
                          		</td>
                          		</tr>
                          	<tr>

                          		<td colspan= 1 style="font-size: 15px">
                          			일정제목
                          		</td>
                          		<td colspan= 3>
                          			<input type="text"  placeholder="일정제목"  name="sche_title" id="sche_title">
                          		</td>
                          	</tr>
                          	
                       
                          	<tr>
                          	 	<td colspan= 1 style="font-size: 15px">
                          			일정내용
                          		</td>
                          		<td colspan= 3 >
                          			<input type="text"  placeholder="준비물 : 수건, 물통 등..."  name="sche_contents" id="sche_contents">
                          		</td>
                          		</tr>
                          		
                          		
                          		<tr></tr><tr>
                          			<td>
                          				<input type="hidden" id="group_seq" name="group_seq" value="<%=group_seq%>">
                          			</td>
                          		</tr>
                          		<tr>
                          		<td colspan= 4; rowspan=3>
                          			<input type="submit" value="일정등록" id="addschedule"></td>
                          	</tr>
                          </table>
                        </div>
   
   
   

   		

   
   
   
   
   
   
   </div>   
   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Main -->
      <div id="main">
         <div class="inner">

            <!-- Header -->
            <header id="header">
               <a href="TayoMain.jsp" class="logo"><img
                  src="images/tayoLogo.jpg" alt="로고" width="200" height="60"></a>

               <div id="login">
                  <a href="TayoJoin.jsp" class="button">회원가입</a> <a
                     href="TayoLogin.jsp" class="button">로그인</a>
               </div>
            </header>


            <!-- Section -->
               <header class="major">
                  <h2>모임일정</h2>
               </header>
                <div id='calendar'></div>


         </div>
      </div>

      <!-- Sidebar -->
      <div id="sidebar">
         <div class="inner">



            <!-- Menu -->
            <nav id="menu">
               <header class="major">
                  <h2>문좀닫아조</h2>
               </header>
               <ul>
                  <li><a href="MoimSangseSogae.jsp">모임소개</a></li>
                  <li><a href="MoimSangseiljeong.jsp">모임일정</a></li>
                  <li><a href="MoimSangseGesipan.jsp">게시판</a></li>
                  <li><a href="MoimSangseMember.jsp">멤버</a></li>
            </nav>

            <!-- Section -->
            

            <!-- Footer -->
            <footer id="footer">
               <p class="copyright">
                  &copy; Untitled. All rights reserved. Demo Images: <a
                     href="https://unsplash.com">Unsplash</a>. Design: <a
                     href="https://html5up.net">HTML5 UP</a>.
               </p>
            </footer>

         </div>
      </div>

   </div>

   <!-- Scripts -->
   <script>
   
   </script>
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>