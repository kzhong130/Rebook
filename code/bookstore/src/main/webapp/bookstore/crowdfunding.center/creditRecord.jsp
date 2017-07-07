<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="model.CreditChangeRecord"%> 
<%@page import="java.util.ArrayList" %> 
<%@page import="model.User" %> 
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
<title>信用记录</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/crowdfunding.center/integration_record.css" rel="stylesheet">
<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
	ArrayList<CreditChangeRecord> creditChangeRecords = new ArrayList<CreditChangeRecord>();
	creditChangeRecords = (ArrayList<CreditChangeRecord>)session.getAttribute("creditChangeRecord");
	User user = (User)session.getAttribute("user");
%>
<body>
<!-- 开始 -->
<div class="my_info_title">信用记录
  <!--<span><button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p></span>-->
  </div>
 <hr>
<div class="integration_record">
  <div class="integration_record_float"> 变更
    <select id="showType">
      <option value ="--全部--">--全部--</option>
      <option value ="increase">增加</option>
      <option value ="decrease">减少</option>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    时间范围：</div>
  <div class="input-append date form_datetime integration_record_float">
    <input class="integration_record_time" type="text" id="startTime" value="" readonly>
    <span class="add-on"><i class="icon-th"></i></span> </div>
  <div class="input-append date form_datetime integration_record_float"> &nbsp;-&nbsp;
    <input class="integration_record_time"  type="text" id="endTime" value="" readonly>
    <span class="add-on"><i class="icon-th"></i></span> </div>
  <div class="integration_record_float"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" class="but2" value="查询" id="searchButton">
  </div>
</div>
<div class="integration_record_jfjl">
  <div class="integration_record_jfjl_title"> 信用变更记录 <font class="font_size14">目前信用值为：<%=user.getCredit() %></font> </div>
  <div class="integration_record_jfjl_content">
    <table class="table table-bordered text-center" id="myTable">
      <tr class="active">
        <td>信用变更</td>
        <td>详情</td>
        <td>变更时间</td>
      </tr>
      <%
      		String number;
      		String reason="";
      		if (creditChangeRecords.size() > 0){
      			for (int i = 0; i < creditChangeRecords.size(); i++){
      				if (creditChangeRecords.get(i).getNumber() > 0){
      					number = "+"+Integer.toString(creditChangeRecords.get(i).getNumber());
      				}
      				else{
      					number = Integer.toString(creditChangeRecords.get(i).getNumber());
      				}
      				if("good seller".equals(creditChangeRecords.get(i).getReason())){
      					reason = "卖书成功并收获好评";
      				}
      				if("good lendin".equals(creditChangeRecords.get(i).getReason())){
      					reason = "借入书籍并收获好评";
      				}
      				if("good lendout".equals(creditChangeRecords.get(i).getReason())){
      					reason = "借出书籍并收获好评";
      				}
      				if("bad seller".equals(creditChangeRecords.get(i).getReason())){
      					reason = "卖书后收到差评";
      				}
      				if("bad lendin".equals(creditChangeRecords.get(i).getReason())){
      					reason = "借入书籍收到差评";
      				}
      				if ("bad lendout".equals(creditChangeRecords.get(i).getReason())){
      					reason = "借出书籍收到差评";
      				}
      				if ("other".equals(creditChangeRecords.get(i).getReason())){
      					reason = "其他";
      				}
      %>
      <tr id="tableRow">
      	<td><font class="colord19826"><%=number %></font></td>
        <td><%=reason %></td>
        <td><%=creditChangeRecords.get(i).getTime().toString().substring(0, 19) %></td>
      </tr>
      <%} %>
      <%} %>
    </table>
  </div>
  <!-- <div class="integration_record_jfjl_page">
    第 1/1 页，共1条记录<% %>                             
  </div>-->
</div>

<!-- 结束 --> 
<script src="../js/jquery-2.1.1.min.js"></script> 
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/bootstrap-datetimepicker.min.js"></script> 
<script src="../js/bootstrap-datetimepicker.zh-CN.js"></script> 
<script src="../js/my_info.js"></script>
<script>
//JavaScript Document
$(document).ready(function(){
	$(".form_datetime").datetimepicker({
        format: "yyyy-mm-dd",
		language: "zh-CN",
        autoclose: true,
        todayBtn: true,
		startView: 2,
		minView: 2,
        startDate: "2015-01-01 10:00",
        minuteStep: 10
    });
});

$("#searchButton").click(function(){
	//alert($("#showType").val());
	//alert(mytable.rows[1].cells[0].innerText[0]);
	var showType = $("#showType").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var mytable = document.getElementById("myTable");
	if (startTime != ""){
		startTime += " 00:00:00";
	}
	if (endTime != ""){
		endTime += "23:59:59";
	}
	if (startTime == "" && endTime != ""){
		alert("请输入开始时间！");
	}
	else if (startTime !="" && endTime ==""){
		alert("请输入结束时间！");
	}
	else if (endTime < startTime){
		alert("结束时间不能比开始时间早！");
		
	}
	
	else{
		if(showType=="--全部--" && startTime == "" && endTime == ""){
			for (var i=1; i<myTable.rows.length; i++){
				mytable.rows[i].style.display="";
			}
		}
		else if (showType== "--全部--" && startTime !="" && endTime != ""){
			for (var i=1; i<mytable.rows.length; i++){
				if (mytable.rows[i].cells[2].innerText < startTime || mytable.rows[i].cells[2].innerText > endTime){
					mytable.rows[i].style.display="none";
				}
				else{
					mytable.rows[i].style.display="";
				}
			}
		}
		else if (showType == "increase" && startTime == "" && endTime == ""){
			for (var i=1; i<mytable.rows.length; i++){
				if (mytable.rows[i].cells[0].innerText[0] == "-"){
					mytable.rows[i].style.display="none";
				}
				else{
					mytable.rows[i].style.display="";
				}
			}
		}
		else if (showType == "increase" && startTime != "" && endTime != ""){
			for (var i=1; i<mytable.rows.length; i++){
				if (mytable.rows[i].cells[0].innerText[0] == "-" || mytable.rows[i].cells[2].innerText < startTime || mytable.rows[i].cells[2].innerText > endTime){
					mytable.rows[i].style.display="none";
				}
				else{
					mytable.rows[i].style.display="";
				}
			}
		}
		else if (showType == "decrease" && startTime =="" && endTime == ""){
			for (var i=1; i<mytable.rows.length; i++){
				if (mytable.rows[i].cells[0].innerText[0] == "+"){
					mytable.rows[i].style.display = "none";
				}
				else{
					mytable.rows[i].style.display="";
				}
			}
		}
		else if (showType == "decrease" && startTime !="" && startTime != ""){
			for (var i=1; i<mytable.rows.length; i++){
				if (mytable.rows[i].cells[0].innerText[0] == "+" || mytable.rows[i].cells[2].innerText < startTime || mytable.rows[i].cells[2].innerText > endTime){
					mytable.rows[i].style.display = "none";
				}
				else{
					mytable.rows[i].style.display="";
				}
			}
		}
	}
	$("#startTime").val("");
	$("#endTime").val("");
	
})
</script>
</body>
</html>