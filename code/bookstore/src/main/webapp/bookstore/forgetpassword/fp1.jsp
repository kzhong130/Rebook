<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>
<link rel="shortcut icon" href="../images/favicon.ico" />
<link type="text/css" href="../css/forgetpassword.css" rel="stylesheet" />
<link href="../css/bootstrap.css" rel="stylesheet" />
</head>

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
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <form action="fpAction!checkName" method="post" class="forget-pwd">
       <dl>
        <dt>用户名：</dt>
        <dd><input type="text" id="user" name="userName"/></dd>                                <!-- 账户名所在的input -->
        <div class="clears"></div>
       </dl> 
       <dl>
        <dt>验证码：</dt>
        <dd>
         <input type="text" id="checkword" />                                        <!-- 验证码所在的input -->
         <div class="yanzma">
          <img src="../images/yzm.gif" />
         </div>
        </dd>
        <div class="clears"></div>
       </dl>
       <div class="subtijiao"><input type="submit" value="提交" /></div> <!-- 提交需判断（a）用户名是否存在（b）验证码是否正确 -->
      </form><!--forget-pwd/-->
   </div><!--web-width/-->
  </div><!--content/-->
  
</body>
</html>
