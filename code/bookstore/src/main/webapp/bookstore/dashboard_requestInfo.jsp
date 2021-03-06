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
     <%@page import="model.RequestBook"%>    
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
	int requestID = Integer.parseInt(request.getParameter("ID"));
	
	ArrayList<RequestBook> requestBooks = (ArrayList<RequestBook>)session.getAttribute("allRequestBooks");
	ArrayList<Book> books = (ArrayList<Book>)session.getAttribute("allBooks");
	Book book = new Book();
	for (int i=0; i<books.size(); i++){
		if (books.get(i).getISBN().equals(ISBN)){
			book = books.get(i);
			break;
		}
	}
	RequestBook requestBook = new RequestBook();
	for (int i=0; i<requestBooks.size(); i++){
		if (requestBooks.get(i).getRequestID() == requestID){
			requestBook = requestBooks.get(i);
			break;
		}
	}
	String returnWay ="无";
	if ("mail".equals(requestBook.getReturnWay())){
		returnWay = "邮寄";
	}
	if ("face".equals(requestBook.getReturnWay())){
		returnWay = "当面";
	}
%>
<!-- java都先注释掉或者删掉了 -->
<%-- <% 
// 	String ISBN = request.getParameter("ISBN");
// 	int lendID = Integer.parseInt(request.getParameter("ID"));
	
// 	ArrayList<Book> books = (ArrayList<Book>)session.getAttribute("allBooks");
// 	Book book = new Book();
// 	for (int i=0; i<books.size(); i++){
// 		if (ISBN.equals(books.get(i).getISBN())){
// 			book = books.get(i);
// 			break;
// 		}
// 	}
	
// 	ArrayList<LendOrder> lendOrders = (ArrayList<LendOrder>)session.getAttribute("allLendOrders");
// 	LendOrder lendOrder = new LendOrder();
// 	for (int i=0; i<lendOrders.size(); i++){
// 		if (lendOrders.get(i).getLendID() == lendID){
// 			lendOrder = lendOrders.get(i);
// 			break;
// 		}
// 	}
	
// 	ArrayList<User> users = (ArrayList<User>)session.getAttribute("allUsers");
// 	User lenderUser = new User();
// 	User ownerUser = new User();
// 	for (int i=0; i<users.size(); i++){
// 		if (lendOrder.getLenderName().equals(users.get(i).getUserName())){
// 			lenderUser = users.get(i);
// 			break;
// 		}
// 	}
// 	for (int i=0; i<users.size(); i++){
// 		if (lendOrder.getOwnerName().equals(users.get(i).getUserName())){
// 			ownerUser = users.get(i);
// 			break;
// 		}
// 	}
%> --%>
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
        <button type="button" class="btn btn-default">搜索</button>
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
                        <a href="#"><i class="fa fa-book"></i> 书籍信息<span class="fa arrow"></span></a>
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
                        <a href="dashboard_request.jsp" class="active-menu"><i class="fa fa-list-alt"></i> 用户申请</a>
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
                           用户申请 <small>
                            request</small>
                        </h2>
                        
									
		</div>
            <div id="page-inner">

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                          
                            <div class="panel-body">
                            <form class="form-horizontal" role="form">
								<p><span class="col-md-2">ISBN: </span>
                               		<span class="col-md-10"><%=ISBN %></span></p>
                                <p><span class="col-md-2">书名:</span>
                                	<span class="col-md-10"> <%=book.getBookName() %></span></p>
                                <p><span class="col-md-2">书籍发布编号: </span>
                                	<span class="col-md-10"><%=requestBook.getBookRecordID() %></span></p>
                                <p><span class="col-md-2">申请人: </span> 
                                	<span class="col-md-10"><%=requestBook.getUserName() %></span></p>

                                <p><span class="col-md-2">还书方式:</span> 
                                	<span class="col-md-10"> <%=returnWay %></span></p>

                                <p><span class="col-md-2">收货人: </span> 
                                	<span class="col-md-10"><%=requestBook.getReceiverName() %></span></p>
                                <p><span class="col-md-2">申请人联系方式: </span> 
                                	<span class="col-md-10"><%=requestBook.getPhone() %></span></p>
                                <p><span class="col-md-2">申请人地址: </span> 
                                	<span class="col-md-10"><%=requestBook.getProvince()+requestBook.getCity()+requestBook.getTown()+requestBook.getAddress() %></span></p>
                                <div class="form-group form-group-pad">
                                	<!-- 暴力方法解决的对齐 -->
									<p><span class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;状态: </span></p>
									<!--<label for="状态" class="col-sm-2">状态: </label>-->
									<div class="col-md-3 form-control-pad">
									<%if (requestBook.getRequestStatus().equals("waiting")){ %>
									<select id="orderLendStatus" class="form-control">
          								<option value="waiting" selected="selected">待确认</option>
          								<option value="accept">已通过</option>
          								<option value="reject">未通过</option>
        							</select>
        							<%} %>
        							<%if (requestBook.getRequestStatus().equals("accept")){ %>
        							<select id="orderLendStatus" class="form-control">
          								<option value="waiting" >待确认</option>
          								<option value="accept" selected="selected">已通过</option>
          								<option value="reject">未通过</option>
          							</select>
        							<%} %>
        							
        							<%if (requestBook.getRequestStatus().equals("reject")){ %>
        							<select id="orderLendStatus" class="form-control">
          								<option value="waiting" >待确认</option>
          								<option value="accept">已通过</option>
          								<option value="reject" selected="selected">未通过</option>
        							</select>
        							<%} %>
									</div>
								</div>
												
                          <input type="button" class="btn btn-success btn-submit-pad" value="确认修改" id="<%=requestID %> " onclick = "updateLendOrder(this)">
                           <a href="dashboard_request.jsp" class="btn btn-default btn-submit-pad">返回</a>
                                
                           
								</form>	
                            </div>
                        </div>

                    </div>
                </div>
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
   function updateLendOrder(ob){
	   var requestStatus = $("#orderLendStatus").val();
	   var requestID = ob.id;
	   $.ajax({
		   type:"POST",
		   url:"RequestAction!updateRequestBook",
		   async:false,
		   data:{requestID:requestID,requestStatus:requestStatus},
		   success:function(result){
			   result=eval('('+result+')');
			   if (result.success){
				   alert("修改成功");
				   location.reload();
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
