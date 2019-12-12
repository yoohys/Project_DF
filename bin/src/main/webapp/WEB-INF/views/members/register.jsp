<<<<<<< HEAD
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
	<div class="container">
		<%@include file="../includes/navigation.jspf"%>
		<div class="container-fluid" style="margin-top: 80px;">
			<form action="/members/register" method="post" class="was-validated">
				<div class="form-group">
					<label for="uname">ID:</label> <input type="text"
						class="form-control" placeholder="Enter username" name="id"
						required>
				</div>

				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password"
						class="form-control" placeholder="Enter password" name="pw"
						required>
				</div>

				<div class="form-group">
					<label for="pwd">Name:</label> <input type="text"
						class="form-control" placeholder="Enter password" name="name"
						required>
				</div>

				<div class="form-group">
					<label for="pwd">E-mail:</label> <input type="email"
						class="form-control" placeholder="Enter password" name="email"
						required>
				</div>

				<div class="form-group">
					<label for="pwd">tel:</label> <input type="text"
						class="form-control" placeholder="Enter password" name="tel">
				</div>

				<button type="submit" class="btn btn-primary">Create
					Account</button>
			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		//Ajax로 아이디 중복여부 체크 후 MemberController로 데이터 전송
	</script>
</body>
=======
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
	<div class="container">
		<%@include file="../includes/navigation.jspf"%>
		<div class="container-fluid" style="margin-top: 80px;">
			<form action="/members/register" method="post" class="was-validated">
				<div class="form-group">
					<label for="uname">ID:</label> <input type="text"
						class="form-control" placeholder="Enter username" name="id"
						required>
				</div>

				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password"
						class="form-control" placeholder="Enter password" name="pw"
						required>
				</div>

				<div class="form-group">
					<label for="pwd">Name:</label> <input type="text"
						class="form-control" placeholder="Enter password" name="name"
						required>
				</div>

				<div class="form-group">
					<label for="pwd">E-mail:</label> <input type="email"
						class="form-control" placeholder="Enter password" name="email"
						required>
				</div>

				<div class="form-group">
					<label for="pwd">tel:</label> <input type="text"
						class="form-control" placeholder="Enter password" name="tel">
				</div>

				<button type="submit" class="btn btn-primary">Create
					Account</button>
			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		//Ajax로 아이디 중복여부 체크 후 MemberController로 데이터 전송
	</script>
</body>
>>>>>>> refs/remotes/upstream/master
</html>