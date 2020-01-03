<%@page import="org.sweeter.application.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ORY</title>
<link href="/resources/css/index.css" rel="stylesheet">
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
		<div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
        <div class="col-md-6 px-0">
          <h3 class="display-4 font-italic">DOG PROJECT</h3>
          <p class="lead my-3">DOG PROJECT는 처음 개발을 접한 초보 개발자와 개발 경력이 있는 베테랑 개발자들 모두 모여  <br>
          						모든 개발자의 질문과 문제들을 함께 공유하여 해결하는 커뮤니티 사이트 입니다.</p>
          <p class="lead mb-0"><a href="#" class="text-white font-weight-bold">Continue reading...</a></p>
        </div>
      </div>
		<div class="row">
			<div class="col-sm-5">
				<a href="/itnews/list/1/1/10"><h2>IT news</h2></a>
				<table id=newsBoard class="table table-hover">
					<tbody class="itnewslist">

					</tbody>
				</table>

				<a href="/job/1/10"><h2>Jobs</h2></a>
				<table id="jobBoard" class="table table-hover">
					<tbody class="jobslist">

					</tbody>
				</table>

			</div>
			<div class="col-sm-5">

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

			<div class="col-sm-2" id="else">
				<br> <br> <img id="logo" src="/resources/img/dogfoot2.png"
					width="250"> <br> <br> <br>
				<h3>Else where</h3>
				<table id="else" class="table table-hover">
					<tbody>
						<tr>
							<td><a href="https://github.com/">GitHub</a></td>
						</tr>
						<tr>
							<td><a href="https://twitter.com/">Twitter</a></td>
						</tr>
						<tr>
							<td><a href="https://ko-kr.facebook.com/">Facebook</a></td>
						</tr>
						<tr>
							<td><a href="https://www.naver.com/">naver</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>
			Project name : DOG FOOT | Project by : 유혁상,전찬현,박승근,황재성 | 사업자등록번호 :
			1234-5678-9876 | <br> where : anywhere(------)
		</p>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/index.js"></script>
</body>
</html>
