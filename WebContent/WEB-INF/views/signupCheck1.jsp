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
	<h2>회원가입 약관</h2><br>
	<hr style="width: 70%;">
<form name="signupCheck" onsubmit="return checkForm()" action="signup">	
	<p style="color:red; font-size:12px;">회원가입 약관 및 개인정보 처리방침 안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</p>
	<br><p style="font-size:14px; font-weight:bold;">회원가입 약관</p>
	<textarea style="width:60%; height:13em;">
[제1장 총칙]


제1조(목적)
    
이 약관은 [울진학사]*가(이) 운영하는 인터넷 사이트의 회원가입과 서비스 이용에 대한 이용자의 권리, 의무와 책임사항을 규정함을 목적으로 합니다. 
 
 
제2조(정의)
    
① '[울진학사]'이란 회사가 재화나 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장과 사이트를 운영하는 사업자의 의미로도 사용합니다.   
② '이용자'란 '[울진학사]'에 접속하거나 방문하여 이 약관에 따라 '[울진학사]'가 제공하는 서비스를 받는 회원과 비회원을 말합니다.   
③ '회원'이라 함은 '[울진학사]'에 개인정보를 제공하여 회원등록을 한 자로서, '[울진학사]'의 정보를 지속적으로 제공받으며, '[울진학사]'가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.   
④ '비회원'이라 함은 회원에 가입하지 않고 '[울진학사]'이 제공하는 서비스를 이용하는 자를 말합니다  


제3조 (약관의 명시와 개정)
    
① '[울진학사]'은 이 약관의 내용과 상호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이트의 초기 서비스화면에 게시합니다.  
② '[울진학사]'은 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에 관한 법률, 방문판매등에 관한 법률, 소비자보호법 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.   
③ '[울진학사]'이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 사이트의 초기화 면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.   
④ '[울진학사]'이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 '[울진학사]'에 송신하여 '[울진학사]'의 동의를 받은 경우에는 개정약관조항이 적용됩니다.   
⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자 보호지침 및 관계 법령 또는 상관례에 따릅니다. 


제4조(서비스의 제공 및 변경)
    
① '[울진학사]'는 다음과 같은 서비스를 제공합니다. 
재화 또는 상품에 대한 정보 제공 및 구매계약의 체결 
구매계약이 체결된 재화 또는 상품의 배송 
기타 [울진학사]가 정하는 서비스   
② '[울진학사]'은 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·상품의 내용을 변경할 수 있습니다.   
③ '[울진학사]'가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 '[울진학사]'은 이로 인하여 이용자가 입은 손해를 배상하지 아니합니다. 단, '[울진학사]'에게 고의 또는 과실이 있는 경우에는 그러하지 아니합니다.


제5조(서비스의 중단)
    
① '[울진학사]'은 컴퓨터 등 정보통신설비의 보수점검,교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다  
② 제1항에 의한 서비스 중단의 경우에는 '[울진학사]'은 제8조에 정한 방법으로 이용자 에게 통지합니다  
③ '[울진학사]'는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상하지 아니합니다. 단 '[울진학사]'에게 고의 또는 과실이 있는 경우에는 그러하지 아니합니다. 


[제2장 회원가입계약]
                
  
제6조(회원가입)
    
① '[울진학사]' 이용자는 '[울진학사]'가 정한 가입 양식에 따라 이 약관에 동의한다는 의사 표시를 한 후 회원정보를 기입함으로서 회원가입을 신청합니다  
② '[울진학사]'은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다. 
가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한적이 있는 경우, 다만 제7조 제3항에 의한 회원자 격 상실후 3년이 경과한 자로서 사이트의 회원 재가입 승낙을 얻은 경우에는 예외로 한다. 
등록 내용에 허위, 기재누락, 오기가 있는 경우 
기타 회원으로 등록하는 것이 [울진학사]의 기술상 현저히 지장이 있다고 판단되는 경우   
③ 회원가입계약의 성립시기는 '[울진학사]'의 가입신청거절 통보가 없는 이상 이용자가 회원강입 신청절차를 완료한 때로 합니다.  
④ 회원은 제15조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 '[울진학사]'에 대하여 그 변경사항을 알려야 합니다

   
제7조(회원 탈퇴 및 자격 상실 등)  
    
