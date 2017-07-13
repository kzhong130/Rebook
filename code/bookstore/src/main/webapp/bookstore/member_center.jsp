<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.User"%>
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
<title>Rebook个人中心</title>


<!-- CSS公共部分 开始 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="css/style.css" rel="stylesheet">
<!-- CSS公共部分 结束 -->
<link rel="stylesheet" href="css/login.css">
<link href="css/crowdfunding.css" rel="stylesheet">

</head>

<%
	User user = (User)session.getAttribute("user");
%>
<body>
	<!-- top + banner 开始 -->
	<nav>
		<div class="container">

			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="test.jsp"><img
					src="images/index1_logo.png" /></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right hidden-sm">
					<li><a href="#" class="td" style="color:#707070">出借/卖书</a> </li>
					<li><a href="test.jsp" class="title">返回首页</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

<div id="gray"></div>
<div class="popup" id="lendsell">

	<div class="top_nav" id='top_nav'>
		<div align="center">
			<span>出借/卖书</span>
			<a class="guanbi"></a>
		</div>
	</div>
	
	<div class="min">
	
		<div class="tc_login">
		
			<div class="right">
				<form method="POST" name="form_login" target="_top" action=<% %>>
					<div align="center">
					    <p style="font-size:14px;color:#707070;float:left;">请输入您出借/卖的书对应的ISBN </p>
						<input type="text" name="ISBN" id="ISBN" required="required" placeholder="ISBN" autocomplete="off" class="input_yh">
						<p style="font-size:5px;color:#fff;"> </p>
					</div>
					<div align="center">
						<input type="submit" class="button" title="" value="查询">
					</div>
				</form> 
			</div>
		
		</div>
	
	</div>

</div>


	<!-- top + banner 结束 -->
	<!-- 核心 开始 -->
	<div class="container border1 nopadding margin10">
		<div id="vertical_navigation"
			class="col-lg-3 background831312 nopadding">
			<div class="dead_pic">
				<span class="hello">你好，</span>
				<br> <span class="username"><%=session.getAttribute("loginUserName") %></span>
			</div>
			<div class="usertype">
				书币余额：<%=user.getBookCoin() %><br> 信用：
				<%
        	if (user.getCredit() > 80 && user.getCredit() <= 100){ 
        %>
				<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
				<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
				<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
				<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
				<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			</div>
			<%} %>
			<%
        	if (user.getCredit() > 60 && user.getCredit() <= 80){
        %>
			<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
			<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
		</div>
		<%} %>
		<%
        	if (user.getCredit() > 40 && user.getCredit() <= 60){
        %>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
		<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	</div>
	<%} %>
	<%
        	if (user.getCredit() > 20 && user.getCredit() <= 40 ){
        %>
	<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	</div>
	<%} %>
	<%
        	if (user.getCredit() >= 0 && user.getCredit() <= 20){
        %>

	<img style="margin-right: 0px;" src="img/member_center/star.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	<img style="margin-right: 0px;" src="img/member_center/xx2.png"></img>
	</div>
	<%} %>
	<div class="menu">
		<div class="menu_title">我的信息</div>
		<div class="menu_list">
			<ul class="list-unstyled">
				<li id="listClick1" class="menu_list_on" onClick="listClick(1)"><img
					src="img/member_center/left_icon_1.png"> 基本信息</li>
				<li id="listClick2" class="" onClick="listClick(2)"><img
					src="img/member_center/left_icon_3.png"> 修改密码</li>
				<li id="listClick3" class="" onClick="listClick(3)"><img
					src="img/member_center/left_icon_9.png"> 书币记录</li>
				<li id="listClick4" class="" onClick="listClick(4)"><img
					src="img/member_center/left_icon_9.png"> 信用纪录</li>
				<li id="listClick5" class="" onClick="listClick(5)"><img
					src="img/member_center/left_icon_5.png"> 我的书评</li>
			</ul>
		</div>
	</div>
	<div class="menu">
		<div class="menu_title">我的订单</div>
		<div class="menu_list">
			<ul class="list-unstyled">
				<li id="listClick6" class="" onClick="listClick(6)"><img
					src="img/member_center/left_icon_6.png"> 我买的书</li>
				<li id="listClick7" class="" onClick="listClick(7)"><img
					src="img/member_center/left_icon_6.png"> 我借的书</li>
			</ul>
		</div>
	</div>
	<div class="menu">
		<div class="menu_title">我的书架</div>
		<div class="menu_list">
			<ul class="list-unstyled">
				<li id="listClick8" class="" onClick="listClick(8)"><img
					src="img/member_center/left_icon_13.png"> 我卖的书</li>
				<li id="listClick9" class="" onClick="listClick(9)"><img
					src="img/member_center/left_icon_13.png"> 出借的书</li>
			</ul>
		</div>
	</div>
	<div class="menu">
		<div class="menu_title">我发送的申请</div>
		<div class="menu_list">
			<ul class="list-unstyled">
				<li id="listClick10" class="" onClick="listClick(10)"><img
					src="img/member_center/left_icon_14.png"> 未被处理</li>
				<li id="listClick11" class="" onClick="listClick(11)"><img
					src="img/member_center/left_icon_16.png"> 已被处理</li>
			</ul>
		</div>
	</div>
	<div class="menu">
		<div class="menu_title">退出</div>
		<div class="menu_list">
			<ul class="list-unstyled">
				<li><a href='AccountAction!logout'><img src="img/member_center/left_icon_1.png"> 退出账号</a></li>
			</ul>
		</div>
	</div>
	</div>
	<div class="col-lg-9">
		<iframe name="left" id="crowdfunding_iframe"
			src="crowdfunding.center/my_info.jsp" frameborder="false"
			scrolling="no" style="border: none;" width="100%" height="1045"
			allowtransparency="true"></iframe>
	</div>
	</div>
	<!-- 核心 结束 -->


	<!-- 版权 开始 -->

	<footer class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<p>
						Rebook, Inc. | SJTU SE Link | ZCX, China, 15021085292 | <abbr
							title="Phone">Phone:</abbr> 15021085292
					</p>
					<p>
						Full Name:<a href="mailto:#">zhichenxi@sjtu.edu.cn</a>
					</p>
					<p>Copyright © Rebook. All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>

	<img id="back_top_jt" class="back_top" onMouseMove="float_call_me(7)"
		onMouseOut="float_call_me(8)" src="img/index/back_top_jt.png">
	<span class="back_top_jt_span">返回顶部</span>

	<!-- 版权 结束 -->

	<!-- 结束 -->
	<!-- JS公共部分 开始 -->
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/basics.js"></script>
	<!-- JS公共部分 结束 -->
	<script src="js/crowdfunding.js"></script>
	<script type="text/javascript">

