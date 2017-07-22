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
     <%@page import="model.LendOrder"%>    
    <%@page import="java.util.ArrayList" %>    
    <%@page import="model.Book" %>
    <%@page import="model.User" %>

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
	int lendID = Integer.parseInt(request.getParameter("ID"));
	
	ArrayList<Book> books = (ArrayList<Book>)session.getAttribute("allBooks");
	Book book = new Book();
	for (int i=0; i<books.size(); i++){
		if (ISBN.equals(books.get(i).getISBN())){
			book = books.get(i);
			break;
		}
	}
	
	ArrayList<LendOrder> lendOrders = (ArrayList<LendOrder>)session.getAttribute("allLendOrders");
	LendOrder lendOrder = new LendOrder();
	for (int i=0; i<lendOrders.size(); i++){
		if (lendOrders.get(i).getLendID() == lendID){
			lendOrder = lendOrders.get(i);
			break;
		}
	}
	
	ArrayList<User> users = (ArrayList<User>)session.getAttribute("allUsers");
	User lenderUser = new User();
	User ownerUser = new User();
	for (int i=0; i<users.size(); i++){
		if (lendOrder.getLenderName().equals(users.get(i).getUserName())){
			lenderUser = users.get(i);
			break;
		}
	}
	for (int i=0; i<users.size(); i++){
		if (lendOrder.getOwnerName().equals(users.get(i).getUserName())){
			ownerUser = users.get(i);
			break;
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
                        <a href="dashboard_request.jsp"><i class="fa fa-list-alt"></i> 用户申请</a>
                    </li>
                    <li>
                        <a href="#" class="active-menu"><i class="fa fa-file-text"></i> 订单信息<span class="fa arrow"></span></a>
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
                                <a href="dashboard_lendFeedback.jsp">有书借</a>
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
                            订单信息 <small>
                            order</small>
                        </h2>
                        
									
		</div>
            <div id="page-inner">

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                          
                            <div class="panel-body">
                            <form class="form-horizontal" role="form">
                            	<p><span class="col-md-2">订单号: </span>
                            		<span class="col-md-10"><%=lendOrder.getLendID() %> </span></p>
								<p><span class="col-md-2">ISBN: </span>
                               		<span class="col-md-10"><%=book.getISBN() %> </span></p>
                                <p><span class="col-md-2">书名: </span>
                                	<span class="col-md-10"><%=book.getBookName() %> </span></p>
                                <p><span class="col-md-2">书籍发布编号: </span>
                                	<span class="col-md-10"><%=lendOrder.getBookRecordID() %> </span></p>
                                <!-- 这里的购书者和卖书者就以ID+用户名的形式显示好了 -->
								<p><span class="col-md-2">购书者: </span>
                               		<span class="col-md-10"><%=lenderUser.getUserID() %> <%=lenderUser.getUserName() %></span></p>  
                                <p><span class="col-md-2">卖书者: </span> 
                                	<span class="col-md-10"><%=ownerUser.getUserID() %> <%=ownerUser.getUserName() %></span></p>
                               <%
                               	if (lendOrder.getArrivalTime() == null){
                               %>
                                <p><span class="col-md-2">到货时间: </span> 
                                	<span class="col-md-10">尚未到货</span> </p>
                                <%} %>
                                <%
                                if (lendOrder.getArrivalTime() != null){
                                %>
                                <p><span class="col-md-2">到货时间: </span> 
                                	<span class="col-md-10"><%=lendOrder.getArrivalTime().toString().substring(0, 19) %></span> </p>
                                <%} %>
                                <p><span class="col-md-2">收货人: </span> 
                                	<span class="col-md-10"><%=lendOrder.getReceiver()%></span></p>
                                <p><span class="col-md-2">购书者联系方式: </span> 
                                	<span class="col-md-10"><%=lendOrder.getLendPhone() %></span></p>
                                <p><span class="col-md-2">购书者地址: </span> 
                                	<span class="col-md-10"><%=lendOrder.getLendAddress() %></span></p>
                                
                                <div class="form-group form-group-pad">
                                	<!-- 暴力方法解决的对齐 -->
									<p><span class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;状态: </span></p>
									<!--<label for="状态" class="col-sm-2">状态: </label>-->
									<div class="col-md-3 form-control-pad">
									<%if ("0".equals(lendOrder.getStatus())){ %>
									<select id="orderBuyStatus" class="form-control">
          								<option value="0" selected="selected">购书者已下单</option>
          								<option value="1">卖书者已确认</option>
          								<option value="2">订单取消</option>
          								<option value="3">卖书者已发货</option>
          								<option value="4">购书者已收货</option>
          								<option value="5">购书者已发货</option>
        							</select>
        							<%} %>
        							<%if ("1".equals(lendOrder.getStatus())){ %>
        							<select id="orderBuyStatus" class="form-control">
          								<option value="0">购书者已下单</option>
          								<option value="1" selected="selected">卖书者已确认</option>
          								<option value="2">订单取消</option>
          								<option value="3">卖书者已发货</option>
          								<option value="4">购书者已收货</option>
          								<option value="5">购书者已发货</option>
        							</select>
        							<%} %>
        							<%if("2".equals(lendOrder.getStatus())){ %>
        							<select id="orderBuyStatus" class="form-control">
          								<option value="0">购书者已下单</option>
          								<option value="1">卖书者已确认</option>
          								<option value="2" selected="selected">订单取消</option>
          								<option value="3">卖书者已发货</option>
          								<option value="4">购书者已收货</option>
          								<option value="5">购书者已发货</option>
        							</select>
        							<%} %>
        							<%if ("3".equals(lendOrder.getStatus())){ %>
        							<select id="orderBuyStatus" class="form-control">
          								<option value="0">购书者已下单</option>
          								<option value="1">卖书者已确认</option>
          								<option value="2">订单取消</option>
          								<option value="3" selected="selected">卖书者已发货</option>
          								<option value="4">购书者已收货</option>
          								<option value="5">购书者已发货</option>
        							</select>
        							<%} %>
        							<%if ("4".equals(lendOrder.getStatus())){ %>
        							<select id="orderBuyStatus" class="form-control">
          								<option value="0">购书者已下单</option>
          								<option value="1">卖书者已确认</option>
          								<option value="2">订单取消</option>
          								<option value="3">卖书者已发货</option>
          								<option value="4" selected="selected">购书者已收货</option>
          								<option value="5">购书者已发货</option>
        							</select>
        							<%} %>
        							<%if ("5".equals(lendOrder.getStatus())){ %>
        							<select id="orderBuyStatus" class="form-control">
          								<option value="0">购书者已下单</option>
          								<option value="1">卖书者已确认</option>
          								<option value="2">订单取消</option>
          								<option value="3">卖书者已发货</option>
          								<option value="4">购书者已收货</option>
          								<option value="5" selected="selected">购书者已发货</option>
        							</select>
        							<%} %>
									</div>
								</div>
												
                          <input type="button" class="btn btn-success btn-submit-pad" value="确认修改" id="<%=lendOrder.getLendID() %>" onclick = "updateBuyOrder(this)">
                           <a href="dashboard_orderBuy.jsp" class="btn btn-default btn-submit-pad">返回</a>
                                
                           
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
     <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
   <script type="text/javascript">
   function updateLendOrder(ob){
	   var status = $("#orderLendStatus").val();
	   var lendID = ob.id;
	   $.ajax({
		   type:"POST",
		   url:"LendOrderAction!updateLendOrder",
		   async:false,
		   data:{lendID:lendID,status:status},
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
