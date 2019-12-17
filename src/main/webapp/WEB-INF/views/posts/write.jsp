<%@page import="org.sweeter.application.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Member member = (Member) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/write.css" rel="stylesheet">
<body>
	<%@include file="../includes/navigation.jspf"%>
	<div class="container">
		<table class="table table-bordered">

			<tbody>
				<div id="list">
					<b>글쓰기</b>
				</div>
				<form action="#" method="post" class="was-validated">
					<tr>
						<th>제목</th>
						<td><input type="text" placeholder="제목을 입력하세요. "
							class="form-control" name="title" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="10" placeholder="내용을 입력하세요. "
								class="form-control" rows="10" name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="text" class="form-control"
							placeholder="파일을 선택하세요. " name="filename" /></td>
					</tr>
					<tr>


						<td colspan="2">
							<button type="submit" class="btn btn-success">Post</button> <a
							class="btn btn-danger" href="list">List</a>
						</td>
					</tr>
					<input type="hidden" value="<%=member.getId()%>" name="writer" />
				</form>
			</tbody>
		</table>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/write.js"></script>
	<script>
		$('button[type="submit"]').on("click", function(e) {
			e.preventDefault();

			if (!check()) {
				write();
			}
		});
	</script>

</body>

</html>