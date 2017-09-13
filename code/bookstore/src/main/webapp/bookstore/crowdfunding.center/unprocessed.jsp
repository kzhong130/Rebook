<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.BookComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
<%@page import="model.BookIN"%>
<%@page import="model.RequestBook"%>

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
<title>未被处理的申请</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/crowdfunding.center/myprocess.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.citys.js"></script>          
 
<div id='MicrosoftTranslatorWidget' class='Dark' style='color:white;background-color:#555555'></div>
<script type='text/javascript'>setTimeout(function(){{var s=document.createElement('script');s.type='text/javascript';s.charset='UTF-8';s.src=((location && location.href && location.href.indexOf('https') == 0)?'https://ssl.microsofttranslator.com':'http://www.microsofttranslator.com')+'/ajax/v3/WidgetV3.ashx?siteData=ueOIGRSKkd965FeEGM5JtQ**&ctf=False&ui=true&settings=Manual&from=';var p=document.getElementsByTagName('head')[0]||document.documentElement;p.insertBefore(s,p.firstChild); }},0);</script>

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
	ArrayList<Book> books = new ArrayList<Book>();
	books = (ArrayList<Book>)session.getAttribute("bookByBookComment");
%>

<%
	
	String Username=(String) session.getAttribute("loginUserName");
	ArrayList<RequestBook> requestList=(ArrayList<RequestBook>)session.getAttribute("UnrequestBookList");
	ArrayList<Book> bookList=(ArrayList<Book>)session.getAttribute("UnbookList");
	ArrayList<BookIN> bookINList=(ArrayList<BookIN>)session.getAttribute("UnbookInList");
	
%>
<body>

	<!-- 开始 -->
	<div class="my_info_title">
		未被处理的申请
	
	</div>
	<hr>
