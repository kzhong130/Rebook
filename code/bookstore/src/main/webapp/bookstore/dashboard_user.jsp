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
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css"> 
        <%@page import="model.User"%>    
    <%@page import="java.util.ArrayList" %>    
    
        <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>

	
</head>

<body>
<%
	ArrayList<User> users = new ArrayList<User>();
	users = (ArrayList<User>)session.getAttribute("allUsers");
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
		<!-- sideNav折叠按钮		
		<div id="sideNav" href="">
		<i class="fa fa-bars icon"></i> 
		</div>
        -->
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.welcome-messages -->
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
                        <a class="active-menu" href="dashboard_user.jsp"><i class="fa fa-user"></i> 用户信息</a>
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
                            用户信息 <small>
                            user</small>
                        </h2>
                        <!-- home/dashboard/data
						<ol class="breadcrumb">
					  <li><a href="#">Home</a></li>
					  <li><a href="#">Dashboard</a></li>
					  <li class="active">Data</li>
					</ol> 
								-->
									
		</div>
            <div id="page-inner">

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                          
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" style="table-layout:fixed" id="myTable">
                                        <thead>
                                            <tr><!-- 把性别、邮箱和地址放在详情页里，增加了删除和详情 -->
                                                <th class="text-center" width="10%">ID</th>
                                                <th class="text-center" width="14%">用户名</th>
                                                <th class="text-center" width="12%">真实姓名</th>
                                                <!--<th class="text-center" width="5%">性别</th>-->
                                                <th class="text-center" width="12%">联系方式</th>
                                                <!--<th class="text-center" width="17%">E-mail</th>
                                                <th class="text-center" width="12%">地址</th>-->
                                                <th class="text-center" width="17%">注册日期</th>
                                                <th class="text-center" width="8%">信用</th>
                                                <th class="text-center" width="10%">书币</th>
                                                
                                                <th class="text-center" width="6%">密码</th>
                                                <th class="text-center" width="6%">操作</th>
                                                <th class="text-center" width="6%">详情</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center">
                                          <%
                                           		String gender="";
                                           		String address="";
                                           		if (users.size() > 0){
                                           			for (int i=0; i < users.size(); i++){
                                           		
                                           %>
                                            <tr style="display">
                                                <td><%=users.get(i).getUserID() %></td>
                                                <td><%=users.get(i).getUserName() %></td>
                                                <td><%=users.get(i).getRealName() %></td>
                                                <td><%=users.get(i).getPhone() %></td>
                                                <td><%=users.get(i).getRegisterDate().toString().substring(0, 19) %></td>
                                                <td><%=users.get(i).getCredit() %></td>
                                                <td><%=users.get(i).getBookCoin() %></td>
                                                
                                                <td><button class="btn btn-warning1 btn-xs" id="<%=users.get(i).getUserID()%>" onclick="resetPassword(this)">重置</button></td>
                                                <td><button class="btn btn-warning1 btn-xs" id="<%=users.get(i).getUserID()%>" onclick="deleteUser(this)">删除</button></td>
                                                <td><a class="btn btn-success btn-xs" href="dashboard_userInfo.jsp?userID=<%=users.get(i).getUserID()%>">查看</a></td>
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

    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
	 
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
	
	
	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>
	
	 <script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
	
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>

      
    <!-- Chart Js -->
    <script type="text/javascript" src="assets/js/chart.min.js"></script>  
    <script type="text/javascript" src="assets/js/chartjs.js"></script> 

 <script type="text/javascript" >
    	function resetPassword(ob){
    		var userID = ob.id;
    		$.ajax({
    			type:"POST",
    			url:"AccountAction!resetPassword",
    			async:false,
    			data:{userID:userID},
    			success:function(result){
    				result=eval('('+result+')');
    				if (result.success){
    					alert("重置成功");
    				}
    				else{
    					alert("重置失败");
    				}
    			}
    		})
    	}
    	
    	function deleteUser(ob){
    		var userID = ob.id;
    		$.ajax({
    			type:"POST",
    			url:"AccountAction!deleteAccount",
    			async:false,
    			data:{userID:userID},
    			success:function(result){
    				result=eval('('+result+')');
    				if(result.success){
    					alert("删除成功");
    					location.reload(); 
    				}
    				else{
    					alert("删除失败");
    				}
    			}
    		})
    	}
    	
    	$("#searchButton").click(function(){
    		var keyword = $("#searchInput").val();
    		var tempText = "";
    		var mytable = document.getElementById("myTable");
    		
    		for (var i=1; i<mytable.rows.length; i++){
    			mytable.rows[i].style.display="none";
    			for (var j=0; j<mytable.rows[i].cells.length-3; j++){
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