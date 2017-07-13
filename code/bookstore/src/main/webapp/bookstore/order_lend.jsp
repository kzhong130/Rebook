<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BookComment" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Product Page Template</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/order_buysell.css">

</head>
<body>
<%
String url;
if (request.getQueryString()!=null){
	url = request.getScheme()+"://"+ request.getServerName()+":8080"+request.getRequestURI()+"?"+request.getQueryString();  
}
else{
	url = request.getScheme()+"://"+ request.getServerName()+":8080"+request.getRequestURI();  
}
session.setAttribute("prePage", url);

%>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="centerPage.jsp"><img src="images/index1_logo.png"/></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      
      <!--<form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>  -->
      
      <ul class="nav navbar-nav navbar-right hidden-sm" id="personalInfo">
        <li><a href='MemberCenterAction!initialize'>个人中心</a></li>
        <li><a href='test.jsp'>返回首页</a></li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>


<%
	Book book = new Book();
    if (session.getAttribute("book")!=null){
    	book = (Book)session.getAttribute("book");
    }
    ArrayList<BookComment> bookComments = new ArrayList<BookComment>();
    bookComments = (ArrayList<BookComment>)session.getAttribute("bookComment");
%>
<p></p>
<!-- 借书申请 -->
<div class="container">
<div class="my_info_title">借书申请</div>
<br>
</div>

<div class="container">
  <div class="bookinfobox">
     <table  style="width:100%;">
        <tr>
          <td class="bookimage" style="vertical-align:text-top;"><a href=<% %>><img class="listbook" src="https://img3.doubanio.com/mpic/s29459533.jpg<% %>"/></a></td>
          <td class="bookcontent" style="vertical-align:top;">
             <p class="bookname">《外婆的道歉信<% %>》</p>
             <p class="comment">作者：<% %>[瑞典] 弗雷德里克·巴克曼</p>
             <p class="comment">出版社：<% %>天津人民出版社</p>
             <p class="comment">定价：<% %>42.00元</p>
         
           </td>
        </tr>
      </table>
  </div>
      <p class="comment">书主信息：<% %>洪晓雅&nbsp;&nbsp;
                                  <% %>15821911839&nbsp;&nbsp;
                                  <% %>福建厦门&nbsp;&nbsp;
                                  <% %>翔安区新店镇新兴街610号</p>  
             
      <p class="comment">新旧程度：<% %>五成新&emsp;&emsp;&emsp;&emsp;
                                                                  送书方式：<% %>邮寄&emsp;&emsp;&emsp;&emsp;
                                                                  借书天数：<% %>20</p>
      <p class="comment">备注：<% %>请小心的对待这本书（没有备注则写无）</p>         
   <hr>
   
   
   <!-- 判断一下，如果上面的送书方式是上门的话下面一部分不需要显示 -->
   <div class="reg_div">
    <ul class="reg_ul">
      <li>
          <span>收货人：</span>
          <input type="text" name="" value="" placeholder="收货人" class="reg_receiver">
          <span class="tip receiver_hint"></span>
      </li>
      <li>
          <span>联系方式：</span>
          <input type="text" name="" value="" placeholder="联系方式" class="reg_buyphone">
          <span class="tip buyphone_hint"></span>
      </li>
      <li>
          <span>收货地址：</span>
            <div id="demo3" class="citys">
                <p>
                    <select name="province"></select>
                    <select name="city"></select>
                    <select name="area"></select>
                </p>
            </div>
      </li>
      <li>          
          <span>&nbsp;</span>
          <input type="text" name="detail" value="" placeholder="详细地址" class="reg_buyaddress">
          <span class="tip buyaddress_hint"></span>      
      </li>
      <li>
          <span>送书方式：</span>
          <div class="citys"><p>
          <select name="sendway" class="reg_sendway">
            <option value ="face">当面</option>
            <option value ="mail">邮寄</option>
          </select></p></div> 
      </li>
      </ul>
    </div>
    <!-- 支付按钮 -->
    <div class="paybox">
     <table  style="width:100%;">
        <tr>
          <td>
             <p>支付：<span class="money">30<% %>书币</span></p>
         </td>
        </tr>
        <tr>
          <td >
             <a href="" ><span class="return">返回</span></a>
             <button class="pay">提出申请</button>
         </td>
        </tr>
      </table>
  </div>

</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
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
        			province:'福建省',
        			city:'厦门市',
        			town:'翔安区'
        	 		
            /*这2个值应从数据库取*/
        			onChange:function(info){
        				townFormat(info);
        			}
        		},function(api){
        			var info = api.getInfo();
        			townFormat(info);
        		});

                var receiver_Boolean=true;
                var buyphone_Boolean=true;
                var buyaddress_Boolean=true;

                //receiver
                $('.reg_receiver').blur(function(){
                  if ((/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/).test($(".reg_receiver").val())){
                    $('.receiver_hint').html("✔").css("color","green");
                    receiver_Boolean = true;
                  }else {
                    $('.receiver_hint').html("×").css("color","red");
                    receiver_Boolean = false;
                  }
                });                
       
                // buyphone
                $('.reg_buyphone').blur(function(){
                  if ((/^1[34578]\d{9}$/).test($(".reg_buyphone").val())){
                    $('.buyphone_hint').html("✔").css("color","green");
                    buyphone_Boolean = true;
                  }else {
                    $('.buyphone_hint').html("×").css("color","red");
                    buyphone_Boolean = false;
                  }
                });

                //buyaddress
                $('.reg_buyaddress').blur(function(){
                  if ($(".reg_buyaddress").val() != ""){
                    $('.buyaddress_hint').html("✔").css("color","green");
                    buyaddress_Boolean = true;
                  }else {
                    $('.buyaddress_hint').html("×").css("color","red");
                    buyaddress_Boolean = false;
                  }
        
                });
                

</script>
</body>
</html>
