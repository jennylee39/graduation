<%@page import="kr.ac.skuniv.graduation.dto.Out"%>
<%@page import="kr.ac.skuniv.graduation.dto.Etc"%>
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
		String role = null;

		// 세션이 존재하면 아이디값을 받아 관리
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			name = (String) session.getAttribute("name");
			role = (String) session.getAttribute("role");
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
		<h1>각종 신청</h1>
		<span style="line-height: 80%;">
			<h5>메뉴를 선택해서 이용해보세요!</h5>
		</span> <br>
		<hr style="width: 70%;">
		<div class="container-fluid" style="width: 70%;">
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable">
						<ul class="nav nav-tabs">
							<li class="nav-item active"><a class="nav-link active"
								href="#tab1" data-toggle="tab">외박 신청</a></li>
							<li class="nav-item"><a class="nav-link" href="#tab2"
								data-toggle="tab">봉사활동 / 상담 신청</a></li>
							<li class="nav-item"><a class="nav-link" href="#tab3"
								data-toggle="tab">학사 신청</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">


								<br> <br>

								<p
									style="text-align: left; color: orange; font-weight: bold; font-size: 18px;">외박
									신청</p>
								<%
									if (id != null) {
								%>
								관리자 혹은 본인이 쓴 글만 확인할 수 있습니다.
								<button class="add-button" onclick="location.href='addOut';"
									style="float: right;">글쓰기</button>
								<br>
								<%
									} else if (id == null) {
								%>
								게시판을 이용하려면 하려면 로그인 해야합니다.<br>
								<%
									}
								%>
								<br>
								<table class="table table-bordered" id="apply"
									style="margin: auto; align: center;">
									<thead>
										<tr style="border-top: 2px solid #ccc;">
											<th style="width: 7%;">번호</th>
											<th style="width: 56%;">제목</th>
											<th style="width: 10%;">글쓴이</th>
											<th style="width: 16%;">날짜</th>
											<th style="width: 10%;">조회</th>
										</tr>
									</thead>
									<tbody>


										<c:forEach items="${outList}" var="outList">
											<tr>
												<td>${outList.outBno}</td>
												<c:choose>
													<c:when
														test="${sessionScope.id == outList.id || sessionScope.role eq '관리자'}">
														<td><a href="detailOut?outBno=${outList.outBno}">${outList.title}</a></td>
													</c:when>
													<c:when test="${sessionScope.id != outList.id}">
														<td>${outList.title}</td>
													</c:when>
												</c:choose>
												<td>${outList.writer}</td>
												<td><fmt:formatDate value="${outList.addDate}"
														timeZone="Asia/Seoul" pattern="yyyy/MM/dd" /></td>
												<td>${outList.count}</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>

								<div id="paginationBox" class="pagination">
									<ul class="pagination">
										<c:if test="${pagination1.prev1}">
											<li class="page-item"><a class="page-link" href="#"
												onClick="fn_prev1('${pagination1.page1}', '${pagination1.range1}', '${pagination1.rangeSize1}')">Previous</a></li>
										</c:if>
										<c:forEach begin="${pagination1.startPage1}"
											end="${pagination1.endPage1}" var="idx1">
											<li
												class="page-item <c:out value="${pagination1.page1 == idx1 ? 'active' : ''}"/> "><a
												class="page-link" href="#"
												onClick="fn_pagination1('${idx1}', '${pagination1.range1}', '${pagination1.rangeSize1}')">
													${idx1} </a></li>
										</c:forEach>
										<c:if test="${pagination1.next1}">
											<li class="page-item"><a class="page-link" href="#"
												onClick="fn_next1('${pagination1.range1}', '${pagination1.range1}', '${pagination1.rangeSize1}')">Next</a></li>
										</c:if>
									</ul>
								</div>
								<div></div>

							</div>
							<div class="tab-pane" id="tab2">
								<br> <br>
								<p
									style="text-align: left; color: orange; font-weight: bold; font-size: 18px;">봉사활동
									/ 상담 신청</p>
								<%
									if (id != null) {
								%>
								관리자 혹은 본인이 쓴 글만 확인할 수 있습니다.
								<button class="add-button" onclick="location.href='addEtc';"
									style="float: right;">글쓰기</button>
								<br>
								<%
									} else if (id == null) {
								%>
								게시판을 이용하려면 하려면 로그인 해야합니다.<br>
								<%
									}
								%>
								<br>
								<table class="table table-bordered" id="apply"
									style="margin: auto; align: center;">
									<thead>
										<tr style="border-top: 2px solid #ccc;">
											<th style="width: 7%;">번호</th>
											<th style="width: 56%;">제목</th>
											<th style="width: 10%;">글쓴이</th>
											<th style="width: 16%;">날짜</th>
											<th style="width: 10%;">조회</th>
										</tr>
									</thead>
									<tbody>


										<c:forEach items="${etcList}" var="etcList">
											<tr>
												<td>${etcList.etcBno}</td>
												<c:choose>
													<c:when
														test="${sessionScope.id == etcList.id || sessionScope.role eq '관리자'}">
														<td><a href="detailEtc?etcBno=${etcList.etcBno}">${etcList.title}</a></td>
													</c:when>
													<c:when test="${sessionScope.id != etcList.id}">
														<td>${etcList.title}</td>
													</c:when>
												</c:choose>
												<td>${etcList.writer}</td>
												<td><fmt:formatDate value="${etcList.addDate}"
														type="both" timeZone="Asia/Seoul"
														pattern="yyyy/MM/dd"></fmt:formatDate></td>
												<td>${etcList.count}</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
								<div id="paginationBox" class="pagination">
									<ul class="pagination">
										<c:if test="${pagination2.prev}">
											<li class="page-item"><a class="page-link" href="#"
												onClick="fn_prev2('${pagination2.page}', '${pagination2.range}', '${pagination2.rangeSize}')">Previous</a></li>
										</c:if>
										<c:forEach begin="${pagination2.startPage}"
											end="${pagination2.endPage}" var="idx">
											<li
												class="page-item <c:out value="${pagination2.page == idx ? 'active' : ''}"/> "><a
												class="page-link" href="#"
												onClick="fn_pagination2('${idx}', '${pagination2.range}', '${pagination2.rangeSize}')">
													${idx} </a></li>
										</c:forEach>
										<c:if test="${pagination2.next}">
											<li class="page-item"><a class="page-link" href="#"
												onClick="fn_next2('${pagination2.range}', '${pagination2.range}', '${pagination2.rangeSize}')">Next</a></li>
										</c:if>
									</ul>
								</div>
							</div>
							<div class="tab-pane" id="tab3">
								<br> <br>
								<p
									style="text-align: left; color: orange; font-weight: bold; font-size: 18px;">학사
									신청</p>
								<%
									if (id != null) {
								%>
								관리자 혹은 본인이 쓴 글만 확인할 수 있습니다.
								<button class="add-button" onclick="location.href='addDorm';"
									style="float: right;">글쓰기</button>
								<br>
								<%
									} else if (id == null) {
								%>
								게시판을 이용하려면 하려면 로그인 해야합니다.<br>
								<%
									}
								%>
								<br>
								<table class="table table-bordered" id="apply"
									style="margin: auto; align: center;">
									<thead>
										<tr style="border-top: 2px solid #ccc;">
											<th style="width: 7%;">번호</th>
											<th style="width: 56%;">제목</th>
											<th style="width: 10%;">글쓴이</th>
											<th style="width: 16%;">날짜</th>
											<th style="width: 10%;">조회</th>
										</tr>
									</thead>
									<tbody>


										<c:forEach items="${dormList}" var="dormList">
											<tr>
												<td>${dormList.dormBno}</td>
												<c:choose>
													<c:when
														test="${sessionScope.id == dormList.id || sessionScope.role eq '관리자'}">
														<td><a href="detailDorm?dormBno=${dormList.dormBno}">${dormList.title}</a></td>
													</c:when>
													<c:when test="${sessionScope.id != dormList.id}">
														<td>${dormList.title}</td>
													</c:when>
												</c:choose>
												<td>${dormList.writer}</td>
												<td><fmt:formatDate value="${dormList.addDate}"
														type="both" timeZone="Asia/Seoul"
														pattern="yyyy/MM/dd"></fmt:formatDate></td>
												<td>${dormList.count}</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
								<div id="paginationBox" class="pagination">
									<ul class="pagination">
										<c:if test="${pagination3.prev}">
											<li class="page-item"><a class="page-link" href="#"
												onClick="fn_prev3('${pagination3.page}', '${pagination3.range}', '${pagination3.rangeSize}')">Previous</a></li>
										</c:if>
										<c:forEach begin="${pagination3.startPage}"
											end="${pagination3.endPage}" var="idx">
											<li
												class="page-item <c:out value="${pagination3.page == idx ? 'active' : ''}"/> "><a
												class="page-link" href="#"
												onClick="fn_pagination3('${idx}', '${pagination3.range}', '${pagination3.rangeSize}')">
													${idx} </a></li>
										</c:forEach>
										<c:if test="${pagination3.next}">
											<li class="page-item"><a class="page-link" href="#"
												onClick="fn_next3('${pagination3.range}', '${pagination3.range}', '${pagination3.rangeSize}')">Next</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<br> <br>
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
	<script>
		//이전 버튼 이벤트
		function fn_prev1(page1, range1, rangeSize1) {
			var page1 = ((range1 - 2) * rangeSize1) + 1;
			var range1 = range1 - 1;
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page1=" + page1;
			url = url + "&range1=" + range1;
			location.href = url;
		}
		//페이지 번호 클릭
		function fn_pagination1(page1, range1, rangeSize1, searchType,
				keyword) {
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page1=" + page1;
			url = url + "&range1=" + range1;
			location.href = url;
		}

		//다음 버튼 이벤트
		function fn_next1(page1, range1, rangeSize1) {
			var page1 = parseInt((range1 * rangeSize1)) + 1;
			var range1 = parseInt(range1) + 1;
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page1=" + page1;
			url = url + "&range1=" + range1;
			location.href = url;

		}

		//이전 버튼 이벤트
		function fn_prev2(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
		//페이지 번호 클릭
		function fn_pagination2(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}

		//다음 버튼 이벤트
		function fn_next2(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;

		}
		//이전 버튼 이벤트
		function fn_prev3(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
		//페이지 번호 클릭
		function fn_pagination3(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}

		//다음 버튼 이벤트
		function fn_next3(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/apply";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;

		}
	</script>


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