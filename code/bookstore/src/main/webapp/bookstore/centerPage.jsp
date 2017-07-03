<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Rebook</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/index_style.css">
<link rel="stylesheet" href="css/login.css">

   
<%@page import="model.Book"%>    
<%@page import="java.util.ArrayList" %>    
    
</head>
<body>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#"><img src="images/index1_logo.png"/></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-right hidden-sm">
        <li><a href="#">我要卖书</a> </li>
        <li><a href="register.jsp">注册</a> </li>
        <li><a href="#" class="tc">登录</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<div id="gray"></div>
<div class="popup" id="popup">

	<div class="top_nav" id='top_nav'>
		<div align="center">
			<span>登录账号</span>
			<a class="guanbi"></a>
		</div>
	</div>
	
	<div class="min">
	
		<div class="tc_login">
		
			<div class="right">
				<form method="POST" name="form_login" target="_top">
					<div align="center">
						<i class="icon-mobile-phone"></i>
						<input type="text" name="name" id="name" required="required" placeholder="用户名" autocomplete="off" class="input_yh">
						<p style="font-size:5px;color:#fff;"> </p>
						<input type="password" name="pass" id="pass" required="required" placeholder="密码" autocomplete="off" class="input_mm">
					</div>
					<div align="right"><a href="">忘记密码</a></div>
					<div align="center">
						<input type="submit" class="button" title="Sign In" value="登录">
					</div>
				</form> 
				<div align="right">
					<a href="#" target="_blank">立即注册</a>                                     <!-- 注册的页面 -->
				</div>  
			</div>
		
		</div>
	
	</div>

</div>


<div class="container">
    <div class="row">
      <!-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">-->
        <div id="carousel1" class="carousel slide" weight=1920px>
          <ol class="carousel-indicators">
            <li data-target="#carousel1" data-slide-to="0" class="active"> </li>
            <li data-target="#carousel1" data-slide-to="1" class=""> </li>
            <li data-target="#carousel1" data-slide-to="2" class=""> </li>
          </ol>
          <div class="carousel-inner" >
            <div class="item"> <img class="img-responsive" src="images/index1_banner.png" alt="thumb" >
            </div>
            <div class="item active"> <img class="img-responsive" src="images/index1_banner.png" alt="thumb">
            </div>
            <div class="item"> <img class="img-responsive" src="images/index1_banner.png" alt="thumb">
            </div>
          </div>
          <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next"></span></a></div>
     
     </div>
    <hr>
  </div>
<div class="container" >
    
    <div class="center-block" style="width:100px;">
      <ul class="nav navbar-nav navbar-right hidden-sm" >
        <li class="dropdown"> 
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
             aria-expanded="false" aria-haspopup="true">有书读 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">有书读</a> </li>
            <li><a href="#">有书买</a> </li>
          </ul>
        </li>
    </ul>
    </div>
    
</div>

	<%
		int pageNum=0;
		if(session.getAttribute("page")!=null){
			pageNum=(Integer)session.getAttribute("page");
		}
		ArrayList<Book> bookList = new ArrayList<Book>();
			if (session.getAttribute("books") != null) {
				bookList = (ArrayList<Book>) session.getAttribute("books");
			}
	%>


<div class="container">
<hr>
 <div class="center">
  <%
  	int max=pageNum*20;
  	for(int i=(pageNum-1)*20;i<bookList.size()&&i<max;i++){
  		Book book = bookList.get(i);
  %>	
    <div class="background">
     <a href="<% %>"><img class="listbook" src=<%=book.getImage() %> />
     <br> <br><%=book.getBookName() %><br><%=book.getAuthor() %></a></div>
  
  
  
  <%
  } %>
  <br>
</div>
</div>
<!--
<div class="container">
  <nav class="text-center">
    <ul class="pagination">
      <li> <a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
      <li class="active">
      <%
      	int pages=(bookList.size()+1)/20;
    	for(int i=1;i<=pages;i++){
    	
      %>
      <li><a href="#"><%=i %></a></li>
     <%
    	}
     %>
      <li> <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
    </ul>
  </nav>
</div>-->
  <br>
<div class="zzsc"> 
<!--currentpage="1" numbercount="100"-->
<ul class="page" maxshowpageitem="5" pagelistcount="10"  id="page"></ul>


</div>


<hr>

<footer class="text-center">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <p>
        Rebook, Inc. | SJTU SE Link | ZCX, China, 15021085292 | <abbr title="Phone">Phone:</abbr> 15021085292
       </p>
        <p>
        Full Name:<a href="mailto:#">zhichenxi@sjtu.edu.cn</a>
        </p>
        <p>Copyright © Rebook. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/page.js"></script>
<script type="text/javascript">
//窗口效果
//点击登录class为tc 显示
$(".tc").click(function(){
	$("#gray").show();
	$("#popup").show();//查找ID为popup的DIV show()显示#gray
	tc_center();
});
//点击关闭按钮
$("a.guanbi").click(function(){
	$("#gray").hide();
	$("#popup").hide();//查找ID为popup的DIV hide()隐藏
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

$("#page").initPage(71,1,GG.kk);

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
	});
}) 
</script>

</body>
</html>