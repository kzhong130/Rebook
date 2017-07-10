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
 <script type="text/javascript" src="../js/jquery.min.js"></script>
 <script type="text/javascript" src="../js/jquery.citys.js"></script>    
<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<%@page import="model.User" %>
<title>个人中心-基本资料</title>
<%
	User user=(User)session.getAttribute("user");

%>
<!-- Bootstrap -->
<link href="../css/crowdfunding.center/my_info.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- 开始 -->
<div class="my_info_title">我的资料
  <!--<span><button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p></span>-->
  </div>
 <hr>
<!--
<div class="my_info_title_3">
  <ul>
    <li id="listClick_1" onClick="listClick(1)" style="border-bottom: 1px solid #d19826; color: #d19826;">基本资料</li>
    <li id="listClick_4" onClick="listClick(4)">修改密码</li>
  </ul>
</div>-->


<div class="my_info_content">
  <table class="my_info_content_care_table">
    <tbody>
      <tr>
        <td align="right" class="color555 td1">用户名：</td>
        <td class="color555 td2" ><%=user.getUserName() %><span class="colord19826 margin_left10 font_size12">不能修改</span></td>
      </tr>
      <tr>
        <td align="right" class="color555">手机号码：</td>
        <td class="color555 td2" >
        <input class="reg_mobile" name="phone" type="text" value=<%=user.getPhone() %>> <!-- 从数据库取 -->
         <span class="tip mobile_hint"></span>
        </td>
      </tr>
      <tr>
        <td align="right" class="color555">真实姓名：</td>
        <td class="color555 td2" >
        <input class="reg_realname" name="realName" type="text" value=<%=user.getRealName() %>> <!-- 从数据库取 -->
        <span class="tip realname_hint"></span>
      </td>
      </tr>
      <tr>
        <td align="right" class="color555">性别：</td>
        <td class="color555 td2" >
        <%	
        	String sex;
        	if(user.getSex().equals("male")) sex="男";
        	else sex="女";
        %>
        <%=sex %>
      </tr>
      <tr>
        <td align="right" class="color555">Email：</td>
        <td class="color555 td2" >
        <input class="reg_email" name="email" type="text" value=<%=user.getEmail() %>>    <!-- 从数据库取 -->
        <span class="tip email_hint"></span></td>
      </tr>
      <tr>
        <td align="right" class="color555">地址：<br>&nbsp;</td>
        <td class="color555 td2"><div id="demo3">
                      <select name="province"></select>
                      <select name="city"></select>
                      <br>
                      <select name="area"></select>
                      <select name="town"></select>
            </div></td>
      </tr>
      <tr>
        <td align="right" class="color555">&nbsp;</td>
        <td class="color555  td2">
        <input class="reg_address" name="address" type="text" value=<%=user.getAddress() %>>   <!-- 从数据库取 -->
        <span class="tip address_hint"></span></td>
     
      </tr>
      <%
      	String date=user.getRegisterDate().toString().substring(0,19);
      %>
      <tr>
        <td align="right" class="color555">注册日期：</td>
        <td class="color555 td2"><%=date %></td>                                  <!-- 从数据库取 -->
      </tr>
      <tr>
        <td align="center" class="color555" colspan="2">
        <button class="my_info_content_care_table_submit" name="" type="onclick" onclick="save()" >保    存</button></td>
        <!-- a.取出value的方法：详见http://www.cnblogs.com/qinzi/archive/2012/10/25/2738646.html
             b.保存就把所有input都存了？ -->
      </tr>
    </tbody>
  </table>
</div>

