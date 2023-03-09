<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


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
						src="images/tayoLogo.jpg" alt="�ΰ�" width="200" height="100"></a>

					<div id="login">
						<%
						request.setCharacterEncoding("UTF-8");

						MemberVO loginM = (MemberVO) session.getAttribute("loginM");
						if (loginM == null) {
						%>
						<a href="TayoLogin.jsp" class="button">�α���</a> <a
							href="TayoJoin.jsp" class="button">ȸ������</a>
						<%
						} else {
						%>

						<a href="LogoutService" class="button">�α׾ƿ�</a> <span
							class="welcome"><%=loginM.getUser_nm()%>�� ȯ���մϴ�!</span>
						<%
						}
						%>
					</div>
				</header>



				<!-- Section -->

				<!-- ȸ���������� ���� -->
				<section>

					<header class="major">
						<h2>ȸ����������</h2>
					</header>
					<div class="joinForm">

						<form method="post" action="#">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">
									<input type="password" name="pw" id="pw" value=""
										placeholder="password" />
								</div>

								<div class="col-6 col-12-xsmall">
									<a href="#" class="button small">��й�ȣȮ��</a>
								</div>

								<div>
									<input type="text" name="birth" id="birth" value=""
										placeholder="������� (ex 19950301)" />
								</div>

								<!-- Break -->
								<div class="col-12">
									<select name="age" id="age">
										<option value="">- ���ɴ� -</option>
										<option value="1">20��</option>
										<option value="1">30��</option>
										<option value="1">40��</option>
										<option value="1">50��</option>
										<option value="1">60���̻�</option>

									</select>
								</div>

								<!-- Break -->
								<div class="col-12">
									<select name="age" id="age">
										<option value="�����">- -</option>
										<option value="1">�Թ���</option>
										<option value="1">�ʱ���</option>
										<option value="1">�߱���</option>
										<option value="1">������</option>


									</select>

								</div>
								<!-- Break -->
								<div class="col-4 col-12-small">
									<input type="radio" id="genderM" name="gender" checked>
									<label for="genderM">��</label>
								</div>
								<div class="col-4 col-12-small">
									<input type="radio" id="genderW" name="gender"> <label
										for="genderW">��</label>
								</div>


								<!-- Break -->
								<div class="col-12">
									<ul class="actions">
										<li><input type="submit" value="�����ϱ�" class="primary" /></li>
										<li><input type="reset" value="Reset" /></li>
									</ul>
								</div>
							</div>
						</form>




					</div>
				</section>
				<!-- ȸ���������� �� -->

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
						<li><a href="TayoCourse.jsp">��Ÿ���ڽ�</a></li>
						<li><a href="TayoFind.jsp">����ã��</a></li>
						<li><a href="TayoMoim.jsp">���ӻ���</a></li>
						<li><span class="opener">����������</span>
							<ul>
								<li><a href="TayoMypage.jsp">�� ����</a></li>
								<li><a href="TayoMyschedule.jsp">���� ����</a></li>
								<li><a href="TayoMyMake.jsp">���� ���� ����</a></li>
								<li><a href="TayoMyMoim.jsp">��������</a></li>
								<li><a href="TayoChange.jsp">ȸ����������</a></li>
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
							<p>���������� Ž�������� ������ �����㰡 � ���� ���Ǹ� �����Ӱ� ���� ���ϴ� ���Դϴ�.</p>
						</article>
						<article>
							<a href="http://hiking.kworks.co.kr/" class="image"><img
								src="images/sideImage02.jpg" alt="" /></a>
							<p>�Ի��������� �� �����мⱸ���� �ȳ��ϴ� ���Դϴ�.</p>
						</article>
						<article>
							<a href="https://www.foresttrip.go.kr/main.do?hmpgId=FRIP"
								class="image"><img src="images/sideImage03.PNG" alt="" /></a>
							<p>100����� �ڿ��޾縲 �����ϴ� ���Դϴ�.</p>
						</article>
					</div>

				</section>

				<!-- Section -->
				<section class="group">
					<header class="major">
						<h2>�����ݾ���</h2>
					</header>
					<ul>
						<li>�̻��</li>
						<li>����</li>
						<li>����ȯ</li>
						<li>������</li>
						<li>���޸���</li>
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