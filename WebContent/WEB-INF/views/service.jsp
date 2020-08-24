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
		<h1>서비스 이용약관</h1>
		<br>
		<hr style="width: 70%;">
		<br>
		
		<div style="border:1px solid #ccc; text-align:left; width:75%;">
		<br>
<p style="margin-left:15px; margin-right:15px; font-size:14px;">
<br>
[제1장 총칙]<br>
제1조(목적)<br><br>
   
이 약관은 [울진학사]*가(이) 운영하는 인터넷 사이트의 회원가입과 서비스 이용에 대한 이용자의 권리, 의무와 책임사항을 규정함을 목적으로 합니다.<br><br><br>
 
 
제2조(정의)<br><br>
   
① '[울진학사]'이란 회사가 재화나 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장과 사이트를 운영하는 사업자의 의미로도 사용합니다.  <br>
② '이용자'란 '[울진학사]'에 접속하거나 방문하여 이 약관에 따라 '[울진학사]'가 제공하는 서비스를 받는 회원과 비회원을 말합니다.  <br>
③ '회원'이라 함은 '[울진학사]'에 개인정보를 제공하여 회원등록을 한 자로서, '[울진학사]'의 정보를 지속적으로 제공받으며, '[울진학사]'가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.  <br>
④ '비회원'이라 함은 회원에 가입하지 않고 '[울진학사]'이 제공하는 서비스를 이용하는 자를 말합니다.<br><br><br>


제3조 (약관의 명시와 개정)<br><br>
   
① '[울진학사]'은 이 약관의 내용과 상호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이트의 초기 서비스화면에 게시합니다. <br>
② '[울진학사]'은 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에 관한 법률, 방문판매등에 관한 법률, 소비자보호법 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.  <br>
③ '[울진학사]'이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 사이트의 초기화 면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.  <br>
④ '[울진학사]'이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 '[울진학사]'에 송신하여 '[울진학사]'의 동의를 받은 경우에는 개정약관조항이 적용됩니다.  <br>
⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자 보호지침 및 관계 법령 또는 상관례에 따릅니다.<br><br><br>


제4조(서비스의 제공 및 변경)<br><br>
   
① '[울진학사]'는 다음과 같은 서비스를 제공합니다.<br>
재화 또는 상품에 대한 정보 제공 및 구매계약의 체결<br>
구매계약이 체결된 재화 또는 상품의 배송<br>
기타 [울진학사]가 정하는 서비스  <br>
② '[울진학사]'은 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·상품의 내용을 변경할 수 있습니다.  <br>
③ '[울진학사]'가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 '[울진학사]'은 이로 인하여 이용자가 입은 손해를 배상하지 아니합니다. 단, '[울진학사]'에게 고의 또는 과실이 있는 경우에는 그러하지 아니합니다.<br><br><br>


제5조(서비스의 중단)<br><br>
   
① '[울진학사]'은 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br> 
② 제1항에 의한 서비스 중단의 경우에는 '[울진학사]'은 제8조에 정한 방법으로 이용자 에게 통지합니다.<br>
③ '[울진학사]'는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상하지 아니합니다. 단 '[울진학사]'에게 고의 또는 과실이 있는 경우에는 그러하지 아니합니다.<br><br><br>


[제2장 회원가입계약]<br>
제6조(회원가입)<br><br>
   
① '[울진학사]' 이용자는 '[울진학사]'가 정한 가입 양식에 따라 이 약관에 동의한다는 의사 표시를 한 후 회원정보를 기입함으로서 회원가입을 신청합니다.<br>
② '[울진학사]'은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.<br>
가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한적이 있는 경우, 다만 제7조 제3항에 의한 회원자 격 상실후 3년이 경과한 자로서 사이트의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.<br>
등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
기타 회원으로 등록하는 것이 [울진학사]의 기술상 현저히 지장이 있다고 판단되는 경우  <br>
③ 회원가입계약의 성립시기는 '[울진학사]'의 가입신청거절 통보가 없는 이상 이용자가 회원강입 신청절차를 완료한 때로 합니다. <br>
④ 회원은 제15조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 '[울진학사]'에 대하여 그 변경사항을 알려야 합니다.<br><br><br>

  
제7조(회원 탈퇴 및 자격 상실 등) <br><br>
   
① 회원은 '[울진학사]'에게 언제든지 탈퇴를 요청할 수 있으며 [울진학사]은 즉시 회원 탈퇴를 처리합니다.<br>
② 회원이 다음 각 호의 사유에 해당하는 경우, '[울진학사]'은 회원자격을 제한 및 정지시킬 수 있습니다.<br>
가입 신청시에 허위 내용을 등록한 경우<br>
'[울진학사]' 을 이용하여 구입한 재화또는상품 등의 대금, 기타 '[울진학사]' 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>
다른 사람의 '[울진학사]' 이용을 방해하거나 그 정보를 도용하는 등 전자거래 질서 를 위협하는 경우<br>
'[울진학사]' 을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우  <br>
③ '[울진학사]' 회원 자격을 제한,정지 시킨 후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 '[울진학사]'은회원자격을 상실시킬 수 있습니다. <br>
④ '[울진학사]'가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.<br><br><br>

 
제8조(회원에 대한 통지)<br><br>
   
