<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>BookStore</title>

<%
	String url=(String)session.getAttribute("prePage");
%>

<%
	response.sendRedirect(url);
	
%>

</head>
<body>
</body>
</html>