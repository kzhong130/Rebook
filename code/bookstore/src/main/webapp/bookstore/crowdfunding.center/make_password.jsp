<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="revised" content="Ningxia Seasons, 2015/8/13/" />
<!-- 定义页面的最新版本 -->
<meta name="description" content="网站简介" />
<!-- 网站简介 -->
<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
<!-- 搜索关键字 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>某经融公司股权众筹站点</title>
<%@page import="model.User" %>
<!-- Bootstrap -->
<%
	String path=request.getContextPath();
%>
<link href="../css/crowdfunding.center/my_info.css" rel="stylesheet">
 <script type="text/javascript" src="<%=path %>/bookstore/js/jquery.min.js"></script>
 <script type="text/javascript" src="<%=path %>/bookstore/js/jquery.citys.js"></script>   
<%
	User user=(User)session.getAttribute("user");
	String password=user.getPassword();
%>


<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- 开始 -->
<div class="my_info_title">修改密码
<!-- <span> <button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p>
  </span>--></div>
<hr>
<div class="my_info_content">
  <table class="my_info_content_care_table">
    <tbody>
      <tr>
        <td align="right" class="color555 td1">旧密码：</td>
        <td class="color555 td2"><input class="oldPassword" name="oldPassword" type="text"></td> 
        <span class="tip confirm_hint"></span>
        
      </tr>
      <tr>
        <td align="right" class="color555">新密码：</td>
        <td class="color555"><input class="password" name="password" type="password"></td>
      </tr>
      <tr>
        <td align="right" class="color555">确认新密码：</td>
        <td class="color555"><input class="checkpassword" name="checkpassword" type="password"></td>
      </tr>
      <span class="tip password_hint"></span>
      
      <tr>
        <td align="center" class="color555" colspan="2">
        <button class="my_info_content_care_table_submit" name="" type="onclick" onclick="changePs()" >保    存</button></td>
        <!-- a.取出value的方法：详见http://www.cnblogs.com/qinzi/archive/2012/10/25/2738646.html
             b.保存先确认旧密码是正确的，然后确认password和checkpassword是一样的，然后把password存进数据库 -->
      </tr>
    </tbody>
  </table>
</div>
<script type="text/javascript">
	var if_old_right=false;
	var if_password_same=false;
	
	//alert($(".oldpassword").val());

	$('.checkpassword').blur(function(){
		  if (($(".checkpassword").val())==($(".password").val())){
		    $('.password_hint').html("✔").css("color","green");
		    if_password_same = true;
		  }else {
		    $('.password_hint').html("×").css("color","red");
		    if_password_same = false;
		  }
	});
	//还没有改正action传递
	function changePs(){
		if(if_password_same){
			$.ajax({  
		        type:"POST",  
		        url:"MemberCenterAction!changePassword",  
		        async:false,
		        data:{password:$(".password").val(),oldpassword:$(".oldPassword").val()},
		        success:function(result){
		        	alert(result);
		        	result=eval('('+result+')');
		        	if(result.success){
		       			alert("修改密码成功！");
		       		}
		        	else{
		        		alert("请确认旧密码输入正确");
		        	}	
		        
		        },
		    });
		    //alert("information right");
		}
		else{
			alert("请确认两次输入的密码一致");
		}
	}
</script>

<!-- 结束 --> 
<script src="../js/jquery-2.1.1.min.js"></script> 
<script src="../js/my_info.js"></script>
</body>
</html>