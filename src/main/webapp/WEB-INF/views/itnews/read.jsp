<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.sweeter.application.model.dto.Member"%>
<%@page import="org.sweeter.application.model.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/itnews/read.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../includes/navigation.jspf"%>
	<div class="container">
		<table class="table table-bordered">

			<tbody>
				<div id="list">
					<b>글읽기</b>
				</div>

				<form action="/post/modify" method="post" class="was-validated">
					<input id="id" type="hidden" name="id">
					<tr>
						<th>제목</th>
						<td colspan="3"><input id="title" type="text"
							class="form-control" name="title" readonly="readonly" /></td>
					</tr>
					<tr>

						<th>작성자</th>
						<td><input type="text" id="writer" class="form-control"
							name="writer" readonly="readonly" /></td>
						<th>수정 시간</th>
						<td><input type="text" id="modifyDate" class="form-control"
							name="modifyDate" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea id="content" cols="10"
								class="form-control" rows="20" name="content"
								readonly="readonly"></textarea></td>
						<!-- 				나중에 글의 크기에따라 Rows 조정 -->

					</tr>

					<tr>
						<td colspan="4">
							<button type="submit" class="btn btn-primary">Modify</button> <a
							class="btn btn-danger" href="/post/list/2/1/10">List</a>
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/itnews/read.js"></script>
</body>
</html>