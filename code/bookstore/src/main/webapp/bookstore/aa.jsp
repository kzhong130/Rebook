<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>BookStore</title>

<%
	String ISBN = request.getParameter("ISBN");
	response.sendRedirect("bookAction!getBookInfo?ISBN="+ISBN);
%>

</head>
<body>
</body>
</html>