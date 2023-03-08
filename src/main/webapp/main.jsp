<%@page import="com.smhrd.model.scheduleVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.scheduleDAO"%>
<%@page import="com.smhrd.model.GroupVO"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
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
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<script type="text/javascript"
   src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>

<script>
<% request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8");
   
   MemberVO loginM = (MemberVO) session.getAttribute("loginM");
    String group_nm = (String)session.getAttribute("group_nm");
     scheduleDAO dao = new scheduleDAO();
     String group_seq=dao.findgroup_seq(group_nm);
   %>
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
              
              
               
            int j = 0;
            List<scheduleVO> list = dao.select(group_seq);%>
                      events: [
                         <%for (int i = 0; i < list.size(); i++) {%>
                          {
                             seq: '<%out.print(list.get(i).getSche_seq());%>' ,
                          title: '<%out.print(list.get(i).getSche_title());%>' ,
                          start: '<%out.print(list.get(i).getSche_sdt().replace(" 00:00:00", "T01:00:00"));%>',
                          end: '<%out.print(list.get(i).getSche_edt().replace(" 00:00:00", "T23:00:00"));%>'
                         },<%j++;
}
if (j == list.size() - 1) {%>
                             {   
                                seq: '<%out.print(list.get(list.size() - 1).getSche_seq());%>' ,
                                  title: '<%out.print(list.get(list.size() - 1).getSche_title());%>' ,
                                  start: '<%out.print(list.get(list.size() - 1).getSche_sdt().replace(" 00:00:00", "T01:00:00"));%>',
                                  end: '<%out.print(list.get(list.size() - 1).getSche_edt().replace(" 00:00:00", "T23:00:00"));%>'
                                  }
                         <%}%>
                      ],
                      
                      
                      
                      
                      eventClick: function(info) {
                        
                        
                         $(".detailmodal").css("display","block");
                         var sche_seq=info.event._def.extendedProps.seq;
                     console.log(sche_seq);
                          $.ajax({
                             url : "MoimSangseiljeong",
                             method : "POST",
                             data : {
                                "sche_seq" : sche_seq
                             },
                             dataType : "JSON",
                             success : function(data){
                                console.log(data);
                                let sdt = data.sche_sdt.split("00:00:00");
                                let edt = data.sche_edt.split("00:00:00");
                                $('td[id=mountain_nm]').text(data.mountain_nm);
                                $('td[id=course]').text(data.course);
                                $('td[id=climb_level]').text(data.climb_level);
                                $('td[id=sche_sdt]').text(sdt[0]);
                                $('td[id=sche_edt]').text(edt[0]);
                                $('td[id=start_time]').text(data.start_time);
                                $('td[id=end_time]').text(data.end_time);
                                $('td[id=sche_title]').text(data.sche_title);
                                $('td[id=sche_contents]').text(data.sche_contents);
                                $('td[id=user_nm]').text(data.user_nm);
                                $(".detailmodal").css("display","block");
                                
                             },
                             error : function(err){
                                console.log(err);
                             }
                           
                          }); 
                         }
           });
           
           $("#closebtn").click(function(){
              $(".modal").css("display","none");
           });
           
           $("#closebtn2").click(function(){
               $(".detailmodal").css("display","none");
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
               $(".modal").css("display","none");
               location.reload();
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
@font-face {
   font-family: 'GangwonEdu_OTFBoldA';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

body {
   font-family: 'GangwonEdu_OTFBoldA';
}

#login a {
   float: right;
   margin: 10px;
   font-family: 'GangwonEdu_OTFBoldA';
}

.group ul {
   list-style: none;
}

.tTitle {
   width: 15%
}

#calendar {
   max-width: 1000px;
   margin: auto;
}

#calendar .fc-scroller {
   overflow-x: hidden !important;
   overflow-y: hidden !important;
}
</style>
</head>
<body class="is-preload">
   <div class="modal"
      style="display: none; z-index: 10998; background-color: black; opacity: 0.6; width: 100%; height: 100%; position: fixed;">

   </div>
   <div class="modal"
      style="display: none; z-index: 10999; background-color: white; width: 600px; height: 800px; position: fixed; opacity: 1.0; top: 30px; left: 50%; transform: translate(-50%, 0%);">
      <header>
         <div
            style="float: center; width: 600px; text-align: center; height: 50px;">
            <span style="font-size: 30px">일정등록</span>
            <button id="closebtn" style="float: right;">X</button>
         </div>
      </header>
      <div style="height: 20px"></div>

      <div class="col-6 col-12-xsmall" style="text-align: center">
         <table>
            <tr>
               <td colspan=2>산 선택</td>
               <td colspan=2><select name="mountain_nm" id="mountain_nm">
                     <option>-산 선택-</option>
                     <option value="무등산">무등산</option>
                     <option value="앞산">앞산</option>
                     <option value="뒷산">뒷산</option>
                     <option value="맛동산">맛동산</option>
               </select></td>
            </tr>

            <tr>
               <td colspan=2>코스 선택</td>

               <td colspan=2><select name="course" id="course">
                     <option>-코스 선택-</option>
                     <option value="갈까">갈까</option>
                     <option value="말까">말까</option>
               </select></td>
            </tr>

            <tr>
               <td colspan=2>등산등급</td>

               <td colspan=2><select name="climb_level" id="climb_level">
                     <option>-등산등급-</option>
                     <option>탈줄몰랑</option>
                     <option>나좀잘탐</option>
               </select></td>
            </tr>

            <tr>
               <td style="font-size: 20px" colspan=2>시작날짜<br> <input
                  type="date" name="sche_sdt" id="sche_sdt" />
               </td>
               <td style="font-size: 20px" colspan=2>종료날짜<br> <input
                  type="date" name="sche_edt" id="sche_edt" />
               </td>
            </tr>

            <tr>
               <td style="font-size: 15px">시작시간</td>

               <td><input type="text" placeholder="18:00" name="start_time"
                  id="start_time"></td>
               <td style="font-size: 15px">종료시간</td>

               <td><input type="text" placeholder="21:00" name="end_time"
                  id="end_time"></td>
            </tr>
            <tr>

               <td colspan=1 style="font-size: 15px">일정제목</td>
               <td colspan=3><input type="text" placeholder="일정제목"
                  name="sche_title" id="sche_title"></td>
            </tr>


            <tr>
               <td colspan=1 style="font-size: 15px">일정내용</td>
               <td colspan=3><input type="text"
                  placeholder="준비물 : 수건, 물통 등..." name="sche_contents"
                  id="sche_contents"></td>
            </tr>


            <tr></tr>
            <tr>
               <td><input type="hidden" id="group_seq" name="group_seq"
                  value="<%=group_seq%>"></td>
            </tr>
            <tr>
               <td colspan=4; rowspan=3><input type="submit" value="일정등록"
                  id="addschedule"></td>
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
                  src="images/tayoLogo.jpg" alt="로고" width="200" height="100"></a>

               <div id="login">
                  <%
                  if (loginM == null) {
                  %>
                  <a href="TayoLogin.jsp" class="button">로그인</a> <a
                     href="TayoJoin.jsp" class="button">회원가입</a>
                  <%
                  } else {
                  %>

                  <a href="LogoutService" class="button">로그아웃</a> <span
                     class="welcome"><%=loginM.getUser_nm()%>님 환영합니다!</span>
                  <%
                  }
                  %>
               </div>
            </header>
            <%
            request.setCharacterEncoding("UTF-8");

            String group_name = request.getParameter("group_name");
            GroupDAO dao2 = new GroupDAO();
            GroupVO vo = dao2.select(group_name);
            vo.getGroup_seq();
            %>


            <!-- Section -->
            <section>
               <header class="major">
                  <h2></h2>
               </header>
               <div id='calendar'></div>

            </section>

         </div>
      </div>