① 회원은 '[울진학사]'에게 언제든지 탈퇴를 요청할 수 있으며 [울진학사]은 즉시 회원 탈퇴를 처리합니다  
② 회원이 다음 각 호의 사유에 해당하는 경우, '[울진학사]'은 회원자격을 제한 및 정지시킬 수 있습니다
가입 신청시에 허위 내용을 등록한 경우 
'[울진학사]' 을 이용하여 구입한 재화또는상품 등의 대금, 기타 '[울진학사]' 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 
다른 사람의 '[울진학사]' 이용을 방해하거나 그 정보를 도용하는 등 전자거래 질서 를 위협하는 경우 
'[울진학사]' 을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우   
③ '[울진학사]' 회원 자격을 제한,정지 시킨 후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 '[울진학사]'은회원자격을 상실시킬 수 있습니다.  
④ '[울진학사]'가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.

 
제8조(회원에 대한 통지)
    
① '[울진학사]'가 회원에 대한 통지를 하는 경우, 회원이 '[울진학사]'에게 제출한 전자우편 주소로 할 수 있습니다.  
② '[울진학사]'는 불특정다수 회원에 대한 통지의 경우 1주일이상 '[울진학사]' 게시판에게시함으로서 개별 통지에 갈음할 수 있습니다.

                
[제5장 [울진학사]와 이용자의 의무사항]

 
제9조(개인정보보호)
    
① '[울진학사]'는 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. 
성명 
주소 
전화번호 
  
② '[울진학사]' 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 이하 각 호의 경우를 제외하고는 반드시 당해 이용자의 동의를 받습니다. 
법률에 특별한 규정이 있는 경우 
전자거래 계약의 이행을 위해서 필요한 경우 
재화등의 제공에 따른 요금정산을 위하여 필요한 경우 
  
③ 제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공 할 수 없으며, 이에 대한 모든 책임은 '[울진학사]'가 책임을 집니다.
다만, 다음의 경우에는 예외로 합니다. 
배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소 ,전화번호)를 알려주는 경우 
통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정개인을 식별할 수 없는 형태로 제공하는 경우 
  
④ '[울진학사]'가 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보 처리책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공+받는자, 제공목적 및 제공할 정보 의 내용)등 정보통신망 이용 촉진 등에 관한 법률 제16조 제3항이 규정 한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.  
⑤ 이용자는 언제든지 '[울진학사]'가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '[울진학사]'는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 '[울진학사]'가 그 오류를 정정 할 때까지 당해 개인정보를 이용하지 않습니다.  
⑥ '[울진학사]'는 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출,변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.   
⑦ '[울진학사]' 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.

 
제10조(회사의 의무)
    
① '[울진학사]은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.   
② '[울진학사]'은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.   
③ '[울진학사]'이 상품이나 용역에 대하여 「표시·광고의공정화에관한법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.   
④ '[울진학사]'은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. 

 
제11조( 회원의 ID 및 비밀번호에 대한 의무)
    
① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.   
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.   
③ ID 및 비밀번호의 관리상 불충분, 사용자의 과실, 제3자의 사용 등에 의한 손해의 책임은 회원이 집니다.  
④   회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 [울진학사]에게 통보하고 '[울진학사]'의 안내가 있는 경우에는 그에 따라 야 합니다. 제18조(이용자의 의무) 이용자는 다음 행위를 하여서는 됩니다. 


제12조(이용자의 의무)
    
이용자는 다음 행위를 하여서는 안됩니다. 
1. 신청 또는 변경시 허위내용의 등록 
2. '[울진학사]'에 게시된 정보의 변경 
3. '[울진학사]'이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시 
4. '[울진학사]' 기타 제3자의 저작권 등 지적재산권에 대한 침해 
5. '[울진학사]' 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 
6. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 사이트에 공개 또는 게시하는 행위 


[제6장 기타]

  
제13조(연결'사이트'과 피연결'사이트' 간의 관계)
    
