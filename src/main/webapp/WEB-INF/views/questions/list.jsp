<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/qa/list.css" rel="stylesheet">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/js/qa/list.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.css" />
<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js"></script>


</head>
<body>
	<%@include file="../includes/navigation.jspf"%>
	<div id="container">
		<div id="list">
			<b>글목록</b>
		</div>


		<table id="example" class="display">
			<thead>
				<tr>
					<th>id</th>
					<th>title</th>
					<th>writer</th>
					<th>writedate</th>
				</tr>
			</thead>
		</table>
		<div id="list">
			<%
				if (session.getAttribute("user") == null) {
			%>

			<%
				} else {
			%>
			<a href="/questions/write" class="btn btn-success"
				style="float: right; margin-right: 20px;">글쓰기</a>
			<%
				}
			%>
		</div>

	</div>


</body>

</body>
</html>