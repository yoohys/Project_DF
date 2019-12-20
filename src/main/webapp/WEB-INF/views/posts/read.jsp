<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.sweeter.application.model.dto.Member"%>
<%@page import="org.sweeter.application.model.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/read.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

					<tr>

						<th>작성자</th>
						<td><input type="text" id="writer"
							class="form-control" name="writer" readonly="readonly" /></td>
						<th>수정 시간</th>
						<td><input type="text"" id="modifyDate"
							class="form-control" name="modifyDate" readonly="readonly" /></td>
					</tr>

	
</body>
</html>