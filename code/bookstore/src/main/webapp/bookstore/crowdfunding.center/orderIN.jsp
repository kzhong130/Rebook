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
<title>买入/借入</title>

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
	ArrayList<BuyOrder> buyOrders = (ArrayList<BuyOrder>)session.getAttribute("buyOrders");
	ArrayList<BookIN> bookINsByBuyOrders = (ArrayList<BookIN>)session.getAttribute("bookINsByBuyOrders");
	ArrayList<Book> booksByBuyOrders = (ArrayList<Book>)session.getAttribute("booksByBuyOrders");
	ArrayList<LendOrder> lendinOrders = (ArrayList<LendOrder>)session.getAttribute("lendinOrders");
	ArrayList<BookIN> bookINsByLendinOrders = (ArrayList<BookIN>)session.getAttribute("bookINsByLendinOrders");
	ArrayList<Book> booksByLendinOrders = (ArrayList<Book>)session.getAttribute("booksByLendinOrders");
%>
<body>

<div class="my_info_title">买入/借入 </div>
<br>
<div class="my_info_title_3">
  <ul>
    <li id="mybuyin" onClick="change(1)" style="border-bottom: 1px solid #d19826; color: #d19826;">
        <a href="#buyIN" data-toggle="tab" >我的买入</a>
    </li>
    <li id="mylendin" onClick="change(2)"><a href="#lendIN" data-toggle="tab" >我的借入</a></li>
  </ul>
</div>
<br>


