<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.BookIN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
<%@page import="model.BuyOrder"%>
<%@page import="model.LendOrder"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.ParsePosition" %>
<%@page import="java.util.Calendar" %>
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
<title>卖出/借出</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap_book.css">
<link href="../css/crowdfunding.center/orderInOut.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript" src="../js/jquery.citys.js"></script>    
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
	ArrayList<BuyOrder> sellOrders = (ArrayList<BuyOrder>)session.getAttribute("sellOrders");
	ArrayList<BookIN> bookINsBySellOrders = (ArrayList<BookIN>)session.getAttribute("bookINsBySellOrders");
	ArrayList<Book> booksBySellOrders = (ArrayList<Book>)session.getAttribute("booksBySellOrders");
	ArrayList<LendOrder> lendoutOrders = (ArrayList<LendOrder>)session.getAttribute("lendoutOrders");
	ArrayList<BookIN> bookINsByLendoutOrders = (ArrayList<BookIN>)session.getAttribute("bookINsByLendoutOrders");
	ArrayList<Book> booksByLendoutOrders = (ArrayList<Book>)session.getAttribute("booksByLendoutOrders");
%>
<body>

<div class="my_info_title">卖出/借出 </div>
<br>
<div class="my_info_title_3">
  <ul>
    <li id="mysellout" onClick="change(1)" style="border-bottom: 1px solid #d19826; color: #d19826;">
        <a href="#sellOUT" data-toggle="tab" >我的卖出</a>
    </li>
    <li id="mylendout" onClick="change(2)"><a href="#lendOUT" data-toggle="tab" >我的借出</a></li>
  </ul>
</div>
<br>


