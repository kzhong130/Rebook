<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="../css/forgetpassword.css" rel="stylesheet" />
<link href="../css/bootstrap.css" rel="stylesheet" />
</head>

<%
	String path=request.getContextPath();
%>

 <script type="text/javascript" src="<%=path %>/bookstore/js/jquery.min.js"></script>
 <script type="text/javascript" src="<%=path %>/bookstore/js/jquery.citys.js"></script>   
<body>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="../test.jsp"><img src="../images/index1_logo.png"/></a> 
      </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right hidden-sm">
        <li><a href="../test.jsp">回首页登录</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<div class="container">
    <div class="row">
      <!-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">-->
        <div id="carousel1" class="carousel slide">
          <ol class="carousel-indicators">
            <li data-target="#carousel1" data-slide-to="0" class="active"> </li>
            <li data-target="#carousel1" data-slide-to="1" class=""> </li>
            <li data-target="#carousel1" data-slide-to="2" class=""> </li>
          </ol>
          <div class="carousel-inner" >
            <div class="item"> <img class="img-responsive" src="../images/index1_banner.png" alt="thumb" >
            </div>
            <div class="item active"> <img class="img-responsive" src="../images/index1_banner.png" alt="thumb">
            </div>
            <div class="item"> <img class="img-responsive" src="../images/index1_banner.png" alt="thumb">
            </div>
          </div>
          <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next"></span></a></div>
     
     </div>
    <hr>
  </div>
  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext for-cur"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <!-- <form  method="post" class="forget-pwd" onsubmit="return check();">-->
       <dl>
        <dt>新密码：</dt>                                                
        <dd>        
        <input type="password" id="newpassword"  name="password" class="password"  placeholder="6-16位密码" /></dd>          <!-- 新密码所在的input -->
        <div class="clears"></div>
       </dl> 
       <dl>
        <dt>确认密码：</dt>
        <dd><input type="password" id="checkpassword"  placeholder="确认密码" class="checkpassword" name="checkpassword"/></dd>                        <!-- 确认密码所在的input -->
        <div class="clears"></div>
       </dl> 
        <button class="my_info_content_care_table_submit" name="" type="onclick" onclick="change()" >修改密码</button></td>
     <!-- </form>--><!--forget-pwd/-->
   </div><!--web-width/-->
  </div><!--content/-->

<script type="text/javascript">
var if_old_right=false;
var if_password_same=false;
var password_Boolean=false;

$('.password').blur(function(){
		 if ((/^[a-z0-9_-]{6,16}$/).test($(".password").val())){
		 //$('.password_len').html("✔").css("color","green");

	 		password_Boolean = true;
		}else {
			 //$('.password_len').html("×").css("color","red");
			 password_Boolean = false;
		}
});


$('.checkpassword').blur(function(){
	  if (($(".checkpassword").val())==($(".password").val())){
	    //$('.password_hint').html("✔").css("color","green");
	    if_password_same = true;
	  }else {
	    //$('.password_hint').html("×").css("color","red");
	    if_password_same = false;
	  }
});

	function change(){
		//alert(2333);
		//alert(password_Boolean);
		//alert(if_password_same);
		if(password_Boolean&&if_password_same){
			//alert("sb");
			$.ajax({  
		        type:"POST",  
		        url:"fpAction!changePassword",  
		        async:false,
		        data:{password:$(".password").val()},
		        
		    });
			alert("修改密码成功！");
			window.location.replace("fp4.jsp");
		}
		else{
			if(!password_Boolean) alert("请确定密码长度");
			if(!if_password_same) alert("请确定两次密码一样");
		}
		
	}


</script>
  
</body>
</html>
