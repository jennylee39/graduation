<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="viewport" content="width=device-width">
<title>Dormitory</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/basic.css">
<link href="jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="jquery.bxslider/jquery.bxslider.js"></script>

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
		<br> <a href="main"><img src="img/ujlogo.jpg"
			style="max-width: 50%; height: auto;"> </a><br>
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

	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		style="max-width: 60%; height: auto; position: center; margin: 0 auto;">

		<!--페이지-->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!--페이지-->
		<div class="carousel-inner">
			<!--슬라이드1-->
			<div class="item active">
				<img src="img/carousel1.jpg" style="width: 100%; height: 40em;"
					alt="First slide">

				<div class="carousel-caption">
					<h1>인재들의 요람</h1>
					<p>UJ DORMITORY</p>
				</div>

			</div>

			<!--슬라이드2-->
			<div class="item">
				<img src="img/carousel2.jpg" style="width: 100%; height: 40em;"
					data-src="" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>오늘 걷지않으면 내일 뛰어야 한다.</h1>
						<p>UJ DORMITORY</p>
					</div>
				</div>
			</div>

			<!--슬라이드3-->
			<div class="item">
				<img src="img/carousel3.jpg" style="width: 100%; height: 40em;"
					data-src="" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>꿈은 이루어진다☆</h1>
						<p>UJ DORMITORY</p>
					</div>
				</div>
			</div>

			<!-- 이전, 다음 버튼 -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
				class="glyphicon glyphicon-chevron-left"></span></a> <a
				class="right carousel-control" href="#myCarousel" data-slide="next"><span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>
	<br>
	<br>
	<hr style="width: 70%;">
	<div class="container" style="width:65%;">
		<div class="col-md-8 col-md-offset-2 text-center">
			<br><br>
			<h2 class="title">ULJIN DORMITORY</h2>
			<div class="space-50"></div>
			<br> <br>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="info">
					<div class="description">
							<br><h3 class="info-title" style="text-align: left;">
							공지사항 <input type="button"
								style="float: right; background-color: #eee; font-size: 15px; bolder: 2px solid #eee;"
								onclick="location.href='notice';" value="더보기">
						</h3>

						<table class="table table-bordered table-striped">
							<c:forEach items="${noticeList}" var="noticeList" end="4">
								<tr>
									<td style="width: 10%;">${noticeList.bno}</td>

									<td style="width: 80%;"><a
										href="detailNotice?bno=${noticeList.bno}" style="color:black;">${noticeList.title}</a></td>

									<td style="width: 10%;"><fmt:formatDate
											value="${noticeList.addDate}" timeZone="Asia/Seoul"
											pattern="yyyy/MM/dd"></fmt:formatDate></td>
								</tr>
							</c:forEach>
						</table>
						<hr>
					</div>
					<br>
					<div class="description">
						<h3 class="info-title" style="text-align: left;">
							언론 속의 학사 <input type="button"
								style="float: right; background-color: #eee; font-size: 15px; bolder: 2px solid #eee;"
								onclick="location.href='news';" value="더보기">
						</h3>

						<table class="table table-bordered table-striped">
							<c:forEach items="${newsList}" var="newsList" end="4">
								<tr>
									<td style="width: 10%;">${newsList.bno}</td>

									<td style="width: 80%;"><a
										href="detailNews?bno=${newsList.bno}" style="color:black;">${newsList.title}</a></td>

									<td style="width: 10%;"><fmt:formatDate
											value="${newsList.addDate}" timeZone="Asia/Seoul"
											pattern="yyyy/MM/dd"></fmt:formatDate></td>
								</tr>
							</c:forEach>
						</table>
						<hr>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6">
				<div class="info">
					<div class="description">
						<br><br><br><br>
						<div style="width: 80%; height: auto; margin: auto;">
							<br> <a href="carte"><img src="img/carte.png"
								style="max-width: 50%; height: auto;"> <br> <br>
								<br>
								<h2 style="color: #5B5B5B;">식단표</h2></a>

						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6">
				<div class="info">
					<br><br><br><br>
					<div class="description">
						<div style="width: 80%; height: auto; margin: auto;">
							<br> <a href="gallery"><img src="img/gallery4.png"
								style="max-width: 50%; height: auto;"> <br> <br>
								<br>
								<h2 style="color: #5B5B5B;">갤러리</h2></a>

						</div>
					</div>
				</div>
			</div>

			<div class="col-md-2 col-sm-6">
				<div class="info">
					<div class="description">
						<br><br><br><br>
						<div style="width: 80%; height: auto; margin: auto;">
							<br> <a href="schedule"><img src="img/event.jpg"
								style="max-width: 50%; height: auto;"> <br> <br>
								<br>
								<h2 style="color: #5B5B5B;">행사</h2></a>

						</div>
					</div>
				</div>
			</div>
			<br>
			
			<div class="col-md-2 col-sm-6">
				<div class="info">
					<div class="description">
						<br><br><br><br>
						<div style="width: 80%; height: auto;margin:auto;">
								<br>
								<a href="apply"><img src="img/apply.png" style="max-width: 50%; height: auto;">
								<br> <br> <br>
								<h2 style="color: #5B5B5B;">외박 신청</h2></a>
							</div>
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2 col-sm-6">
					<div class="info">
						<div class="description">
							<br><br><br><br>
							<div style="width: 80%; height: auto; margin: auto;">
							<br> <a href="map"><img src="img/map2.png"
								style="max-width: 50%; height: auto;"> <br> <br>
								<br>
								<h2 style="color: #5B5B5B;">오시는 길</h2></a>
						</div>
						</div>
					</div>
				</div>
				<div class="col-md-2 col-sm-6">
					<br><br><br><br><br>
					<div style="width: 100%; height: auto; float: left; ">
						<h3 style="font-weight=bold;">02)701-4230</h3>
						<h3>010-3107-7661</h3>
						<h4 style="color: red;">(24시간 긴급 전화)</h4>

					</div>
				</div>
			</div>
		</div>
	<br><br><br>
	</div>


	<!--   footer     -->
	<footer
		style="margin: auto; position: relative; background-color: #eee; color: #777;">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-10 col-lg-offset-1 text-center COLSPAN=5 ALIGN=center">
					<br> <br>
					<p>
						<a href="privacy" style="font-weight: bold; color: #5B5B5B;">개인정보
							처리방침</a> | <a href="service"
							style="font-weight: bold; color: #5B5B5B;">서비스 이용약관</a> | <a
							href="intro" style="font-weight: bold; color: #5B5B5B;">학사소개</a>
						| <a href="map" style="font-weight: bold; color: #5B5B5B;">오시는
							길</a><br> <br>서울특별시 동대문구 이문로 172<br>Uljin Dormitory
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