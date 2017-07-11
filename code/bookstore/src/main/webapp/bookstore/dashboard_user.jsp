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
                <!-- /.dropdown-tasks -->
                <!--
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">28% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" style="width: 28%">
                                            <span class="sr-only">28% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">85% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                            <span class="sr-only">85% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                -->
                <!-- /.dropdown-alerts -->
                <!--
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                -->
                <!-- /.dropdown-user -->
                <li class="dropdown dropdown-myuser">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw" style="color:#efbb24"></i> <i class="fa fa-caret-down" style="color:#efbb24"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 基本信息</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="AccountAction!logout"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                        </li>
                    </ul>
                </li>
                          <form class="navbar-form navbar-right" role="search" style="margin:13px 20px 0 0">
        <div class="form-group">
          <input id="searchInput" type="text" class="form-control" placeholder="Search">
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
                                <a href="#">书籍发布情况</a>
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
                                            <tr>
                                                <th class="text-center" width="5%">ID</th>
                                                <th class="text-center" width="10%">用户名</th>
                                                <th class="text-center" width="10%">真实姓名</th>
                                                <th class="text-center" width="5%">性别</th>
                                                <th class="text-center" width="12%">联系方式</th>
                                                <th class="text-center" width="17%">E-mail</th>
                                                <th class="text-center" width="12%">地址</th>
                                                <th class="text-center" width="10%">注册日期</th>
                                                <th class="text-center" width="5%">信用</th>
                                                <th class="text-center" width="6%">书币</th>
                                                <th class="text-center" width="8%">重置密码</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center">
                                           <%
                                           		String gender="";
                                           		String address="";
                                           		if (users.size() > 0){
                                           			for (int i=0; i < users.size(); i++){
                                           				if (users.get(i).getSex().equals("male")){
                                           					gender="男";
                                           				}
                                           				else{
                                           					gender="女";
                                           				}
                                           				address = users.get(i).getProvince() + users.get(i).getCity() + users.get(i).getArea() + users.get(i).getTown() + users.get(i).getAddress();
                                           %>
											<tr style="display">
                                                <td><%=users.get(i).getUserID() %></td>
                                                <td><%=users.get(i).getUserName() %></td>
                                                <td><%=users.get(i).getRealName() %></td>
                                                <td><%=gender %></td>
                                                <td><%=users.get(i).getPhone() %></td>
                                                <td><div title="<%=users.get(i).getEmail() %>" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><%=users.get(i).getEmail() %></div></td>
                                                <td><div title="<%=address %>" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><%=address %></div></td>
                                                <td><%=users.get(i).getRegisterDate().toString().substring(0,19) %></td>
                                                <td><%=users.get(i).getCredit() %></td>
                                                <td><%=users.get(i).getBookCoin() %></td>
                                                <td><button class="btn btn-success btn-xs" id="<%=users.get(i).getUserID()%>" onclick="resetPassword(this)">重置</button></td>
                                                
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