① '[울진학사]'가 회원에 대한 통지를 하는 경우, 회원이 '[울진학사]'에게 제출한 전자우편 주소로 할 수 있습니다.<br> 
② '[울진학사]'는 불특정다수 회원에 대한 통지의 경우 1주일이상 '[울진학사]' 게시판에게시함으로서 개별 통지에 갈음할 수 있습니다.<br><br><br>

               
[제5장 [울진학사]와 이용자의 의무사항]<br>
제9조(개인정보보호)<br><br>
   
① '[울진학사]'는 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.<br>
성명<br>
주소<br>
전화번호<br><br>
 
② '[울진학사]' 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 이하 각 호의 경우를 제외하고는 반드시 당해 이용자의 동의를 받습니다.<br>
법률에 특별한 규정이 있는 경우<br>
전자거래 계약의 이행을 위해서 필요한 경우<br>
재화등의 제공에 따른 요금정산을 위하여 필요한 경우<br><br>
 
③ 제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공 할 수 없으며, 이에 대한 모든 책임은 '[울진학사]'가 책임을 집니다.<br>
다만, 다음의 경우에는 예외로 합니다.<br>
배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소 ,전화번호)를 알려주는 경우<br>
통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정개인을 식별할 수 없는 형태로 제공하는 경우<br><br>
 
④ '[울진학사]'가 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보 처리책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공+받는자, 제공목적 및 제공할 정보 의 내용)등 정보통신망 이용 촉진 등에 관한 법률 제16조 제3항이 규정 한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br> 
⑤ 이용자는 언제든지 '[울진학사]'가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '[울진학사]'는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 '[울진학사]'가 그 오류를 정정 할 때까지 당해 개인정보를 이용하지 않습니다. <br>
⑥ '[울진학사]'는 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출,변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다. <br> 
⑦ '[울진학사]' 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br><br><br>

 
제10조(회사의 의무)<br><br>
   
① '[울진학사]은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.  <br>
② '[울진학사]'은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.  <br>
③ '[울진학사]'이 상품이나 용역에 대하여 「표시·광고의공정화에관한법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.  <br>
④ '[울진학사]'은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br><br><br>

 
제11조( 회원의 ID 및 비밀번호에 대한 의무)<br><br>
   
① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다. <br> 
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.  <br>
③ ID 및 비밀번호의 관리상 불충분, 사용자의 과실, 제3자의 사용 등에 의한 손해의 책임은 회원이 집니다.<br> 
④   회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 [울진학사]에게 통보하고 '[울진학사]'의 안내가 있는 경우에는 그에 따라 야 합니다. 제18조(이용자의 의무) 이용자는 다음 행위를 하여서는 됩니다.<br><br><br>


제12조(이용자의 의무)<br><br>
   
이용자는 다음 행위를 하여서는 안됩니다.<br>
1. 신청 또는 변경시 허위내용의 등록<br>
2. '[울진학사]'에 게시된 정보의 변경<br>
3. '[울진학사]'이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시<br>
4. '[울진학사]' 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>
5. '[울진학사]' 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
6. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 사이트에 공개 또는 게시하는 행위<br><br><br>


[제6장 기타]<br>

 
제13조(연결'사이트'과 피연결'사이트' 간의 관계)<br><br>
   
① '[울진학사]'은 연결사이트가 독자적으로 제공하는 상품 또는 상품에 의하여 이용자와행하는 거래에 대하서는 보증 책임을 지지 않습니다.<br><br><br>


제14조(저작권의 귀속 및 이용제한)<br><br>
   
① '[울진학사]' 작성한 저작물에 대한 저작권 기타 지적재산권은 [울진학사]에게 귀속합니다.<br>  
② 이용자는 '[울진학사]'를 이용함으로써 얻은 정보를 [울진학사]의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br><br><br>

 
제15조(분쟁해결)<br><br>
   
① '[울진학사]'은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.  <br>
② '[울진학사]'은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.  <br>
③ '[울진학사]'과 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.<br><br><br>

 
제16조(재판권 및 준거법)<br><br>
   
① '[울진학사]'과 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.  <br>
② '[울진학사]'과 이용자간에 제기된 전자거래 소송에는 대한민국 법을 적용합니다. <br><br><br> 
   
  
제17조(약관외 준칙)<br><br>
  
당 약관에 명시되지 않은 사항은 전자거래 기본법, 전자서명법, 방문판매법 및 기타 관련법령의 규정에 의합니다.<br>
(시행일) 위 약관은 2017년 6월 1일부터 시행합니다.<br><br><br>
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