<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BookComment" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Product Page Template</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap_book.css">
<link rel="stylesheet" href="css/login.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<%
String url;
if (request.getQueryString()!=null){
	url = request.getScheme()+"://"+ request.getServerName()+":8080"+request.getRequestURI()+"?"+request.getQueryString();  
}
else{
	url = request.getScheme()+"://"+ request.getServerName()+":8080"+request.getRequestURI();  
}
session.setAttribute("prePage", url);

%>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="centerPage.jsp"><img src="images/index1_logo.png"/></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      
      <!--<form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>  -->
      
      <ul class="nav navbar-nav navbar-right hidden-sm" id="personalInfo">
        <li><a href="#">我要卖书</a> </li>
        <li><a href="register.jsp">注册</a> </li>
        <li><a href="#" class="tc" >登录</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

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
				<form method="POST" name="form_login" target="_top" action="AccountAction!login">
					<div align="center">
						<i class="icon-mobile-phone"></i>
						<input type="text" name="userName" id="userName" required="required" placeholder="用户名" autocomplete="off" class="input_yh">
						<p style="font-size:5px;color:#fff;"> </p>
						<input type="password" name="password" id="password" required="required" placeholder="密码" autocomplete="off" class="input_mm">
						<!--  <input type="hidden" name="prePage" value="" > -->
					</div>
					<div align="right"><a href="forgetpassword/fp1.jsp">忘记密码</a></div>
					<div align="center" >
						<input type="submit" class="button" title="Sign In" value="登录">
					</div>
				</form> 
				<div align="right">
					<a href="register.jsp" target="_blank">立即注册</a>                                     <!-- 注册的页面 -->
				</div>  
			</div>
		
		</div>
	
	</div>

</div>
<!--
<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <div class="jumbotron">
        <h1 class="text-center">Lorem ipsum dolor sit amet, consectetur.</h1>
        <div class="row">
          <div class="col-lg-2 col-lg-offset-4 col-md-offset-4 col-md-2 col-sm-offset-3 col-sm-3 col-xs-offset-3 col-xs-3">
            <p><a class="btn btn-success btn-lg" href="#" role="button">FREE TRIAL</a> </p>
          </div>
          <div class="col-lg-2 col-md-6 col-sm-6">
            <p><a class="btn btn-primary btn-lg" href="#" role="button">BUY NOW</a> </p>
          </div>
        </div>
        <p class="text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam, vel minima quis commodi atque animi eum unde culpa magnam vero.</p>
        <img src="images/1200X400.gif" alt="" class="img-responsive"> </div>
    </div>
  </div>
</div>
-->
<!--
<div class="container">
  <div class="row">
    <div class="text-center col-sm-6">
      <h3>Lorem ipsum</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum, magnam?</p>
      <a class="btn btn-danger btn-lg" href="#" role="button">Tutorials</a></div>
    <div class="text-center col-sm-6">
      <h3>Lorem ipsum</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum, magnam?</p>
      <a class="btn btn-info btn-lg" href="#" role="button">Documentation</a></div>
  </div>
</div>
<hr>
-->
<%
	Book book = new Book();
    if (session.getAttribute("book")!=null){
    	book = (Book)session.getAttribute("book");
    }
    ArrayList<BookComment> bookComments = new ArrayList<BookComment>();
    bookComments = (ArrayList<BookComment>)session.getAttribute("bookComment");
%>

<!-- 书籍封面&基本信息 -->
<div class="container">
  <div class="row">
    <div class="col-sm-2">
      <div class="thumbnail"> <img src=<%=book.getImage() %> alt="Thumbnail Image 1" class="img-responsive">
        
      </div>
	</div>
	<div class="col-sm-4">
	  <div class="caption">
        <h3><%=book.getBookName() %></h3>
        <p>作者：<%=book.getAuthor() %></p>
        <p>出版社：<%=book.getPublisher() %></p>
        <p>出版日期：<%=book.getPubdate() %></p>
        <p>页数：<%=book.getPageNumber() %></p>
        <p>定价：<%=book.getPrice()%></p>
        <p>ISBN：<%=book.getISBN() %></p>

      </div>
	</div> 
	<div class="col-sm-3">
	  <div class="caption">
        <br><br><br><p>豆瓣评分：<%=book.getDoubanRate() %></p>
        <p>参评人数：<%=book.getRaterNumber() %></p>
        <hr>
        <p><a href="#" class="btn btn-success" role="button">查看发布信息</a></p>
      </div>
	</div> 
  </div>
</div>
<!-- 标签页 -->
<div class="container">
<ul class="nav nav-tabs" style="text-align: center">
  <li class="active">
  	<a href="#bookGeneralContent" data-toggle="tab">内容概述</a>
  </li>
  <li><a href="#bookComment" data-toggle="tab">书籍评价</a>
  </li>
  <li><a href="#bookOwnerInfo" data-toggle="tab">卖家信息</a>
  </li>
