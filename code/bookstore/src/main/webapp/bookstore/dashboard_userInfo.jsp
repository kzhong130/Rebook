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
   <%@page import="model.User"%>    
    <%@page import="java.util.ArrayList" %>    
       <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>

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
	int userID = Integer.parseInt(request.getParameter("userID"));
	ArrayList<User> users = (ArrayList<User>)session.getAttribute("allUsers");
	User user = new User();
	String gender = "";
	String address = "";
	if (users.size() > 0){
		for (int i=0; i< users.size(); i++){
			if (users.get(i).getUserID() == userID){
				user = users.get(i);
				break;
			}
		}
	}
	if ("male".equals(user.getSex())){
		gender = "男";
	}
	else{
		gender = "女";
	}
	
	address = user.getProvince() + user.getCity() + user.getArea() + user.getTown() + user.getAddress();
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
                        <a href="dashboard_user.jsp" class="active-menu"><i class="fa fa-user"></i> 用户信息</a>
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
                                <a href="dashboard_lendFeedback.jsp">有书借</a>
                            </li>
                            <li>
                                <a href="dashboard_buyFeedback.jsp">有书买</a>
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
									
		</div>
            <div id="page-inner">

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                          
                            <div class="panel-body">
                            <form class="form-horizontal" role="form">
                            	<div class="col-md-10 col-sm-10 col-xs-10">
								<p><span class="col-md-2">ID:</span><span class="col-md-10"><%=user.getUserID() %></span></p>
                                <p><span class="col-md-2">用户名: </span><span class="col-md-10"><%=user.getUserName() %></span></p>
                                <p><span class="col-md-2">真实姓名: </span><span class="col-md-10"><%=user.getRealName() %></span></p>
                                <p><span class="col-md-2">性别:</span><span class="col-md-10"><%=gender %> </span></p>
                                <p><span class="col-md-2">联系方式:</span><span class="col-md-10"><%=user.getPhone() %> </span></p>
                                <p><span class="col-md-2">E-mail: </span><span class="col-md-10"><%=user.getEmail() %></span></p>
                                <p><span class="col-md-2">地址:</span><span class="col-md-10"><%=address %> </span></p>
                                <p><span class="col-md-2">注册日期: </span><span class="col-md-10"><%=user.getRegisterDate().toString().substring(0, 19) %></span></p>
                                <br>
                                
                                <div class="form-group">
                                <!-- 暴力方法解决的对齐 -->
                                <p><span class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;信用: </span></p>
								<!-- <label for="信用" class="col-sm-1 control-label">信用: </label> -->
    							<div class="col-md-10 style="margin: -5px 0 0 0">
      							<input type="text" class="form-control form-control-pad form-control-xs" id="credit" name="credit" value="<%=user.getCredit() %>">
								</div></div>
								<div style="margin:-25px 0 -5px 0px">
                                <div class="form-group">
                                <p><span class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;书币: </span></p>
                                <!--<label for="书币" class="col-sm-1 control-label">书币: </label> -->
    							<div class="col-md-10" style="margin: -5px 0 0 0">				
      							<input type="text" class="form-control form-control-pad form-control-xs" id="bookCoin" name="bookCoin" value="<%=user.getBookCoin() %>">
                               	</div></div></div>
                               	<br>
                               	<div>
                                &nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-success" value="确认修改" onclick="updateUser(this)" id="<%=user.getUserID() %>">&nbsp;&nbsp;
                                <a href="dashboard_user.jsp" class="btn btn-default">返回</a>
                                </div>
								</div>
                               </form>
                                <div class="col-md-2 col-sm-2 col-xs-2" style="text-align: center">
                                <p><button class="btn btn-warning1" id="<%=user.getUserID() %>" onclick="resetPassword(this)">重置密码</button><hr style="margin-top:5px;margin-bottom:10px;"><button class="btn btn-warning1" id="<%=user.getUserID() %>" onclick="deleteUser(this)">删除用户</button></p>
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
     <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
   <script type="text/javascript">
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
					window.location.href="dashboard_user.jsp"
				}
				else{
					alert("删除失败");
				}
			}
		})
	}
   
   function updateUser(ob){
	   var bookCoin = $("#bookCoin").val();
	   var credit = $("#credit").val();
	   var userID = ob.id;
	  $.ajax({
		  type:"POST",
		  url:"AccountAction!updateAccount",
		  async:false,
		  data:{userID:userID,bookCoin:bookCoin,credit:credit},
		  success:function(result){
			  result = eval('('+result+')');
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