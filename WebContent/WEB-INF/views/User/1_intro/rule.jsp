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
		<h1>운영규정</h1><br>
		<hr style="width: 70%;">
		<br>
		<div class="container-fluid" style="width: 70%;">
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable">
						<ul class="nav nav-tabs">
							<li class="nav-item active"><a class="nav-link active"
								href="#tab1" data-toggle="tab">학사 이용안내</a></li>
							<li class="nav-item"><a class="nav-link" href="#tab2"
								data-toggle="tab">생활수칙</a></li>
							<li class="nav-item"><a class="nav-link" href="#tab3"
								data-toggle="tab">일과 시간표</a></li>
							<li class="nav-item"><a class="nav-link" href="#tab4"
								data-toggle="tab">입사생 금지행위</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">

								<!-- <h3 style="font-color:orange;">학사 이용 안내</h3> -->
								<br> <br>

								<p
									style="text-align: left; color: orange; font-weight: bold; font-size: 18px;">학사
									이용 안내</p>
								<p style="text-align: left;">
									<br> 입사생은 학사 이용에 따른 다음의 입사생 수칙을 반드시 준수하여야 한다. <br> <br>
									· 입사 기간은 당해연도 1년으로 입사 등록일로부터 학년말까지이며, 계속 재사를 희망하는 학생은 별도 신청하여야
									한다.<br> ·기숙사는 일요일은 물론 방학 기간을 포함하여 연중 계속 운영한다. (단 추석, 설날 연휴
									등은 제외)<br> · 입사생 부담금 납부<br> -입사료 : 50,000원(입사 등록시 납부)<br>
									-보증금 : 200,000원(입사 등록시 납부 - 퇴사 시 환불)<br> -사용료 : 월
									200,000원~300,000원 (매월 선납)<br> -전기, 가스, 수도요금 : 사용량만큼 입사생(각
									생활관 1/2) 자부담<br> · 퇴사하는 학생에 대하여는 울진학사 설치 및 운영기준에 따라 사용료를
									부담하여야 한다.<br> · 입사생은 사감 등 학사 직원 등의 정당한 지시에 대하여 이행하여야 한다.<br>
									· 야간 귀사 시간은 24시 30분전까지 입사하여야 하며, 부득이한 경우에는 사전 사감의 승인을 받아야 한다.<br>
									· 면회는 수시(10:00~21:00)가능하나 사감과 사전 협의하고 휴게실을 이용하여야 한다.<br> ·
									외박 시에는 사전 사감의 승인을 받아야 한다.<br> · 입사생은 학사에서 시행하는 각종 행사, 모임,
									회의 등에 참석하여야 한다.<br> · 학사내 개인 및 공용 시설물에 대하여 선량한 관리자로서 의무를
									다하여야 한다.<br> · 건전하고 청결한 학사 환경조성을 위하여 질서 유지 및 청소 등에 힘써야 한다.<br>
									·학사에서는 입사 시 허용 지참물 이외에는 발열이나 화재 발생 우려가 있는 일체의 물품은 소지·사용할 수 없다.<br>
								</p>
							</div>
							<div class="tab-pane" id="tab2">
								<br> <br>
								<p
									style="text-align: left; color: orange; font-weight: bold; font-size: 18px;">생활
									수칙</p>
								<p style="text-align: left;">
									<br> 울진학사 생활 수칙 제1조(목적) 이 수칙은 울진학사 입사생(이하 “입사생”이라 한다)이 입사
									기간 중 울진학사(이하“학사”라 한다)내에서 생활 전반에 관하여 <br> 질서 있는 공동생활을 영위하고
									입사생 상호간의 인화와 친목을 도모하는 등 명랑한 면학 분위기를 조성하기 위하여 지켜야 할 사항을<br>
									규정함을 목적으로 한다.<br> <br> <br> 제2조(생활신조) 입사생은 울진학사의
									설립목적과 제반규정을 준수하고 향토인재양성의 참뜻을 이루기 위하여 스스로 노력하는 것을<br> 생활신조로
									하여야 한다.<br> <br> <br> 제3조(권리) 울진학사 입사생의 권리는 다음의
									각 호와 같다.<br> <br> 1. 학사시설물의 이용<br> 2. 자치회 가입 및
									활동<br> 3. 건전한 활동 목적의 동아리 모임 조직 및 가입 <br> <br>
									제4조(의무) 울진학사 입사생의 의무는 다음과 같다.<br> 1. 울진군 발전의 중추적 인재로 성장하기
									위한 면학 노력 등 학사의 설립 목적에 부응하는 사고 및 언행<br> 2. 울진군 학사 설치 및 운영에
									관한 규정에 의한 입사서약의 이행<br> 3. 입사생 수칙의 준수<br> 4. 사감 등
									학사직원의 정당한 지시에 대한 이행<br> 5. 운영규정 제16조 제1항에 의한 부담금의 납부<br>
									6. 학사(자치회 포함)에서 시행하는 각종 행사, 회의, 모임 등의 참석<br> 7. 자치회 가입 및
									자치 활동의 참여<br> 8. 학사 내 개인 및 공용 시설물의 선량한 이용 및 관리<br> 9.
									전기 및 수도, 가스등 공과금 납부 및 에너지의 절약<br> 10. 생활관 등 담당 구역에 대한 청소 및
									청결 유지<br> 11. 건전하고 명랑한 학습 환경을 위한 학사 내 질서 유지<br> <br>
									<br> 제5조(관련서류 제출)<br> 입사생은 학사의 운영이나 선발 기준요건 확인에 필요하여
									학사측이 건강 진단서(결핵, B형 간염 항목 반드시 포함),<br> 재학 증명서, 성적 증명서 등을
									요구할 때는 이에 응하여야 한다.<br> <br> <br> 제6조(생활관 배정)<br>
									생활관 배정은 학사장이 정하며 일단 배정한 방은 입사생들 상호간의 협의에 의하여 임의로 변경할 수 없다.<br>
									<br> <br> 제7조(입사 지참물)<br> 입사생은 입사 등록을 필하고 입사할
									때에는 생활에 필요한 개인 용품를 지참하여야 한다.<br> 단 불필요한 물품의 반입은 일체 금지하며,
									학사장의 주관적 판단에 응하여야 한다. <br> <br> <br> 제8조(지참물 제한)<br>
									① 입사생은 다음 각 호 물품의 지참을 금지한다.<br> 1. 개인용 가구(미니옷장, 화장대 등의
									장식품류)<br> 2. 전자제품(TV, 음향기기, 전자악기, 냉장고, 전기밥솥 등)<br> 3.
									전열기(전기장판, 전기담요, 전기난로, 전기방석, 전기쿠커, 온풍기, 다리미, 커피메이커, 커피포트, 토스터
									등), 휴대용 버너,<br> 기타 발열이나 화재 우려가 있는 품목(휘발유, 부탄가스, 양초 등)일체<br>
									4. 애완동물<br> <br> <br> ② 단, 다음 물품은 예외로 한다.<br>
									1. 컴퓨터 및 주변장치<br> 2. 개인전자기기(스마트폰, 스피커, MP 3 포함)<br>
									3. 헤어드라이기, 전기면도기, 가습기 등 <br> <br> 제9조(사물 관리)<br>
									① 귀중품은 사감에게 보관하여야 하며, 보관시키지 않은 현금 또는 물품의 손∙망실은 학사 측에서 책임을 지지
									아니한다.<br> ② 생활관 집기는 지정된 장소에서 사용하여야 한다.<br> <br>
									제10조(변상)<br> 입사생이 시설물 및 기물을 훼손하거나 분실하였을 때에는 고의 또는 과실을 불문하고
									이를 원상 복구하거나 변상하여야 한다.<br> <br> 제11조(일과시간)<br>
									입사생은 ⌜별표1⌟의 일과시간을 지켜야 한다.<br> <br> 제12조(식사)<br>
									입사생은 식사시간을 엄수하여야 하며 다음 각 호의 절차를 지켜야 한다.<br> 1. 식사는 식당에서만
									가능하고, 환자의 식사는 사전 사감의 승인을 받아 생활관에서 할 수 있다.<br> 2. 입사생이 아닌
									외부 학생에게는 식사를 제공하지 아니한다.<br> 3. 생수는 각 층 세탁실에 비치된 정수기를 사용하여
									음용한다.<br> <br> 제13조(외출 및 외박)<br> 외출 또는 외박하는 입사생은
									다음 각 호의 사항을 지켜야 한다.<br> 1. 외출, 외박 및 귀사 시에는 출입 전자 상황판에 의거
									출입상황을 정리하여야 하며, 외박 시에는 사전 사감의 승인을 받아야 한다.<br> 2. 외박은 부득이한
									사유가 있을 때에 한하여 승인한다.<br> 3. 외출, 외박 시 불미스러운 사고가 발생하였거나 귀사
									시간을 위반하였을 때에는 사감의 판단 하에 일정기간 외박을 금지할 수 있다.<br> 4. 외박횟수는 학기
									중 월평균 7회를 넘지 아니한다. (연휴, 시험기간 1주일, 주말 제외)<br> 5.당일 외박신청은
									22:00 까지 신청하도록 한다.<br> <br> 제14조(면회) 입사생은 다음 각 호의 면회
									절차를 지켜야 한다.<br> 1. 면회자는 사전에 사감의 승인을 받아 면회하여야 한다.<br>
									2. 면회시간은 10:00 ~ 21:00까지로 한다.<br> 3. 면회는 휴게실에서만 할 수 있으며,
									면회자는 입사생의 생활관에 들어갈 수 없다. 다만, 사감의 승인을 받은 경우에는 그렇지 아니하다.<br>
									4. 외부인의 학사 내 숙박은 금지한다.<br> <br> 제15조(면회의 제한)<br>
									다음 각 호의 경우에는 면회를 제한할 수 있다.<br> 1. 학사 내에 전염성 질병을 전염시킬 우려가
									있을 때<br> 2. 풍기 문란의 우려가 있을 때<br> 3. 기타 사감이 면회자의 출입이
									부적당하다고 판단될 때 <br> <br> 제16조(통신) 학사내의 통신은 다음 각 호와 같다.<br>
									1. 인터넷은 생활관에 설치된 무선인터넷 도는 랜선을 사용하고, 별도의 통신망을 설치할 수 없다.<br>
									2. 우편물(택배물품, 등기우편물 포함)은 휴게실(무인택배함)에서 수령한다.(원칙적으로 학사에서 착불 우편물은
									수령하지 아니한다) <br> <br> 제17조(상담) 입사생은 언제나 사감에게 상담을 요청할 수
									있으며, 사감은 입사생의 상담요청이 있을 때에는 이를 수락하여야 한다.<br> <br>
									제18조(청소) 입사생은 각자의 생활관과 자치회에서 정한 학사 내·외의 청소 담당 구역에 대한 정리정돈과
									청소책임을 지며 다음 각 호의 사항을 지켜야 한다.<br> 1. 입사생은 각자의 생활관은 물론 공동구역을
									깨끗하게 청소하고 정리정돈 해야 한다.<br> 2. 생활관 및 공동구역에 대한 청소 및 정리정돈상태의
									정기점검은 매주 화요일 오전 10시 30분 ~ 12시까지 실시하고, 사감은 이에 대한 시정 지시를 할 수 있으며,
									필요시 확인 점검할 수 있다. <br> 3. 쾌적한 환경과 학사 시설물의 유지관리를 위해 분기별 1회
									학사에 대해 일제히 대청소를 실시한다.<br> 4. 분리수거는 투명봉투에 종류별로 구분하여, 1층
									분리수거함에 넣는다.<br> 5. 쓰레기는 종량제 봉투를 각자 준비하여, 1층 종량제 쓰레기통에 넣는다.<br>
									6. 세탁은 각층 세탁실에 구비된 세탁기(건조기 포함)를 사용하고, 24시 이전에 사용을 종료한다. <br>
									7. 각층 세탁실에 구비된 무선 청소기를 사용한 후, 제자리에 갖다두고 충전한다.<br> <br>
									제19조(안전점검)<br> 화재예방을 위한 안전점검과 건전한 생활지도 면학 분위기 조성을 위해 필요시
									생활관을 수시로 점검할 수 있다.<br> <br> 제20조(금지행위)<br> ①
									입사생은 학사 내에서 ⌜별표2⌟의 금지 행위를 할 수 없다.<br> ② 입사생은 제1항에 따른 금지
									행위를 하였을 때에 사감은 이에 해당하는 벌점을 부과하고, 그 명단을 공개할 수 있다.<br> <br>
									제21조(징계)<br> ① 제20조에 따른 금지 행위 위반에 의한 징계의 종류와 양정 기준은 다음 각
									호와 같다.<br> 1. 경고처분 : 벌점이 10점 이상 일 때<br> 2. 퇴사처분 : 벌점이
									15점 이상 일 때<br> <br> ② 제1항의 규정에 의한 벌점의 계산은 1년 단위로 하고,
									다음해 입사생 선발 시 벌점만큼 감점을 적용한다.<br> ③ 다음 각 호의 1에 해당하는 사람은 가점을
									부여할 수 있다.<br> 1. 자치회장 : 3점<br> 2. 부회장, 총무, 층장 : 2점<br>
									3. 농어촌 봉사활동, 학사 내ㆍ외 봉사활동, 기타 학사장이 인정하는 선행 실적이 있는 경우 : 2점(단,
									외부활동은 증빙 서류 제출에 한함)<br> ④ 제1항에 해당하는 경우 학사 장은 그 내용을 당해 입사생의
									부모 등 친권자에게 통보하여 개별 지도하게 할 수 있다.<br> <br> 제22조(퇴사)<br>
									① 학사의 퇴사 기준은 다음 각 호의 1과 같다.<br> 1. 본인이 퇴사를 희망하였을 때<br>
									2. 휴학하였거나 정학ㆍ퇴학 처분을 받았을 때<br> 3. 제21조 제1항 2호의 규정에 해당될 때(벌점
									15점 이상일 때)<br> 4. 전염병으로 인한 장기 요양이 필요할 때<br> 5. 불온사상의
									선전ㆍ유포를 목적으로 하는 집회, 토론, 연설 등의 행위를 하였을 때<br> 6. 학사 운영에 부당한
									요구 또는 사감이나 학사직원의 정당한 지시에 폭언ㆍ폭행 등으로 반항하는 등 학사운영에 현저하게 저해하는 행위를
									하였을 때<br> 7. 기타 학사 내ㆍ외적으로 물의를 일으켜 계속 재사하는 것이 타 입사생과 학사운영에
									악영향을 미친다고 판단되었을 때<br> <br> ② 학사장은 제1항 제3호 내지 제7호에 따라
									퇴사를 명할 때에는 퇴사를 결정하기에 앞서 당해 입사생의 의견을 듣거나 진술서 등을 제출하게 할 수 있다.<br>
									<br> 제23조(퇴사신청)<br> 제22조 제1항 제1호 및 제2호에 따라 퇴사하고자 하는
									입사생은 울진학사 설치 및 운영규정 별지 제6호 서식에 퇴사 7일전까지 학사장에게 퇴사 신고서를 제출하여야 한다.<br>
									<br> 제24조(자치회 구성, 운영)<br> ① 입사생들의 자치활동을 위하여 자치회를
									조직ㆍ운영하게 할 수 있다.<br> ② 자치회는 학사의 제 규정에 저촉되지 아니하는 범위 내에서 회칙을
									정하여 운영할 수 있다.<br> ③ 자치회의 회칙제정과 회장, 부회장(남, 여), 총무 및 각층장의
									선임은 입사생의 총의로 결정 하고, 이를 학사장이 임면 한다.<br> ④ 회장과 층장은 각층의 입사생을
									대표하여 학사장의 지시 사항을 입사생들에게 전달하고 애로사항을 파악하여 건의 할 수 있다.<br> <br>
									제25조(자치활동의 범위)<br> ① 입사생의 자치 활동은 다음 각 호의 범위 내에서 보장된다.<br>
									1. 입사생 상호간 화합 및 친목의 도모<br> 2. 건전한 취미활동 및 체력단련 행사<br>
									3. 시정 및 학사의 발전을 위한 활동<br> 4. 농어촌 봉사활동 등 대내ㆍ외적 봉사활동<br>
									5. 학습ㆍ교양강좌 및 토론회 등의 개최<br> 6. 교양지 및 사생회지 발간<br> 7. 학사
									환경개선 및 청결유지를 위한 활동<br> <br> ② 학사내의 생활은 입사생 자치제를 원칙으로
									하되, 수칙으로 정하는 범위 이내이어야 하며, 학사의 시설이나 운영에 부당한 건의 또는 요구를 할 수 없다.<br>
									③ 건설적인 의견이나 건의사항은 학사장에게 제출하여야 한다. <br> <br>
									제26조(보건관리)<br> ① 학사장은 학사내에 구급 상비약품을 비치하여야 하며 입사생의 환경 및
									보건위생에 특별히 유의하여야 한다.<br> ② 입사생의 부상 또는 질병이 발생한 때에는 즉시 의사의
									진단을 받아 필요한 조치를 취하고 보호자에게 통지하여야 한다.<br> <br> 이 경우 진료비는
									입사생의 부담으로 한다.<br> <br> 제27조(전염병 환자의 관리)<br> 전염병
									환자가 발생하였을 때에는 다음 각 호와 같이 조치하여야 한다.<br> 1. 즉각 격리 수용하고 의사의
									지시에 따른다.<br> 2. 환자의 보호자에게 통지하여 보호를 받도록 한다.<br> 3.
									장기치료나 요양이 필요한 경우 퇴사 시킨다.<br> <br> 제28조(방화관리)<br>
									① 입사생은 항상 학사내의 화재예방에 유의하여야 하며 각층의 층장은 방화 책임자가 된다.<br> ②
									입사생은 항시 소화기의 위치를 파악 관리하고 지정된 장소 이외 전열기 사용을 금지하여야 한다.<br> <br>
									<br> 부 칙 <br> 이 수칙은 (재)울진군장학재단 이사회의 의결일로부터 시행한다. <br>
								</p>
							</div>
							<div class="tab-pane" id="tab3">
								<br> <br>
								<p
									style="text-align: left; color: orange; font-weight: bold; font-size: 18px;">일과
									시간표</p>
								<br>
								<table class="table table-bordered table-striped" id="rule"
									style="margin: auto; align: center;">
									<thead>
										<tr style="border-top: 2px solid #ccc;">
											<th>구분</th>
											<th>평일</th>
											<th>공휴일</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>아침 식사</th>
											<td>06:30 ~ 08:30</td>
											<td>08:00 ~ 10:00</td>
											<td rowspan="2">06:30 ~ 24:00<br>식당 자유롭게 이용가능(조리
												불가능)
											</td>
										</tr>
										<tr>
											<th>저녁 식사</th>
											<td>18:00 ~ 20:00</td>
											<td>18:00 ~ 20:00</td>

										</tr>
										<tr>
											<th>귀 사</th>
											<td>24:30 까지</td>
											<td>24:30 까지</td>
											<td>1:00 까지 지각<br>(사무실 경유)
											</td>
										</tr>
										<tr>
											<th>외부 출입금지</th>
											<td>24:30 ~ 05:30</td>
											<td>24:30 ~ 05:30</td>
											<td>학사 내 이동 금지</td>
										</tr>
										<tr>
											<th>면회시간</th>
											<td>10:00 ~ 21:00</td>
											<td>10:00 ~ 21:00</td>
											<td>휴게실에서만 가능</td>
										</tr>
									</tbody>
								</table>

							</div>
							<div class="tab-pane" id="tab4">
								<br> <br>
								<p
									style="text-align: left; color: orange; font-weight: bold; font-size: 18px;">입사생
									금지행위</p>
								<br>
								<c:choose>
									<c:when
										test="${sessionScope.role eq '관리자'}">
										<input type="button"class="add-button" style="float:right;"
										onclick="location.href='addRule';" value="수정">
									</c:when>
								</c:choose>
								<table class="table table-bordered" id="rule"
									style="margin: auto; align: center;">
									<thead>
										<tr style="border-top: 2px solid #ccc;">
											<th>연번</th>
											<th>금지행위</th>
											<th>벌점</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ruleList}" var="ruleList">
											<tr>
												<td>${ruleList.id}</td>
												<td>${ruleList.content}</td>
												<td>${ruleList.minus}</td>
												<td>${ruleList.refer}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
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