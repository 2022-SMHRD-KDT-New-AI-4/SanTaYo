<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.GroupVO"%>
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

#login a, #login span {
	float: right;
	margin: 10px;
}

.group ul {
	list-style: none;
}

#login span {
	margin-top: 20px;
}

.moim {
	margin: 0 auto;
	height: 100%;
}

.moim article {
	width: 30%;
	height: 230px;
	float: left;
	padding: 1% !important;
	margin: 10px !important;
	border: solid 1px lightgray !important;
	border-radius: 10px;
	z-index: 100;
}

.moim article:hover {
	background-color: #defabb;
	cursor: pointer;
}
</style>
</head>
<body class="is-preload">

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
				
				
				
				<section>
					<header class="major">
						<h2>진행중모임</h2>
					</header>
					<form method="post" action="#">
						<div class="row gtr-uniform" style="border: 1px dotted; border-radius: 20px; width: 1200px; position: relative;" >
							<div class="col-6 col-12-xsmall">
							
							
								<input type="text" name="demo-name" id="demo-name" value=""
									placeholder="모임이름" style="width:160%">
							</div>
									<!-- Break -->
							<div class="col-12">
								<select name="demo-category" id="demo-category" style="width:78%">
									<option value="">- 모임의 등반난이도 -</option>
									<option value="1">초급코스</option>
									<option value="1">중급코스</option>
									<option value="1">고급코스</option>

								</select>
						
							</div>									
							<!-- Break -->
							<div style="width: 250px; text-align: center; font-weight: bold;">성별</div>	
								<div class="col-4 col-12-small" style="width:20%">
									<input type="radio" id="genderALL" name="demo-priority" checked>
									<label for="genderALL">상관없음</label>
								</div>
								<div class="col-4 col-12-small" style="width:20%">
									<input type="radio" id="genderM" name="demo-priority">
									<label for="genderM">남</label>
								</div>
								<div class="col-4 col-12-small" style="width:20%">
									<input type="radio" id="genderW" name="demo-priority">
									<label for="genderW">여</label>
								</div>
								
                            
						<div style="width: 250px; text-align: center;font-weight: bold;">나이(중복선택가능)</div>	
								<div class="col-6 col-12-small" style="width:15%">
									<input type="checkbox" id="two" name="age"> <label
										for="two">20대</label>
								</div>
								<div class="col-6 col-12-small" style="width:15%">
									<input type="checkbox" id="three" name="age"> <label
										for="three">30대</label>
								</div>
								<div class="col-6 col-12-small" style="width:15%">
									<input type="checkbox" id="four" name="age"> <label
										for="four">40대</label>
								</div>
								<div class="col-6 col-12-small" style="width:15%">
									<input type="checkbox" id="five" name="age"> <label
										for="five">50대</label>
								</div>
								<div class="col-6 col-12-small" style="width:15%">
									<input type="checkbox" id="six" name="age"> <label
										for="six">60대이상</label>
								</div>									

					


							<!-- Break -->
							<div class="col-12" style="margin-bottom: 20px;">
								<ul class="actions">
									<li><input type="submit" value="검색하기" /></li>
								</ul>
							</div>
						</div>
					</form>
					
					
					<%
					//1. DB에 있는 회원정보 데이터 가져오기
					//-> DAO에 기능을 호출!
					GroupDAO dao = new GroupDAO();
					List<GroupVO> list = dao.selectAll();
					%>
					<div class="moim">
						<%
						for (GroupVO vo : list) {
						%>
						<article
							onclick="location.href='MoimSangseSogae.jsp?group_name=<%=vo.getGroup_name()%>';">
							<!-- 											<a href="MoimSangseSogae.jsp" class="image"><img src="images/tayoLogo.jpg" alt="로고" /></a> -->
							<h3><%=vo.getGroup_name()%></h3>
							<p>
								#
								<%=vo.getGroup_age()%>
								<br>#
								<%=vo.getGroup_gender()%><br>#
								<%=vo.getGroup_level()%><br>
							</p>
							<!-- 											<ul class="actions">
												<li><a href="MoimSangseSogae.jsp" class="button">More</a></li>
											</ul> -->
						</article>
						<%
						}
						%>
					</div>
				</section>

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
						<li><a href="TayoMoim.jsp">모임생성</a></li>
						<li><span class="opener">마이페이지</span>
							<ul>
								<li><a href="TayoMyschedule.jsp">나의 일정</a></li>
								<li><a href="TayoMyMake.jsp">내가 만든 모임</a></li>
								<li><a href="TayoMyMoim.jsp">참여모임</a></li>
								<li><a href="TayoChange.jsp">회원정보수정</a></li>
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