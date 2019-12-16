<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/list.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<%@include file="../includes/navigation.jspf"%>
		<div align="right">
			<!-- Login 검증 -->
			<!-- jstl의 if문은 else가 없어서 따로 검증해야함. -->
			<c:if test="${id != null}">
				<%-- <%@include file="loginOk.jsp" %> --%>
			</c:if>
			<c:if test="${id == null}">
				<%-- <%@include file="login.jsp" %> --%>
			</c:if>
		</div>

		<div id="list">
			<b>게시판 (전체 글: ${totalCount})</b>
		

		
		<%
				if (session.getAttribute("user") == null) {
			%>
		
			<%
				} else {
			%>
			<a href="write" class="btn btn-success" style="float: right; margin-right: 20px;" >글쓰기</a>
			<%
				}
			%>
			
		</div>

		<div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일</th>
						<th width="10%">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles}" varStatus="status">
					
					</c:forEach>
				</tbody>
			</table>

			<!-- Paging 처리 -->
			<div id="paging">${pageCode}</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$.ajax({
		url : '/posts/2/1/10',
		type : 'get',
		dataType : "json",
		success : function(response) {
			console.log(response);

			for (var i = 0; i < response.length; i++) {
				$("table")
						.append('<tr>'+
									'<td>' + response[i].id + '</td>'+
									'<td id="title">' + response[i].title + '</td>'+
									'<td>' + response[i].writer + '</td>'+
									'<td>' + response[i].writeDate + '</td>'+
								'</tr>');
			}
		},
		fail : function(error) {
			alert('???');
		},
		always : function(response) {
			console.log("call always()");
		}
	});
</script>
</body>
</html>