① '[울진학사]'은 연결사이트가 독자적으로 제공하는 상품 또는 상품에 의하여 이용자와행하는 거래에 대하서는 보증 책임을 지지 않습니다.


제14조(저작권의 귀속 및 이용제한)
    
① '[울진학사]' 작성한 저작물에 대한 저작권 기타 지적재산권은 [울진학사]에게 귀속합니다.   
② 이용자는 '[울진학사]'를 이용함으로써 얻은 정보를 [울진학사]의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다..

  
제15조(분쟁해결)
    
① '[울진학사]'은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.   
② '[울진학사]'은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.   
③ '[울진학사]'과 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다. 

  
제16조(재판권 및 준거법)
    
① '[울진학사]'과 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.   
② '[울진학사]'과 이용자간에 제기된 전자거래 소송에는 대한민국 법을 적용합니다.   
    
   
제17조(약관외 준칙)
   
당 약관에 명시되지 않은 사항은 전자거래 기본법, 전자서명법, 방문판매법 및 기타 관련법령의 규정에 의합니다.
(시행일) 위 약관은 2017년 6월 1일부터 시행합니다.
	</textarea>
	<br>
	<span style="text-align:left; margin:auto;">회원가입 약관에 동의합니다.<input type="checkbox" id="check1" name="check1"></span>

<br><br><br><p style="font-size:14px; font-weight:bold;">개인정보 처리방침 안내</p>
<textarea style="width:60%; height:13em;">
::: 개인정보처리방침 ::::


울진학사(이하 '학사'라 합니다.)은 회원의 사생활 및 개인정보를 적극적으로 보호하여 정보화 사회에서의 통신의 자유를 보장하고자 아래와 같이 개인정보처리방침을 명시하여 실천하고 있습니다.

학사의 개인정보처리방침은 관련 법률 및 정부 지침의 변경과 학사의 내부 정책 변화에 따라 변경될 수 있으며, 수시로 방문하셔서 그 내용을 확인하여 주시기 바랍니다.

1. 개인정보의 수집 방법 및 범위
학사는 서비스의 이용을 위하여 회원 가입 시에 회원 정보를 기입하도록 합니다. 회원가입 시에 받는 기본 필수 정보에는 성명, 주민등록번호, 사업자등록번호, 성별, 주소, 핸드폰번호, 전자우편 주소, 연락처가 있습니다. 이외에 보다 나은 서비스를 위해 선택 정보인 직업, 취미, 월소득 등을 수집할 수 있습니다.

기타 서비스 이용과정 및 처리과정에서 생성되는 서비스 이용기록, 접속 로그, 쿠키, 접속 IP정보, 결재기록 등이 수집될 수 있으며, 추가적인 정보가 필요한 특정 서비스의 이용 시 추가 정보의 제공을 요청할 수 있습니다. 이 경우에도 기입하신 정보는 해당 서비스의 이용 및 사전에 밝힌 목적 이외에는 이용하지 않습니다.

2. 개인정보의 수집 목적 및 이용
학사가 개인정보를 수집하는 목적은 양질의 서비스 제공 및 회원 개개인의 기호와 필요에 따른 맞춤화된 서비스를 제공해드리기 위한 것입니다.

학사는 서비스 제공에 따라 회원님의 동의 하에 광고성 정보를 전달할 수 있으며, 회원님 개인에 대한 정보를 바탕으로 좀 더 유용한 정보로서의 가치가 있는 광고를 선별적으로 전달됩니다. 성별, 연령별 기타 특정 조건의 집단에 대한 광고 게재 및 발송 시에도 회원의 개인정보는 광고를 의뢰한 개인이나 단체에 제공되지 않습니다.

3. 개인정보의 공유 및 제공
학사는 원칙적으로 회원의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만 회원님이 공개 및 제공을 동의한 경우 또는 학사의 이용자 약관을 위배하거나 타인에게 피해를 주는 행위 등으로 법적인 조치가 요구되고 적법한 절차에 의해 관련 정부 기관의 요구가 있을 경우는 예외로 합니다.

