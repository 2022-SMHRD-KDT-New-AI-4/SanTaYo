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

h2, h4 {
	font-family: 'GangwonEdu_OTFBoldA'
}

#login a {
	float: right;
	margin: 10px;
}

.group ul {
	list-style: none;
}

.posts {
	margin-left: 10px;
	margin-right: 50px;
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
				<section>
					<header class="major">
						<h2>��Ÿ����õ�ڽ�</h2>
					</header>

					<div class="content">

						<h4>���ڽ� - �Ѻ��(537M)</h4>
						<p>
							<span class="image left"><img class="image1"
								src="images/spring.png" alt=""></span>���� ������ ���� ���꿡�� �ź��ɼ��� Ÿ��
							�������� �Ѻ���� ������. �ź��ɼ����� �Ѻ���� ã�ư��� ���� �������� �ָ� �������� ���̰�, �ٷ� �ؿ��� ��������
							������ �帣�°� �ϸ� �����ʿ��� ���꿡�� ��Һ����� �̾����� �ɼ����� ���̴� ���� ���̴�. �� ���츮��
							����(�Ѻ�)�ϴٴ� ���� ������ �� ���� ���� ��ȭ������ ǰ�� �ִ�. ��ҿ��� ã�� �̵��� ���� ������ ��ȭ ��巯����
							����̸� ������ ���� ��� �����ʰ� �պ��. �������� ��󳲵� �ϵ��� ���󳲵� ������ ��踦 �̷�� �� �ϴ� ��������
							��ȭ���� 10�� �׷簡 �ڶ�� �ִ�. ���̸� �����ϰ� �帣�� ������ �տ� ��ġ�� û�Ž� ����� �Ͼ� �ɿ� Ǫ�� �����
							���� û��ȭ, ������ ��ó�� ��ȫ���� �� ȫ��ȭ �� ���簢���� ��ȭ���� ����� �̷��.

						</p>

						<h4>�����ڽ� - �Ұ��� ��ˣߣ(518m)</h4>
						<p>
							<span class="image right"><img src="images/summer.png"
								alt="" /></span>���� ������ �ִ� �� ���� ������ ������ �Ƹ��ٿ� �꼼�� �߻�ȭ�� ������ ������ ��ǥ�ϴ� ���̴�.
							���̸� �ҹ��� �߻�ȭ�� ���� ����ϸ�, �����̸� ���ȭ�� �����ϴ�. ���Ǻ��� ���� ���� ���Ÿ� ��� �ٿ��� �̸��̴�.
							�ֺ� ����� �� ���츮�� �߽����� ������ó�� �ѷ��ΰ� �ִ� ����̴�. ���󿡼� ����� ���ٱ���� ������� ��������
							����� ����� ����̴�. �Ұ����� ������� �Ŵ� ������. ������ ������ ���� �Ұ��縦 �������� �ϴ� �ڽ��� ���� ����
							�̿��Ѵ�. �Ұ��� ���� �ڽ��δ� �����~�غҾ�~����~�غҾ�~�����~�Ұ��� �ڽ�(4.5km, �� 1�ð�30��),
							�Ұ���~�����~������~���Ǻ�~�غҾ�~�����~�Ұ���(�� 4.5km, 2�ð�30��),
							�Ұ���~�����~������~���~���ֺ�~������(�Ǵ� �Ұ���)~������(4.2km, 2�ð�30��),
							������~���ֺ�~������~���Ǻ�~����~�Ұ���(�� 6.4km, 3�ð�30��) ���� �ִ�.
						</p>
						<h4>�����ڽ� - �����Ү��ߣ(763m)</h4>
						<p>
							<span class="image left"><img src="images/fall.png" alt="" /></span>����
							���� ������� ��ǳ�� ������ ���� ������ ��ġ �����̴�. ��ǳ�� �ϱ����� ũ��, ���� �ð��� ����� ���� ���������µ�
							������� ���γ����� �־� �ϱ����� ũ��, ������ ū ���� ���� ���� �ð��� ���. ��ǳ������ ������ �ֱ��ǳ����,
							�ų��� �� 11������ �پ��� ȭ���� ������ ��ǳ�� ��췯�� ǳ���� ������ �� �ִ�. ����� Ư���� �ֱ��ǳ�� ����
							����� ��ó�� �۰� ����������, ������ ��� ���� Ư¡�̴�. ��ǳö ������� ������ ����̹Ƿ�, �̸� ������
							����ϰų� ���� �� ����ϴ� ���ڻ����� �̿��ϴ� ���� ����. ����� ��ǳ�� 10�� ���� ����. ������ �����ϰų� ���
							�ʺ��� ��� ��ǳ���� �ڽ��� ��ǳ�ͳ� ����, ���̺�ī�� Ÿ�� ������ �Ʒ��� �����뿡 �ٳ� �� �� ����縦 ����
							��������� ���� �ö��ٰ� �����Ͽ��� ���þ����� ����� ������ ���� ��ǳ�ͳη� �������� �ڽ��� �����ϴ�.
						</p>


						<h4>�ܿ��ڽ� - ����� Ү��ߣ (1,187m)</h4>
						<p>
							<span class="image right"><img src="images/winter.png"
								alt="" /></span>���� �� ������, ��� �� �������̶�� �Ͽ����� ���� 1,187m�̴�. ������ �������, ������
							���ɻ����� ��迡 ������ �꼼�� �����ϴ�. �Ϻδ� �߻��뿡 ������ ȭ������ �����ϰ� ���δ� �����������̴�. 2016��
							�� Ž�水�� 357��1,712��. ����� �����������δ� ���ѻ�(609���� ��), ���ǻ�(365���� ��)�� �̾� ��
							��°��. ������(288���� ��)���� ����. �� ö��, ���� ���, ���� ����� ��ǳ, �ܿ� ���� �� ��� �� ���ϴ�.
							Ư�� ������� �Լ���, �Ժ��Ͽ� �ִ� ������ ���� �����̴�.
						</p>
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
						<li><a href="TayoCourse.jsp">��Ÿ���ڽ�</a></li>
						<li><a href="TayoFind.jsp">����ã��</a></li>
						<%
						request.setCharacterEncoding("UTF-8");
						if (loginM != null) {
						%>
						<li><a href="TayoMoim.jsp">���ӻ���</a></li>
						<li><span class="opener">����������</span>
							<ul>
								<li><a href="TayoMypage.jsp">�� ����</a></li>
								<li><a href="TayoMyschedule.jsp">���� ����</a></li>
								<li><a href="TayoMyMake.jsp">���� ���� ����</a></li>
								<li><a href="TayoMyMoim.jsp">��������</a></li>
								<li><a href="TayoChange.jsp">ȸ����������</a></li>
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
							<p>100���� �ڿ��޾縲 �����ϴ� ���Դϴ�.</p>
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