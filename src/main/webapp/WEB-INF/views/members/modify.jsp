<%@page import="org.sweeter.application.model.dto.Member"%>
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

		<%
			Member member = (Member) session.getAttribute("user");
		%>
		<div class="container-fluid" style="margin-top: 80px;">
			<form action="#" method="post" class="was-validated">
				<div class="form-group">
					<label for="uname">ID:</label> <input type="text"
						class="form-control" value="<%=member.getId()%>" name="id"
						required readonly="readonly">
				</div>

				<div class="form-group">
					<label for="pwd"><font color="red">*</font>Password: (영어와
						숫자 혼용하여 4글자 이상 12글자 이하)</label> <input type="password"
						class="form-control" name="pw" required>
				</div>

				<div class="form-group">
					<label for="pwd"><font color="red">*</font>Password Confirm</label>
					<input type="password" class="form-control" name="pw2" required>
				</div>

				<div class="form-group">
					<label for="pwd"><font color="red">*</font>Name:</label> <input
						type="text" class="form-control" value="<%=member.getName()%>"
						name="name" required>
				</div>


				<div class="form-group">
					<label for="pwd"><font color="red">*</font>E-mail:</label> <input
						type="email" class="form-control" value="<%=member.getEmail()%>"
						name="email" required>
				</div>

				<div class="form-group">
					<label for="pwd">tel:</label> <input type="text"
						class="form-control" value="<%=member.getTel()%>" name="tel">
				</div>

				<button type="submit" class="btn btn-primary">Modify
					Account</button>
			</form>
		</div>
	</div>
	<script src="/resources/js/modify.js"></script>
	<script>
		$('button[type="submit"]').on("click", function(e) {
			e.preventDefault();
			modify();

		});
	</script>
</body>
</html>