<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		
	</table>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	$.ajax({
		url : '/posts/2/1/10',
		type : 'get',
		dataType : "json",
		success : function(response) {
			console.log(response);
			
			for(var i = 0; i < response.length; i++){
				$("table").append('<tr><td>'+ response[i].title +'</td></tr>');
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