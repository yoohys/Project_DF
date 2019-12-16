<%@page import="org.sweeter.application.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.6">
<title>ORY</title>



<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/4.4/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="mask-icon"
	href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg"
	color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config"
	content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

a {text-decoration: none}
</style>
<!-- Custom styles for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900"
	rel="stylesheet">
<!-- Custom styles for this template -->

</head>
<body>
	<%
		Member member = (Member) session.getAttribute("user");
		String id = "";
		if (member != null) {
			id = member.getId();
		}
	%>
	<%@include file="includes/navigation.jspf"%>


	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-4">
				<h2>IT news</h2>
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>새 CPU</td>
						</tr>
						<tr>
							<td>인텔, 모뎀시장 철수</td>
						</tr>
						<tr>
							<td>AMD 스레드리퍼 3세대 발표</td>
						</tr>
					</tbody>
				</table>

				<h3>Jobs</h3>
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>아이프로 신입 채용</td>
						</tr>
						<tr>
							<td>바른기업 경력직 채용</td>
						</tr>
						<tr>
							<td>떡잎상사 웹 개발자 채용</td>
						</tr>
					</tbody>
				</table>

			</div>
			<div class="col-sm-8">

				<a href="/post/list"><h2>자유게시판</h2></a>

				<table class="table table-hover">
					<tbody>
						<tr>
							<td>안녕하세요 :)</td>
						</tr>
						<tr>
							<td>새 서버용 PC 장만</td>
						</tr>
						<tr>
							<td>오늘 저녁밥</td>
						</tr>
						<tr>
							<td>ㅁㄴㅇㄹ</td>
						</tr>
						<tr>
							<td>자유게시판입니다.</td>
						</tr>
					</tbody>
				</table>
				<h2>Q&A</h2>
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>Bootstrap 질문</td>
						</tr>
						<tr>
							<td>자바에서의 예외처리</td>
						</tr>
						<tr>
							<td>서버용 PC 견적 질문</td>
						</tr>
						<tr>
							<td>테스트 코드 작성</td>
						</tr>
						<tr>
							<td>질문 게시판 입니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>
