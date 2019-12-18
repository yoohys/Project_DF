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
<title>Insert title here</title>
</head>
<body>
	<%@include file="../includes/navigation.jspf"%>
	<table class="table table-bordered">
		<div class="container">

			<tbody>
				<form action="#" method="post" class="was-validated">
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-control" name="title"
							placeholder="${id }" /></td>
						<td>작성자</td>

					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="10" class="form-control" rows="10"
								name="content" placeholder="${content }">
						</textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="text" class="form-control" name="filename" /></td>
					</tr>


					<tr>
						<a class="btn-btn-primary" href="list">목록으로</a>
					</tr>
					<!-- 					//작성자만 수정 버튼이 보이도록 만들기 -->

				</form>
			</tbody>
	</table>
	</div>
	<script type="text/javascript">
		$('button[type="submit"]').on(
				"click",
				function(e) {
					e.preventDefault();
					modify();

					$.ajax({
						url : '/posts/' + response.id,
						type : 'get',
						dataType : "json",
						success : function(response) {
							console.log(response);

							$("table").append(
									'<tr>' + '<th>' + '제목' + '</th>' + '<td>'
											+ response.title + '</td>' + '<td>'
											+ response.writer + '</td>'
											+ '<td>' + '작성일' + '</td>' + '<td>'
											+ response.writeDate + '</td>'
											+ '<th>' + '내용' + '</th>' + '<td>'
											+ response.content + '</td>'
											+ '</tr>');

						},
						fail : function(error) {
							alert('???');
						},
						always : function(response) {
							console.log("call always()");
						}
					});
				});
		//암호 확인
	</script>
</body>
</html>