4. 자신의 개인정보 열람, 수정 및 삭제
학사의 회원은 언제든지 자신의 개인정보를 열람하거나 수정할 수 있으며, 회원 등록 해지를 통해서 개인정보의 삭제를 요청할 수 있습니다. 개인정보의 열람, 수정 및 삭제는 홈페이지 내 개인정보관리 페이지에서 하실 수 있습니다.

5. 개인정보의 보유 및 이용 기간
학사의 서비스를 제공 받는 동안 회원의 개인정보는 학사가 계속 보유하고 서비스의 제공을 위해서 이용합니다.
원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존 합니다.

(1) 학사 내부방침에 의한 정보보유 사유
회원이 탈퇴한 경우에도 학사는 원활한 서비스의 제공 및 부정한 서비스의 이용을 방지하기 위하여 아래와 같이 회원정보를 보관합니다.
1) 이름, 이메일 주소, 전화번호
- 보존이유 : 서비스 이용의 혼선방지, 분쟁해결 및 수사기관의 요청에 따른 협조
- 보존기간 : 1 년
2) 부정/불량이용기록 (부정/불량이용자의 개인정보 포함)
- 보존이유 : 서비스의 부정 및 불량 이용 방지 및 부정/불량이용자의 재가입 방지
- 보존기간 : 1 년

(2) 관련 법령에 의한 정보보유 사유
상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계 법령의 규정에 의하여 보존할 필요가 있는 경우 학사는 관계 법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 학사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
1) 계약 또는 청약철회 등에 관한 기록
- 보존이유 : 전자상거래 등에서의 소비자보호에 관한 법률
- 보존기간 : 5년
2) 대금결제 및 재화 등의 공급에 관한 기록
- 보존이유 : 전자상거래 등에서의 소비자보호에 관한 법률
- 보존기간 : 5년
3) 소비자의 불만 및 분쟁처리에 관한 기록
- 보존이유 : 전자상거래 등에서의 소비자보호에 관한 법률
- 보존기간 : 3년
4) 로그기록
- 보존이유 : 통신비밀보호법
- 보존기간 : 3개월

6. 개인정보의 파기절차
회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.

종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고, 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

7. 개인정보 자동 수집 장치의 설치?운영 및 그 거부에 관한 사항
학사는 회원에게 개별적으로 특화된 맞춤서비스를 제공하기 위해서 회원의 정보를 수시로 저장하고 찾아내는 '쿠키(cookie)'를 사용합니다. 쿠키는 당사의 웹사이트를 운영하는데 이용되는 서버가 사용자의 브라우저에 보내는 소량의 텍스트 파일로서 사용자의 컴퓨터 하드디스크에 저장되며, 사용자의 컴퓨터는 식별하지만 사용자를 개인적으로 식별하지는 않습니다.

(1) 쿠키 등 사용목적
학사는 다음과 같은 목적을 위해 쿠키를 사용합니다.
회원과 비회원의 접속빈도나 방문시간 등을 분석, 학사의 취향과 관심분야를 파악 및 자취 추적과 각종 이벤트 참여 정도 및 방문회수 파악 등을 통한 타겟 마케팅 및 개인맞춤서비스제공

(2) 쿠키설정거부방법
회원은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 회원은 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
설정방법의 예 : (인터넷 익스플로러의 경우) 웹브라우저 상단의 도구 > 인터넷 옵션 > 개인정보

그러나 학사 홈페이지에 접속하여 서비스를 이용하기 위해서는 쿠키를 허용하여야 하며, 이를 거부할 경우 로그인이 필요한 학사의 서비스의 이용이 어려울 수 있습니다.

8. 개인정보 보호책임자
학사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
- 개인정보 보호책임자
성명 :장현정
전화번호 : 02)701-4230


회원은 학사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보 보호책임자 에게 신고할 수 있습니다. 학사는 회원들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.

10. 회원 및 법정 대리인의 권리와 그 행사방법
회원 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입 해지를 요청할 수도 있습니다.

회원 혹은 만 14세 미만 아동의 개인정보 조회/수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을, 가입해지(동의철회)를 위해서는 '회원탈퇴'를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.혹은 개인정보 보호책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.