<!-- schedule modal -->
<div class="detailmodal"
      style="display: none; z-index: 10998; background-color: black; opacity: 0.6; width: 100%; height: 100%; position: fixed;">

   </div>
   <div class="detailmodal"
      style="display: none; z-index: 10999; background-color: white; width: 600px; height: 800px; position: fixed; opacity: 1.0; top: 30px; left: 50%; transform: translate(-50%, 0%);">
      <header>
         <div
            style="float: center; width: 600px; text-align: center; height: 50px;">
            <span style="font-size: 30px">일정상세</span>
            <button id="closebtn2" style="float: right;">X</button>
         </div>
      </header>
      <div style="height: 20px"></div>

      <div class="col-6 col-12-xsmall" style="text-align: center">
         <table>
            <tr>
               <td colspan=1>산이름</td>
               <td colspan=3 id="mountain_nm"></td>
            </tr>

            <tr>
               <td colspan=1>코스</td>
               <td colspan=3 id="course"></td>
            </tr>

            <tr>
               <td colspan=1>등산 난이도</td>
               <td colspan=3 id="climb_level"></td>
            </tr>

            <tr>
               <td colspan=1>일정 시작기간</td>
               <td colspan=3 id="sche_sdt"></td>
            </tr>

            <tr>
               <td colspan=1>일정 종료기간</td>
               <td colspan=3 id="sche_edt"></td>
            </tr>
            
            <tr>
               <td colspan=1>일정 시작시간</td>
               <td colspan=3 id="start_time"></td>
            </tr>


            <tr>
               <td colspan=1>일정 종료시간</td>
               <td colspan=3 id="end_time"></td>
            </tr>
            
            <tr>
               <td colspan=1>일정 제목</td>
               <td colspan=3 id="sche_title"></td>
            </tr>
            
            <tr>
               <td colspan=1>일정 내용</td>
               <td colspan=3 id="sche_contents"></td>
            </tr>
            
            <tr>
               <td colspan=1>작성자</td>
               <td colspan=3 id="user_nm"></td>
            </tr>

            <tr></tr>

         </table>
      </div>
      
   </div>

   
   
   
   
   
   
   
   
      