<div>
  <div id="myTabContent" class="tab-content">
  
   <!-- 我的买入 -->
   <div class="tab-pane fade in active" id="buyIN">
	<%
		if (buyOrders.size() > 0){
			for (int i=0; i<buyOrders.size(); i++){
				BuyOrder buyOrder = buyOrders.get(i);
				BookIN bookIN = bookINsByBuyOrders.get(i);
				Book book = booksByBuyOrders.get(i);
				String cityInfo = "";
				if (bookIN.getCity().equals("")){	//直辖市
					cityInfo = bookIN.getProvince() + " " + bookIN.getTown();
				}
				if (!bookIN.getCity().equals("")){	//非直辖市
					cityInfo = bookIN.getProvince() + " " + bookIN.getCity();
				}
				String recency = "";
				if ("20%".equals(bookIN.getRecency())){
					recency = "两成新";
				}
				if ("50%".equals(bookIN.getRecency())){
					recency = "五成新";
				}
				if ("80%".equals(bookIN.getRecency())){
					recency = "八成新";
				}
				if ("100%".equals(bookIN.getRecency())){
					recency = "全新";
				}
				
				String sendWay = "";
				if ("mail".equals(bookIN.getSendWay())){
					sendWay = "邮寄";
				}
				if ("face".equals(bookIN.getSendWay())){
					sendWay = "当面";
				}
				
				String note = bookIN.getNote();
				if ("".equals(note)){
					note = "无";
				}
	%>
	  <!-- 每个订单 -->
	  <div class="boxtitle"><%=buyOrder.getCreateTime().toString().substring(0, 10) %>&emsp;&emsp;订单号：<%=buyOrder.getBuyID() %>&emsp;&emsp;&emsp;&emsp;<%=buyOrder.getOwnerName() %>
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
              <p class="comment">书主信息：<%=bookIN.getOwnerName() %>&nbsp;&nbsp;<%=bookIN.getOwnerPhone() %>&nbsp;&nbsp;</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<%=cityInfo %></p>
              <p class="comment">新旧程度：<%=recency %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=sendWay %></p>
              <p class="comment">备注：<%=note %></p>
              </td>

              
              <td style="vertical-align:top;height:181px;" >
              <p class="time">收货人：<%=buyOrder.getReceiver() %>
              <img style="height:20px;width:20px;margin:0 -1px 3px -2px;" src="../images/person_info.png" title="<%=buyOrder.getReceiver()+" "+buyOrder.getBuyPhone()+" "+buyOrder.getBuyAddress() %>">
              </p>
              <p class="time">书币：<span class="coin"><%=bookIN.getCoinNumber() %></span></p>
              <div class="deletebutton" style="padding-top:85px;">
              <%if (buyOrder.getStatus().equals("1")){ %>
               <button class="nothing" style="width:90px" id="application" onclick="alert('书主尚未发货，请耐心等待')">尚未发货</button>
               <%} %>
               <%if (buyOrder.getStatus().equals("3")){ %>
               <button class="delete" style="width:90px" id="application" value="<%=buyOrder.getBuyID()%>" onclick="confirmBuy(this)">确认收货</button> 
               <%} %>
               <%if (buyOrder.getStatus().equals("4")){ %>
               <button class="evaluate" style="width:90px" id="evaluateButton"  data-toggle="modal"  data-target="#evaluate<%=i %>">评价</button>
               <%} %>
               <%if (buyOrder.getStatus().equals("5")){ %>
               <button class="nothing" style="width:90px" id="evaluateButton" onclick="alert('您已经评价，不能再次评价')">已评价</button>
              <%} %>
              </div>
              </td>
              
              </tr>
              </table>
              
            </td>
            </tr>
		    </table>
		 </div>   
		<!-- 反馈模态框（Modal） -->
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
                <td><input type="text" name="buyFeedbackTopic" id="topic" value="" placeholder="请输入反馈主题" class="" style="width:90%"> </td>  
                </tr>
                <tr>
                <td style="vertical-align:top;padding-top:10px;"><span>内容：</span></td>
				<td><textarea id="content" name="buyFeedbackContent" placeholder="请输入具体内容" style="height: 120px; width:90%;resize:none;margin:10px 0;text-align:left;" value=""></textarea>
				</td></tr>
				</table></div>
				<input type="hidden" name="" value="<% %>" >
				<input type="hidden" name="" value="<% %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitBuyOrderFeedback(this,<%=i %>);" data-dismiss="modal" id="<%=buyOrder.getBuyID() %>">
					提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		    </div><!-- /.modal -->
	     </div>
         <!-- 评价模态框（Modal） -->
		<div class="modal fade" id="evaluate<%=i %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                     <select name="buyCommentType" class="">
                     <option value ="good">好评</option>
                     <option value ="normal">中评</option>
                     <option value ="bad">差评</option>
                     </select></p></div>  </td>  
                </tr>
                <tr>
                <td style="vertical-align:top;padding-top:10px;"><span>评价内容：</span></td>
				<td><textarea id="evaluatecontent" name="buyCommentContent" placeholder="请输入具体内容" style="height: 120px; width:90%;resize:none;margin:10px 0;text-align:left;"></textarea>
				</td></tr>
				</table></div>
				<input type="hidden" name="" value="<% %>" >
				<input type="hidden" name="" value="<% %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitBuyOrderEvaluate(this,<%=i %>);" data-dismiss="modal" id="<%=buyOrder.getBuyID() %>">
					提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		    </div><!-- /.modal -->
	     </div>   
 <%} %>       
 <%} %>       
  </div>
  <!-- buyINend -->    
  
  <!-- 我的借入 -->
  <div class="tab-pane fade" id="lendIN">
	<%
		if (lendinOrders.size() > 0){
			for (int i=0; i<lendinOrders.size(); i++){
				LendOrder lendOrder = lendinOrders.get(i);
				BookIN bookIN = bookINsByLendinOrders.get(i);
				Book book = booksByLendinOrders.get(i);
				String cityInfo ="";
				String addressInfo = "";
				if (bookIN.getCity().equals("")){	//直辖市
					cityInfo = bookIN.getProvince() + " " + bookIN.getTown();
					addressInfo = bookIN.getOwnerAddress();
				}
				if (!bookIN.getCity().equals("")){	//非直辖市
					cityInfo = bookIN.getProvince() + " " + bookIN.getCity();
					addressInfo = bookIN.getTown() + bookIN.getOwnerAddress();
				}
				
				String recency = "";
				if ("20%".equals(bookIN.getRecency())){
					recency = "两成新";
				}
				if ("50%".equals(bookIN.getRecency())){
					recency = "五成新";
				}
				if ("80%".equals(bookIN.getRecency())){
					recency = "八成新";
				}
				if ("100%".equals(bookIN.getRecency())){
					recency = "全新";
				}
				
				String sendWay = "";
				if ("mail".equals(bookIN.getSendWay())){
					sendWay = "邮寄";
				}
				if ("face".equals(bookIN.getSendWay())){
					sendWay = "当面";
				}
				
				String note = bookIN.getNote();
				if ("".equals(note)){
					note = "无";
				}
				
				String returnDate = "";
				int longestDuration = bookIN.getLongestDuration();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String str = lendOrder.getCreateTime().toString().substring(0, 10);
				Date date = sdf.parse(str,new ParsePosition(0));
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				calendar.add(Calendar.DATE,longestDuration);
				Date date1 = calendar.getTime();
				returnDate = sdf.format(date1);
				
				String returnWay = "";
				if ("mail".equals(lendOrder.getReturnWay())){
					returnWay = "邮寄";
				}
				if ("face".equals(lendOrder.getReturnWay())){
					returnWay = "当面";
				}
	%>
	  <!-- 每个订单 -->
	  <div class="boxtitle"><%=lendOrder.getCreateTime().toString().substring(0, 10) %>&emsp;&emsp;订单号：<%=lendOrder.getLendID() %>&emsp;&emsp;&emsp;&emsp;<%=lendOrder.getOwnerName() %>
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
              <p class="comment">书主信息：<%=bookIN.getOwnerName() %>&nbsp;&nbsp;<%=bookIN.getOwnerPhone() %>&nbsp;&nbsp;</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<%=cityInfo %></p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<%=addressInfo %></p>
              <p class="comment">新旧程度：<%=recency %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=sendWay %></p>
              <p class="comment">备注：<%=note %></p>
              </td>

              
              <td style="vertical-align:top;height:181px;" >
              <p class="time">收货人：<%=lendOrder.getReceiver() %>
              <img style="height:20px;width:20px;margin:0 -1px 3px -2px;" src="../images/person_info.png" title="<%=lendOrder.getReceiver()+" "+lendOrder.getLendPhone()+" "+lendOrder.getLendAddress() %>">
              </p>
              <p class="time">还书时间：<%=returnDate %></p>
              <p class="time">还书方式：<%=returnWay %></p>
              <p class="time">书币：<span class="coin"><%=bookIN.getCoinNumber() %></span></p>
              <div class="deletebutton">
              <%if (lendOrder.getStatus().equals("1")){ %>
              <button class="nothing" style="width:90px" id="application" onclick="alert('书主尚未发货，请耐心等待')">尚未发货</button>
              <%} %>
              <%if (lendOrder.getStatus().equals("3")){ %>
              <button class="delete" style="width:90px" id="application" value="<%=lendOrder.getLendID()%>" onclick="confirmLend(this)">确认收货</button> 
              <%} %>
              <%if (lendOrder.getStatus().equals("4")){ %>
              <button class="delete" style="width:90px" id="application" value="<%=lendOrder.getLendID() %>" onclick="returnLend(this)">我已还书</button>
              <%} %>
              <%if (lendOrder.getStatus().equals("5")){ %>
              <button class="nothing" style="width:90px" id="application" onclick="alert('书主尚未收到书籍，请耐心等待')">书主暂未收货</button>
              <%} %>
              <%if (lendOrder.getStatus().equals("6") || lendOrder.getStatus().equals("7")){%>
              <button class="evaluate" style="width:90px" id="evaluateButton2"  data-toggle="modal"  data-target="#evaluate2<%=i %>">评价</button>
              <%} %>
              <%if (lendOrder.getStatus().equals("8") || lendOrder.getStatus().equals("9")){ %>
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
		<!-- 反馈模态框（Modal） -->
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
                <td><input type="text" name="lendFeedbackTopic" id="topic" value="" placeholder="请输入反馈主题" class="" style="width:90%"> </td>  
                </tr>
                <tr>
                <td style="vertical-align:top;padding-top:10px;"><span>内容：</span></td>
				<td><textarea id="content" name="lendFeedbackContent" placeholder="请输入具体内容" style="height: 120px; width:90%;resize:none;margin:10px 0;text-align:left;"></textarea>
				</td></tr>
				</table></div>
				<input type="hidden" name="" value="<% %>" >
				<input type="hidden" name="" value="<% %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitLendOrderFeedback(this,<%=i %>);" data-dismiss="modal" id="<%=lendOrder.getLendID() %>">
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
					<button type="button" class="btn btn-success"  onClick="submitLendOrderEvaluate(this,<%=i %>);" data-dismiss="modal" id=<%=lendOrder.getLendID() %>>
					提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		    </div><!-- /.modal -->
	     </div>         
<%} %>
<%} %>        
  </div>
  <!-- lendINend --> 




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
		$("#mybuyin").attr("style","border-bottom: 1px solid #d19826; color: #d19826;");
		$("#mylendin").attr("style","");
	}
	if(value == 2){
		$("#mybuyin").attr("style","");
		$("#mylendin").attr("style","border-bottom: 1px solid #d19826; color: #d19826;");
	}
}

