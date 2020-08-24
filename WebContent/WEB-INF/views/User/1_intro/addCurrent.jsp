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
		<h1>입사생 현황</h1>
		<h3>수정하기</h3><br>
		<hr style="width: 70%;">
		<br>
		<div style="width: 70%;">
			<h4 style="float: left;">입사생 현황 추가</h4>
			<form method="post" id="current" method="post" name="current"
				onsubmit="return checkValue()" action="addCurrent">
				<table class="table table-bordered" id="current"
					style="margin: auto; align: center;">
					<thead>
						<tr>
							<td><input type="text" name="id"
								style="width: 100%; background-color: #f5f5f5;"
								placeholder="구분단위"></td>
							<td><input type="text" name="man"
								style="width: 100%; background-color: #f5f5f5;"
								placeholder="남자인원수"></td>
							<td><input type="text" name="woman"
								style="width: 100%; background-color: #f5f5f5;"
								placeholder="여자인원수"></td>
							<td><input type="text" name="refer"
								style="width: 100%; background-color: #f5f5f5;" placeholder="비고"></td>
							<td><input class="add-button"
								style="float: right; width: 100%;" name="add" type="submit"
								onsubmit="return checkValue()"
								onclick="location.href='addCurrent';" value="추가"></td>
						</tr>
					</thead>
				</table>
			</form>
			<br> <input type="button" class="add-button"
				style="float: right;" onclick="location.href='current';" value="완료">

			<br>
			<br>
			<h4 style="float: left;">입사생 현황 수정</h4>

			<table class="table table-bordered table-striped" id="current"
				style="margin: auto; align: center;">
				<thead>
					<tr style="border-top: 2px solid #ccc;">
						<th rowspan="2">구분</th>
						<th colspan="3">합계</th>
						<th rowspan="2">비고</th>
						<th rowspan="2">삭제</th>
					</tr>
					<tr style="border-top: 2px solid #ccc;">
						<th>남</th>
						<th>여</th>
						<th>계</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="sum" value="0" />
					<c:set var="mans" value="0" />
					<c:set var="womans" value="0" />
					<c:forEach items="${currentList}" var="currentList">
						<tr>

							<td style="width: 10%;">${currentList.id}</td>
							<td style="width: 20%;">${currentList.man}</td>
							<td style="width: 20%;">${currentList.woman}</td>
							<c:set value="${currentList.man + currentList.woman}" var="total" />
							<td style="width: 20%;"><c:out value="${total}"></c:out></td>
							<td style="width: 10%;">${currentList.refer}</td>
							<td style="width: 20%;"> <input class="add-button"
								style="float: right; width: 100%;" name="delete" type="submit"
								onsubmit="return removeCheck()"
								onclick="location.href='deleteCurrent?id=${currentList.id}';"
								value="삭제"></td>

						</tr>
						<c:set value="${sum+total}" var="sum" />
						<c:set value="${mans+currentList.man}" var="mans" />
						<c:set value="${womans+currentList.woman}" var="womans" />
					</c:forEach>
					<tr>
						<th>총 합</th>
						<td style="color: #E57200; font-weight: bold; font-size: 15px;"><c:out
								value="${mans}" /></td>
						<td style="color: #E57200; font-weight: bold; font-size: 15px;"><c:out
								value="${womans}" /></td>
						<td style="color: #EA2B00; font-weight: bold; font-size: 15px;"><c:out
								value="${sum}" /></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br> <input type="button" class="add-button"
				style="float: right;" onclick="location.href='current';" value="완료">

		</div>
	</div>
	<script type="text/javascript">
		function checkValue() {

			if (!document.current.id.value) {
				alert("구분단위를 입력하세요.");
				return false;
			}

			if (!document.current.man.value) {
				alert("남자의 인원을 입력하세요.");
				return false;
			}
			if (!document.current.woman.value) {
				alert("여자의 인원을 입력하세요.");
				return false;
			}

			document.current.submit();

			alert('추가 완료');

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