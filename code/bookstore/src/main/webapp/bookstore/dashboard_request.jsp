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
   <%@page import="model.Book"%>    
    <%@page import="java.util.ArrayList" %> 
    <%@page import="model.RequestBook"%>    
     <%@page import="model.BookIN"%>  
</head>
<body>
<%
	ArrayList<Book> books = (ArrayList<Book>)session.getAttribute("allBooks");
	ArrayList<RequestBook> requestBooks = (ArrayList<RequestBook>)session.getAttribute("allRequestBooks");
	ArrayList<BookIN> bookINs = (ArrayList<BookIN>)session.getAttribute("allBookINs");
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
                            用户申请<small>
                            request</small>
                        </h2>
									
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
                                                <th class="text-center" width="17%">ISBN</th>
                                                <th class="text-center" width="20%">书名</th>
                                                <th class="text-center" width="18%">申请人</th>
                                                <th class="text-center" width="14%">城市</th>
                                                <th class="text-center" width="12%">还书方式</th>
                                                <th class="text-center" width="10%">状态</th>
                                                <th class="text-center" width="9%">详情</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center">
                                            <%
                                            if (requestBooks.size()>0){	
                                            for (int i=0; i<requestBooks.size(); i++){
                                            		String bookName = "";
                                            		String ISBN = "";
                                            		String returnWay = "无";
                                            		String requestStatus = "";
                                            		String cityInfo = "";
                                            		int bookRecordID = requestBooks.get(i).getBookRecordID();
                                            		for (int j=0; j<bookINs.size(); j++){
                                            			if (bookINs.get(j).getBookRecordID() == bookRecordID){
                                            				ISBN = bookINs.get(j).getISBN();
                                            				break;
                                            			}
                                            		}
                                            		for (int k=0; k<books.size(); k++){
                                            			if (books.get(k).getISBN().equals(ISBN)){
                                            				bookName = books.get(k).getBookName();
                                            				break;
                                            			}
                                            		}
                                            		if ("mail".equals(requestBooks.get(i).getReturnWay())){
                                            			returnWay = "邮寄";
                                            		}
                                            		if("face".equals(requestBooks.get(i).getReturnWay())){
                                            			returnWay = "当面";
                                            		}
                                            		if ("waiting".equals(requestBooks.get(i).getRequestStatus())){
                                            			requestStatus = "待确认";
                                            		}
                                            		if ("accept".equals(requestBooks.get(i).getRequestStatus())){
                                            			requestStatus = "已确认";
                                            		}
                                            		if ("reject".equals(requestBooks.get(i).getRequestStatus())){
                                            			requestStatus = "已拒绝";
                                            		}
                                            		if (requestBooks.get(i).getCity() == ""){	//直辖市
                                            			cityInfo = requestBooks.get(i).getProvince() + " " + requestBooks.get(i).getTown();
                                            		}
                                            		if (requestBooks.get(i).getCity() != ""){
                                            			cityInfo = requestBooks.get(i).getProvince() + " "+ requestBooks.get(i).getCity();
                                            		}
                                            %>
                                            <tr>
												  <td><%=ISBN %></td>
                                                <td><div title="<%=bookName %>" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><%=bookName %></div></td>
                                                <td><%=requestBooks.get(i).getUserName() %></td>
                                                <td><%=cityInfo %></td>
                                                <td><%=returnWay %></td>
                                                <td><%=requestStatus %></td>
                                                <td><a class="btn btn-success btn-xs" href="dashboard_requestInfo.jsp?ISBN=<%=ISBN%>&ID=<%=requestBooks.get(i).getRequestID()%>">查看</a></td>
                                                
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
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
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