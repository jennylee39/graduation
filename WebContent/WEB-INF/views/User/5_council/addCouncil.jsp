<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width">
<title>Dormitory</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/basic.css">
</head>
<body>
	<%
		// 로그인이 된 정보 담기
		String id = null;

		// 세션이 존재하면 아이디값을 받아 관리
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
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
		<h1>학생 자치회 구성</h1>
		<br>
		<hr style="width: 70%;">
		<br>
		<div style="width: 70%;">

			<h4 style="float: left;">자치회 구성 추가</h4>
			<form method="post" id="council" method="post" name="council"
				onsubmit="return checkValue()" action="addCouncil">
				<table class="table table-bordered" id="council"
					style="margin: auto; align: center;">
					<thead>
						<tr>
							<td><input type="text" name="id"
								style="width: 100%; background-color: #f5f5f5;" placeholder="나열 순서"></td>
							<td><input type="text" name="role"
								style="width: 100%; background-color: #f5f5f5;" placeholder="직책"></td>
							<td><input type="text" name="name"
								style="width: 100%; background-color: #f5f5f5;" placeholder="이름"></td>
							<td><input type="text" name="grade"
								style="width: 100%; background-color: #f5f5f5;" placeholder="학년"></td>
							<td><input class="add-button"
								style="float: right; width: 100%;" name="add" type="submit"
								onsubmit="return checkValue()"
								onclick="location.href='addCouncil';" value="추가"></td>
						</tr>
					</thead>
				</table>
			</form>
			<br>
			<c:choose>
				<c:when test="${sessionScope.role eq '관리자'}">
					<input type="button" class="add-button" style="float: right;"
						onclick="location.href='council_form';" value="완료">
				</c:when>
			</c:choose>
			<br> <br>
			<h4 style="float: left;">자치회 구성 수정</h4>
			<table class="table table-bordered" id="council"
				style="margin: auto; align: center;">
				<thead>
					<tr style="border-top: 2px solid #ccc;">
						<th style="text-align: center; width: 10%;">순서</th>
						<th style="text-align: center; width: 30%;">직책</th>
						<th style="text-align: center; width: 20%;">이름</th>
						<th style="text-align: center; width: 20%;">학년</th>
						<th style="text-align: center; width:20%;">수정 및 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${councilList}" var="councilList">
						<tr>
							<td>${councilList.id}</td>
							<td>${councilList.role}</td>
							<td>${councilList.name}</td>
							<td>${councilList.grade}</td>
							<td><input class="add-button"
								style="float: right; width: 50%;" name="update" type="submit"
								onclick="location.href='updateCouncil?id=${councilList.id}';"
								value="수정"> <input class="add-button"
								style="float: right; width: 50%;" name="delete" type="submit"
								onsubmit="return removeCheck()"
								onclick="location.href='deleteCouncil?id=${councilList.id}';"
								value="삭제"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<c:choose>
				<c:when test="${sessionScope.role eq '관리자'}">
					<input type="button" class="add-button" style="float: right;"
						onclick="location.href='council_form';" value="완료">
				</c:when>
			</c:choose>
		</div>
	</div>

	<script type="text/javascript">

		function checkValue() {

			if (!document.council.id.value) {
				alert("순서를 입력하세요.");
				return false;
			}

			if (!document.council.role.value) {
				alert("직책을 입력하세요.");
				return false;
			}

			document.council.submit();

		}
	</script>
	<br>
	<br>
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