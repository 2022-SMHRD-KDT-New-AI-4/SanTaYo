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
						<h2>산타요추천코스</h2>
					</header>

					<div class="content">

						<h4>봄코스 - 쫓비산(537M)</h4>
						<p>
							<span class="image left"><img class="image1"
								src="images/spring.png" alt=""></span>전남 광양의 진산 백운산에서 매봉능선을 타고
							내려오면 쫓비산을 만난다. 매봉능선에서 쫓비산을 찾아가는 길은 왼쪽으로 멀리 지리산이 보이고, 바로 밑에는 섬진강이
							굽이쳐 흐르는가 하면 오른쪽에는 백운산에서 억불봉으로 이어지는 능선길이 보이는 멋진 길이다. 산 봉우리가
							뾰족(쫓빗)하다는 데서 유래한 이 산은 광양 매화마을을 품고 있다. 평소에는 찾는 이들이 많지 않지만 매화 흐드러지는
							삼월이면 전국의 여느 명산 못지않게 붐빈다. 섬진강이 경상남도 하동과 전라남도 광양의 경계를 이루는 이 일대 마을에는
							매화나무 10만 그루가 자라고 있다. 봄이면 유장하게 흐르는 섬진강 앞에 위치한 청매실 농원에 하얀 꽃에 푸른 기운이
							섞인 청매화, 새색시 볼처럼 분홍색을 띤 홍매화 등 각양각색의 매화꽃이 장관을 이룬다.

						</p>

						<h4>여름코스 - 불갑산 佛甲山(518m)</h4>
						<p>
							<span class="image right"><img src="images/summer.png"
								alt="" /></span>전남 영광에 있는 이 산은 높지는 않지만 아름다운 산세와 야생화로 유명한 영광을 대표하는 산이다.
							봄이면 소박한 야생화가 산을 장식하며, 가을이면 상사화로 유명하다. 연실봉은 산이 연꽃 열매를 닮아 붙여진 이름이다.
							주변 산들이 이 봉우리를 중심으로 연꽃잎처럼 둘러싸고 있는 모양이다. 정상에서 뻗어나간 산줄기들이 사방으로 어지럽게
							흩어진 모습이 장관이다. 불갑산을 명산으로 꼽는 이유다. 산행은 백제가 세운 불갑사를 기점으로 하는 코스를 가장 많이
							이용한다. 불갑사 기점 코스로는 동백골~해불암~정상~해불암~동백골~불갑사 코스(4.5km, 약 1시간30분),
							불갑사~동백골~구수재~연실봉~해불암~동백골~불갑사(약 4.5km, 2시간30분),
							불갑사~동백골~구수재~용봉~도솔봉~수도암(또는 불갑사)~주차장(4.2km, 2시간30분),
							수도암~도솔봉~구수재~연실봉~덫고개~불갑사(약 6.4km, 3시간30분) 등이 있다.
						</p>
						<h4>가을코스 - 내장산內藏山(763m)</h4>
						<p>
							<span class="image left"><img src="images/fall.png" alt="" /></span>전북
							정읍 내장산의 단풍이 각별한 것은 지리적 위치 때문이다. 단풍은 일교차가 크고, 일조 시간이 길수록 색이 선명해지는데
							내장산은 남부내륙에 있어 일교차도 크고, 주위에 큰 산이 없어 일조 시간도 길다. 단풍나무의 수종도 애기단풍나무,
							신나무 등 11종으로 다양해 화려한 색감의 단풍이 어우러진 풍경을 감상할 수 있다. 내장산 특유의 애기단풍은 잎이
							어린아이 손처럼 작고 앙증맞으며, 빛깔이 고운 것이 특징이다. 단풍철 내장산은 국민적 명소이므로, 이른 새벽에
							출발하거나 전날 밤 출발하는 무박산행을 이용하는 것이 좋다. 내장산 단풍은 10월 말이 절정. 가족을 동반하거나 등산
							초보인 경우 단풍놀이 코스로 단풍터널 지나, 케이블카를 타고 연지봉 아래의 전망대에 다녀 온 후 내장사를 거쳐
							원적계곡을 따라 올랐다가 원적암에서 벽련암으로 편안한 사면길을 따라 단풍터널로 내려오는 코스가 적당하다.
						</p>


						<h4>겨울코스 - 무등산 內藏山 (1,187m)</h4>
						<p>
							<span class="image right"><img src="images/winter.png"
								alt="" /></span>백제 때 무진악, 고려 때 서석산이라고 하였으며 높이 1,187m이다. 북쪽은 나주평야, 남쪽은
							남령산지의 경계에 있으며 산세가 웅대하다. 북부는 중생대에 관입한 화강암이 분포하고 남부는 퇴적암지대이다. 2016년
							총 탐방객은 357만1,712명. 산악형 국립공원으로는 북한산(609만여 명), 설악산(365만여 명)에 이어 세
							번째다. 지리산(288만여 명)보다 많다. 봄 철쭉, 여름 계곡, 가을 억새와 단풍, 겨울 눈꽃 등 모두 볼 만하다.
							특히 서석대와 입석대, 규봉암에 있는 눈꽃은 가히 절경이다.
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
								<li><a href="TayoMyschedule.jsp">나의 일정</a></li>
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