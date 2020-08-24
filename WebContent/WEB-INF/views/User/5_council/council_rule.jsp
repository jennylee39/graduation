<%@page import="kr.ac.skuniv.graduation.dto.Out"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="viewport" content="width=device-width">
<title>Dormitory</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/basic.css">
</head>
<body>
	<%
		// 로그인이 된 정보 담기
		String id = null;
		String name = null;

		// 세션이 존재하면 아이디값을 받아 관리
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			name = (String) session.getAttribute("name");
		}
	%>
	<!--   네비게이션바     -->
	<nav class="navbar navbar-default">
		<br> <a href="main"><img src="img/ujlogo_min.jpg"
			style="max-width: 50%; height: auto;"> </a>
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>


			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-hashpop="true"
						aria-expanded="false"> 소개 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="intro">인사말</a></li>
							<li><a href="summary">학사 개요</a></li>
							<li><a href="chart">조직도</a></li>
							<li><a href="current">입사생 현황</a></li>
							<li><a href="rule">운영규정</a></li>
							<li><a href="map">찾아오는 길</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-hashpop="true"
						aria-expanded="false"> 시설 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="floor">층별 안내도</a></li>
							<li><a href="guide">시설 및 이용안내</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-hashpop="true"
						aria-expanded="false"> 알리미 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="notice">공지사항</a></li>
							<li><a href="news">언론 속의 학사</a></li>
							<li><a href="schedule">행사 일정</a></li>
							<li><a href="carte">식단표</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-hashpop="true"
						aria-expanded="false"> 커뮤니티 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="gallery">갤러리</a></li>
							<li><a href="apply">신청</a></li>
							<li><a href="formula">서식 자료실</a></li>
							<li><a href="free">자유게시판</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-hashpop="true"
						aria-expanded="false"> 학생 자치회 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="council_form">구성</a></li>
							<li><a href="council_rule">자치회 규정</a></li>
						</ul></li>

					<%
						if (id != null) {
					%>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-hashpop="true"
						aria-expanded="false" style="color: #FF6347;">
							${sessionScope.name }님 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="logout">로그아웃</a></li>
						</ul></li>

					<%
						} else if (id == null) {
					%>

					<li><a href="login">로그인</a></li>

					<%
						}
					%>
				</ul>

			</div>
		</div>
	</nav>
	<!-- body -->
	<div id="body_current" align="center">
		<br>
		<h1>학생 자치회 규정</h1>
		<br>
		<hr style="width: 70%;">
		<br>
		
		<div style="border:1px solid #ccc; text-align:left; width:75%;">
		<br>
		<h3 style="margin-left:15px; color:#F29500;">울진학사 학생자치회 회칙</h3><br>
<p style="margin-left:15px; margin-right:15px; font-size:18px;">

 

제 1 조 (목적) <br>본회는 특별활동의 일환으로 학생의 취미 및 특기 신장과 자치능력을 배양하여 민주시민의 자질을 함양하고 건전한 학풍과 학사 발전에 기여함을 목적으로 한다. <br><br>

제 2 조 (명칭)<br> 본회는 우리 학사의 학생자치회라 한다. (이하 “학생회” 또는 “본회”라 칭함) <br><br>

제 3 조 (운영)<br><br>

① 본회는 제 1조의 목적 달성을 위하여 다음 사항의 활동을 위하여 노력한다.<br>
1. 학예, 체육, 취미 및 특기 신장에 관한 활동<br>
2. 정서 함양 및 심신 수련을 위한 활동<br>
3. 학사의 전통, 향토의 민속, 전통 문화의 계승발전에 관한 활동<br>
4. 학사 내⦁외의 각종 봉사활동<br>
5. 학사 또는 주변의 화재 등 각종 재난시 방재 및 지원활동<br>
6. 국가 안보에 관한 정신교육의 실시 및 활동<br>
7. 기타 학사생활수칙과 본회의 목적에 부합하는 활동<br>
② 본회의 모든 활동은 학사생활수칙과 본 회칙의 범위 내에서 학생의 본분에 맞게 이루어져야하며 사전에 학사장의 승인을 받아야 한다.<br>
③ 제 1항의 활동을 하기 위하여 경비지원이 필요하다고 인정될 때에 학사장은 예산 범위 내에서 이를 지원할 수 있다.<br><br>

제 4 조 (구성) 본회는 다음과 같이 구성하며 의장은 자치회장이 된다.<br><br>

①학생자치회 회장 1인<br>
②부회장 2인 (남녀 각 1인)<br>
③총무 1인<br>
④홍보부장 1인<br>
⑤층장 14인 (각 층별 1인)<br><br>

제 5 조 (임무) 자치회의 임무는 다음과 같다.<br><br>

①사업 계획 수립 및 시행<br>
②자치회나 각 층 입사생이 발의한 안건의 처리 및 학사 전달<br>
③기타 학사장이 요구하는 사항 처리 등<br><br> 

제 6 조 (회의)<br><br>

①자치회의는 정기 회의와 임시 회의로 구분하고, 자치회장이 의장이 된다.<br>
②정기 회의는 매월 자치회장이 소집, 운영한다.<br>
③임시 회의는 다음과 같은 경우에 소집한다.<br>
회장이 필요하다고 인정할 때<br>
자치회 임원의 재적 3분의 1 이상의 요구가 있을 때<br>
학사장의 요구가 있을 때<br>

부칙<br><br>

본 회칙은 2019년 3월 3일부터 시행한다.<br>
</p>
		</div>
		

	</div>
	<br>
	<br>
		<!--   footer     -->
	<footer
		style="margin: auto; position: relative; background-color: #eee; color: #777;">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-10 col-lg-offset-1 text-center COLSPAN=5 ALIGN=center">
					<br><br>
					<p>
					<a href="privacy" style="font-weight:bold; color:#5B5B5B;">개인정보 처리방침</a> |
					<a href="service" style="font-weight:bold; color:#5B5B5B;">서비스 이용약관</a> |
					<a href="intro" style="font-weight:bold; color:#5B5B5B;">학사소개</a> |
					<a href="map" style="font-weight:bold; color:#5B5B5B;">오시는 길</a><br>
						<br>서울특별시 동대문구 이문로 172<br>Uljin Dormitory
					</p>

					<ul class="list-unstyled">
						<li><i class="fa fa-phone fa-fw"></i> TEL : 02 ) 701 - 4230</li>
						<li><i class="fa fa-phone fa-fw"></i> H.P : 010 - 3107 - 7661</li>
						<li><i class="fa fa-phone fa-fw"></i> FAX : 02 ) 701 - 4231</li>


						<li><i class="fa fa-envelope-o fa-fw"></i></li>
					</ul>
					<h3>
						<strong> Uljin Dormitory </strong>
					</h3>
					<br>
				</div>
			</div>
		</div>
	</footer>
	<!-- 애니메이션 참조 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
		
	</script>
	<script src="js/bootstrap.js">
		
	</script>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요
    <script src="js/bootstrap.min.js"></script> -->
</body>
</html>