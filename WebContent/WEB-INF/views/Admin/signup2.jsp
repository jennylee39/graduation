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
<br>
		<a href="main"><img src="img/ujlogo_min.jpg"
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
						aria-expanded="false" style="color:#FF6347;"> ${sessionScope.name }님 <span class="caret"></span>
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
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
	<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
	<br>
	<h2>회원가입</h2><br>
	<hr style="width: 70%;">
	<form class="form" id="adminInfo" method="post" name="adminInfo"
		onsubmit="return checkValue()">

		<table class="type" style="margin: auto; align: center;">
			<tr>
				<th id="title">아이디</th>
				<td>
					<!-- 아이디 중복체크 했는지 안했는지 --> <input class="input" type="text"
					name="admin_id" id="admin_id" maxlength="50" style="width: 40%;">
					<input class="idcheck" type="button" value="중복확인"
					onclick="return idCheck()" /> <span class="msg">아이디를
						확인해주십시오.</span>

				</td>
			</tr>

			<tr>
				<th id="title">비밀번호</th>
				<td><input class="input" type="password" name="admin_pwd"
					maxlength="50" style="width: 40%;">최소 하나의 숫자와 특수기호 포함</td>
			</tr>

			<tr>
				<th id="title">비밀번호 확인</th>
				<td><input class="input" type="password" name="passwordcheck"
					maxlength="50" style="width: 40%;"></td>
			</tr>

			<tr>
				<th id="title">이름</th>
				<td><input class="input" type="text" name="name" maxlength="50">
				</td>
			</tr>
			<tr>
				<th id="title">이메일</th>
				<td>
					<!--   <input class="input" type="email" name="mail" maxlength="100"> -->
					<div style="float: left;" onchange="checkmail()">
						<input class="box" type="text" name="email1"> @ <input
							class="box" type="text" name="email2"> <select
							name="email_select" class="box">
							<!-- 		<option value="" selected>선택하세요.</option> -->
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="1" selected>직접 입력</option>
						</select>
					</div>
				</td>
			</tr>

			<tr>
				<th id="title">휴대전화</th>
				<td><input class="input" type="text" name="phoneNum"
					style="width: 40%;" /> 숫자만 기입 ('-'금지)</td>
			</tr>
			<tr>
				<th id="title">주소</th>
				<td><input class="input" type="text" size="50" name="address" />
				</td>
			</tr>
			<tr>
				<th id="title">직책</th>
				<td><input name="role" value="관리자" readonly/> 수정이 불가합니다.</td>
			</tr>
		</table>
		<br> <br>
		<button type="submit" id="submit" class="add-button" name="adminInfo"
			onsubmit="return checkValue()">회원가입</button>
		<input type="reset" class="reset-button" value="취소">
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

	<!-- 애니메이션 참조 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

	<script type="text/javascript">


	$(".idcheck").click(function(){
	 
	 var query = {admin_id : $("#admin_id").val()};
	 var idcheckreg =/^[a-zA-Z0-9]{5,15}$/;
	 $.ajax({
	  url : "idCheck2",
	  type : "post",
	  data : query,
	  success : function(data) {
	  
	   if(data == 1) {
		   $(".msg").text("아이디가 중복됩니다.");
  		    $(".msg").attr("style", "color:#f00");
	  
	   } else if( data== 0 ){
		   if(idcheckreg.test($('#admin_id').val())) {
			   $(".msg").text("사용 가능");
		 	    $(".msg").attr("style", "color:#00f");
		 	   
	   		}else {
	   
			 	   alert("아이디는 영어와 숫자의 조합이어야합니다.\n 영어로 시작하는 아이디, 길이는 5~15자");
		  			$(".msg").text("사용 불가");
		  		    $(".msg").attr("style", "color:#f00");
	   		}
	 
	   }
	  }
	 });  // ajax 끝
	});	

		function checkValue() {

			var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/);
			var nameCheck = RegExp(/^[가-힣]{2,6}$/);
			var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			var phonNumCheck = RegExp(/^01[^0-9]$/);
			
			if (!document.adminInfo.user_id.value) {
				alert("아이디를 입력하세요.");
			
				return false;
				
			}
			if (!document.adminInfo.user_pwd.value || document.adminInfo.user_pwd.value ==passwdCheck){
				alert("비밀번호는 6~16자, 영어 소문자, 숫자 그리고 특수기호가 포함되어야합니다.");
				return false;
			}

			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if (document.adminInfo.user_pwd.value != document.adminInfo.passwordcheck.value) {
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
			if (!document.adminInfo.name.value || document.adminInfo.name.value == nameCheck) {
				alert("이름을 제대로 입력하세요.");
				return false;
			}
			//이메일 확인
			if (!document.adminInfo.email1.value) {
				alert("이메일을 입력하세요.");
				return false;
			}
			if (document.adminInfo.email_select.value == "1" && !document.adminInfo.email2.value) {

				alert("이메일 주소를 입력하세요.");

				document.adminInfo.email2.readOnly = false;
				document.adminInfo.email2.value = '';
				document.adminInfo.email2.focus();
				return false;
			}else if(document.adminInfo.email_select.value == "1" && document.adminInfo.email2.value) {
				document.adminInfo.email2.readOnly = false;
				/* document.userInfo.email2.value = '';
				document.userInfo.email2.focus();
 */			}else  if(document.adminInfo.email_select.value != "1" && document.adminInfo.email_select.value){
				//alert("이메일 주소를 선택하세요.");
				document.adminInfo.email2.readOnly = true;
				document.adminInfo.email2.value = document.adminInfo.email_select.value;
			//return false;	
			}
		
			if (!document.adminInfo.phoneNum.value || document.adminInfo.phoneNum.value== phonNumCheck) {
				alert("휴대폰번호는 '01'로 시작하는 숫자만 넣어주세요. \n '-'하이픈 금지");
				return false;
			}
			if (!document.adminInfo.address.value) {
				alert("주소를 입력하세요.");
				return false;
			}
			
			alert('회원가입이 완료되었습니다.!');

		}	
	
	</script>
</body>
</html>