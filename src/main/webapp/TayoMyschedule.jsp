<%@page import="java.util.Random"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.joiningVO"%>
<%@page import="com.smhrd.model.joiningDAO"%>
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

<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8");
MemberVO loginM = (MemberVO) session.getAttribute("loginM");

scheduleDAO sdao = new scheduleDAO();

Random rd = new Random();
rd.nextInt(4);
List<scheduleVO> list = (List<scheduleVO>) sdao.mySche(loginM.getUser_id());

String[] backgroundColor = {"green", "purple", "navy", "gray", "#8CFF7C", "#FA7AFD", "#0738FA", "#677DE1", "#03D4DA",
		"#EC5878", "#9B2F5D", "#585BD2", "#26264F", "#5A8A6A"};%>
var calendar;

       document.addEventListener('DOMContentLoaded', function() {
           var calendarEl = document.getElementById('calendar');
           calendar = new FullCalendar.Calendar(calendarEl, {
               timeZone: 'UTC',
               initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
               
               headerToolbar: {
                  left: 'prev,next,today',
                  center: 'title',
                   right: ''/* 'addEventButton' // headerToolbar에 버튼을 추가 */
                  
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

               <%int j = 0;%>
                      events: [
                         <%for (int i = 0; i < list.size(); i++) {
	int num = rd.nextInt(backgroundColor.length);%>
                          {
                          seq: '<%out.print(list.get(i).getSche_seq());%>' ,
                          title: '<%out.print(list.get(i).getSche_title());%>' ,
                          start: '<%out.print(list.get(i).getSche_sdt().replace(" 00:00:00", "T01:00:00"));%>',
                          end: '<%out.print(list.get(i).getSche_edt().replace(" 00:00:00", "T23:00:00"));%>',
                          backgroundColor: '<%out.print(backgroundColor[num]);%>',
                          textColor: 'white',
                          borderColor: '<%out.print(backgroundColor[num]);%>'
                         },<%j++;
}
if (j == list.size() - 1) {
int num = rd.nextInt(backgroundColor.length);%>
                             {   
                                seq: '<%out.print(list.get(list.size() - 1).getSche_seq());%>' ,
                                  title: '<%out.print(list.get(list.size() - 1).getSche_title());%>' ,
                                  start: '<%out.print(list.get(list.size() - 1).getSche_sdt().replace(" 00:00:00", "T01:00:00"));%>',
                                  end: '<%out.print(list.get(list.size() - 1).getSche_edt().replace(" 00:00:00", "T23:00:00"));%>',
                                  backgroundColor: '<%out.print(backgroundColor[num]);%>',
                                  textColor: 'white',
                                  borderColor: '<%out.print(backgroundColor[num]);%>'
                                  }
                         <%}%>
                      ],
                      
                      
                      
                      
                      eventClick: function(info) {
                         $(".detailmodal").css("display","block");
                         var sche_seq=info.event._def.extendedProps.seq;
                          $.ajax({
                             url : "MoimSangseiljeong",
                             method : "POST",
                             data : {
                                "sche_seq" : sche_seq
                             },
                             dataType : "JSON",
                             success : function(data){
                                console.log(data);
                                let sdt = data[0].sche_sdt.split("00:00:00");
                                let edt = data[0].sche_edt.split("00:00:00");
                                let id = "<%=loginM.getUser_id()%>";
                                let gjbtn = document.getElementById("gjoinbtn");
                                console.log(data[0].group_nm);                                
                               
                                $('[id=mountain_nm]').text(data[0].mountain_nm);
                                $('[id=course]').text(data[0].course);
                                $('[id=climb_level]').text(data[0].climb_level);
                                $('[id=sche_sdt]').text(sdt[0]);
                                $('[id=sche_edt]').text(edt[0]);
                                $('[id=start_time]').text(data[0].start_time);
                                $('[id=end_time]').text(data[0].end_time);
                                $('[id=sche_title]').text(data[0].sche_title);
                                $('[id=sche_contents]').text(data[0].sche_contents);
                                $('[id=user_nm]').text(data[0].maden_id);
                                $('[id=moim_nm]').text(data[0].moim_nm);
                                $('#subbtn').prop('href','MoimSangseiljeong.jsp?group_name='+data[0].moim_nm);
                                
                                $(".detailmodal").css("display","block");
                                
                             },
                             error : function(err){
                                console.log(err);
                             }
                           
                          }); 
                          
                  
                          
                          
                          
                          
                         }
           });
           
           $("#close").click(function(){
              $(".modal").css("display","none");
           });
           
           $("#closebtn2").click(function(){
               $(".detailmodal").css("display","none");
               <%session.removeAttribute("schedule_seq");%>
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
               alert('일정 등록이 완료되었습니다.');
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
	max-width: 1200px;
	margin: auto;
}

#calendar .fc-scroller {
	overflow-x: hidden !important;
	overflow-y: hidden !important;
}

#close {
	margin-right: 15px;
	cursor: pointer;
	font-size: 20px;
}

input[type='date']::before {
	content: attr(data-placeholder);
	width: 100%;
}

input[type='date']:focus::before, input[type='date']:valid::before {
	display: none;
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
			<!-- <div
            style="float: center; width: 600px; text-align: center; height: 50px;">
            <span style="font-size: 30px">일정등록</span>
            <button id="closebtn" style="float: right;">X</button>
         </div> -->
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


				<!-- Section -->
				<section>
					<header class="major">
						<h2>내 일정</h2>
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
					style="float: center; width: 600px; text-align: center; height: 50px; margin-top: 20px;">
					<span style="font-size: 30px;">일정상세</span>
					<button id="closebtn2" style="margin-right: 20px; float: right;">X</button>
				</div>
			</header>
			<div style="height: 20px"></div>

			<div class="col-6 col-12-xsmall" style="text-align: center">
				<!-- Content -->

				<div style="float: left;">
					<div>
						<img src="images/mountain.png" alt="로고" width="100" height="100"
							style="margin-left: 100px;">
					</div>

				</div>
				<h3 style="color: green;">이번에 등반할 산</h3>
				<h2 id="mountain_nm" style="margin-left: 20px; color: black;"></h2>

				<hr>




				<div class="row">

					<div class="col-4 col-12-medium">
						<h2 style="color: green; margin-bottom: 0px;">모임명</h2>
						<p id="moim_nm" style="color: black;"></p>
					</div>

					<div class="col-4 col-12-medium">
						<h2 style="color: green; margin-bottom: 0px;">등반할 코스</h2>
						<p id="course" style="color: black;"></p>


					</div>

					<div class="col-4 col-12-medium">
						<h2 style="color: green; margin-bottom: 0px;">등반난이도</h2>
						<p id="climb_level" style="color: black;"></p>

					</div>




					<div class="col-6 col-12-small">

						<h2 style="color: green; margin-bottom: 0px;">등반기간</h2>
						<span id="sche_sdt" style="color: black;"></span> <span
							style="color: black;"> ~ </span> <span id="sche_edt"
							style="color: black;"></span>


					</div>
					<div class="col-6 col-12-small">

						<h2 style="color: green; margin-bottom: 0px;">등반예정시간</h2>
						<span id="start_time" style="color: black;"></span> <span
							style="color: black;"> ~ </span> <span style="color: black;"
							id="end_time"></span>
					</div>

				</div>
				<hr>
				<h2 style="margin-top: 20px; margin-bottom: 2px; color: green;">공지사항</h2>
				<div id="sche_contents"
					style="height: 100px; width: 550px; border-color: lightgray; border-radius: 5px; margin-left: 30px; color: black; margin-bottom: 20px;"></div>


				<a id="subbtn" class="button" href="#">일정보기</a>


				<!-- 				<div align="center">
					<input type='submit' id="delbtn" value='일정삭제'>
				</div>
 -->

			</div>


		</div>




		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">


				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="TayoCourse.jsp">산타요코스</a></li>
						<li><a href="TayoFind.jsp">모임찾기</a></li>
						<%
						request.setCharacterEncoding("UTF-8");
						if (loginM != null) {
						%>
						<li><a href="TayoMoim.jsp">모임생성</a></li>
						<li><span class="opener">마이페이지</span>
							<ul>
								<li><a href="TayoMypage.jsp">내 정보</a></li>
								<li><a href="TayoMyschedule">내 일정</a></li>
								<li><a href="TayoMyMake.jsp">내가 만든 모임</a></li>
								<li><a href="TayoMyMoim.jsp">참여모임</a></li>
								<li><a href="TayoChange.jsp">회원정보수정</a></li>
							</ul> <%
 } else {
 %> <%
 }
 %>
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