<div>
  <div id="myTabContent" class="tab-content">
  
   <!-- 我的卖出 -->
   <div class="tab-pane fade in active" id="sellOUT">
	<%
		if (sellOrders.size() > 0){
			for (int i=0; i<sellOrders.size(); i++){
				BuyOrder sellOrder = sellOrders.get(i);
				BookIN bookIN = bookINsBySellOrders.get(i);
				Book book = booksBySellOrders.get(i);
				String recency = "";
				if (bookIN.getRecency().equals("20%")){
					recency = "两成新";
				}
				if (bookIN.getRecency().equals("50%")){
					recency = "五成新";
				}
				if (bookIN.getRecency().equals("80%")){
					recency = "八成新";
				}
				if (bookIN.getRecency().equals("100%")){
					recency = "全新";
				}
				
				String sendWay = "";
				if (bookIN.getSendWay().equals("mail")){
					sendWay = "邮寄";
				}
				if (bookIN.getSendWay().equals("face")){
					sendWay = "当面";	
				}
				
				String note = bookIN.getNote();
				if ("".equals(note)){
					note = "无";
				}
				
				String cityInfo = "";
				if (bookIN.getCity().equals("")){	//直辖市
					cityInfo = bookIN.getProvince() + bookIN.getTown();
				}
				if (!bookIN.getCity().equals("")){
					cityInfo = bookIN.getProvince() + bookIN.getCity();
				}
				
	%>
	  <!-- 每个订单 -->
	  <div class="boxtitle"><%=sellOrder.getCreateTime().toString().substring(0, 10) %>&emsp;&emsp;订单号：<%=sellOrder.getBuyID() %>&emsp;&emsp;&emsp;&emsp;<%=sellOrder.getBuyerName() %>
      <button type="button" class="btn btn-link" data-toggle="modal"  data-target="#feedbackcontent<%=i %>" style="padding:3px 5px 0 0;color:#333333;float:right;" id="feedback">反馈</button>
      </div>
      <div class="commentbox">
      <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="<%=book.getImage() %>"/></a><br>         
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td>
              <p class="bookname">《<%=book.getBookName() %>》</p>
              <p class="comment" style="color:#b7b7b7"><%=book.getAuthor() %></p>
              <p class="comment" style="font-size:1px;">&nbsp;</p>
              <p class="comment">收货人信息：<%=sellOrder.getReceiver() %>&nbsp;&nbsp;<%=sellOrder.getBuyPhone() %>&nbsp;&nbsp;</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<%=sellOrder.getBuyAddress() %></p>
              <p class="comment">新旧程度：<%=recency %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=sendWay %></p>
              <p class="comment">备注：<%=note %></p>
              </td>

              
              <td style="vertical-align:top;height:181px;" >
              <p class="time">书主：<%=bookIN.getOwnerName() %>
              <img style="height:20px;width:20px;margin:0 -1px 3px -2px;" src="../images/person_info.png" title="<%=bookIN.getOwnerName() + " " + bookIN.getOwnerPhone() + " " + cityInfo%>">
              </p>
              <p class="time">书币：<span class="coin"><%=bookIN.getCoinNumber() %></span></p>
              <div class="deletebutton" style="padding-top:85px;">
              <%if (sellOrder.getStatus().equals("1")){ %>
              <button class="delete" style="width:90px" id="application" value=<%=sellOrder.getBuyID() %> onclick="confirmSend(this)">我已发货</button> 
              <%} %>
              <%if (sellOrder.getStatus().equals("3")){ %>
              <button class="nothing" style="width:90px" id="application" onclick="alert('您已发货，请耐心等待用户收货')">已发货</button>
              <%} %>
              <%if (sellOrder.getStatus().equals("4")){ %>
              <button class="nothing" style="width:90px" id="application" onclick="alert('买家已收货，但暂未评价‘)")>买家已收货</button>
              <%} %>
              <%if (sellOrder.getStatus().equals("5")){ %>
              <button class="nothing" style="width:90px" id="application" onclick="alert('买家已对您作出评价，祝您生活愉快')">买家已评价</button>
              <%} %>
              </div>
              </td>
              
              </tr>
              </table>
              
            </td>
            </tr>
		    </table>
		 </div>   
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="feedbackcontent<%=i %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" >
					反馈
					</h4>
				</div>
				<form id="feedbackForm" class="STYLE-NAME" method="POST" action="">
				
				
				<div style="padding:5px 0 0 10px;">
				<table style="width:598px;resize:none;margin: 10px;text-align:left;">
				<tr>
				<td style="width:50px;"><span>主题：</span></td>
                <td><input type="text" name="sellFeedbackTopic" id="topic" value="" placeholder="请输入反馈主题" class="" style="width:90%"> </td>  
                </tr>
                <tr>
                <td style="vertical-align:top;padding-top:10px;"><span>内容：</span></td>
				<td><textarea id="content" name="sellFeedbackContent" placeholder="请输入具体内容" style="height: 120px; width:90%;resize:none;margin:10px 0;text-align:left;"></textarea>
				</td></tr>
				</table></div>
				<input type="hidden" name="" value="<% %>" >
				<input type="hidden" name="" value="<% %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitSellOrderFeedback(this,<%=i %>);" data-dismiss="modal" id="<%=sellOrder.getBuyID() %>">
					提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		    </div><!-- /.modal -->
	     </div>
       <!-- 评价模态框（Modal） -->
		<div class="modal fade" id="evaluate<% %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" >
					评价
					</h4>
				</div>
				<form id="evaluateForm" class="STYLE-NAME" method="POST" action="">
				
				
				<div style="padding:5px 0 0 10px;">
				<table style="width:598px;resize:none;margin: 10px;text-align:left;">
				<tr>
				<td style="width:50px;"><span>请对对方信用进行评价：</span></td>
                <td><div class="citys"><p>
                     <select name="" class="">
                     <option value ="good">好评</option>
                     <option value ="normal">中评</option>
                     <option value ="bad">差评</option>
                     </select></p></div>  </td>  
                </tr>
                <tr>
                <td style="vertical-align:top;padding-top:10px;"><span>评价内容：</span></td>
				<td><textarea id="evaluatecontent" name="content" placeholder="请输入具体内容" style="height: 120px; width:90%;resize:none;margin:10px 0;text-align:left;"></textarea>
				</td></tr>
				</table></div>
				<input type="hidden" name="" value="<% %>" >
				<input type="hidden" name="" value="<% %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitEvaluate();" data-dismiss="modal">
					提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		    </div><!-- /.modal -->
	     </div>   
 <%} %>       
 <%} %>       
  </div>
  <!-- sellOUTend -->    
  
  <!-- 我的借出 -->
  <div class="tab-pane fade" id="lendOUT">