<%

	for(int i=0;i<requestList.size();i++){
		RequestBook requestBook=requestList.get(i);
		Book book=bookList.get(i);
		BookIN bookIn=bookINList.get(i);
		String type=bookIn.getType();
		//System.out.println(bookIn.getRecency());
		if(type.equals("lend")){
			
%>

<!-- 借书申请  -->
<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a  target="view_parent" href="../aa.jsp?ISBN=<%=book.getISBN()%>"><img class="listbook" src="<%=book.getImage() %>"/></a><br>

          
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<%=book.getBookName() %>》<span class="isbn"><%=book.getISBN() %></span></td>
              <td>
              <p class="time">书币要求：<span class="coin"><%=bookIn.getCoinNumber() %>&nbsp;&nbsp;</span></p>
              </td>
              </tr>
              
              
              <tr>
              <td>
              <p class="comment">书主信息：<%=bookIn.getOwnerName() %>&nbsp;&nbsp;<%=bookIn.getOwnerPhone() %>&nbsp;&nbsp;<%=bookIn.getProvince()+bookIn.getCity()+bookIn.getTown() %></p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<%=bookIn.getOwnerAddress() %></p>
              </td>
              <td>
              <p class="time" title="" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis">卖家：<%=bookIn.getUserName() %>&nbsp;&nbsp;</p>
              <p class="time">可借天数：<%=bookIn.getLongestDuration() %>&nbsp;&nbsp;</p>
              </td>
              </tr>
               <%
			  String recency=bookIn.getRecency();
			  String w1,w2,w3;
			  w1="";
			  w2="";
			  w3="";
			  //System.out.println(recency);
			  if(recency.equals("20%")) w1="两成新";
			  if(recency.equals("50%")) w1="五成新";
			  if(recency.equals("80%")) w1="八成新";
			  if(recency.equals("100%")) w1="全新";
			  	
			  String delivery=bookIn.getSendWay();
			  if(delivery.equals("face")) w2="当面";
			  else w2="邮寄";
			  w3=bookIn.getNote();
			  if(w3=="") w3="无";
			  %>            
              <tr>
              <td colspan="2">
              <p class="comment">新旧程度：<%=w1 %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=w2 %></p>
              <p class="comment">备注：<%=w3 %></p>
              </td>
              </tr>
              
              <tr><td colspan="2"><hr class="fortr"></td></tr>
              <tr>
              <td>
              <p class="comment" id="<%=i %>lendInfo">收件人：<%=requestBook.getReceiverName() %>&nbsp;&nbsp;<%=requestBook.getPhone() %>&emsp;&emsp;还书方式：
			  <%
              	if("mail".equals(requestBook.getReturnWay())){
              %>邮寄
              <%} %>
              <%
              	if("face".equals(requestBook.getReturnWay())){
              %>当面
              <%} %>
             </p>
              <p class="comment" id="<%=i%>lendAddress">收货地址：<%=requestBook.getProvince()+requestBook.getCity()+requestBook.getTown()+requestBook.getAddress() %></p>

              </td>
              <td class="deletebutton" style="vertical-align:bottom;">
              <p class="time"><span class="coin"><% %>借书&nbsp;&nbsp;</span></p>
              <button class="delete tc" name="" id=<%=requestBook.getRequestID() %> onclick="modifyLend(this.id)">修改</button>
              <button class="delete" value="<%=requestBook.getRequestID() %>"  onclick="cancel(this.value)"  >取消</button>
              </td>
              </tr>
              
           </table>
           </td>
        </tr>
		</table>
</div>
<br>

<%
		}
%>
<%
	if(type.equals("sell")){
%>
<!-- 购书申请  -->
<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a  target="view_parent" href="../aa.jsp?ISBN=<%=book.getISBN()%>"><img class="listbook" src="<%=book.getImage() %>"/></a><br>

          
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<%=book.getBookName() %>》<span class="isbn"><%=book.getISBN() %></span></td>
              <td><p class="time">书币要求：<span class="coin"><%=bookIn.getCoinNumber() %>&nbsp;&nbsp;</span></p></td>
              </tr>
              
              <tr>
              <td>
              <p class="comment">书主信息：<%=bookIn.getOwnerName() %>&nbsp;&nbsp;<%=bookIn.getOwnerPhone() %>&nbsp;&nbsp;<%=bookIn.getProvince()+bookIn.getCity()+bookIn.getTown() %></p>
              </td>
              <td>
              <p class="time" title="" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis">卖家：<%=bookIn.getUserName() %>&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td colspan="2">
              <%
			  String recency=bookIn.getRecency();
			  String w1,w2,w3;
			  w1="";
			  w2="";
			  w3="";
			  //System.out.println(recency);
			  if(recency.equals("20%")) w1="两成新";
			  if(recency.equals("50%")) w1="五成新";
			  if(recency.equals("80%")) w1="八成新";
			  if(recency.equals("100%")) w1="全新";
			  	
			  String delivery=bookIn.getSendWay();
			  if(delivery.equals("face")) w2="当面";
			  else w2="邮寄";
			  w3=bookIn.getNote();
			  if(w3==null) w3="无";
			  %>  
               <p class="comment">新旧程度：<%=w1 %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=w2 %></p>
              <p class="comment">备注：<%=w3 %></p>
              </td>
              </tr>
              
              <tr><td colspan="2"><hr class="fortr"></td></tr>
              <tr>
              <td>
              <p class="comment">收件人：<%=requestBook.getReceiverName() %>&nbsp;&nbsp;<%=requestBook.getPhone() %></p>
              <p class="comment">收货地址：<%=requestBook.getProvince()+requestBook.getCity()+requestBook.getAddress() %></p>
              </td>
              
              <td class="deletebutton" style="vertical-align:bottom;">
              <p class="time"><span class="coin"><% %>购书&nbsp;&nbsp;</span></p>
              <button class="delete td" name="" id=<%=requestBook.getRequestID() %> onclick="modifySell(this.id)">修改</button>
              <button class="delete" value="<%=requestBook.getRequestID() %>" onclick="cancel(this.value)" >取消</button>
              </td>
              </tr>
              
           </table>
           </td>
        </tr>
		</table>
</div>
<br>	
<%
	}
%>
<%
	}
