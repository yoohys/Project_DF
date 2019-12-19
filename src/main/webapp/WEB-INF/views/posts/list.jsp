<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/list.css" rel="stylesheet">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="/resources/js/list.js"></script> -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js"></script>


</head>
<body>
	<div id="container">
		<%@include file="../includes/navigation.jspf"%>

		<div id="list">
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
		<div style="width:1500px; margin:auto;">
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
		</div>
		
	</div>
	
	
</body>

<script>
$(document).ready(function() {
    $('#example').DataTable( {
        "ajax": "/posts/all",
        "columns": [
            { "data": "id" },
            { "data": "title",
            	"render" : function(data, type, row, meta){
            		return '<a href="/post/' + row.id + '">'+data+"</a>";
            	}},
            { "data": "writer" },
            { "data": "writeDate" }
        ]
    } );
} );
</script>
</body>
</html>