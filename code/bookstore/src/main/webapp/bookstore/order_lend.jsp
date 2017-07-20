<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page import="model.BookIN" %>
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
	int bookRecordID = Integer.parseInt(request.getParameter("ID"));
	Book book = new Book();
    if (session.getAttribute("book")!=null){
    	book = (Book)session.getAttribute("book");
    }
    ArrayList<BookIN> bookINs = new ArrayList<BookIN>();
    bookINs = (ArrayList<BookIN>)session.getAttribute("bookIN");
    BookIN bookIN = new BookIN();
    for (int i = 0; i<bookINs.size() ; i++){
    	if (bookINs.get(i).getBookRecordID() == bookRecordID){
    		bookIN = bookINs.get(i);
    		break;
    	}
    }
    String recency="";
    if ("20%".equals(bookIN.getRecency())){
    	recency = "两成新";
    }
    if ("50%".equals(bookIN.getRecency())){
    	recency = "五成新";
    }
    if ("80%".equals(bookIN.getRecency())){
    	recency = "八成新";
    }
    if ("100%".equals(bookIN.getRecency())){
    	recency = "全新";
    }
    
    String sendWay = "";
    if ("mail".equals(bookIN.getSendWay())){
    	sendWay = "邮寄";
    }
    if ("face".equals(bookIN.getSendWay())){
    	sendWay = "当面";
    }
%>
<p></p>
<!-- 借书申请 -->
<div class="container">
<div class="my_info_title">借书申请</div>
<br>
</div>

<div class="container">
  <div class="bookinfobox" style="background-image: url(images/orderBorrow_bg.png);">
     <table  style="width:100%;">
        <tr>
          <td class="bookimage" style="vertical-align:text-top;"><a href="bookAction!getBookInfo?ISBN=<%=book.getISBN()%> "><img class="listbook" src="<%=book.getImage() %>"/></a></td>
          <td class="bookcontent" style="vertical-align:top;">
             <p class="bookname">《<%=book.getBookName() %>》</p>
             <p class="comment">作者：<%=book.getAuthor() %></p>
             <p class="comment">出版社：<%=book.getPublisher() %></p>
             <p class="comment">定价：<%=book.getPrice() %></p>
         
           </td>
        </tr>
      </table>
  </div>
      <p class="comment">书主信息：<%=bookIN.getOwnerName() %>&nbsp;&nbsp;
                                  <%=bookIN.getOwnerPhone() %>&nbsp;&nbsp;
                                  <%=bookIN.getProvince()+" "+bookIN.getCity() %>&nbsp;&nbsp;
                                  <%=bookIN.getOwnerAddress() %></p>  
             
      <p class="comment">新旧程度：<%=recency %>&emsp;&emsp;&emsp;&emsp;
                                                                  送书方式：<%=sendWay %>&emsp;&emsp;&emsp;&emsp;
                                                                  借书天数：<%=bookIN.getLongestDuration()+"天" %></p>
      <%if (bookIN.getNote() == null){ %>
      <p class="comment">备注：无 </p>    
      <%} %>     
      <%if (bookIN.getNote() != null){ %>
      <p class="comment">备注：<%=bookIN.getNote() %></p>    
      <%} %> 
   <hr>
   
   

   <div class="reg_div">
    <ul class="reg_ul">
      <li>
          <span>收货人：</span>
          <input type="text" name="" value="" placeholder="收货人" class="reg_receiver" id ="receiverName">
          <span class="tip receiver_hint"></span>
      </li>
      <li>
          <span>联系方式：</span>
          <input type="text" name="" value="" placeholder="联系方式" class="reg_buyphone" id="phone">
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
          <input type="text" name="detail" value="" placeholder="详细地址" class="reg_buyaddress" id="address">
          <span class="tip buyaddress_hint"></span>      
      </li>
      <li>
          <span>还书方式：</span>
          <div class="citys"><p>
          <select name="sendway" class="reg_sendway" id="returnWay">
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
             <p>支付：<span class="money"><%=bookIN.getCoinNumber() %>书币</span></p>
         </td>
        </tr>
        <tr>
          <td >
             <a href="bookAction!getBookInfo?ISBN=<%=book.getISBN()%> " ><span class="return">返回</span></a>
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
  <script type="text/javascript" src="js/jquery.citys.js"></script>      
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
        			town:'翔安区',
        	 		
            /*这2个值应从数据库取*/
        			onChange:function(info){
        				townFormat(info);
        			}
        		},function(api){
        			var info = api.getInfo();
        			townFormat(info);
        		});

                var receiver_Boolean=false;
                var buyphone_Boolean=false;
                var buyaddress_Boolean=false;

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
                
                $('.pay').click(function(){
                	if(receiver_Boolean && buyphone_Boolean && buyaddress_Boolean){
                		
                		var select = document.getElementsByName("province")[0];
                		var province = select.options[select.selectedIndex].text;
                		var city = "";
                		var town = "";
                		if(document.getElementsByName("city")[0].value!=""){	//非直辖市
                			 select=document.getElementsByName("city")[0];
                			 city=select.options[select.selectedIndex].text;
                			 select = document.getElementsByName("area")[0];
                			 town = select.options[select.selectedIndex].text;
                		}
                		else{	//直辖市
                			 select=document.getElementsByName("area")[0];
                			 town=select.options[select.selectedIndex].text;
                		}
                		var bookRecordID = "<%=request.getParameter("ID")%>";
                		bookRecordID = parseInt(bookRecordID);
                		var userName = "<%=session.getAttribute("loginUserName")%>";
                		var address = document.getElementById("address").value;
                		var receiverName = document.getElementById("receiverName").value;
                		var requestStatus = "waiting";
                		var returnWay = $("#returnWay").val();
                		var phone = document.getElementById("phone").value;
                		var ISBN = "<%=book.getISBN()%>";
                		var returnHref = "bookAction!getBookInfo?ISBN="+ISBN;
                		$.ajax({
                			type:"POST",
                			url:"RequestAction!addRequestBook",
                			async:false,
                			data:{bookRecordID:bookRecordID,userName:userName,city:city,province:province,town:town,address:address,receiverName:receiverName,requestStatus:requestStatus,returnWay:returnWay,phone:phone},
                			success:function(result){
                				result = eval('('+result + ')');
                				if (result.success){
                					alert("支付成功,请等待书主确认");
                					window.location.href = returnHref;
                				}
                				else{
                					alert("支付失败");
                					}
                				}
                			})
                	}
                		
                	else{
                		alert("请完善信息");
                	}
                });
                
                
                

</script>
</body>
</html>
