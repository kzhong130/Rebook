<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>忘记密码</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="../css/forgetpassword.css" rel="stylesheet" />
<link href="../css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-1.8.3-min.js"></script>
<script type="text/javascript">
 //导航定位
 $(function(){
	// $(".nav li:eq(2) a:first").addClass("navCur")
	 //验证手机 邮箱 
	 $(".selyz").change(function(){
	   var selval=$(this).find("option:selected").val();
		 if(selval=="0"){
			 $(".sel-yzsj").show()
			 $(".sel-yzyx").hide()
			 }
		 else if(selval=="1"){
			 $(".sel-yzsj").hide()
			 $(".sel-yzyx").show()
			 }
		 })
	 })
</script>
</head>

<body>
<div class="container"> 
<nav class="navbar navbar-default" role="navigation" style="border-color: #fff;background-color: #fff;margin-bottom:5px;">

	<div class="container-fluid"> 
	<div class="navbar-header">
		
		<!--<a class="navbar-brand" href="test.jsp"><img src="images/index1_logo.png" class="logo"/></a>-->
		<a class="navbar-brand" href="../test.jsp"><img src="../images/index1_logo.png"/></a> 
	</div>
	</div>
</nav>
</div>

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
  
  <div class="container">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>方式选择</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <form action="fpAction!checkAnswer" method="post" class="forget-pwd">
       <dl>
        <dt>密保问题：</dt>
        <%String a=(String)session.getAttribute("validationProblem"); %>
        <dd><%=a%></dd>                                                        <!-- 该用户对应的密保问题 -->
        <div class="clears"></div>
       </dl>
       <dl class="sel-yzsj">
        <dt>密保答案：</dt>
        <dd><input type="text" id="validationAnswer" name="validationAnswer"/></dd>                   <!-- 问题答案所在的input -->
         <div class="clears"></div>
       </dl>
       <div class="subtijiao"><input type="submit" value="提交" /></div>      <!-- 提交需判断（a）答案是否正确 -->
      </form><!--forget-pwd/-->
  </div><!--content/-->
   <script type="text/javascript">
var RightAnswer=<%=request.getAttribute("RightAnswer")%>
if (RightAnswer==0){
	alert("验证答案错误");
}
</script>
</body>
</html>
