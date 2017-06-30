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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
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
        <li><a href="#">注册</a> </li>
        <li><a href="#">登陆</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>
<div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
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
</div>


  <nav class="text-center">
    <!-- Add class .pagination-lg for larger blocks or .pagination-sm for smaller blocks-->
    <ul class="pagination">
      <li> <a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
      <li class="active">
      <%
      	int pages=bookList.size()/20;
    	if(pages==0) pages=1; 
    	for(int i=1;i<=pages;i++){
    	
      %>
      <li><a href="#"><%=i %></a></li>
     <%
    	}
     %>
      <li> <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
    </ul>
  </nav>
</div>
<hr>

<!--
  <div class="container well">
    <div class="row">
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-7">
        <div class="row">
          <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
            <div>
              <ul class="list-unstyled">
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4 col-md-4 col-lg-4  col-xs-6">
            <div>
              <ul class="list-unstyled">
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
            <div>
              <ul class="list-unstyled">
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
                <li> <a>Link anchor</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-5"> 
        <address>
        <strong>Rebook, Inc.</strong><br>
        SJTU SE Link<br>
        ZCX, China, 15021085292<br>
        <abbr title="Phone">Phone:</abbr> 15021085292
       </address>
        <address>
        <strong>Full Name</strong><br>
        <a href="mailto:#">zhichenxi@sjtu.edu.cn</a>
        </address>
        </div>
    </div>
  </div>-->

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
</body>
</html>