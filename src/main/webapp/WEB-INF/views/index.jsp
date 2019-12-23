<%@page import="org.sweeter.application.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ORY</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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

				<a href="/post/list/2/1/10"><h2>자유게시판</h2></a>

				<table id="freeBoard" class="table table-hover">
					<tbody>

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
	<script src="/resources/js/index.js"></script>
</body>
</html>
