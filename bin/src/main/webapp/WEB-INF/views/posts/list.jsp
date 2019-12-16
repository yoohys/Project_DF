<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style>
#container {
	width: 70%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */
}

#list {
	text-align: center;
}

#write {
	text-align: right;
}

/* Bootstrap 수정 */
.table>thead {
	background-color: #b3c6ff;
}

.table>thead>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #e6ecff;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

div>#paging {
	text-align: center;
}

.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@
keyframes blink {
	from {color: white;
}

30%
{
color
:
 
yellow
;
}
to {
	color: red;
	font-weight: bold;
}
/* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="container">
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
		</div>

		<div id="write">
			<a href="/bbs/writeForm.bbs?pageNum=${pageNum}">글쓰기</a>
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