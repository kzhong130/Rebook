<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>

    <title>My JSP 'index.jsp' starting page</title>
        <meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <s:form action="sendTextMail!verify">
        <s:textfield name="to" label="收件人邮箱:"></s:textfield>
        <s:textfield name="subject" label="主题"></s:textfield>
        <s:textarea name="content" label="内容" rows="5"></s:textarea>
        <s:submit value="发送"></s:submit>
    </s:form>
  </body>
</html>