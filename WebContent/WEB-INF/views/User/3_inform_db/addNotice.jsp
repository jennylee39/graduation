<%@page
	import="org.apache.tomcat.util.net.openssl.ciphers.Authentication"%>
<%@page import="kr.ac.skuniv.graduation.dao.UserMapper"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="kr.ac.skuniv.graduation.service.UserServiceImpl"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="kr.ac.skuniv.graduation.dto.User"%>
<%@page import="kr.ac.skuniv.graduation.service.UserService"%>
<%@page import="kr.ac.skuniv.graduation.dto.Out"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<h2>공지사항</h2>
	<h4>글쓰기</h4><br>
	<hr style="width: 60%;">
	<form class="form" id="notice" method="post" name="notice"
		onsubmit="return checkValue()" action="addNotice"
		enctype="multipart/form-data">

		<table class="type" style="margin: auto; align: center; width: 70%;">
			<tr>
				<th id="title">작성자</th>
				<td><input type="text" name="writer"
					value="${sessionScope.name}" readonly> 
					<input type="hidden" name="id "value="${sessionScope.id}" /></td>
			</tr>

			<tr>
				<th id="title">제목</th>
				<td><input type="text" name="title" style="width: 100%;" /></td>
			</tr>
			<tr>
				<th id="title">내용</th>
				<td><textarea class="input" name="text" id="text"
						style="width: 100%; height: 30em; border: 1px solid #eee;"></textarea>
				</td>
			</tr>
			<tr>
				<th id="title">링크 #1</th>
				<td><input type="text" name="rink1" style="width: 100%;" /></td>
				<!-- 멀티파일하고싶으면 이거 추가 multiple="multiple" -->
			</tr>
			<tr>
				<th id="title">링크 #2</th>
				<td><input type="text" name="rink2" style="width: 100%;"/></td>
			</tr>
			<tr>
				<th id="title">파일 선택 #1</th>
				<td><input type="file" name="file" id="upload" />
					<div id='preview'>
						<!-- 미리보기 공간 -->
					</div></td>
				<!-- 멀티파일하고싶으면 이거 추가 multiple="multiple" -->
			</tr>
			<tr>
				<th id="title">파일 선택 #2</th>
				<td><input type="file" name="file2" id="upload1" />
					<div id='preview1'>
						<!-- 미리보기 공간 -->
					</div></td>
			</tr>
		</table>
		<br> <br>
		<button type="submit" class="add-button"
			onsubmit="return checkValue()">작성하기</button>
		<input type="button" class="add-button"
			onclick="location.href='notice';" value="취소">
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
			<script type="text/javascript">
	
		function checkValue() {
			var rink1Check = RegExp(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w_\.-]*)*\/?$/);
			var rink2Check = RegExp(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w_\.-]*)*\/?$/);
			
			
			if (!document.notice.title.value) {
				alert("제목을 입력하세요.");
				return false;
			}

			if (!document.notice.text.value) {
				alert("내용을 입력하세요.");
				return false;
			}else {
				var str = $('#text').val();

				str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

				$('#text').val(str);
				
				return true;
			}
			
			if(document.notice.rink1.value==rink1Check){
				alert("링크 #1을 제대로 입력하세요.");
				return false;
			}
			if(document.notice.rink2.value==rink2Check){
				alert("링크 #2를 제대로 입력하세요.");
				return false;
			}
			
			document.notice.submit();

			alert('공지사항 추가 완료');

		};
	</script>
	<script>
    var upload = document.querySelector('#upload');
    var preview = document.querySelector('#preview');
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var image = document.createElement('img');
 
        /* FileReader 객체 생성 */
        var reader = new FileReader();
 
        /* reader 시작시 함수 구현 */
        reader.onload = (function (aImg) {
            console.log(1);
 
            return function (e) {
                console.log(3);
                /* base64 인코딩 된 스트링 데이터 */
                aImg.src = e.target.result
            }
        })(image)
 
        if(get_file){
            /* 
                get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                onload 에 설정했던 return 으로 넘어간다.
                이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
            */
            reader.readAsDataURL(get_file[0]);
            console.log(2);
        }
 
        preview.appendChild(image);
    })
		var upload1 = document.querySelector('#upload1');
		var preview1 = document.querySelector('#preview1');

		upload1.addEventListener('change', function(e) {
			var get_file = e.target.files;

			var image = document.createElement('img');

			/* FileReader 객체 생성 */
			var reader = new FileReader();

			/* reader 시작시 함수 구현 */
			reader.onload = (function(aImg) {
				console.log(1);

				return function(e) {
					console.log(3);
					/* base64 인코딩 된 스트링 데이터 */
					aImg.src = e.target.result;
				}
			})(image)

			if (get_file) {
				/* 
				    get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
				    onload 에 설정했던 return 으로 넘어간다.
				    이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
				 */
				reader.readAsDataURL(get_file[0]);
				console.log(2);
			}

			preview1.appendChild(image);
		})
		</script>



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