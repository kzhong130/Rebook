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
    <%@page import="model.BookIN" %>

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
	ArrayList<LendOrder> lendOrders = (ArrayList<LendOrder>)session.getAttribute("allLendOrders");
	ArrayList<BookIN> bookINs = (ArrayList<BookIN>)session.getAttribute("allBookINs");
	ArrayList<Book> books = (ArrayList<Book>)session.getAttribute("allBooks");
	ArrayList<BookIN> myBookINs = new ArrayList<BookIN>();
	ArrayList<Book> myBooks = new ArrayList<Book>();
	if (lendOrders.size()>0){
		for (int i=0; i<lendOrders.size(); i++){
			int bookRecordID = lendOrders.get(i).getBookRecordID();
			for (int j=0; j<bookINs.size(); j++){
				if (bookINs.get(j).getBookRecordID() == bookRecordID){
					myBookINs.add(bookINs.get(j));
					break;
				}
			}
		}
	}
	for (int i=0; i<myBookINs.size(); i++){
		String ISBN = myBookINs.get(i).getISBN();
		for (int j=0; j<books.size(); j++){
			if (ISBN.equals(books.get(j).getISBN())){
				myBooks.add(books.get(j));
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
          <input type="text" class="form-control" placeholder="Search" id="searchInput">
        </div>
        <button type="button" class="btn btn-default" id="searchButton">搜索</button>
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
                        <a href="#"><i class="fa fa-edit"></i> 用户反馈</a>
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
                        <ol class="breadcrumb">
					  <li class="color-ylw">订单信息</li>
					  <li class="active">有书买</li>
					</ol> 


		</div>
            <div id="page-inner">

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                          
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" style="table-layout:fixed" id="myTable">
                                        <thead>
                                            <tr class="text-center">
                                                <th class="text-center" width="15%">订单号</th>
                                                <th class="text-center" width="19%">书名</th>
                                                <th class="text-center" width="15%">书籍发布编号</th>
                                                <th class="text-center" width="15%">借阅者</th>
                                                <th class="text-center" width="15%">出借者</th>
                                                <th class="text-center" width="15%">状态</th>
                                                <th class="text-center" width="6%">详情</th>
                                            </tr>
                                        </thead>
                                        <%
                                        	if (lendOrders.size()>0){
                                        		BookIN myBookIN = new BookIN();
                                        		Book myBook = new Book();
                                        		String status = "";
                                        		String duration = "";
                                        		for (int i=0; i<lendOrders.size(); i++){
                                        			int bookRecordID = lendOrders.get(i).getBookRecordID();
                                        			for (int j=0; j<myBookINs.size(); j++){
                                        				if (myBookINs.get(j).getBookRecordID() == bookRecordID){
                                        					myBookIN = myBookINs.get(j);
                                        					break;
                                        				}
                                        			}
                                        			String ISBN = myBookIN.getISBN();
                                        			for (int k=0; k<myBooks.size(); k++){
                                        				if (ISBN.equals(myBooks.get(k).getISBN())){
                                        					myBook = myBooks.get(k);
                                        					break;
                                        				}
                                        			}
                                        			duration = myBookIN.getLongestDuration() + "天";
                                        			if ("0".equals(lendOrders.get(i).getStatus())){
                                        				status = "借阅者已下单";
                                        			}
                                        			if ("1".equals(lendOrders.get(i).getStatus())){
                                        				status = "出借者已确认";
                                        			}
                                        			if("2".equals(lendOrders.get(i).getStatus())){
                                        				status = "订单取消";
                                        			}
                                        			if ("3".equals(lendOrders.get(i).getStatus())){
                                        				status = "出借者已发货";
                                        			}
                                        			if ("4".equals(lendOrders.get(i).getStatus())){
                                        				status = "借阅者已收货";
                                        			}
                                        			if("5".equals(lendOrders.get(i).getStatus())){
                                        				status = "借阅者已发货";
                                        			}
                                        			if("6".equals(lendOrders.get(i).getStatus())){
                                        				status = "出借者已收货";
                                        			}
                                        			if("7".equals(lendOrders.get(i).getStatus())){
                                        				status = "仅借阅者可评价";
                                        			}
                                        			if("8".equals(lendOrders.get(i).getStatus())){
                                        				status = "仅出借者可评价";
                                        			}
                                        			if("9".equals(lendOrders.get(i).getStatus())){
                                        				status = "双方都不可评价";
                                        			}
                                        			
                                        		
                                        	
                                        %><tbody class="text-center">
                                            <tr>
                                            	<td><%=lendOrders.get(i).getLendID() %></td>
                                                <td><div title="<%=myBook.getBookName() %>" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><%=myBook.getBookName() %></div></td>
												<td><%=myBookIN.getBookRecordID() %></td>
                                                <td><%=lendOrders.get(i).getLenderName() %></td>
                                                <td><%=lendOrders.get(i).getOwnerName() %></td>
                                                <td><%=status %></td>
                                                <td><a class="btn btn-success btn-xs" href="dashboard_orderLendInfo.jsp?ISBN=<%=myBook.getISBN()%>&ID=<%=lendOrders.get(i).getLendID()%>">查看</a></td>
                                                
                                            </tr>
											<%} %>
											<%} %>
                                        </tbody>
                                    </table>
                                </div>
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
    <script type="text/javascript" src="assets/js/Chart.min.js"></script>  
    <script type="text/javascript" src="assets/js/chartjs.js"></script> 
     <!-- Morris Chart Js -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
     <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    <script type="text/javascript">
    $("#searchButton").click(function(){
		var keyword = $("#searchInput").val();
		var tempText = "";
		var mytable = document.getElementById("myTable");
		
		for (var i=1; i<mytable.rows.length; i++){
			mytable.rows[i].style.display="none";
			for (var j=0; j<mytable.rows[i].cells.length-1; j++){
				tempText = mytable.rows[i].cells[j].innerText;
    			if (tempText.indexOf(keyword) >= 0){	//查到结果
    				mytable.rows[i].style.display="";
    				break;
    			}
			}
			
		}

	})
    </script>


       
</body>
</html>