%>

	
	
	
<!-- 借书修改的按钮 -->
<div id="gray"></div>
<div class="popup" id="lend">

	<div class="top_nav" id='top_nav'>
		<div align="center">
			<span>修改</span>
			<a class="guanbi"></a>
		</div>
	</div>	
	<div class="min">
		<div class="tc_login">
			<div class="right">
					<div align="center">
						<table class="my_info_content_care_table">
						    <tbody>
						      <tr>
 						       <td align="right" class="color555">收件人：</td>
						        <td class="color555 td2" >
 						       <input class="reg_ownername" name="ownerName" id="lend_ownerName" type="text" value=<% %>> <!-- 从数据库取 -->
 						       <span class="tip ownername_hint"></span>
 						     </td>
 						     </tr>
						      <tr>
						        <td align="right" class="color555">联系方式：</td>
						        <td class="color555 td2" >
						        <input class="reg_ownerphone" name="ownerPhone" id="lend_ownerPhone"type="text" value=<% %>> <!-- 从数据库取 -->
						         <span class="tip ownerphone_hint"></span>
						        </td>
						      </tr>  						    
   						    <tr>
   						     <td align="right" class="color555">收货地址：</td>
   						     <td class="color555 td2"><div id="demo3">
  						                    <select name="province"></select>
  						                    <select name="city"></select>
  						                    <br>
  						                    <select name="area"></select>
 						                    </div></td>
 						     </tr> 						     
						      <tr>
  						      <td align="right" class="color555">&nbsp;</td>
  						      <td class="color555  td2">
  						      <input class="reg_address" name="address" id="lend_address" type="text" value=<% %>>   <!-- 从数据库取 -->
  						      <span class="tip address_hint"></span></td>  
     
  						     </tr>
 						     <tr>
   						     <td align="right" class="color555">还书方式：</td>
   						     <td><div><p>
        						          <select name="sendway" id="sendway" class="reg_sendway">
       						             <option value ="face">当面</option>
       						             <option value ="mail">邮寄</option>
      						            </select></p></div> </td>
 						     </tr>
 						    <tr>
  						      <td align="center" class="color555" colspan="2">
  						      <button class="my_info_content_care_table_submit" name="" type="onclick" onclick="lendupdate()" >保    存</button></td>
   						     
  						    </tr>
  						  </tbody>
 						 </table>
					</div>
			</div>		
		</div>	
	</div>
</div>
<!-- 购书修改的按钮 -->
<div id="gray"></div>
<div class="popup" id="buy">

	<div class="top_nav" id='top_nav'>
		<div align="center">
			<span>修改</span>
			<a class="guanbi"></a>
		</div>
	</div>	
	<div class="min">
		<div class="tc_login">
			<div class="right">
					<div align="center">
						<table class="my_info_content_care_table">
						    <tbody>
						      <tr>
 						       <td align="right" class="color555">收件人：</td>
						        <td class="color555 td2" >
 						       <input class="reg_ownername" name="ownerName" id="sell_ownerName" type="text" value=<% %>> <!-- 从数据库取 -->
 						       <span class="tip ownername_hint"></span>
 						     </td>
 						     </tr>
						      <tr>
						        <td align="right" class="color555">联系方式：</td>
						        <td class="color555 td2" >
						        <input class="reg_ownerphone" name="ownerPhone" id="sell_ownerPhone" type="text" value=<% %>> <!-- 从数据库取 -->
						         <span class="tip ownerphone_hint"></span>
						        </td>
						      </tr>  						    
   						    <tr>
   						     <td align="right" class="color555">收货地址：</td>
   						     <td class="color555 td2"><div id="demo4">
  						                    <select name="province"></select>
  						                    <select name="city"></select>
  						                    <br>
  						                    <select name="area"></select>
 						                    </div></td>
 						     </tr> 						     
						      <tr>
  						      <td align="right" class="color555">&nbsp;</td>
  						      <td class="color555  td2">
  						      <input class="reg_address" name="address" id="sell_address" type="text" value=<% %>>   <!-- 从数据库取 -->
  						      <span class="tip address_hint"></span></td>  
     
  						     </tr>
 						    <tr>
  						      <td align="center" class="color555" colspan="2">
  						      <button class="my_info_content_care_table_submit" name="" type="onclick" onclick="buyupdate()" >保    存</button></td>
   						     
  						    </tr>
  						  </tbody>
 						 </table>
					</div>
			</div>		
		</div>	
	</div>
</div>



	<!--<script src="../js/jquery-2.1.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>  -->

<script type="text/javascript">



var requestID;

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