<%
	if (lendoutOrders.size() > 0){
		for (int i=0; i<lendoutOrders.size(); i++){
			LendOrder lendoutOrder = lendoutOrders.get(i);
			BookIN bookIN = bookINsByLendoutOrders.get(i);
			Book book = booksByLendoutOrders.get(i);
			String recency = "";
			if (bookIN.getRecency().equals("20%")){
				recency = "两成新";
			}
			if (bookIN.getRecency().equals("50%")){
				recency = "五成新";
			}
			if (bookIN.getRecency().equals("80%")){
				recency = "八成新";
			}
			if (bookIN.getRecency().equals("100%")){
				recency = "全新";
			}
			
			String sendWay = "";
			if (bookIN.getSendWay().equals("mail")){
				sendWay = "邮寄";
			}
			if (bookIN.getSendWay().equals("face")){
				sendWay = "当面";	
			}
			
			String note = bookIN.getNote();
			if ("".equals(note)){
				note = "无";
			}
			
			String returnDate = "";
			int longestDuration = bookIN.getLongestDuration();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = lendoutOrder.getCreateTime().toString().substring(0, 10);
			Date date = sdf.parse(str,new ParsePosition(0));
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.DATE,longestDuration);
			Date date1 = calendar.getTime();
			returnDate = sdf.format(date1);
			
			String returnWay = "";
			if ("mail".equals(lendoutOrder.getReturnWay())){
				returnWay = "邮寄";
			}
			if ("face".equals(lendoutOrder.getReturnWay())){
				returnWay = "当面";
			}
%>
	  <!-- 每个订单 -->
	  <div class="boxtitle"><%=lendoutOrder.getCreateTime().toString().substring(0, 19) %>&emsp;&emsp;订单号：<%=lendoutOrder.getLendID() %>&emsp;&emsp;&emsp;&emsp;<%=lendoutOrder.getLenderName() %>
      <button type="button" class="btn btn-link" data-toggle="modal"  data-target="#feedbackcontent2<%=i %>" style="padding:3px 5px 0 0;color:#333333;float:right;" id="feedback">反馈</button>
      </div>
      <div class="commentbox">
      <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="<%=book.getImage() %>"/></a><br>         
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td>
              <p class="bookname">《<%=book.getBookName() %>》</p>
              <p class="comment" style="color:#b7b7b7"><%=book.getAuthor() %></p>
              <p class="comment" style="font-size:1px;">&nbsp;</p>
              <p class="comment">收货人信息：<%=lendoutOrder.getReceiver() %>&nbsp;&nbsp;<%=lendoutOrder.getLendPhone() %>&nbsp;&nbsp;</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<%=lendoutOrder.getLendAddress() %></p>
              <p class="comment">新旧程度：<%=recency %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=sendWay %></p>
              <p class="comment">备注：<%=note %></p>
              </td>

              
              <td style="vertical-align:top;height:181px;" >
              <p class="time">书主：<%=bookIN.getOwnerName() %>
              <img style="height:20px;width:20px;margin:0 -1px 3px -2px;" src="../images/person_info.png" title="<%=bookIN.getOwnerName() + " " + bookIN.getOwnerPhone() + " " + bookIN.getProvince()+bookIN.getCity()+bookIN.getTown()+bookIN.getOwnerAddress() %>">
              </p>
              <p class="time">还书时间：<%=returnDate %></p>
              <p class="time">还书方式：<%=returnWay %></p>
              <p class="time">书币：<span class="coin"><%=bookIN.getCoinNumber() %></span></p>
              <div class="deletebutton">
              <%if (lendoutOrder.getStatus().equals("1")){ %>
              <button class="delete" style="width:90px" id="application" value=<%=lendoutOrder.getLendID() %> onclick="confirmLendSend(this)">我已发货</button> 
              <%} %>
              <%if (lendoutOrder.getStatus().equals("3")){ %>
              <button class="nothing" style="width:90px" id="application" onclick="alert('您已发货，请等待用户收货')">已发货</button>
              <%} %>
              <%if (lendoutOrder.getStatus().equals("4")){ %>
              <button class="nothing" style="width:90px" id="application" onclick="alert('对方已收货，请耐心等待归还')">对方已收货</button>
              <%} %>
              <%if (lendoutOrder.getStatus().equals("5")){ %>
              <button class="delete" style="width:90px" id="application" value=<%=lendoutOrder.getLendID() %> onclick="confirmReturn(this)">确认归还</button>
              <%} %>
              <%if(lendoutOrder.getStatus().equals("6") || lendoutOrder.getStatus().equals("8")){ %>
              <button class="evaluate" style="width:90px" id="evaluate"  data-toggle="modal"  data-target="#evaluate2<%=i %>" >评价</button>
              <%} %>
              <%if(lendoutOrder.getStatus().equals("7") || lendoutOrder.getStatus().equals("9")){ %>
              <button class="nothing" style="width:90px" id="application" onclick="alert('您已经评价，不能再次评价')">已评价</button>
              <%} %>
              </div>
              </td>
              
              </tr>
              </table>
              
            </td>
            </tr>
		    </table>
		 </div>   
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="feedbackcontent2<%=i %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" >
					反馈
					</h4>
				</div>
				<form id="feedbackForm" class="STYLE-NAME" method="POST" action="">
				
				
				<div style="padding:5px 0 0 10px;">
				<table style="width:598px;resize:none;margin: 10px;text-align:left;">
				<tr>
				<td style="width:50px;"><span>主题：</span></td>
                <td><input type="text" name="lendoutFeedbackTopic" id="topic" value="" placeholder="请输入反馈主题" class="" style="width:90%"> </td>  
                </tr>
                <tr>
                <td style="vertical-align:top;padding-top:10px;"><span>内容：</span></td>
				<td><textarea id="content" name="lendoutFeedbackContent" placeholder="请输入具体内容" style="height: 120px; width:90%;resize:none;margin:10px 0;text-align:left;"></textarea>
				</td></tr>
				</table></div>
				<input type="hidden" name="" value="<% %>" >
				<input type="hidden" name="" value="<% %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitLendOrderFeedback(this,<%=i %>);" data-dismiss="modal" id="<%=lendoutOrder.getLendID() %>">
					提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		    </div><!-- /.modal -->
	     </div>
       <!-- 评价模态框（Modal） -->
		<div class="modal fade" id="evaluate2<%=i %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" >
					评价
					</h4>
				</div>
				<form id="evaluateForm" class="STYLE-NAME" method="POST" action="">
				
				
				<div style="padding:5px 0 0 10px;">
				<table style="width:598px;resize:none;margin: 10px;text-align:left;">
				<tr>
				<td style="width:50px;"><span>请对对方信用进行评价：</span></td>
                <td><div class="citys"><p>
                     <select name="lendCommentType" class="">
                     <option value ="good">好评</option>
                     <option value ="normal">中评</option>
                     <option value ="bad">差评</option>
                     </select></p></div>  </td>  
                </tr>
                <tr>
                <td style="vertical-align:top;padding-top:10px;"><span>评价内容：</span></td>
				<td><textarea id="evaluatecontent" name="lendCommentContent" placeholder="请输入具体内容" style="height: 120px; width:90%;resize:none;margin:10px 0;text-align:left;"></textarea>
				</td></tr>
				</table></div>
				<input type="hidden" name="" value="<% %>" >
				<input type="hidden" name="" value="<% %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitLendOrderEvaluate(this,<%=i %>);" data-dismiss="modal" id=<%=lendoutOrder.getLendID() %>>
					提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		    </div><!-- /.modal -->
	     </div>         
 <%} %>          
 <%} %>       
  </div>
  <!-- lendOUTend --> 




