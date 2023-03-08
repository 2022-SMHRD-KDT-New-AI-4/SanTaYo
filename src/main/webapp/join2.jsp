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
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/join.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.joinForm {
	position: relative;
}

.checkbtn {
	position: absolute;
	margin-left: 390px;
	margin-top: -88px;
}

.chkdiv {
	text-align: center;
	width: 100%;
}
.title{
text-align:center;}
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
				</header>


				<!-- 조인시작 -->
				<section>


					<div class="joinForm">

						<header class="title">
							<h2>JOIN</h2>
						</header>

						<form method="post" action="JoinService">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall">
									<input type="text" name="id" id="id" value="" placeholder="id" />
								</div>
								<div class="col-6 col-12-xsmall">
									<a href="#" class="button small">중복확인</a>
								</div>
								<div class="col-6 col-12-xsmall">
									<input type="password" name="pw" id="pw" value=""
										placeholder="password" />
								</div>
								<div class="col-6 col-12-xsmall">
									<input type="password" name="pwcheck" id="pwcheck" value=""
										placeholder="password 확인" />
								</div>
								<div class="chkdiv">
									<font id="chkNotice" size="2"></font>
								</div>
								
								<div class="col-6 col-12-xsmall">
									<input type="text" name="name" id="name" value="" placeholder="이름" />
								</div>
								
								<div class="col-6 col-12-xsmall">
									<input type="text" name="addr" value="" placeholder="주소" />
								</div>
								
								<div class="col-12">
								<table>
								<tr>
								<td>생년월일</td>
									<td><input type="date" name="birth" id="birth" /></td>
									</tr>
									</table>
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
								<div class="col-4 col-12-small">
									<input type="radio" value="M" name="gender" checked>
									<label for="M">남</label>
								</div>
								<div class="col-4 col-12-small">
									<input type="radio" value="F" name="gender"> 
									<label for="F">여</label>
								</div>
 <!-- Break -->
                     <div class="col-4 col-12-small">
                        <input type="radio" id="genderM" name="gender"
                           checked> <label for="genderM">남</label>
                     </div>
                     <div class="col-4 col-12-small">
                        <input type="radio" id="genderW"
                           name="gender"> <label for="genderW">여</label>
                     </div>

								<!-- Break -->
								<div class="col-12">
									<ul class="actions">
										<li><input type="submit" value="가입하기" class="primary" /></li>
										<li><input type="reset" value="Reset" /></li>
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
                     <a href="https://www.knps.or.kr/front/portal/open/openList.do?tpmdGrpCd=TKBBS03&menuNo=7020035" class="image"><img src="images/sideImage01.png" alt="" /></a>
                     <p>국립공원의 탐방정보나 공원내 행위허가 등에 대한 질의를 자유롭게 묻고 답하는 곳입니다.</p>
                  </article>
                  <article>
                     <a href="http://hiking.kworks.co.kr/" class="image"><img src="images/sideImage02.jpg" alt="" /></a>
                     <p>입산통제구역 및 등산로패쇄구간을 안내하는 곳입니다.</p>
                  </article>
                  <article>
                     <a href="https://www.foresttrip.go.kr/main.do?hmpgId=FRIP" class="image"><img src="images/sideImage03.PNG" alt="" /></a>
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
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>