<!-- 结束 --> 
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../js/jquery-2.1.1.min.js"></script>  
<script type="text/javascript" src="../js/jquery.citys.js"></script>        
<script type="text/javascript">
        		var $town = $('#demo3 select[name="town"]');
        		var townFormat = function(info){
        			$town.hide().empty();
        			if(info['code']%1e4&&info['code']<7e5){	//是否为“区”且不是港澳台地区
        				$.ajax({
        					url:'http://passer-by.com/data_location/town/'+info['code']+'.json',
        					dataType:'json',
        					success:function(town){
        						$town.show();
        						for(i in town){
        								$town.append('<option value="'+i+'">'+town[i]+'</option>');
        						}
        					}
        				});
        			}
        		};
                $('#demo3').citys({
        			province:'<%=user.getProvince()%>',
        			city:'<%=user.getCity()%>',
        			area:'<%=user.getArea()%>',
        			town:'<%=user.getTown()%>',
            /*这四个值应从数据库取*/
        			onChange:function(info){
        				townFormat(info);
        			}
        		},function(api){
        			var info = api.getInfo();
        			townFormat(info);
        		});

                var email_Boolean=true;
                var address_Boolean=true;
                var Mobile_Boolean=true;
                var realname_Boolean=true;
                

              //address
              $('.reg_address').blur(function(){
                if ($(".reg_address").val()!=""){
                  $('.address_hint').html("✔").css("color","green");
                  address_Boolean = true;
                }else {
                  $('.address_hint').html("×").css("color","red");
                  address_Boolean = false;
                }
      
              });
       
             // Mobile
                $('.reg_mobile').blur(function(){
                  if ((/^1[34578]\d{9}$/).test($(".reg_mobile").val())){
                    $('.mobile_hint').html("✔").css("color","green");
                    Mobile_Boolean = true;
                  }else {
                    $('.mobile_hint').html("×").css("color","red");
                    Mobile_Boolean = false;
                  }
                });

                //Realname
                $('.reg_realname').blur(function(){
                  if ((/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/).test($(".reg_realname").val())){
                    $('.realname_hint').html("✔").css("color","green");
                    realname_Boolean = true;
                  }else {
                    $('.realname_hint').html("×").css("color","red");
                    realname_Boolean = false;
                  }
                });
                
                $('.reg_email').blur(function(){
                	  if ((/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/).test($(".reg_email").val())){
                	    $('.email_hint').html("✔").css("color","green");
                	    email_Boolean = true;
                	  }else {
                	    $('.email_hint').html("×").css("color","red");
                	    email_Boolean = false;
                	  }
                	});        
    
      	function save(){
      		
      		if(email_Boolean&&realname_Boolean&&Mobile_Boolean&&address_Boolean){
      		  var select = document.getElementsByName("province")[0];
      		  var province=select.options[select.selectedIndex].text;
      		  //alert(document.getElementsByName("city")[0].value);
      		  if(document.getElementsByName("city")[0].value!=""){
      			  select=document.getElementsByName("city")[0];
      			  var city=select.options[select.selectedIndex].text;
      		  }
      		  else {
      			  var city="";
      			  //alert(2);
      		  }
      		  //alert(2333);
      		  //alert(city);
      		  if(document.getElementsByName("area")[0].value!=""){
      			  select=document.getElementsByName("area")[0];
      			  var area=select.options[select.selectedIndex].text;
      		  }
      		  else var area="";
      		  //alert(area);
      		  if(document.getElementsByName("town")[0].value!=""){
      			  select=document.getElementsByName("town")[0];
      			  var town=select.options[select.selectedIndex].text;
      		  }
      		  else var town="";
      		  //alert(town);
      		  var detail=$(".reg_address").val();
      		 
      			$.ajax({  
      		        type:"POST",  
      		        url:"MemberCenterAction!update",  
      		        async:false,
      		        data:{province:province,city:city,area:area,town:town,realName:$(".reg_realname").val(),phone:$(".reg_mobile").val(),email:$(".reg_email").val(),address:detail} ,
      		        
      		    });
      			
      			alert("修改成功");
      		}
      		else{
      			alert("请完善信息");
      		}
      	}  
</script>



</body>
</html>