//点击登录class为td 显示
$(".td").click(function(){
	$("#gray").show();
	$("#lendsell").show();//查找ID为lendsell的DIV show()显示#gray
	tc_center();
});
//点击关闭按钮
$("a.guanbi").click(function(){
	$("#gray").hide();
	$("#lendsell").hide();//查找ID为lendsell的DIV hide()隐藏
})

//窗口水平居中
$(window).resize(function(){
	tc_center();
});

function tc_center(){
	var _top=($(window).height()-$(".popup").height())/2;
	var _left=($(window).width()-$(".popup").width())/2;
	
	$(".popup").css({top:_top,left:_left});
}


function tt(dd){
    //alert(dd);
}
var GG = {
    "kk":function(mm){
       // alert(mm);
    }
}

var books = $('#bookISBNs').val().split("$");
var listCount = parseInt(books.length);
$("#page").initPage(listCount,1,GG.kk);

$(document).ready(function(){ 

	$(".top_nav").mousedown(function(e){ 
		$(this).css("cursor","move");//改变鼠标指针的形状 
		var offset = $(this).offset();//DIV在页面的位置 
		var x = e.pageX - offset.left;//获得鼠标指针离DIV元素左边界的距离 
		var y = e.pageY - offset.top;//获得鼠标指针离DIV元素上边界的距离 
		$(document).bind("mousemove",function(ev){ //绑定鼠标的移动事件，因为光标在DIV元素外面也要有效果，所以要用doucment的事件，而不用DIV元素的事件 
		
			$(".popup").stop();//加上这个之后 
			
			var _x = ev.pageX - x;//获得X轴方向移动的值 
			var _y = ev.pageY - y;//获得Y轴方向移动的值 
		
			$(".popup").animate({left:_x+"px",top:_y+"px"},10); 
		}); 

	}); 

	$(document).mouseup(function() { 
		$(".popup").css("cursor","default"); 
		$(this).unbind("mousemove");
	})
})




</script>
	<script type="text/javascript">
	$("#crowdfunding_iframe").load(function () {
	    var mainheight = $(this).contents().find("body").height() + 30;
	    if (mainheight < 1045){
	    	mainheight = 1045;
	    }
	    $(this).height(mainheight);
	    $("#vertical_navigation").css("height",mainheight+5+"px");
	});
	</script>
</body>
</html>