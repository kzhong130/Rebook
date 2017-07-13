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
     <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
       <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <%@page import="model.BookIN"%>    
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
	ArrayList<BookIN> bookINs = (ArrayList<BookIN>)session.getAttribute("allBookINs");
	BookIN bookIN = new BookIN();
	if (bookINs.size()>0){
		for (int i=0; i<bookINs.size(); i++){
			if (bookINs.get(i).getBookRecordID() == ID){
				bookIN = bookINs.get(i);
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
                        <a href="#"><i class="fa fa-file-text"></i> 订单信息<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">有书借</a>
                            </li>
                            <li>
                                <a href="#">有书买</a>
                            </li>
							</ul>
					</li>	
							
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> 用户反馈</a>
                    </li>
                    

                </ul>
            </div>

        </nav>
        <!-- /. NAV SIDE  -->
		<div id="page-wrapper">
		  <div class="header"> 
                        <h2 class="page-header">
                            书籍发布情况 <small>
                            release</small>
                        </h2>
									
		</div>
            <div id="page-inner">

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                          
                            <div class="panel-body">
                            <%
                            	String type="";
                            	if ("lend".equals(bookIN.getType())){
                            		type="借";
                            	}
                            	if ("sell".equals(bookIN.getType())){
                            		type="卖";
                            	}
                            	String longestDuration ="";
                            	if (bookIN.getLongestDuration() == null){
                            		longestDuration = "无";
                            	}
                            	if (bookIN.getLongestDuration() != null){
                            		longestDuration = bookIN.getLongestDuration() + "天";
                            	}
                            	String recency="";
                            	if ("20%".equals(bookIN.getRecency())){
                            		recency="两成新";
                            	}
                            	if ("50%".equals(bookIN.getRecency())){
                            		recency="五成新";
                            	}
                            	if ("80%".equals(bookIN.getRecency())){
                            		recency="八成新";
                            	}
                            	if ("100%".equals(bookIN.getRecency())){
                            		recency="全新";
                            	}
                            	String note="";
                            	if (bookIN.getNote() == null){
                            		note = "无";
                            	}
                            	if (bookIN.getNote() != null){
                            		note = bookIN.getNote();
                            	}
                            	
                            	String sendWay = "";
                            	if ("mail".equals(bookIN.getSendWay())){
                            		sendWay = "邮寄";
                            	}
                            	if ("face".equals(bookIN.getSendWay())){
                            		sendWay = "当面";
                            	}
                            %>
                            <form class="form-horizontal" role="form">

								<p><span class="col-md-2">ISBN: </span><span class="col-md-10"><%=bookIN.getISBN() %></span></p>
                                <p><span class="col-md-2">书名: </span><span class="col-md-10"><%=book.getBookName() %></span></p>
                                <p><span class="col-md-2">用户名: </span><span class="col-md-10"><%=bookIN.getUserName() %></span></p>
                                <p><span class="col-md-2">书主姓名: </span><span class="col-md-10"><%=bookIN.getOwnerName() %></span></p>
                                <p><span class="col-md-2">书主电话: </span><span class="col-md-10"><%=bookIN.getOwnerPhone() %></span></p>
                                <p><span class="col-md-2">书币要求: </span><span class="col-md-10"><%=bookIN.getCoinNumber() %></span></p>
                                <p><span class="col-md-2">借/买: </span><span class="col-md-10"><%=type %></span></p>
                                <p><span class="col-md-2">发布时间: </span><span class="col-md-10"><%=bookIN.getInTime().toString().substring(0, 19) %></span></p>
                                <p><span class="col-md-2">送书方式: </span><span class="col-md-10"><%=bookIN.getSendWay() %></span></p>
                                <p><span class="col-md-2">所在城市: </span><span class="col-md-10"><%=bookIN.getProvince() + bookIN.getCity() %></span></p>
                                <p><span class="col-md-2">最长借书时间: </span><span class="col-md-10"><%=longestDuration %> </span></p>
                                <p><span class="col-md-2">书主地址: </span><span class="col-md-10"><%=bookIN.getProvince() + bookIN.getCity() + bookIN.getOwnerAddress() %> </span></p>
                                <p><span class="col-md-2">新旧程度: </span><span class="col-md-10"><%=recency %></span></p>
                                <p><span class="col-md-2">备注: </span><span class="col-md-10"><%=note %></span></p>

                                <%
                                	if("yes".equals(bookIN.getInStatus())){
                                %>
                                <div class="form-group">
                                					<p><span class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;状态: </span></p>
 													<!--<label for="状态">状态: </label> -->
 													<div class="col-md-10">
 													<div style="margin:-15px 0 0 -10px">
													<label class="checkbox-inline">
													<input type="radio" name="bookInCheck" id="bookInCheck1" value="上架" checked="true"> 上架
													</label>
													<label class="checkbox-inline">
													<input type="radio" name="bookInCheck" id="bookInCheck0" value="下架"> 下架
													</label>
												</div></div></div>
								<%} %>
								<%
									if ("no".equals(bookIN.getInStatus())){
								%>
								 <div class="form-group">
													<p><span class="col-md-2">状态: </span></p>
 													<!--<label for="状态">状态: </label> -->
 													<div class="col-md-10" style="margin:-30px 0 0 -20px">
													<label class="checkbox-inline">
													<input type="radio" name="bookInCheck" id="bookInCheck1" value="上架"> 上架
													</label>
													<label class="checkbox-inline">
													<input type="radio" name="bookInCheck" id="bookInCheck0" value="下架"  checked="true"> 下架
													</label>
												</div></div>
									<%} %>
							<br>&nbsp;&nbsp;&nbsp;
                          <input type="button" class="btn btn-success" value="确认修改" id="<%=bookIN.getBookRecordID()%>" onclick = "updateBookIN(this)">&nbsp;&nbsp;
                           <a href="dashboard_bookIn.jsp" class="btn btn-default">返回</a>
                                
                           
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

      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Chart Js -->
    <script type="text/javascript" src="assets/js/chart.min.js"></script>  
    <script type="text/javascript" src="assets/js/chartjs.js"></script> 
     <!-- Morris Chart Js -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
     <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
   <script type="text/javascript">
   function updateBookIN(ob){
	   var bookRecordID = ob.id;
	   var inStatus;
	   if (document.getElementById("bookInCheck1").checked){
		   inStatus="yes";
	   }
	   else{
		   inStatus = "no";
	   }
	   $.ajax({
		   type:"POST",
		   url:"BookINAction!updateBookIN",
		   async:false,
		   data:{bookRecordID:bookRecordID,inStatus:inStatus},
		   success:function(result){
			   result = eval('('+result+')');
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
