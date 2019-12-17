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
			<a href="write" class="btn btn-success"
				style="float: right; margin-right: 20px;">글쓰기</a>
			<%
				}
			%>

		</div>

		<div>
			<table
				class="table table-striped table-bordered table-hover tbl paginated"
				id="tbl">
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
			<div class="col" id="paging">${pageCode}
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/js/list.js"></script>
</body>
</html>