var $town = $('#demo4 select[name="town"]');
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


	function modifyLend(id){
		var province;
		var city;
		var area;
		var address;
		var gender;
		var returnWay;
		var name;
		var phone;
		requestID=id;
		$.ajax({  
		        type:"POST",  
		        url:"RequestAction!searchRequestInfo",  
		        async:false,
		        data:{requestID:id} ,
		        
		        success:function(msg){ 
		        	//alert(msg);
		        	msg=eval('('+msg+')');
		        	
		        	city=msg.city;
		        	province=msg.province;
		        	area=msg.area;
		        	name=msg.name;
		        	phone=msg.phone;
		        	address=msg.address;
		        	returnWay=msg.returnWay;	        	
		        }  
		});
		
		//alert(province);
        $('#demo3').citys({
			province:province,
			city:city,
			area:area,
			

			onChange:function(info){
				townFormat(info);
			}
		},function(api){
			var info = api.getInfo();
			townFormat(info);
		});
        
        document.getElementById("lend_address").value=address;
        document.getElementById("lend_ownerName").value=name;
        document.getElementById("lend_ownerPhone").value=phone;
       	var options=document.getElementById("sendway").options;
       	for(var i=0;i<options.length;i++){
       		if(options[i].value==returnWay){
       			
       			options[i].selected=true;
       		}
       	}
	}
	
	function modifySell(id){
		var province;
		var city;
		var area;
		var address;
		var name;
		var phone;
		requestID=id;
		$.ajax({  
		        type:"POST",  
		        url:"RequestAction!searchRequestInfo",  
		        async:false,
		        data:{requestID:id} ,
		        
		        success:function(msg){ 
		        	//alert(msg);
		        	msg=eval('('+msg+')');
		        	
		        	city=msg.city;
		        	province=msg.province;
		        	area=msg.area;
		        	name=msg.name;
		        	phone=msg.phone;
		        	address=msg.address;
		        	       	
		        }  
		});
		
		//alert(province);
        $('#demo4').citys({
			province:province,
			city:city,
			area:area,
			

			onChange:function(info){
				townFormat(info);
			}
		},function(api){
			var info = api.getInfo();
			townFormat(info);
		});
        
        document.getElementById("sell_address").value=address;
        document.getElementById("sell_ownerName").value=name;
        document.getElementById("sell_ownerPhone").value=phone;
       	
	}

function cancel(id){
	alert("取消成功");
	$.ajax({  
	        type:"POST",  
	        url:"RequestAction!cancle",  
	        async:false,
	        data:{requestID:id}
	    });
	window.location.assign("unprocessed.jsp");
}

//窗口效果
//点击登录class为tc 显示
$(".tc").click(function(){

	$("#gray").show();
	
	$("#lend").show();//查找ID为popup的DIV show()显示#gray
	tc_center();
});
//点击登录class为td 显示
$(".td").click(function(){
	$("#gray").show();
	$("#buy").show();//查找ID为popup的DIV show()显示#gray
	tc_center();
});

//点击关闭按钮
$("a.guanbi").click(function(){
	$("#gray").hide();
	$("#lend").hide();//查找ID为popup的DIV hide()隐藏
	$("#buy").hide();//查找ID为popup的DIV hide()隐藏

})

//窗口水平居中
$(window).resize(function(){
	tc_center();
});

function tc_center(){
	var _top=($(window).height()-$(".popup").height())/3;
	var _left=($(window).width()-$(".popup").width())/2;
	
	$(".popup").css({top:_top,left:_left});
}


function tt(dd){
    //alert(dd);
}
var GG = {
    "kk":function(mm){
       // alert(mm);
    }
}


