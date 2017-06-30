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
        <li><a href="javascript:showDialog();">注册</a> </li>
        <li><a href="#">登陆</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<div class="ui-mask" id="mask" onselectstart="return false" style="display:none;"></div>

<div class="ui-dialog" id="dialogMove" onselectstart='return false;' >
	<div class="ui-dialog-title" id="dialogDrag"  onselectstart="return false;"  >
		
		登录通行证

		<a class="ui-dialog-closebutton" href="javascript:hideDialog();"></a>

	</div>
	<div class="ui-dialog-content">
		<div class="ui-dialog-l40 ui-dialog-pt15">
			<input class="ui-dialog-input ui-dialog-input-username" type="input" placeholder="用户名" value="" />
		</div>
		<p style="font-size:5px;color:#fff;"> </p>
		<div class="ui-dialog-l40 ui-dialog-pt15">
			<input class="ui-dialog-input ui-dialog-input-password" type="input" placeholder="密码" value="" />
		</div>
		<br> 
		<div class="ui-dialog-l40">
			<a class="ui-dialog-l40" href="#">忘记密码</a>                                    <!-- 忘记密码的页面 -->
		</div>
		<div>
			<a class="ui-dialog-submit" href="#" >登录</a>              <!-- 须实现Ajax -->
		</div>
		<div class="ui-dialog-l40">
			<a class="ui-dialog-l40" href="#">立即注册</a>                                     <!-- 注册的页面 -->
		</div>
	</div>
</div>



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
  <br>
</div>
</div>

<div class="container">
  <nav class="text-center">
    <!-- Add class .pagination-lg for larger blocks or .pagination-sm for smaller blocks-->
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
<script type="text/javascript">

	var dialogInstace , onMoveStartId , mousePos = {x:0,y:0};	//	用于记录当前可拖拽的对象
	
	// var zIndex = 9000;

	//	获取元素对象	
	function g(id){return document.getElementById(id);}

	//	自动居中元素（el = Element）
	function autoCenter( el ){
		var bodyW = document.documentElement.clientWidth;
		var bodyH = document.documentElement.clientHeight;

		var elW = el.offsetWidth;
		var elH = el.offsetHeight;

		el.style.left = (bodyW-elW)/2 + 'px';
		el.style.top = (bodyH-elH)/2 + 'px';
		
	}

	//	自动扩展元素到全部显示区域
	function fillToBody( el ){
		el.style.width  = document.documentElement.clientWidth  +'px';
		el.style.height = document.documentElement.clientHeight + 'px';
	}

	//	Dialog实例化的方法
	function Dialog( dragId , moveId ){

		var instace = {} ;

		instace.dragElement  = g(dragId);	//	允许执行 拖拽操作 的元素
		instace.moveElement  = g(moveId);	//	拖拽操作时，移动的元素

		instace.mouseOffsetLeft = 0;			//	拖拽操作时，移动元素的起始 X 点
		instace.mouseOffsetTop = 0;			//	拖拽操作时，移动元素的起始 Y 点

		instace.dragElement.addEventListener('mousedown',function(e){

			var e = e || window.event;

			dialogInstace = instace;
			instace.mouseOffsetLeft = e.pageX - instace.moveElement.offsetLeft ;
			instace.mouseOffsetTop  = e.pageY - instace.moveElement.offsetTop ;
			
			onMoveStartId = setInterval(onMoveStart,10);
			return false;
			// instace.moveElement.style.zIndex = zIndex ++;
		})

		return instace;
	}

	//	在页面中侦听 鼠标弹起事件
	document.onmouseup = function(e){
		dialogInstace = false;
		clearInterval(onMoveStartId);
	}
	document.onmousemove = function( e ){
		var e = window.event || e;
		mousePos.x = e.clientX;
		mousePos.y = e.clientY;
		

		e.stopPropagation && e.stopPropagation();
		e.cancelBubble = true;
		e = this.originalEvent;
        e && ( e.preventDefault ? e.preventDefault() : e.returnValue = false );

        document.body.style.MozUserSelect = 'none';
	}	

	function onMoveStart(){


		var instace = dialogInstace;
	    if (instace) {
	    	
	    	var maxX = document.documentElement.clientWidth -  instace.moveElement.offsetWidth;
	    	var maxY = document.documentElement.clientHeight - instace.moveElement.offsetHeight ;

			instace.moveElement.style.left = Math.min( Math.max( ( mousePos.x - instace.mouseOffsetLeft) , 0 ) , maxX) + "px";
			instace.moveElement.style.top  = Math.min( Math.max( ( mousePos.y - instace.mouseOffsetTop ) , 0 ) , maxY) + "px";

	    }

	}


	


	//	重新调整对话框的位置和遮罩，并且展现
	function showDialog(){
		g('dialogMove').style.display = 'block';
		g('mask').style.display = 'block';
		autoCenter( g('dialogMove') );
		fillToBody( g('mask') );
	}

	//	关闭对话框
	function hideDialog(){
		g('dialogMove').style.display = 'none';
		g('mask').style.display = 'none';
	}

	//	侦听浏览器窗口大小变化
	window.onresize = showDialog;

	Dialog('dialogDrag','dialogMove');
	
	//默认设置弹出层启动
	showDialog();

</script>

</body>
</html>