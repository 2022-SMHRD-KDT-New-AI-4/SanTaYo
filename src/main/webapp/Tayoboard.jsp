<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="com.smhrd.model.GroupVO"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.BoardDAO"%>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

.group ul {
	list-style: none;
}

#demo-message {
	height: 500px;
}

.primary {
	margin-left: 600px;
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

				<!-- 조인시작 -->
				<section>

					<header class="major">
						<h2>게시글 작성</h2>
					</header>
					<div class="joinForm">



						<!-- 게시글시작 -->


						<form action="BoardInsertService" method="post" id="boardform">
							<%
							request.setCharacterEncoding("UTF-8");
							String group_name = request.getParameter("group_name");
							GroupDAO dao = new GroupDAO();
							GroupVO vo = dao.select(group_name);

							String group_seq = vo.getGroup_seq();
							%>

							<div class="row gtr-uniform">
								<INPUT TYPE="hidden" NAME="group_seq" SIZE=10
									value='<%=group_seq%>'> <INPUT TYPE="hidden"
									NAME="user_id" SIZE=10 value='<%=loginM.getUser_id()%>'>
								<div class="col-12">
									<input type="text" name="board_title" id="demo-name" value=""
										placeholder="제목을 입력해주세요." />
								</div>

								<!-- Break -->

								<!-- Break -->
								<div class="col-12">
									<textarea name="board_content" id="demo-message"
										placeholder="작성할 내용을 입력해주세요." rows="3"></textarea>
								</div>
								<!-- Break -->
								<div class="col-12" id="submit">
									<ul class="actions">
										<li><input type="submit" value="글 등록" class="primary"
											id="submitbtn" /></li>
										<input type="hidden" name="group_name"
											value="<%=vo.getGroup_name()%>">
									</ul>
								</div>
							</div>
						</form>





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
	<script>
		$("#submitbtn").click(function() {
			if ($.trim($("#demo-name").val()) == '') {
				alert("제목을 입력해주세요.");
				return false;
			}
			if ($.trim($("#demo-message").val()) == '') {
				alert("내용을 입력해주세요.");
				return false;
			}
			$("#boardform").submit();
		});
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>



</body>
</html>