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
        <%@page import="model.BookComment"%>    
    <%@page import="java.util.ArrayList" %>    
    <%@page import="model.Book" %>
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
                        <a href="#" class="active-menu"><i class="fa fa-edit"></i> 用户反馈<span class="fa arrow"></span></a>
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
                            用户反馈 <small>
                            feedback</small>
                        </h2>
                    <ol class="breadcrumb">
					  <li class="color-ylw">用户反馈</li>
					  <li class="active">有书借</li>
					</ol>	
		</div>
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                          
                            <div class="panel-body">
								<p><span class="col-md-2">反馈号: </span><span class="col-md-10"><% %></span></p>
                                <p><span class="col-md-2">订单号: </span><span class="col-md-10"><% %></span></p>
                                <p><span class="col-md-2">用户邮箱:</span><span class="col-md-10"><% %> </span></p>
                                <p><span class="col-md-2">反馈主题: </span><span class="col-md-10"><% %></span></p><br>
                                <p><span class="col-md-2">反馈内容: </span><span class="col-md-10"><% %></span></p><br>
                                <p><span class="col-md-2">反馈日期: </span><span class="col-md-10"><% %></span></p><br>
                                <form role="form">
                                <%
                                	
                                %>
												<div class="form-group" style="margin:-20px 0 0 0">
													<p><span class="col-md-2">处理结果: </span></p>
 													<div class="col-md-10" style="margin:-5px 0 0 -20px">
													<label class="checkbox-inline">
													<input type="radio" name="lendFeedbackCheck" id="lendFeedbackCheck1" value="已处理" > 已处理
													</label>
													<label class="checkbox-inline">
													<input type="radio" name="lendFeedbackCheck" id="lendFeedbackCheck0" value="未处理" checked="true"> 未处理
													</label></div>
												</div>
								<% %>
								<% %>
								<div class="form-group" >
													<p><span class="col-md-2">处理结果: </span></p>
 													<div class="col-md-10" style="margin:-5px 0 0 -20px">
													<label class="checkbox-inline">
													<input type="radio" name="lendFeedbackCheck" id="lendFeedbackCheck1" value="已通过" checked="true"> 已处理
													</label>
													<label class="checkbox-inline">
													<input type="radio" name="lendFeedbackCheck" id="lendFeedbackCheck0" value="未通过" > 未处理
													</label></div>
												</div>
								<% %>
								<br><br>&nbsp;&nbsp;&nbsp;				
                          <input type="button" class="btn btn-success" value="确认修改" id="<% %>" onclick="updateBookComment(this)">&nbsp;&nbsp;
                           <a href="dashboard_lendFeedback.jsp" class="btn btn-default">返回</a>
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