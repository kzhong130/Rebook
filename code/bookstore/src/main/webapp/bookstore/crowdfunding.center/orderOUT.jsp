<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.BookComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
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
<title>买入/借入</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/crowdfunding.center/sell_book.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript" src="../js/jquery.citys.js"></script>    
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
	ArrayList<Book> books = new ArrayList<Book>();
	books = (ArrayList<Book>)session.getAttribute("bookByBookComment");
%>
<body>

 <!-- 标签页 -->
 <div>
    <ul class="nav nav-tabs" style="text-align: center">
      <li class="active">
      	<a href="#buyIN" data-toggle="tab" class="my_info_title">我的买入</a>
      </li>
      <li><a href="#lendIN" data-toggle="tab" class="my_info_title">我的借入</a>
      </li>
    </ul>
</div>
<hr>


<div class="container">
  <div id="myTabContent" class="tab-content">
  
   <!-- 我的买入 -->
   <div class="tab-pane fade in active" id="buyIN">

	  <!-- 每个订单 -->
      <div class="commentbox">
      <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="https://img3.doubanio.com/mpic/s28332051.jpg<% %>"/></a><br>         
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<% %>斯通纳》<span class="isbn"><% %>9787208130500</span></td>
              <td style="vertical-align:top;">
              <button class="btn btn-link" value="<% %>" onclick="" style="padding:3px 10px 0 0;color:#efbb24;float:right;">删除</button>
              <button type="button" class="btn btn-link tc" style="padding:3px 5px 0 0;color:#efbb24;float:right;">编辑</button>
              </td>
              </tr>
                        
              <tr>
              <td>
              <p class="comment">书主信息：<% %>洪晓雅&nbsp;&nbsp;<% %>15821911839&nbsp;&nbsp;<% %>福建厦门</p>
              <p class="comment">新旧程度：<% %>五成新&emsp;&emsp;&emsp;&emsp;送书方式：<% %>邮寄</p>
              </td>
              
              <td>
              <p class="time">书币要求：<span class="coin"><% %>30&nbsp;&nbsp;</span></p>
              <p class="time">状态：<% %>在架上&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td>
              <p class="comment">备注：<% %>请小心的对待这本书（没有备注则写无）</p>
              <p class="comment">录入时间：<% %>2017.7.11 13:52:12</p>
              </td>
              
              
              
              <td class="deletebutton" style="vertical-align:bottom;padding-left:10px;">

              <button class="delete" style="width:110px" id="application" >查看申请</button> 
              </td>
              </tr>
              </table>
            </td>
            </tr>
		    </table>
        </div>
        
        
  </div>
  <!-- buyINend -->    
  
  <!-- 我的借入 -->
  <div class="tab-pane fade" id="lendIN">
  
  
  	  <!-- 每个订单 -->
      <div class="commentbox">
      <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="https://img3.doubanio.com/mpic/s28332051.jpg<% %>"/></a><br>         
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<% %>斯通纳》<span class="isbn"><% %>9787208130500</span></td>
              <td style="vertical-align:top;">
              <button class="btn btn-link" value="<% %>" onclick="" style="padding:3px 10px 0 0;color:#efbb24;float:right;">删除</button>
              <button type="button" class="btn btn-link tc" style="padding:3px 5px 0 0;color:#efbb24;float:right;">编辑</button>
              </td>
              </tr>
                        
              <tr>
              <td>
              <p class="comment">书主信息：<% %>洪晓雅&nbsp;&nbsp;<% %>15821911839&nbsp;&nbsp;<% %>福建厦门</p>
              <p class="comment">新旧程度：<% %>五成新&emsp;&emsp;&emsp;&emsp;送书方式：<% %>邮寄</p>
              </td>
              
              <td>
              <p class="time">书币要求：<span class="coin"><% %>30&nbsp;&nbsp;</span></p>
              <p class="time">状态：<% %>在架上&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td>
              <p class="comment">备注：<% %>请小心的对待这本书（没有备注则写无）</p>
              <p class="comment">录入时间：<% %>2017.7.11 13:52:12</p>
              </td>
              
              
              
              <td class="deletebutton" style="vertical-align:bottom;padding-left:10px;">

              <button class="delete" style="width:110px" id="application" >查看申请</button> 
              </td>
              </tr>
              </table>
            </td>
            </tr>
		    </table>
        </div>
  
  
  
  
  
  </div>
  <!-- lendINend --> 




<br>	
</div>
</div>
<hr>
















	<!-- 结束 -->
	<!-- 
	<script src="../js/jquery-2.1.1.min.js"></script>
	<script src="../js/jquery-1.11.3.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	-->



</body>
</html>