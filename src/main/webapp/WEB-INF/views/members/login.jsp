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
	<div class="container">

		<div class="container-fluid" style="margin-top: 80px;">
			<form id="loginform" action="/members/signin" method="post" class="was-validated">
				<div class="form-group">
					<label for="uname">ID:</label> <input type="text"
						class="form-control" placeholder="Enter username" name="id"
						required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>

				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password"
						class="form-control" placeholder="Enter password" name="pw"
						required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>

				<p><button id="login-submit" type="submit" class="btn btn-primary">Login</button></p>
				<p>need Account? <a href="/members/register">click here to Register</a></p>

			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/login.js"></script>
</body>
</html>