학사는 회원 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 '학사가 수집하는 개인정보의 보유 및 이용기간'에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

11. 개인정보보호 관련 대책
학사는 회원 본인의 비밀번호 요청 등에 의해 개인정보를 다룰 때 가능한 최선의 방법으로 본인임을 확인하고 안전하게 정보가 처리될 수 있도록 최선을 다합니다.

학사는 개인정보에 대한 접근권한을 개인정보 보호책임자 등 개인정보관리업무를 수행하는 자, 기타 업무상 개인정보의 취급이 불가피한 자로 제한하며, 개인정보를 취급하는 직원에 대한 수시 교육을 통하여 개인정보처리방침의 준수를 항상 강조하고 있습니다.

위와 같은 학사의 노력 이외에 회원은 아이디와 비밀번호, 주민등록번호 등 개인정보가 인터넷 상에 노출되거나 타인에게 유출되지 않도록 주의하여야 합니다. 회원 본인의 부주의나 관리소홀로 아이디와 비밀번호 등 개인정보가 유출되었다면 이에 대해서 학사는 책임을 지지 않습니다.
따라서, 회원의 아이디와 비밀번호는 반드시 본인만 사용하시고, 비밀번호를 자주 바꿔주시는 것이 좋으며, 비밀번호는 영문자, 숫자를 혼합하여 타인이 유추하기 어려운 번호를 사용하는 것이 좋습니다.

또한 서비스의 이용을 마친 후에는 항상 로그아웃을 하여 주시고 웹 브라우저를 종료하는 것이 좋습니다. 특히, 다른 사람과 컴퓨터를 공유하거나, 공공장소에서 이용하는 경우에 개인정보의 보안을 위해서는 이와 같은 절차가 더욱 필요합니다.

채팅, 게시판, 이메일 등을 통해 자신이 자발적으로 제공하는 개인정보는 다른 사람들에 의하여 본인의 의도와는 다르게 이용될 수 있다는 사실을 염두에 두어야 합니다. 회원님의 로그인 패스워드에 대한 보안을 유지할 책임은 회원님 자신에게 있으므로, 다른 사람에게도 공개되어 있는 공간에는 자신의 개인정보를 함부로 남겨서는 안됩니다. 또한 PC방이나, 기타 공공장소 등 주변에 다른 사람들이 많은 곳에서는 서비스를 이용하고 있는 동안 다른 사람들이 자신의 컴퓨터 화면을 볼 수도 있다는 사실을 염두에 두고 개인정보가 노출되지 않도록 주의하여야 합니다.

12. 개인정보관련 신고 및 분쟁조정
개인정보침해에 대한 신고, 상담이 필요하신 경우에는 한국정보보호진흥원(KISA) 개인 정보 침해신고센터로 문의하시기 바랍니다. 또한, 귀하가 개인정보침해를 통한 금전적, 정신적 피해를 입으신 경우에는 개인정보분쟁조정위원회에 피해구제를 신청하실 수 있습니다.

개인정보 침해신고센터 (http://www.cyberprivacy.or.kr, 전화 1336)
개인정보 분쟁조정위원회 (http://www.kopico.or.kr, 전화 1336)
정보보호마크 인증위원회 (http://www.privacymark.or.kr, 전화 02-580-0533)
대검찰청 인터넷범죄수사센터 (http://www.spo.go.kr, 전화 02-3480-3600)
경찰청 사이버테러대응센터 (http://www.ctrc.go.kr, 전화 02-392-0330)
경찰청 (http://www.police.go.kr)


시행일자 : 2017년 6월 1일

</textarea>
	<br>
	<span style="align:left;">개인정보처리방침안내의 내용에 동의합니다.<input type="checkbox" id="check2" name="check2"></span><br><br>
	<input type="submit"class="add-button" onsubmit="return checkForm()" value="회원가입">
	
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

		function checkForm() {


			var chk1 = document.signupCheck.check1.checked;
			var chk2 = document.signupCheck.check2.checked;
			
		
			if (!chk1 || !chk2) {
				alert("약관에 모두 동의해주세요.");
				return false;
			}


		}	
	
	</script>
</body>
</html>