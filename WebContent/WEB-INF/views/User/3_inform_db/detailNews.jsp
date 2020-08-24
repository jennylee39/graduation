<%@page import="kr.ac.skuniv.graduation.service.OutService"%>
<%@page import="kr.ac.skuniv.graduation.dao.OutMapper"%>
<%@page
	import="org.apache.tomcat.util.net.openssl.ciphers.Authentication"%>
<%@page import="kr.ac.skuniv.graduation.dao.UserMapper"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="kr.ac.skuniv.graduation.service.UserServiceImpl"%>
<%@page import="kr.ac.skuniv.graduation.dto.User"%>
<%@page import="kr.ac.skuniv.graduation.service.UserService"%>
<%@page import="kr.ac.skuniv.graduation.dto.Out"%>
<%@page import="java.util.List"%>
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
	<br>

	<h2>언론 속의 학사</h2>
	<h4>상세보기</h4>
	<br>
	<hr style="width: 70%;">
	<form class="form" id="detailForm" name="detailForm">


		<table class="type"
			style="width: 70%; min-height: 30em; margin: auto; align: center;">
			<tr class="hidden">
				<th id="title">게시글 번호</th>
				<td>${news.bno}</td>
			</tr>


			<tr style="height: 10%;">
				<th id="title">제목</th>
				<td><span style="font-size: 19px; font-weight: bold;">${news.title}</span></td>
			</tr>
			<tr style="height: 10%;">
				<th id="title">작성자</th>
				<td>${news.writer}<span style="float:right; margin-right: 10px;font-size:14px; font-weight:bold; color:#153e73;">조회수 : ${news.count}</span></td>
			</tr>
			<c:if test="${not empty news.orgname}">
				<tr style="height: 10%;">
					<th id="title">파일 #1</th>
					<td><a href="downloadNews?bno=${news.bno}"><c:out
								value="${news.orgname}"></c:out></a></td>
				</tr>
			</c:if>
			<c:if test="${not empty news.orgname2}">
				<tr style="height: 10%;">
					<th id="title">파일 #2</th>
					<td><a href="downloadNews2?bno=${news.bno}"><c:out
								value="${news.orgname2}"></c:out></a></td>

				</tr>
			</c:if>
			<tr>
				<th id="title">내용</th>
				<td><br> <c:if test="${not empty news.orgname}">
						<c:url value="/uploadFile\\${news.orgname}" var="url1" />
						<img id="load" src="${url1}" width=50% />
						<br>
						<br>
					</c:if> <c:if test="${not empty news.orgname2}">
						<c:url value="/uploadFile\\${news.orgname2}" var="url2" />
						<img id="load" src="${url2}" width=50% />
						<br>
					</c:if> <br> <c:out value="${news.text}" escapeXml="false" /> <br>
					<br></td>
			</tr>
			<c:choose>
				<c:when test="${empty news.rink1 and empty news.rink2 }">

				</c:when>
				<c:when test="${not empty news.rink1}">
					<tr>
						<th id="title">링크 #1</th>
						<td><a href="${news.rink1 }">${news.rink1}</a></td>
					</tr>
				</c:when>
				<c:when test="${not empty news.rink2}">
					<tr>
						<th id="title">링크 #1</th>
						<td><a href="${news.rink2 }">${news.rink2}</a></td>
					</tr>
				</c:when>
				<c:when test="${not empty news.rink1 and not empty news.rink2}">
					<tr>
						<th id="title">링크 #1</th>
						<td><a href="${news.rink1 }">${news.rink1 }</a></td>
						<th id="title">링크 #2</th>
						<td><a href="${news.rink2 }">${news.rink2 }</a></td>
					</tr>
				</c:when>

			</c:choose>
		</table>
		<br> <br>
		<c:choose>
			<c:when test="${sessionScope.role eq '관리자' }">
				<input type="button" class="add-button" id="confirm_del" name="confirm_del"
					onclick="location.href='deleteNews?bno=${news.bno}';"
					value="삭제하기">
				<input type="button" class="add-button"
					onclick="location.href='news';" value="목록으로 돌아가기">
			</c:when>
			<c:otherwise>
				<input type="button" class="add-button"
					onclick="location.href='news';" value="목록으로 돌아가기">
			</c:otherwise>
		</c:choose>
	</form>
	<br>
	<br>
	<!--   footer     -->
	<footer
		style="margin: auto; position: relative; background-color: #eee; color: #777;">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-10 col-lg-offset-1 text-center COLSPAN=5 ALIGN=center">
					<br>
					<br>
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