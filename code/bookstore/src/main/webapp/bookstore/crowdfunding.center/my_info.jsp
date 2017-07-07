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
<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<title>个人中心-基本资料</title>

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
        <td class="color555 td2" ><% %><span class="colord19826 margin_left10 font_size12">不能修改</span></td>
      </tr>
      <tr>
        <td align="right" class="color555">手机号码：</td>
        <td class="color555 td2" >
        <input class="my_info_content_care_table_text" name="phone" type="text" value=<% %>></td> <!-- 从数据库取 -->
      </tr>
      <tr>
        <td align="right" class="color555">真实姓名：</td>
        <td class="color555 td2" >
        <input class="my_info_content_care_table_text" name="realName" type="text" value=<% %>></td> <!-- 从数据库取 -->
      </tr>
      <tr>
        <td align="right" class="color555">性别：</td>
        <td class="color555 td2" >
        <!-- 从数据库中取，如果是男的，则代码为 -->
          <label><input type="radio" name="sex" id="" value="male" checked>男 </label>
          <label class="radio-inline"><input type="radio" name="sex" id="" value="female">女 </label></td>
         <!-- 如果是男的，则代码为
          <label><input type="radio" name="sex" id="" value="male" >男 </label>
          <label class="radio-inline"><input type="radio" name="sex" id="" value="female" checked>女 </label></td>        
         
          -->
      </tr>
      <tr>
        <td align="right" class="color555">Email：</td>
        <td class="color555 td2" >
        <input class="my_info_content_care_table_text" name="email" type="text" value=<% %>></td>    <!-- 从数据库取 -->
      </tr>
      <tr>
        <td align="right" class="color555">地址：</td>
        <td class="color555 td2"><div id="demo3">
                      <select name="province"></select>
                      <select name="city"></select>
                      <select name="area"></select>
                      <select name="town"></select>
            </div></td>
      </tr>
      <tr>
        <td align="right" class="color555">&nbsp;</td>
        <td class="color555  td2">
        <input class="my_info_content_care_table_text" name="address" type="text" value=<% %>> </td>  <!-- 从数据库取 -->
      </tr>
      <tr>
        <td align="right" class="color555">注册日期：</td>
        <td class="color555 td2"><% %></td>                                  <!-- 从数据库取 -->
      </tr>
      <tr>
        <td align="center" class="color555" colspan="2">
        <button class="my_info_content_care_table_submit" name="" type="onclick" >保    存</button></td>
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
        			province:'福建',
        			city:'厦门',
        			area:'思明',
        			towm:'思明南路'            /*这四个值应从数据库取*/
        			onChange:function(info){
        				townFormat(info);
        			}
        		},function(api){
        			var info = api.getInfo();
        			townFormat(info);
        		});
            </script>


  <script type="text/javascript" src="../js/script.js"></script>
</body>
</html>