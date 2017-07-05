<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.Book" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Product Page Template</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap_book.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="centerPage.jsp"><img src="images/index1_logo.png"/></a> </div>
    
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
    if (request.getAttribute("book")!=null){
    	book = (Book)request.getAttribute("book");
    }
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
    	<hr>
    	<p>zcx 2017-07-03</p>
    	<p>令人意外的文本，好看得出人意料，可以打六星</p>
    	<hr>
    	<p>zk 2017-05-02</p>
    	<p>每个孩子的生命最初都需要一个超级英雄，为他们保驾护航，告诉他们可以特立独行，谁说女孩TMD不能穿蜘蛛侠的衣服？谁说谁滚边儿去！而每个孩子的超级英雄终将离开，因为在说＂回见＂而非＂再见＂的那天，曾经的孩子自己已成为了别人的超级英雄。</p>
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
</body>
</html>
