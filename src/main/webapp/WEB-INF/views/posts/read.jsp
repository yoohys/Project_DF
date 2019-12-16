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
<%
			Member member = (Member) session.getAttribute("user");
			
		%>
			<tbody>
				<form action="write_ok.jsp" method="get"
					encType="multiplart/form-data">
					<tr>
						<th>$board.title</th>
						<td><input type="text"  class="form-control" 
							name="subject" /></td>
							<td>조회수</td>
							<td><% %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="10"  class="form-control" rows="10"
								name="content"><% %></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="text"  class="form-control" 
							name="filename" /></td>
					</tr>
					
					
					<tr>
						<a class="" href="posts/list">목록으로</a> 		
					</tr>
<!-- 					작성자만 수정 버튼이 보이도록 만들기 -->
					<%
					if (session.getId() != null) {
					%>
					
					<%
					}else{
					%>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password"  class="form-control" placeholder="비밀번호를 입력하세요" /></td>
					</tr>
					<tr>
						<button type="submit" class="btn btn-primary">수정하기</button> 		
					</tr>
					<%} %>
				</form>
			</tbody>
		</table>
	</div>
<script type="text/javascript">
$('button[type="submit"]').on("click", function(e) {
	e.preventDefault();
	modify();

});
	//암호 확인 
	
</script>
</body>
</html>