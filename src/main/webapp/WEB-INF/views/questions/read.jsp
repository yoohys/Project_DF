<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.sweeter.application.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" />
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/qa/read.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<%@include file="../includes/navigation.jspf"%>
	<div class="container">
		<table class="table table-bordered">
			<form action="/question/modify" method="post" class="was-validated">
				<tbody>
					<div id="list">
						<b>글읽기</b>
						<button type="submit" class="btn btn-primary"
							style="float: right; margin-right: 20px;">Modify</button>
					</div>

					<input id="id" type="hidden" name="id">
					<tr>
						<th>제목</th>
						<td colspan="4"><input id="title" type="text"
							class="form-control" name="title" readonly="readonly" /></td>
					</tr>
					<tr>

						<th>작성자</th>
						<td><input type="text" id="writer" class="form-control"
							name="writer" readonly="readonly" /></td>
						<th>수정 시간</th>
						<td colspan="2"><input type="text" id="modifyDate"
							class="form-control" name="modifyDate" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="4"><textarea id="content" cols="10"
								class="form-control" rows="20" name="content"
								readonly="readonly"></textarea></td>
						<!-- 				나중에 글의 크기에따라 Rows 조정 -->

					</tr>
			</form>
			</tbody>
		</table>
		<div id="list">
			<b>댓글</b>
		</div>
		<table id="comment" class="table">
			<tr>
				<th>댓글 번호</th>
				<th>작성 ID</th>
				<th>작성 시간</th>
				<th colspan=3>내용</th>
				<th>삭제</th>
		</table>
		<%
			if (session.getAttribute("user") == null) {
		%>

		<%
			} else {
				Member member = (Member) session.getAttribute("user");
		%>
	
		<form action="#" method="post" class="was-validated">
			<table class="table table-bordered">
				<tr>
					<th>댓글 작성 칸</th>
					<td> <textarea name="content" rows="4"
							cols="70"></textarea>
					<th width="200"><button type="submit" class="btn btn-primary">댓글등록</button></th>
				</tr>

			</table>

			<input type="hidden" value="<%=member.getId()%>" name="writer" /> <input
				type="hidden" id="id2" name="post" />
		</form>
		<%
			}
		%>
	</div>


	<div id="list2">
		<a id="list3" class="btn btn-danger" href="/questions/1/5">List</a>

	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/qa/read.js"></script>
</body>
</html>