</ul>
</div>

<div class="container">
  <div id="myTabContent" class="tab-content">
    <!-- 内容概述 -->
    <div class="tab-pane fade in active" id="bookGeneralContent">
    <hr>
	<p></p>
	<p><%=book.getSummary() %></p>
    </div>
    
  
    <!-- 书籍评论 -->
    <div class="tab-pane fade" id="bookComment">
    <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#addBookComment" style="margin: 5px 0 0 0;float:right;" id="commentButton">添加评论</button>
    	<br><br>
		<hr style="margin-top: 5px">
    	<%if(bookComments.size() <= 0){ %>
    	<p>无评论</p>
    	<%} %>
    	<%
    	if(bookComments.size() > 0){ 
    		for (int i=0;i<bookComments.size();i++){
    			
    	%>
    	<hr>
    	<p><%=bookComments.get(i).getUserName() %>    <%=bookComments.get(i).getCommentTime().toString().substring(0, 19) %></p>
    	<p><%=bookComments.get(i).getContent() %>
    	<%} %>
    	<%} %>
    	
    	<!-- 模态框（Modal） -->
		<div class="modal fade" id="addBookComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" >
					添加评论
					</h4>
				</div>
				<form id="commentForm" class="STYLE-NAME" method="POST" action="BookCommentAction!addBookComment">
				<label>
				<textarea id="content" name="content" placeholder="请输入评论" style="height: 120px; width:580px;resize:none;margin: 10px"></textarea>
				</label>
				<input type="hidden" name="ISBN" value="<%=book.getISBN() %>" >
				<input type="hidden" name="userName" value="<%=session.getAttribute("loginUserName") %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitComment();" data-dismiss="modal">
					提交评论
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</div>
	<!-- 卖家信息 -->
    <div class="tab-pane fade" id="bookOwnerInfo">
    <hr>
    <div class="row">
    <div class="table-responsive">
    <!-- class="table table-hover" -->
    <table class="table" background="images/index1_yellowbg.png">
    	<thead>
    		<tr bgcolor="#efbb24">
    			<th style="text-align: center">卖家</th>
    			<th style="text-align: center">信用</th>
				<th style="text-align: center">新旧程度</th>
   				<th style="text-align: center">送书方式</th>
   				<th style="text-align: center">所在城市</th>
   				<th style="text-align: center">书币</th>
   				<th style="text-align: center">备注</th>
   				<th style="text-align: center">下单</th>
    		</tr>
    	</thead>
    	<tbody>
    		<tr class="text-center"> 
    			<td>zcx</td>
				<td>♥</td>
   				<td>90%</td>
   				<td>快递/上门</td>
   				<td>上海</td>
   				<td>10</td>
   				<td>哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈韩寒会画画后悔画韩红韩红要和韩寒嘿嘿嘿韩寒喊韩红坏坏</td>
   				<td><a class="btn btn-success btn-sm -sm" role="button">借书</a></td>
    		</tr>
    		<tr class="text-center">
    			<td>zk</td>
    			<td>♥♥♥</td>
   				<td>90%</td>
   				<td>快递</td>
   				<td>上海</td>
   				<td>10</td>
   				<td>哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈韩寒会画画后悔画韩红韩红要和韩寒嘿嘿嘿韩寒喊韩红坏坏</td>
				<td><a class="btn btn-success btn-sm" role="button">借书</a></td>
    		</tr>
    	</tbody>
    </table>
    </div>
    <!--
    <div class="col-lg-12 col-sm-6">
      <div class="panel panel-default panel-success"> 
        <div class="panel-heading">
          <h5>Free</h5>
        </div>
        <table class="table">
          <thead>
            <tr>
              <th>Lorem ipsum dolor sit</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1 ......</th>
            </tr>
            <tr>
              <th scope="row">2 ......</th>
            </tr>
            <tr>
              <th scope="row">3 ......</th>
            </tr>
            <tr>
              <th scope="row"><p class="text-center"><a href="" class="btn-success btn"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Buy Now</a></p></th>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div class="col-lg-12 col-sm-6">
      <div class="panel panel-default panel-warning"> 
        <div class="panel-heading">
          <h3>Basic</h3>
        </div>
        <table class="table">
          <thead>
            <tr>
              <th>Lorem ipsum dolor sit</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1 ......</th>
            </tr>
            <tr>
              <th scope="row">2 ......</th>
            </tr>
            <tr>
              <th scope="row">3 ......</th>
            </tr>
            <tr>
              <th scope="row"><p class="text-center"><a href="" class="btn-warning btn"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Buy Now</a></p>
              </th>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    
    <div class="col-lg-12 col-sm-6">
      <div class="panel panel-default panel-info"> 
        <div class="panel-heading">
          <h3>Professional</h3>
        </div>
        <table class="table">
          <thead>
            <tr>
              <th>Lorem ipsum dolor sit</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1 ......</th>
            </tr>
            <tr>
              <th scope="row">2 ......</th>
            </tr>
            <tr>
              <th scope="row">3 ......</th>
            </tr>
            <tr>
              <th scope="row"><p class="text-center"><a href="" class="btn-info btn"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Buy Now</a></p></th>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div class="col-lg-12 col-sm-6">
      <div class="panel panel-default panel-danger"> 
        <div class="panel-heading">
          <h3>Enterprise</h3>
        </div>
        <table class="table">
          <thead>
            <tr>
              <th>Lorem ipsum dolor sit</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1 ......</th>
            </tr>
            <tr>
              <th scope="row">2 ......</th>
            </tr>
            <tr>
              <th scope="row">3 ......</th>
            </tr>
            <tr>
              <th scope="row"><p class="text-center"><a href="" class="btn-danger btn"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Buy Now</a></p></th>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    -->
    </div>
	</div>
  </div>
