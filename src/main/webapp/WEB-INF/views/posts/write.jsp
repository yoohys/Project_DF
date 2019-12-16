<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<body>
	<%@include file="../includes/navigation.jspf"%>
	<div class="container">
		<table class="table table-bordered">

			<tbody>
				<form action="write_ok.jsp" method="post"
					encType="multiplart/form-data">
					<tr>
						<th>제목</th>
						<td><input type="text" placeholder="제목을 입력하세요. "  class="form-control" 
							name="subject" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="10" placeholder="내용을 입력하세요. "  class="form-control" rows="10"
								name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="text"  class="form-control" placeholder="파일을 선택하세요. "
							name="filename" /></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password"  class="form-control" placeholder="비밀번호를 입력하세요" /></td>
					</tr>
					<tr>
					
					
						<td colspan="2"><input type="button" value="Post"
							onclick="sendData()" class="btn btn-primary" /> 
							
							
							<input type="button" value="reset"  class="btn btn-danger"/> <input
							type="button" value="List" class="btn btn-warning"
							onclick="javascript:location.href='list'"  /></td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>


</body>
</html>