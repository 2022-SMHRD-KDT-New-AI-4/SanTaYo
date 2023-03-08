<%@page import="java.util.Objects"%>
<%@page import="com.smhrd.model.GroupJoinVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.GroupJoinDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@page import="com.smhrd.model.GroupVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.GroupDAO"%>
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
</style>
</head>
<body class="is-preload">

	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	request.setCharacterEncoding("UTF-8");
	String group_name = request.getParameter("group_name");
	GroupDAO dao = new GroupDAO();
	GroupVO vo = dao.select(group_name);
	%>

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
						request.setCharacterEncoding("UTF-8");

						MemberVO loginM = (MemberVO) session.getAttribute("loginM");
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

				<!-- 조인시작 -->
				<section>

					<header class="major">
						<h2>모임수정 및 삭제</h2>
					</header>
					<div class="joinForm">

						<header>
							<h2>모임수정</h2>
						</header>

						<!-- 모임만들기시작 -->

						<form action="GroupUpdateService" method="post">
							<div class="row gtr-uniform">
								<input type="hidden" name="group_name" value='<%=group_name%>'>
								<!-- Break -->
								<div class="col-12">
									<select name="group_level" id="demo-category">
										<option value="">- 모임의 등반난이도 -</option>
										<option value="상관없음">아무나</option>
										<option value="초급">초급코스</option>
										<option value="중급">중급코스</option>
										<option value="상급">상급코스</option>

									</select>
								</div>


								<!-- Break -->

								<div class="col">
									<h4>함께할 멤버의 성별을 선택해주세요.</h4>
								</div>


								<div class="col-12">
									<input type="radio" id="genderALL" value="상관없음"
										name="group_gender" checked> <label for="genderALL">상관없음</label>
									<input type="radio" id="genderM" value="남자만"
										name="group_gender"> <label for="genderM">남</label> <input
										type="radio" id="genderW" value="여자만" name="group_gender">
									<label for="genderW">여</label>
								</div>


								<div class="col">
									<h4>멤버의 연령을 선택해주세요.(중복선택이 가능합니다)</h4>
								</div>


								<div class="col-12">
									<input type="checkbox" id="all" value="상관없음" name="group_age">
									<label for="all">상관없음</label> <input type="checkbox" id="two"
										value="20대" name="group_age"> <label for="two">20대</label>
									<input type="checkbox" id="three" value="30대" name="group_age">
									<label for="three">30대</label> <input type="checkbox" id="four"
										value="40대" name="group_age"> <label for="four">40대</label><input
										type="checkbox" id="five" value="50대" name="group_age">
									<label for="five">50대</label> <input type="checkbox" id="six"
										value="60대" name="group_age"> <label for="six">60대이상</label>
								</div>


								<!-- Break -->
								<div class="col-12">
									<textarea name="group_info" id="demo-message"
										placeholder="간단한 모임의 소개글을 적어주세요" rows="3"></textarea>
								</div>
								<!-- Break -->
								<div class="col-12" id="submit">
									<ul class="actions">
										<li><input type="submit" value="모임수정" class="primary" /></li>
										<li><a class="button" href="GroupDeleteService?group_name=<%=vo.getGroup_name()%>">모임삭제</a></li>
									</ul>
								</div>
							</div>
						</form>



							<div class="row gtr-uniform">
							
							</div>







					</div>
				</section>
				<!-- 조인끝 -->
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
						GroupVO advo = dao.adminSelect(avo);
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