<%@ page import="java.util.*"%>
<%@ page import="model.Book"%>
<%@ page language="java" contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id='MicrosoftTranslatorWidget' class='Dark' style='color:white;background-color:#555555'></div>
<script type='text/javascript'>setTimeout(function(){{var s=document.createElement('script');s.type='text/javascript';s.charset='UTF-8';s.src=((location && location.href && location.href.indexOf('https') == 0)?'https://ssl.microsofttranslator.com':'http://www.microsofttranslator.com')+'/ajax/v3/WidgetV3.ashx?siteData=ueOIGRSKkd965FeEGM5JtQ**&ctf=False&ui=true&settings=Manual&from=';var p=document.getElementsByTagName('head')[0]||document.documentElement;p.insertBefore(s,p.firstChild); }},0);</script>


	<%
		Book book = (Book)request.getAttribute("book");
		//System.out.println(book.getPrice());
	%>
	<table border="1">
		<tr>
			<th>ISBN:</th>
			<th><%=book.getISBN() %></th>
		</tr>
		<tr>
			<th>bookName:</th>
			<th><%=book.getBookName() %></th>
		</tr>
		<tr>
			<th>author:</th>
			<th><%=book.getAuthor() %></th>
		</tr>
		<tr>
			<th>publisher:</th>
			<th><%=book.getPublisher() %></th>
		</tr>
		<tr>
			<th>pubdate:</th>
			<th><%=book.getPubdate() %></th>
		<tr>
			<th>pageNumber:</th>
			<th><%=book.getPageNumber() %></th>
		</tr>
		<tr>
			<th>price:</th>
			<th><%=book.getPrice() %></th>
		</tr>
		<tr>
			<th>doubanRate:</th>
			<th><%=book.getDoubanRate() %></th>
		</tr>
		<tr>
			<th>raterNumber:</th>
			<th><%=book.getRaterNumber() %></th>
		</tr>
		<tr>
			<th>summary:</th>
			<th><%=book.getSummary() %></th>
		</tr>
		<tr>
			<th>image:</th>
			<th><img src="<%=book.getImage() %>"></th>
		</tr>	
	</table>
</body>
</html>