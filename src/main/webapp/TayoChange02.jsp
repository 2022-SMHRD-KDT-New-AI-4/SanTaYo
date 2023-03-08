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

#login a {
	float: right;
	margin: 10px;
	font-family: 'GangwonEdu_OTFBoldA';
}

.group ul {
	list-style: none;
}

input[type='date']::before {
	content: attr(data-placeholder);
	width: 100%;
}

input[type='date']:focus::before, input[type='date']:valid::before {
	display: none;
}

.chkdiv {
	text-align: center;
	width: 100%;
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

				<!-- 회원정보수정 시작 -->
				<section>
					<a href="UserDelete" class="button primary" style="float: right;">회원탈퇴</a>
					<header class="major">

						<h2>회원정보수정</h2>

					</header>

					<div class="joinForm">


						<form method="post" action="UserUpdateService">
							<div class="row gtr-uniform">


								<input type="hidden" name="id" id="id"
									value="<%=loginM.getUser_id()%>">
								<div class="col-6 col-12-xsmall">
									<input type="password" name="pw" id="pw" value=""
										placeholder="변경할 비밀번호" />
								</div>
								<div class="col-6 col-12-xsmall">
									<input type="password" name="pwcheck" id="pwcheck" value=""
										placeholder="비밀번호 확인" />
								</div>
								<div class="chkdiv">
									<font id="chkNotice" size="2"></font>
								</div>
								<div class="col-6 col-12-xsmall">
									<input type="text" name="name" id="name"
										value="<%=loginM.getUser_nm()%>" placeholder="이름" />
								</div>

								<div class="col-6 col-12-xsmall">
									<input type="text" name="addr" id="addr"
										value="<%=loginM.getUser_addr()%>" placeholder="주소" />
								</div>

								<div class="col-12">
									<input class="date" type="date" name="birth" id="birth"
										data-placeholder="&nbsp&nbsp&nbsp생년월일" required
										aria-required="true" value={startDateValue}
										className={styles.selectDay} onChange={StartDateValueHandler}
										style="width: 100%; height: 2.75em; border: solid 1px rgba(210, 215, 217, 0.75); border-radius: 0.375em;" />

								</div>
								<!-- Break -->
								<div class="col-12">
									<select name="level" id="level">
										<option value="등산경력">- 등산경력 -</option>
										<option value="초급자">초급자</option>
										<option value="중급자">중급자</option>
										<option value="상급자">상급자</option>
									</select>

								</div>
								<!-- Break -->
								<div class="col-6 col-12-small">
									<input type="radio" id="genderM" value="M" name="gender"
										checked> <label for="genderM">남</label>
								</div>
								<div class="col-6 col-12-small">
									<input type="radio" id="genderW" value="F" name="gender">
									<label for="genderW">여</label>
								</div>


								<!-- Break -->
								<div class="col-12">
									<ul class="actions">
										<li><input id="joinbtn" type="submit" value="수정하기"
											class="button" /></li>

									</ul>
								</div>
							</div>
						</form>




					</div>
				</section>
				<!-- 회원정보수정 끝 -->

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
								<li><a href="TayoMypage.jsp">내 정보</a></li>
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
	<script>
		$(function() {
			$('#pw').keyup(function() {
				$('#chkNotice').html('');
			});

			$('#pwcheck').keyup(function() {
				if ($('#pw').val() != null || $('#pwcheck').val() != null) {
					if ($('#pw').val() != $('#pwcheck').val()) {
						$('#chkNotice').html('비밀번호가 일치하지 않습니다.');
						$('#chkNotice').attr('color', '#f82a2aa3');
					} else {
						$('#chkNotice').html('비밀번호가 일치합니다.');
						$('#chkNotice').attr('color', '#199894b3');
					}
				}

			});
		});

		$("#joinbtn").click(function() {
			if ($.trim($("#pw").val()) == '') {
				alert("패스워드를 입력해주세요.");
				return false;
			}
			if ($.trim($("#pwcheck").val()) == '') {
				alert("패스워드확인을 입력해주세요.");
				return false;
			}
			if ($.trim($("#name").val()) == '') {
				alert("이름을 입력해주세요.");
				return false;
			}
			if ($.trim($("#addr").val()) == '') {
				alert("주소를 입력해주세요.");
				return false;
			}
			if ($.trim($("#birth").val()) == '') {
				alert("생년월일을 입력해주세요.");
				return false;
			}
			if ($.trim($("#level option:selected").val()) == '등산경력') {
				alert("등산경력을 선택해주세요.");
				return false;
			}

		});
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>



</body>
</html>