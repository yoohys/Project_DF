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
<%
			Member member = (Member) session.getAttribute("user");
			String userId = member.getId();
			
		%>
			
				
					<tr>
						<a class="btn-btn-primary" href="posts/list">목록으로</a> 		
					</tr>
<!-- 					//작성자만 수정 버튼이 보이도록 만들기 -->
					<%
					if (userId != null) {
					%>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password"  class="form-control" placeholder="비밀번호를 입력하세요" /></td>
					</tr>
					<tr>
						<button type="submit" class="btn btn-primary">수정하기</button> 		
					</tr>
					<%
					}else{
					%>
					
					<%} %>
			
		</div>
	</table>
<script type="text/javascript">
$('button[type="submit"]').on("click", function(e) {
	e.preventDefault();
	modify();
	
	
	$.ajax({
		url : '/posts/'+response.id ,
		type : 'get',
		dataType : "json",
		success : function(response) {
			console.log(response);

				$("table").prepend(
						'<tr>' + '<th>' + '제목' + '</th>'
								+ '<td>' + response.title + '</td>'
								+ '<td>' + response.writer +'</td>'
								+ '<td>' + '작성일' +'</td>'
								+ '<td>' + response.writeDate + '</td>'
								+ '<th>' + '내용' +'</th>'
								+ '<td>' +response.content +'</td>' 
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