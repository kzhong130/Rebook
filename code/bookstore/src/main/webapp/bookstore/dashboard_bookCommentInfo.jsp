<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta content="" name="description" />
    <meta content="webthemez" name="author" />
    <title>Rebook Dashboard</title>
	<!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap_book.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
        <%@page import="model.BookComment"%>    
    <%@page import="java.util.ArrayList" %>    
    <%@page import="model.Book" %>

	<!-- JS Scripts-->
    <script type="text/javascript">
       	//文本溢出点击显示
			 $(document).ready(function(){
			 $("button").click(function(){
				 $("overflowText").toggle();
			 });
		 });
	</script>

</head>
<body>
<%
	String ISBN = request.getParameter("ISBN");

	int ID = Integer.parseInt(request.getParameter("ID"));
	
	ArrayList<Book> books = (ArrayList<Book>)session.getAttribute("allBooks");
	Book book = new Book();
	if (books.size() > 0){
		for (int i=0; i<books.size(); i++){
			if (books.get(i).getISBN().equals(ISBN)){
				book = books.get(i);
				break;
			}
		}
	}
	ArrayList<BookComment> bookComments = (ArrayList<BookComment>)session.getAttribute("allBookComments");
	BookComment bookComment = new BookComment();
	if (bookComments.size()>0){
		for (int i=0; i<bookComments.size(); i++){
			if (bookComments.get(i).getID() == ID){
				bookComment = bookComments.get(i);
				break;
			}
		}
	}
	
%>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="test.jsp"><strong style="vertical-align: middle"><img src="assets/img/logo_transparent_white.png" height="20px"></strong></a>
				
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li>
					<font size="+1" style="vertical-align: middle">Welcome, <%=session.getAttribute("loginUserName") %></font>
                </li>

                <!-- /.dropdown-user -->
                <li class="dropdown dropdown-myuser">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw" style="color:#efbb24"></i> <i class="fa fa-caret-down" style="color:#efbb24"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="AccountAction!logout"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                        </li>
                    </ul>
                </li>
                          <form class="navbar-form navbar-right" role="search" style="margin:13px 20px 0 0">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
            </ul>

        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href="dashboard_user.jsp"><i class="fa fa-user"></i> 用户信息</a>
                    </li>
                    
                    <li>
                        <a href="#" class="active-menu"><i class="fa fa-book"></i> 书籍信息<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            <li>
                                <a href="dashboard_book.jsp">基本信息</a>
                            </li>
                            <li>
                                <a href="dashboard_bookComment.jsp">书籍评论</a>
                            </li>
                            <li>
                                <a href="dashboard_bookIn.jsp">书籍发布情况</a>
                            </li>
							</ul>
                    </li> 
                    <li>
                        <a href="dashboard_request.jsp"><i class="fa fa-list-alt"></i> 用户申请</a>
                    </li>
					 <li>
                        <a href="#"><i class="fa fa-file-text"></i> 订单信息<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="dashboard_orderLend.jsp">有书借</a>
                            </li>
                            <li>
                                <a href="dashboard_orderBuy.jsp">有书买</a>
                            </li>
							</ul>
					</li>	
							
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> 用户反馈<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="LendOrderFeedbackAction!initialize">有书借</a>
                            </li>
                            <li>
                                <a href="BuyOrderFeedbackAction!initialize">有书买</a>
                            </li>
							</ul>
                    </li>
                    

                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
		<div id="page-wrapper">
		  <div class="header"> 
                        <h2 class="page-header">
                            书籍评论 <small>
                            comment</small>
                        </h2>
									
		</div>
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                          
                            <div class="panel-body">
								<p><span class="col-md-2">ISBN: </span><span class="col-md-10"><%=book.getISBN() %></span></p>
                                <p><span class="col-md-2">书名: </span><span class="col-md-10"><%=book.getBookName() %></span></p>
                                <p><span class="col-md-2">用户名:</span><span class="col-md-10"><%=bookComment.getUserName() %> </span></p>
                                <p><span class="col-md-2">时间:</span><span class="col-md-10"><%=bookComment.getCommentTime().toString().substring(0, 19) %> </span></p>
                                <p><span class="col-md-2">内容: </span><span class="col-md-10"><%=bookComment.getContent() %></span></p><br>
                                <form role="form">
                                <%
                                	if ("reject".equals(bookComment.getCheckResult())){
                                %>
												<div class="form-group" style="margin:-20px 0 0 0">
													<p><span class="col-md-2">状态: </span></p>
 													<!--<label for="状态">状态: </label> -->
 													<div class="col-md-10" style="margin:-5px 0 0 -20px">
													<label class="checkbox-inline">
													<input type="radio" name="bookCommentCheck" id="bookCommentCheck1" value="已通过" > 已通过
													</label>
													<label class="checkbox-inline">
													<input type="radio" name="bookCommentCheck" id="bookCommentCheck0" value="未通过" checked="true"> 未通过
													</label></div>
												</div>
								<%} %>
								<%if ("pass".equals(bookComment.getCheckResult()) || bookComment.getCheckResult()==null){ %>
								<div class="form-group" >
													<p><span class="col-md-2">状态: </span></p>
 													<!--<label for="状态">状态: </label> -->
 													<div class="col-md-10" style="margin:-5px 0 0 -20px">
													<label class="checkbox-inline">
													<input type="radio" name="bookCommentCheck" id="bookCommentCheck1" value="已通过" checked="true"> 已通过
													</label>
													<label class="checkbox-inline">
													<input type="radio" name="bookCommentCheck" id="bookCommentCheck0" value="未通过" > 未通过
													</label></div>
												</div>
								<%} %>
								<br><br>&nbsp;&nbsp;&nbsp;				
                          <input type="button" class="btn btn-success" value="确认修改" id="<%=bookComment.getID()%>" onclick="updateBookComment(this)">&nbsp;&nbsp;
                           <a href="dashboard_bookComment.jsp" class="btn btn-default">返回</a>
                           </form>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /. ROW  -->
                <footer><p>Copyright &copy; 2017.Company name All rights reserved.</p>
				</footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->


       <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
   <script type="text/javascript">
   	function updateBookComment(ob){
   		var ID = ob.id;
   		var checkResult;
   		if (document.getElementById("bookCommentCheck1").checked){
   			checkResult = "pass";
   		}
   		else{
   			checkResult = "reject";
   		}
   		$.ajax({
   			type:"POST",
   			url:"BookCommentAction!updateBookComment",
   			async:false,
   			data:{ID:ID,checkResult:checkResult},
   			success:function(result){
   				result=eval('('+result+')');
   				if(result.success){
   					location.reload();
   					alert("修改成功");
   					
   				}
   				else{
   					alert("修改失败");
   				}
   			}
   		})
   		
   	}
   </script>


       
</body>
</html>
