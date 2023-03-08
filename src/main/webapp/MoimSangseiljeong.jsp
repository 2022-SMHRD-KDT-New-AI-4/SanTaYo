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
response.setContentType("text/html; charset=UTF-8");

MemberVO loginM = (MemberVO) session.getAttribute("loginM");
String schedule_seq = (String) session.getAttribute("schedule_seq");
/* System.out.print(schedule_seq); */
String group_name = request.getParameter("group_name");
scheduleDAO dao = new scheduleDAO();
String group_seq = dao.findgroup_seq(group_name);%>
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

               <%int j = 0;
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
/*                          var $del = document.getElementById("delbtn");
                         $del.setAttribute("onclick", "godel("+sche_seq+")"); */
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
                                let sdt = data[0].sche_sdt.split("00:00:00");
                                let edt = data[0].sche_edt.split("00:00:00");
                                let member = "";
                                let id = "<%=loginM.getUser_id()%>";
                                let gjbtn = document.getElementById("gjoinbtn");
                                console.log(data[0].user_id);
                                if(data[0].user_id != null){
                                for(let i = 0; i< data.length; i++){
                                	member += data[i].joining_mem + "(" + data[i].user_id + ")" + "/";
            					}
                             }

                                 
                               if(member.includes("("+id+")/")){
                                	document.getElementById('schejoin').innerHTML =`<form action="scheduleAppService" method="post">
                						<div align="center">
                							<INPUT TYPE="hidden" NAME="group_name" SIZE=10
                								value='<%=group_name%>'> <input name="user_id"
                								type="hidden" value='<%=loginM.getUser_id()%>'> <input
                								type='submit' value='일정참가 취소' id="gjoinbtn">
                						</div>
                					</form>`
                                		 if(data[0].maden_id.includes("("+id+")")){
                                         	document.getElementById('schejoin').innerHTML =`<div align="center"><input onclick="godel(${sche_seq})" type='submit' id="delbtn" value='일정삭제'></div>`
                                         	
                                         }
                                	
                                }else{
                                	document.getElementById('schejoin').innerHTML =`<form action="scheduleAppService" method="post">
                						<div align="center">
                							<INPUT TYPE="hidden" NAME="group_name" SIZE=10
                								value='<%=group_name%>'> <input name="user_id"
                								type="hidden" value='<%=loginM.getUser_id()%>'> <input
                								type='submit' value='일정참가 신청' id="gjoinbtn">
                						</div>
                					</form>`
                                	
                                	
                                }
                                
                                
                                
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
                                $('[id=member]').text(member);
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
               
               setTimeout(function() { 
            	 location.reload();
            	}, 500);
               
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
       
       
       function godel(sche_seq){
    	      
    	      $.ajax({
    	        url : "scheduleDeleteService",
    	        method : "get",
    	        data : {"sche_seq" : sche_seq},
    	        success : function(data){
    	           alert('삭제되었습니다!');
    	           location.reload(); 
    	        },
    	        error : function(err) {
    	           console.log(err);
    	        }
    	     });      
    	}
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
			<div
				style="float: center; width: 600px; text-align: center; height: 50px; padding-top: 20px;">
				<span style="font-size: 20px; font-weight: bold;">일정등록</span> <a
					id="close" style="float: right;">X</a>
			</div>

		</header>
		<div style="height: 20px"></div>
		<div class="row gtr-uniform">
			<!-- <div class="col-6 col-12-xsmall" style="text-align: center"> -->
			<div class="col-6 col-12-xsmall"
				style="width: 570px; padding-top: 70px;">
				<input type="text" name="sche_title" id="sche_title"
					placeholder="일정제목" />
			</div>

			<div class="col-6 col-12-xsmall" style="width: 570px;">
				<input type="text" name="mountain_nm" id="mountain_nm"
					placeholder="산이름" />
			</div>

			<div class="col-12">
				<input type="text" name="course" id="course" placeholder="등산 코스" />
			</div>

			<div class="col-6 col-12-xsmall">
				<input type="date" name="sche_sdt" id="sche_sdt"
					data-placeholder="&nbsp&nbsp&nbsp시작날짜" required
					aria-required="true" value={startDateValue}
					onChange={StartDateValueHandler}
					style="width: 100%; height: 2.75em; border: solid 1px rgba(210, 215, 217, 0.75); border-radius: 0.375em;" />
			</div>

			<div class="col-6 col-12-xsmall">
				<input type="date" name="sche_edt" id="sche_edt"
					data-placeholder="&nbsp&nbsp&nbsp종료날짜" required
					aria-required="true" value={startDateValue}
					onChange={StartDateValueHandler}
					style="width: 100%; height: 2.75em; border: solid 1px rgba(210, 215, 217, 0.75); border-radius: 0.375em;" />
			</div>

			<div class="col-6 col-12-xsmall">
				<input type="text" placeholder="출발시간( 09:00 )" name="start_time"
					id="start_time">
			</div>

			<div class="col-6 col-12-xsmall">
				<input type="text" placeholder="종료시간( 18:00 )" name="end_time"
					id="end_time">
			</div>

			<div class="col-12">
				<select name="climb_level" id="climb_level">
					<option value="">- 등산난이도 -</option>
					<option value="아무나">아무나</option>
					<option value="초급자">초급자</option>
					<option value="중급자">중급자</option>
					<option value="상급자">상급자</option>
				</select>
			</div>

			<div class="col-12">
				<input type="text" name="sche_contents" id="sche_contents"
					placeholder="준비물(ex. 물, 손수건...)" />
			</div>
			<input type="hidden" id="group_seq" name="group_seq"
				value="<%=group_seq%>">

			<!-- Break -->
			<div class="col-12">
				<ul class="actions">
					<li><input type="submit" value="일정등록" class="primary"
						id="addschedule" /></li>

				</ul>
			</div>
			<%-- <table>
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
				<!-- <tr>

					<td colspan=1 style="font-size: 15px">일정제목</td>
					<td colspan=3><input type="text" placeholder="일정제목"
						name="sche_title" id="sche_title"></td>
				</tr> -->


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
			</table> --%>
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

				GroupDAO dao2 = new GroupDAO();
				GroupVO vo = dao2.select(group_name);
				vo.getGroup_seq();
				%>


				<!-- Section -->
				<section>
					<header class="major">
						<h2>모임일정</h2>
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
				<p style="color: green;">이번에 등반할 산</p>
				<h2 id="mountain_nm" style="margin-left: 20px; color: black;"></h2>
				<hr>




				<div class="row">
					<div class="col-4 col-12-medium">
						<h2 style="color: green; margin-bottom: 0px;">등반할 코스</h2>
						<p id="course" style="color: black;"></p>


					</div>

					<div class="col-4 col-12-medium">
						<h2 style="color: green; margin-bottom: 0px;">등반난이도</h2>
						<p id="climb_level" style="color: black;"></p>

					</div>

					<div class="col-4 col-12-medium">
						<h2 style="color: green; margin-bottom: 0px;">등반대장</h2>
						<p id="user_nm" style="color: black;"></p>
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


					<div style="width: 100%; height: 50px;"></div>
					<div class="col-6 col-12-small">
						<h2 style="margin-bottom: 0px; color: green;">참가하는멤버</h2>
						<p id="member" style="color: black;"></p>
					</div>
					<div style="" class="col-6 col-12-small">
						<h2 style="color: green; margin-bottom: 0px;">공지사항</h2>
						<p id="sche_contents" style="color: black; padding: 15px;"></p>
					</div>

				</div>

				<div id="schejoin">
					<form action="scheduleAppService" method="post">
						<div align="center">
							<INPUT TYPE="hidden" NAME="group_name" SIZE=10
								value='<%=group_name%>'> <input name="user_id"
								type="hidden" value='<%=loginM.getUser_id()%>'> <input
								type='submit' value='일정참가 신청' id="gjoinbtn">
						</div>
					</form>
				</div>

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
						<%
						String user_id = loginM.getUser_id();
						GroupVO avo = new GroupVO(group_name, user_id);
						GroupVO advo = dao2.adminSelect(avo);
						if (advo != null) {
						%>
						<li><span class="opener">관리자 페이지</span>
							<ul>
								<li><a
									href="MoinUpdate.jsp?group_name=<%=vo.getGroup_name()%>">모임
										수정 및 삭제</a></li>
								<li><a
									href="MoimSangseMember.jsp?group_name=<%=vo.getGroup_name()%>">모임멤버
										관리</a></li>
							</ul> <%
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