</div>
<hr>
<!-- 书籍评价 -->
<!--
<div class="container">
  <div class="row">
<div class="col-lg-4 col-md-6 col-sm-6">
      <h2>Contact Us</h2>
      <address>
      <strong>MyCompany, Inc.</strong><br>
      Sunny Autumn Plaza, Grand Coulee,<br>
      CA, 91308-4075, US<br>
      <abbr title="Phone">P:</abbr> (123) 456-7890
      </address>
      <h4>Social</h4>
      <div class="row">
      	<div class="col-xs-2"><img class="img-circle" src="images/32X32.gif" alt=""></div>
      	<div class="col-xs-2"><img class="img-circle" src="images/32X32.gif" alt=""></div>
      	<div class="col-xs-2"><img class="img-circle" src="images/32X32.gif" alt=""></div>
      	<div class="col-xs-2"><img class="img-circle" src="images/32X32.gif" alt=""></div>        
      </div>
</div>
    <div class="col-lg-4 col-md-6 col-sm-6">
      <h2>Testimonials</h2>
      <div class="media">
        <div class="media-left"> <a href="#"> <img class="media-object" src="images/35X35.gif" alt="..."> </a> </div>
        <div class="media-body">
          <h4 class="media-heading">Media heading</h4>
          Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. </div>
      </div>
      <div class="media">
        <div class="media-left"> <a href="#"> <img class="media-object" src="images/35X35.gif" alt="..."> </a> </div>
        <div class="media-body">
          <h4 class="media-heading">Media heading</h4>
          Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-12">
      <h2>About Us</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas, voluptates, soluta velit nostrum ut iste exercitationem vitae ipsum repellendus laudantium ab possimus nemo odio cumque illum nulla laborum blanditiis unde.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas, voluptates, soluta velit nostrum ut iste exercitationem vitae ipsum repellendus laudantium ab possimus nemo odio cumque illum nulla laborum blanditiis unde.</p>
    </div>
  </div>
</div>
 
<footer class="text-center">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <p>Copyright © MyWebsite. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>
-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
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

/*jQuery(document).ready(function($){  
        $("form#login").submit(function(form)  
            {  
  
                $.ajax({  
                    url: "LoginAction",  
                    method: 'POST',  
                    dataType: 'text',  
                    data: {   
                        userName: $("form#login").find('#userName').val(),  
                        password: $(form).find('#password').val()  
                    },  
                    success: function (json) {  
                        var obj = $.parseJSON(json);  //使用这个方法解析json  
                        var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的   
                        if(state_value=="true"){  
                            alert("true");  
                        }else{  
                            alert("false");  
                        }  
                    },  
                    error: function (json) { 
                        alert("json=" + json);  
                        return false;  
                    }  
                });  
  
            }) 
        }) */

var login_status='<%=session.getAttribute("login")%>';
if (login_status=='error'){
	alert("登录失败");
	<% session.removeAttribute("login"); %>
}

var userName = '<%=session.getAttribute("loginUserName")%>'

if (userName != "null"){

	var str = "<li><a href='#'>我要卖书</a>";
	str += "<li><a href='MemberCenterAction!initialize'>个人中心</a>"
	str+="<li><a href='AccountAction!logout'>登出</a>"
	$('#personalInfo').html(str);
}

$("#commentButton").click(function(){
	if (userName=="null"){
		alert("请先登录！");
		$(this).attr("data-target","");
	}
})

function submitComment(){
	var comment=document.getElementById("content").value;
	if (comment==""){
		alert("评论不能为空");
	}
	else{
		document.getElementById("commentForm").submit();
		location='#bookComment';
	}
	
}
</script>
</body>
</html>
