<%@page import="com.smhrd.model.CommentVO"%>
<%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.BoardDAO"%>
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

tr {
	height: 50px;
}

th {
	text-align: center !important;
	border: 1px solid rgba(210, 215, 217, 0.75);
	vertical-align: bottom !important;
	font-size: 1.0em !important;
}

td {
	border: 1px solid rgba(210, 215, 217, 0.75);
}

.box {
	z-index: 9999;
}

#comment {
	margin-top: 10px;
}

#commetsubmit {
	font-family: 'GangwonEdu_OTFBoldA';
	background-color: white;
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
				<%
				request.setCharacterEncoding("UTF-8");
				String group_name = request.getParameter("group_name");
				GroupDAO dao = new GroupDAO();
				GroupVO vo = dao.select(group_name);

				String board_seq = request.getParameter("board_seq");

				BoardDAO bdao = new BoardDAO();

				BoardVO bvo = bdao.boardConSel(board_seq);
				%>


				<!-- Section -->
				<section>
					<header class="major">
						<h2>게시판</h2>
					</header>
					<% if (loginM.getUser_id().equals(vo.getUser_id()) || loginM.getUser_id().equals(bvo.getuser_id())) { %>
					<div style="float:right; margin-bottom: 10px;">
						<a style="font-size:0.8em;" class="button small"
							href="TayoBoardEdit.jsp?group_name=<%=vo.getGroup_name()%>&board_seq=<%=board_seq%>"
							id="editbtn">수정</a> <a style="font-size:0.8em;" id="deletebtn" class="button primary small"
							href="BoardDeleteService?group_name=<%=vo.getGroup_name()%>&board_seq=<%=board_seq%>"
							id="deletebtn">삭제</a>
					</div>
					<% } %>
					
					<table class="board_detail">
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>

								<th>작성자</th>
								<td><%=bvo.getuser_id()%></td>
								<th>작성일</th>
								<td><%=bvo.getBoard_dt()%></td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3"><%=bvo.getBoard_title()%></td>
							</tr>
							<tr>
								<td colspan="4" class="box"><pre><%=bvo.getBoard_content()%></pre></td>
							</tr>
						</tbody>


					</table>
					<form action="CommentService" method="post" id="commentform">
						<%
						CommentDAO cdao = new CommentDAO();

						List<CommentVO> list = cdao.commentSel(board_seq);
						%>


						<%
						if (list == null) {
						%>
						<table>
							<tr>
								<th>댓글</th>
								<td class="12" align="center"><input type="text"
									id="comment" name="cmt_content"
									style="height: 2em; margin-top: 0;"></td>

								<td colspan="4" align="center"><input type="submit"
									id="commetsubmit" value="입력"
									style="width: 300px; height: 2.5em; line-height: 3.1em;"></td>
							</tr>

						</table>
						<input type="hidden" name="group_name" value='<%=group_name%>'>
						<INPUT TYPE="hidden" NAME="board_seq"
							value='<%=bvo.getBoard_seq()%>'> <INPUT TYPE="hidden"
							NAME="user_id" value='<%=loginM.getUser_id()%>'>

					</form>

					<%
					} else {
					%>
					<form action="CommentService" method="post" id="commentform">
						<table>
							<%
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<th><%=list.get(i).getUser_id()%></th>
								<td style="width: 75%;"><%=list.get(i).getCmt_content()%></td>
								<td>작성일 : <%=list.get(i).getCmt_dt()%> <%
 if (list.get(i).getUser_id().equals(loginM.getUser_id())) {
 %> <a
									href="CommentDeleteService?cmt_seq=<%=list.get(i).getCmt_seq()%>&board_seq=<%=list.get(i).getBoard_seq()%>&user_id=<%=loginM.getUser_id()%>&group_name=<%=group_name%>"
									style="margin-left: 15%;">삭제</a> <%
 }
 %>
								</td>

							</tr>
							<%
							}

							}
							%>


							<tr style="height: 20px;">
								<th style="width: 5%; margin-bottom: 10%;">댓글</th>
								<td class="12" align="center" style="width: 75%;"><input
									type="text" id="comment" name="cmt_content"
									style="height: 2em; margin-top: 0;"></td>

								<td colspan="4" align="center"><input type="submit"
									id="commetsubmit" value="입력"
									style="width: 300px; height: 2.5em; line-height: 3.1em;"></td>
							</tr>

						</table>
						<input type="hidden" name="group_name" value='<%=group_name%>'>
						<INPUT TYPE="hidden" NAME="board_seq"
							value='<%=bvo.getBoard_seq()%>'> <INPUT TYPE="hidden"
							NAME="user_id" value='<%=loginM.getUser_id()%>'>

					</form>
				</section>


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
		$("#commetsubmit").click(function() {
			if ($.trim($("#comment").val()) == '') {
				alert("댓글을 입력해주세요.");
				return false;
			}
			$("#commentform").submit();
		});
		$("#deletebtn").click(function() {
			let check = confirm("정말 삭제하시겠습니까?");
			
			if(!check){
				alert("삭제취소되었습니다.");
				event.preventDefault();
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