function confirmBuy(ob){	//买书订单确认收货
	var buyID = ob.value;
	buyID = parseInt(buyID);
	
	$.ajax({
		type:"POST",
		url:"BuyOrderAction!confirmBook",
		async:false,
		data:{buyID:buyID},
		success:function(result){
			result=eval('('+result + ')');
			if (result.success){
				alert("您已确认收货，请对对方作出评价")
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}

function confirmLend(ob){		//借书订单确认收货
	var lendID = ob.value;
	lendID = parseInt(lendID);
	
	$.ajax({
		type:"POST",
		url:"LendOrderAction!confirmBook",
		async:false,
		data:{lendID:lendID},
		success:function(result){
			result=eval('('+result+')');
			if (result.success){
				alert("您已确认收货，请在规定时间内还书");
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}

function returnLend(ob){		//借书订单“我已还书”
	var lendID = ob.value;
	lendID = parseInt(lendID);
	$.ajax({
		type:"POST",
		url:"LendOrderAction!returnLend",
		async:false,
		data:{lendID:lendID},
		success:function(result){
			result = eval('('+result+')');
			if (result.success){
				alert("您已还书，请等待书主确认");
				location.reload();
			}
			else{
				alert("操作失败");
				location.reload();
			}
		}
	})
}

function submitBuyOrderFeedback(ob,index){
	var buyID = ob.id;
	buyID = parseInt(buyID);
	var topic = document.getElementsByName("buyFeedbackTopic")[index].value;
	var content = document.getElementsByName("buyFeedbackContent")[index].value;
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

function submitLendOrderFeedback(ob,index){
	var lendID = ob.id;
	lendID = parseInt(lendID);
	var topic = document.getElementsByName("lendFeedbackTopic")[index].value;
	var content = document.getElementsByName("lendFeedbackContent")[index].value;
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


function submitBuyOrderEvaluate(ob,index){
	var buyID = ob.id;
	var commentTypeSelect = document.getElementsByName("buyCommentType")[index];
	var commentType = commentTypeSelect.options[commentTypeSelect.selectedIndex].value;
	var content = document.getElementsByName("buyCommentContent")[index].value;
	$.ajax({
		type:"POST",
		url:"BuyOrderCommentRecordAction!addBuyOrderCommentRecord",
		async:false,
		data:{buyID:buyID,commentType:commentType,content:content},
		success:function(result){
			result=eval('('+result+')');
			if (result.success){
				alert("您已评价成功，祝您生活愉快");
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