$(document).ready(function(){ 

	$(".top_nav").mousedown(function(e){ 
		$(this).css("cursor","move");//改变鼠标指针的形状 
		var offset = $(this).offset();//DIV在页面的位置 
		var x = e.pageX - offset.left;//获得鼠标指针离DIV元素左边界的距离 
		var y = e.pageY - offset.top;//获得鼠标指针离DIV元素上边界的距离 
		$(document).bind("mousemove",function(ev){ //绑定鼠标的移动事件，因为光标在DIV元素外面也要有效果，所以要用doucment的事件，而不用DIV元素的事件 
		
			$(".popup").stop();//加上这个之后 
			
			var _x = ev.pageX - x;//获得X轴方向移动的值 
			var _y = ev.pageY - y;//获得Y轴方向移动的值 
		
			$(".popup").animate({left:_x+"px",top:_y+"px"},10); 
		}); 

	}); 

	$(document).mouseup(function() { 
		$(".popup").css("cursor","default"); 
		$(this).unbind("mousemove");
	})
})



        	
                var buyreceiver_Boolean=true;
                var buyphone_Boolean=true;
                var buyaddress_Boolean=true;
                var lendreceiver_Boolean=true;
                var lendphone_Boolean=true;
                var lendaddress_Boolean=true;                

       
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

                //buyreceiver
                $('.reg_buyreceiver').blur(function(){
                  if ((/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/).test($(".reg_buyreceiver").val())){
                    $('.buyreceiver_hint').html("✔").css("color","green");
                    buyreceiver_Boolean = true;
                  }else {
                    $('.buyreceiver_hint').html("×").css("color","red");
                    buyreceiver_Boolean = false;
                  }
                });
                
              
              //buyaddress
                $('.reg_buyaddress').blur(function(){
                  if ($(".reg_buyaddress").val()!= ""){
                    $('.buyaddress_hint').html("✔").css("color","green");
                    buyaddress_Boolean = true;
                  }else {
                    $('.buyaddress_hint').html("×").css("color","red");
                    buyaddress_Boolean = false;
                  }
        
                }); 
              
             // lendphone
                $('.reg_lendphone').blur(function(){
                  if ((/^1[34578]\d{9}$/).test($(".reg_lendphone").val())){
                    $('.lendphone_hint').html("✔").css("color","green");
                    lendphone_Boolean = true;
                  }else {
                    $('.lendphone_hint').html("×").css("color","red");
                    lendphone_Boolean = false;
                  }
                });

                //lendreceiver
                $('.reg_lendreceiver').blur(function(){
                  if ((/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/).test($(".reg_lendreceiver").val())){
                    $('.lendreceiver_hint').html("✔").css("color","green");
                    lendreceiver_Boolean = true;
                  }else {
                    $('.lendreceiver_hint').html("×").css("color","red");
                    lendreceiver_Boolean = false;
                  }
                });
                
              
              //lendaddress
                $('.reg_lendaddress').blur(function(){
                  if ($(".reg_lendaddress").val()!= ""){
                    $('.lendaddress_hint').html("✔").css("color","green");
                    lendaddress_Boolean = true;
                  }else {
                    $('.lendaddress_hint').html("×").css("color","red");
                    lendaddress_Boolean = false;
                  }
        
                }); 
    
      	function buyupdate(){
      		
      		if(buyreceiver_Boolean && buyaddress_Boolean && buyphone_Boolean){
      		 
        		  var select = document.getElementsByName("province")[1];
          		  var province=select.options[select.selectedIndex].text;
          		  //alert(document.getElementsByName("city")[0].value);
          		  //alert(province);
          		  if(document.getElementsByName("city")[1].value!=""){
          			  select=document.getElementsByName("city")[1];
          			  var city=select.options[select.selectedIndex].text;
          		  }
          		  else {
          			  var city="";
          			  //alert(2);
          		  }
          		  //alert(2333);
          		  //alert(city);
          		  if(document.getElementsByName("area")[1].value!=""){
          			  select=document.getElementsByName("area")[1];
          			  var area=select.options[select.selectedIndex].text;
          		  }
          		  else var area="";
          		 // alert(area);
          		//alert(document.getElementById("sell_address").value);  
      			$.ajax({  
      		        type:"POST",  
      		        url:"RequestAction!changeInfo",  
      		        async:false,
      		        data:{province:province,town:area,city:city,receiverName:document.getElementById("sell_ownerName").value,address:document.getElementById("sell_address").value,phone:document.getElementById("sell_ownerPhone").value,requestID:requestID} ,
      		        
      		    });
      			
      			alert("修改成功");
      		}
      		else{
      			alert("请完善信息");
      		}
      	}  
      	function lendupdate(){
      		
      		if(lendreceiver_Boolean && lendaddress_Boolean && lendphone_Boolean){
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
        		  
        		  if(document.getElementsByName("area")[0].value!=""){
        			  select=document.getElementsByName("area")[0];
        			  var area=select.options[select.selectedIndex].text;
        		  }
        		  else var area="";
        		  var a;
        		  var options=document.getElementById("sendway").options;
        	       	for(var i=0;i<options.length;i++){
        	       		if(options[i].selected==true){
        	       			
        	       			a=options[i].value;
        	       		}
        	       	}
        		//alert(a);
    			$.ajax({  
    		        type:"POST",  
    		        url:"RequestAction!changeInfo",  
    		        async:false,
    		        data:{returnWay:a,province:province,town:area,city:city,receiverName:document.getElementById("lend_ownerName").value,address:document.getElementById("lend_address").value,phone:document.getElementById("lend_ownerPhone").value,requestID:requestID} ,
    		        
    		    });
    			
      			
      		    
      			
      			alert("修改成功");
      			//window.location.assign("MemberCenterAction!initialize");
      			
      			
      		}
      		else{
      			alert("请完善信息");
      		}
      	}       	
</script>
</body>
</html>