<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.BookComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.RequestBook"%>
<%@page import="model.Book"%>
<%@page import="model.BookIN"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="revised" content="Ningxia Seasons, 2015/8/13/" />
<!-- 定义页面的最新版本 -->
<meta name="description" content="网站简介" />
<!-- 网站简介 -->
<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
<!-- 搜索关键字 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>已被处理的申请</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/crowdfunding.center/myprocess.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
	
	String Username=(String) session.getAttribute("loginUserName");
	ArrayList<RequestBook> requestList=(ArrayList<RequestBook>)session.getAttribute("requestBookList");
	ArrayList<Book> bookList=(ArrayList<Book>)session.getAttribute("bookList");
	ArrayList<BookIN> bookINList=(ArrayList<BookIN>)session.getAttribute("bookInList");
	
%>
<body>

	<!-- 开始 -->
	<div class="my_info_title">
		已被处理的申请
		
	</div>
	<hr>

	<!-- 每本书 -->

<!-- 借书申请  -->
<%

	for(int i=0;i<requestList.size();i++){
		RequestBook requestBook=requestList.get(i);
		Book book=bookList.get(i);
		BookIN bookIn=bookINList.get(i);
		String type=bookIn.getType();
		//System.out.println(bookIn.getRecency());
		if(type.equals("lend")){
			
%>
<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="<%=book.getImage() %>"/></a><br>

          
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<%=book.getBookName() %>》<span class="isbn"><%=book.getISBN() %></span></td>
              <td>
              <p class="time">书币要求：<span class="coin"><%=bookIn.getCoinNumber() %>&nbsp;&nbsp;</span></p>
              </td>
              </tr>
              
              
              <tr>
              <td>
              <p class="comment">书主信息：<%=bookIn.getOwnerName() %>&nbsp;&nbsp;<%=bookIn.getOwnerPhone() %>&nbsp;&nbsp;<%=bookIn.getProvince()+bookIn.getCity()+bookIn.getTown() %></p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<%=bookIn.getOwnerAddress() %></p>
              </td>
              <td>
              <p class="time" title="" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis">卖家：<%=bookIn.getUserName() %>&nbsp;&nbsp;</p>
              <p class="time">可借天数：<%=bookIn.getLongestDuration() %>&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td colspan="2">
			  <%
			  String recency=bookIn.getRecency();
			  String w1,w2,w3;
			  w1="";
			  w2="";
			  w3="";
			  //System.out.println(recency);
			  if(recency.equals("20%")) w1="两成新";
			  if(recency.equals("50%")) w1="五成新";
			  if(recency.equals("80%")) w1="八成新";
			  if(recency.equals("100%")) w1="全新";
			  	
			  String delivery=bookIn.getSendWay();
			  if(delivery.equals("face")) w2="面取";
			  else w2="邮寄";
			  w3=bookIn.getNote();
			  if(w3==null) w3="无";
			  %>            
              <p class="comment">新旧程度：<%=w1 %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=w2 %></p>
              <p class="comment">备注：<%=w3 %></p>
              </td>
              </tr>
              
              <tr><td colspan="2"><hr class="fortr"></td></tr>
              <tr>
              <td>
              <%
              System.out.println(requestBook.getReturnWay());
              %>
              <p class="comment">收件人：<%=requestBook.getReceiverName() %>&nbsp;&nbsp;<%=requestBook.getPhone() %>&emsp;&emsp;还书方式：<%=requestBook.getReturnWay() %></p>
              <p class="comment">收货地址：<%=requestBook.getProvince()+requestBook.getCity()+requestBook.getTown()+requestBook.getAddress() %></p>
              </td>
              <td>
              <%
              String status=requestBook.getRequestStatus();
              String a="";
              if(!status.equals("accept")) a="未通过";
              else a="已通过";
              %>
              <p class="time"><span class="coin"><% %>借书&nbsp;&nbsp;<%=a %>&nbsp;&nbsp;</span></p>
              </td>
              </tr>
              
           </table>
           </td>
        </tr>
		</table>
</div>
<br>
<%
		}
%>
<%
	if(type.equals("sell")){
%>

<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="<%=book.getImage() %>"/></a><br>

          
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<%=book.getBookName() %>》<span class="isbn"><%=book.getISBN() %></span></td>
              <td><p class="time">书币要求：<span class="coin"><%=bookIn.getCoinNumber() %>&nbsp;&nbsp;</span></p></td>
              </tr>
              
              <tr>
              <td>
              <p class="comment">书主信息：<%=bookIn.getOwnerName() %>&nbsp;&nbsp;<%=bookIn.getOwnerPhone() %>&nbsp;&nbsp;<%=bookIn.getProvince()+bookIn.getCity()+bookIn.getTown() %></p>
              </td>
              <td>
              <p class="time" title="" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis">卖家：<%=bookIn.getUserName() %>>&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td colspan="2">
              <%
			  String recency=bookIn.getRecency();
			  String w1,w2,w3;
			  w1="";
			  w2="";
			  w3="";
			  //System.out.println(recency);
			  if(recency.equals("20%")) w1="两成新";
			  if(recency.equals("50%")) w1="五成新";
			  if(recency.equals("80%")) w1="八成新";
			  if(recency.equals("100%")) w1="全新";
			  	
			  String delivery=bookIn.getSendWay();
			  if(delivery.equals("face")) w2="面取";
			  else w2="邮寄";
			  w3=bookIn.getNote();
			  if(w3=="") w3="无";
			  %>            
              <p class="comment">新旧程度：<%=w1 %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=w2 %></p>
              <p class="comment">备注：<%=w3 %></p>
              </td>
              </tr>
              
              <tr><td colspan="2"><hr class="fortr"></td></tr>
              <tr>
              <td>
              <p class="comment">收件人：<%=requestBook.getReceiverName() %>&nbsp;&nbsp;<%=requestBook.getPhone() %></p>
              <p class="comment">收货地址：<%=requestBook.getProvince()+requestBook.getCity()+requestBook.getAddress() %></p>
              </td>
               <%
              String status=requestBook.getRequestStatus();
              String a="";
              if(!status.equals("accept")) a="未通过";
              else a="已通过";
              %>
              <td>
              <p class="time"><span class="coin"><% %>购书&nbsp;&nbsp;<%=a %>&nbsp;&nbsp;</span></p>
              </td>
              </tr>
              
           </table>
           </td>
        </tr>
		</table>
</div>
<br>

<%
	}
%>
<%
	}
%>





	<!-- 结束 -->
	<script src="../js/jquery-2.1.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	/* 以下是信用星级判断，放到卖家的title内
	if (user.getCredit() > 80 && user.getCredit() <= 100){ 
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>

        	if (user.getCredit() > 60 && user.getCredit() <= 80){
			<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>

        	if (user.getCredit() > 40 && user.getCredit() <= 60){

		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>

        	if (user.getCredit() > 20 && user.getCredit() <= 40 ){

	<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>

        	if (user.getCredit() >= 0 && user.getCredit() <= 20){

	<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	*/
	
	</script>
	

</body>
</html>