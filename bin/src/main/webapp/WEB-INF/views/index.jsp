<<<<<<< HEAD
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
		<div class="container-fluid" style="margin-top:80px;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>no</th>
						<th>title</th>
						<th>writer</th>
						<th>date</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
					<tr>
						<td>0</td>
						<td>title</td>
						<td>writer</td>
						<td>2019-01-01</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%@include file="./includes/footer.jsp" %>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/resources/js/userAjax.js"></script>
	<script>
		
	</script>
</body>
=======
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
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>DogFoot</h1>
	</div>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="/">DF</a>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">IT 뉴스</a></li>
				<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Q&A</a></li>
				<li class="nav-item"><a class="nav-link" href="#">구인구직</a></li>
			</ul>

			<div class="float-right">
				<a class="btn btn-primary" href="#">로그인</a> <a class="btn btn-light"
					href="/members/register">회원가입</a>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-4">
				<h2>IT news</h2>
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>새 CPU</td>
						</tr>
						<tr>
							<td>인텔, 모뎀시장 철수</td>
						</tr>
						<tr>
							<td>AMD 스레드리퍼 3세대 발표</td>
						</tr>
					</tbody>
				</table>

				<h3>Jobs</h3>
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>아이프로 신입 채용</td>
						</tr>
						<tr>
							<td>바른기업 경력직 채용</td>
						</tr>
						<tr>
							<td>떡잎상사 웹 개발자 채용</td>
						</tr>
					</tbody>
				</table>

			</div>
			<div class="col-sm-8">
				<h2>자유게시판</h2>
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>안녕하세요 :)</td>
						</tr>
						<tr>
							<td>새 서버용 PC 장만</td>
						</tr>
						<tr>
							<td>오늘 저녁밥</td>
						</tr>
						<tr>
							<td>ㅁㄴㅇㄹ</td>
						</tr>
						<tr>
							<td>자유게시판입니다.</td>
						</tr>
					</tbody>
				</table>
				<h2>Q&A</h2>
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>Bootstrap 질문</td>
						</tr>
						<tr>
							<td>자바에서의 예외처리</td>
						</tr>
						<tr>
							<td>서버용 PC 견적 질문</td>
						</tr>
						<tr>
							<td>테스트 코드 작성</td>
						</tr>
						<tr>
							<td>질문 게시판 입니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
>>>>>>> refs/remotes/upstream/master
</html>