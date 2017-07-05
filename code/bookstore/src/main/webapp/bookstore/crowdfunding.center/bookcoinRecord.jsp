<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<title>书币记录</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/crowdfunding.center/integration_record.css" rel="stylesheet">
<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- 开始 -->
<div class="my_info_title">书币记录
  <!--<span><button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p></span>-->
  </div>
 <hr>
<div class="integration_record">
  <div class="integration_record_float"> 收支
    <select>
      <option value ="--全部--">--全部--</option>
      <option value ="increase">增加</option>
      <option value ="decrease">减少</option>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    时间范围：</div>
  <div class="input-append date form_datetime integration_record_float">
    <input class="integration_record_time" type="text" value="" readonly>
    <span class="add-on"><i class="icon-th"></i></span> </div>
  <div class="input-append date form_datetime integration_record_float"> &nbsp;-&nbsp;
    <input class="integration_record_time"  type="text" value="" readonly>
    <span class="add-on"><i class="icon-th"></i></span> </div>
  <div class="integration_record_float"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" class="but2" value="查询">
  </div>
</div>
<div class="integration_record_jfjl">
  <div class="integration_record_jfjl_title"> 书币记录 <font class="font_size14">总书币为：<% %></font> </div>
  <div class="integration_record_jfjl_content">
    <table class="table table-bordered text-center">
      <tr class="active">
        <td>操作</td>
        <td>书币数量变更</td>
        <td>详情</td>
        <td>变更时间</td>
      </tr>
      <tr>
        <td>任务奖励<% %></td>
        <td><font class="colord19826">+20<% %></font></td>
        <td>注册会员签到<% %></td>
        <td>2015-07-28 17:26:15<% %></td>                 <!-- 该tr需按数据库多次循环 -->
      </tr>
    </table>
  </div>
  <div class="integration_record_jfjl_page">
    第 1/1 页，共1条记录<% %>                                  <!-- 可以的话实现分页功能 -->
  </div>
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
</script>
</body>
</html>