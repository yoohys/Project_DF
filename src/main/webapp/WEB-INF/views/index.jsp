<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<%@include file="./includes/navigation.jspf"%>
		<div class="container-fluid" style="margin-top:80px;">Main</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/userAjax.js"></script>
	<script>
		/* $("#loginBtn").on("click", login); */
		$("#registerBtn").on("click", register);
	</script>
</body>
</html>