<br>	
</div>
</div>
















<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="../js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
<script type="text/javascript">
function change(value){
	if(value == 1){
		$("#mysellout").attr("style","border-bottom: 1px solid #d19826; color: #d19826;");
		$("#mylendout").attr("style","");
	}
	if(value == 2){
		$("#mysellout").attr("style","");
		$("#mylendout").attr("style","border-bottom: 1px solid #d19826; color: #d19826;");
	}
}

function submitSellOrderFeedback(ob,index){
	var buyID = ob.id;
	buyID = parseInt(buyID);
	var topic = document.getElementsByName("sellFeedbackTopic")[index].value;
	var content = document.getElementsByName("sellFeedbackContent")[index].value;
	if (topic == ""){
		alert("主题不能为空");
		return;
	}
	if (content == ""){
		alert("内容不能为空");
		return;
	}
	$.ajax({
		type:"POST",
		url:"BuyOrderFeedbackAction!addBuyOrderFeedback",
		async:false,
		data:{buyID:buyID,topic:topic,content:content},
		success:function(result){
			result = eval('('+result+')');
			if (result.success){
				alert("我们已收到您的反馈，会在处理完的第一时间与您联系")
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}

function confirmSend(ob){
	var buyID = ob.value;
	buyID = parseInt(buyID);
	
	$.ajax({
		type:"POST",
		url:"BuyOrderAction!confirmSend",
		async:false,
		data:{buyID:buyID},
		success:function(result){
			result=eval('('+result + ')');
			if (result.success){
				alert("您已确认发货，请等待对方收货")
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}

function submitLendOrderFeedback(ob,index){
	var lendID = ob.id;
	lendID = parseInt(lendID);
	var topic = document.getElementsByName("lendoutFeedbackTopic")[index].value;
	var content = document.getElementsByName("lendoutFeedbackContent")[index].value;
	if (topic == ""){
		alert("主题不能为空");
		return;
	}
	if (content == ""){
		alert("内容不能为空");
		return;
	}
	$.ajax({
		type:"POST",
		url:"LendOrderFeedbackAction!addLendOrderFeedback",
		async:false,
		data:{lendID:lendID,topic:topic,content:content},
		success:function(result){
			result = eval('('+result+')');
			if (result.success){
				alert("我们已收到您的反馈，会在处理完的第一时间与您联系")
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}

function confirmLendSend(ob){
	var lendID = ob.value;
	lendID = parseInt(lendID);
	$.ajax({
		type:"POST",
		url:"LendOrderAction!confirmSend",
		async:false,
		data:{lendID:lendID},
		success:function(result){
			result=eval('('+result + ')');
			if (result.success){
				alert("您已确认发货，请等待对方收货")
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}

function confirmReturn(ob){
	var lendID = ob.value;
	lendID = parseInt(lendID);
	$.ajax({
		type:"POST",
		url:"LendOrderAction!confirmReturn",
		async:false,
		data:{lendID:lendID},
		success:function(result){
			result=eval('('+result + ')');
			if (result.success){
				alert("您已确认收货，请为对方作出评价")
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}

function submitLendOrderEvaluate(ob,index){
	var lendID = ob.id;
	var commentTypeSelect = document.getElementsByName("lendCommentType")[index];
	var commentType = commentTypeSelect.options[commentTypeSelect.selectedIndex].value;
	var content = document.getElementsByName("lendCommentContent")[index].value;
	$.ajax({
		type:"POST",
		url:"LendOrderCommentRecordAction!addLendOrderCommentRecord",
		async:false,
		data:{lendID:lendID,commentType:commentType,content:content},
		success:function(result){
			alert(result);
			result=eval('('+result+')');
			if (result.success){
				alert("您已评论成功，祝您生活愉快");
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}
</script>


</body>
</html>