<!-- Sidebar -->
      <div id="sidebar">
         <div class="inner">


            <!-- Menu -->
            <nav id="menu">
               <header class="major">
                  <h2><%=vo.getGroup_name()%></h2>
               </header>
               <ul>
                  <li><a
                     href="MoimSangseSogae.jsp?group_name=<%=vo.getGroup_name()%>">모임소개</a></li>
                  <li><a
                     href="MoimSangseiljeong.jsp?group_name=<%=vo.getGroup_name()%>">모임일정</a></li>
                  <li><a
                     href="MoimSangseMember.jsp?group_name=<%=vo.getGroup_name()%>">모임멤버</a></li>
                  <li><a
                     href="MoimSangseGesipan.jsp?group_name=<%=vo.getGroup_name()%>">게시판</a></li>
               </ul>
            </nav>


            <!-- Section -->
            <section>
               <header class="major">
                  <h2>SanTaYo</h2>
               </header>
               <div class="mini-posts">
                  <article>
                     <a
                        href="https://www.knps.or.kr/front/portal/open/openList.do?tpmdGrpCd=TKBBS03&menuNo=7020035"
                        class="image"><img src="images/sideImage01.png" alt="" /></a>
                     <p>국립공원의 탐방정보나 공원내 행위허가 등에 대한 질의를 자유롭게 묻고 답하는 곳입니다.</p>
                  </article>
                  <article>
                     <a href="http://hiking.kworks.co.kr/" class="image"><img
                        src="images/sideImage02.jpg" alt="" /></a>
                     <p>입산통제구역 및 등산로패쇄구간을 안내하는 곳입니다.</p>
                  </article>
                  <article>
                     <a href="https://www.foresttrip.go.kr/main.do?hmpgId=FRIP"
                        class="image"><img src="images/sideImage03.PNG" alt="" /></a>
                     <p>100대명산 자연휴양림 예약하는 곳입니다.</p>
                  </article>
               </div>

            </section>

            <!-- Section -->
            <section class="group">
               <header class="major">
                  <h2>문좀닫아조</h2>
               </header>
               <ul>
                  <li>이상언</li>
                  <li>석평광</li>
                  <li>박지환</li>
                  <li>김지현</li>
                  <li>조달맞이</li>
               </ul>
               <ul class="contact">
                  <li class="icon solid fa-envelope"><a href="#">zldyakfn3@gmail.com</a></li>
               </ul>
            </section>

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
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>



</body>
</html>