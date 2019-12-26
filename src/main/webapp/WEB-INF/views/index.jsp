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
				<a href="/itnews/list/1/1/10"><h2>IT news</h2></a>
				<table id=newsBoard class="table table-hover">
					<tbody>

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
				<a href="/questions/1/5"><h2>Q&A</h2></a>

				<table id="qaBoard" class="table table-hover">
					<tbody>

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
