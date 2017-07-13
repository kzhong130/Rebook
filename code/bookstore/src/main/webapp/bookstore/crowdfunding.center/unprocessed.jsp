<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.BookComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
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
<link href="../css/crowdfunding.center/sell_book.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
	ArrayList<Book> books = new ArrayList<Book>();
	books = (ArrayList<Book>)session.getAttribute("bookByBookComment");
%>
<body>

	<!-- 开始 -->
	<div class="my_info_title">
		未被处理的申请
		<!--<span><button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p></span>-->
	</div>
	<hr>

	<!-- 每本书 -->

<!-- 借书申请  -->
<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="https://img3.doubanio.com/mpic/s28397415.jpg<% %>"/></a><br>

          
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<% %>二手时间》<span class="isbn"><% %>9787508658346</span></td>
              <td>
              <p class="time">书币要求：<span class="coin"><% %>10&nbsp;&nbsp;</span></p>
              </td>
              </tr>
              
              
              <tr>
              <td>
              <p class="comment">书主信息：<% %>沈蓓蓓&nbsp;&nbsp;<% %>15821911839&nbsp;&nbsp;<% %>上海闵行</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<% %>上海市闵行区东川路800号上海交通大学</p>
              </td>
              <td>
              <p class="time" title="" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis">卖家：<% %>sbb2017&nbsp;&nbsp;</p>
              <p class="time">可借天数：<% %>27&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td colspan="2">
              <p class="comment">新旧程度：<% %>五成新&emsp;&emsp;&emsp;&emsp;送书方式：<% %>邮寄</p>
              <p class="comment">备注：<% %>请小心的对待这本书（没有备注则写无）</p>
              </td>
              </tr>
              
              <tr><td colspan="2"><hr class="fortr"></td></tr>
              <tr>
              <td>
              <p class="comment">收件人：<% %>洪晓雅&nbsp;&nbsp;<% %>15821123456&emsp;&emsp;还书方式：<% %>邮寄</p>
              <p class="comment">收货地址：<% %>福建省厦门市翔安区新店镇新兴街610号</p>
              </td>
              <td class="deletebutton" style="vertical-align:bottom;">
              <p class="time"><span class="coin"><% %>借书&nbsp;&nbsp;</span></p>
              <button class="delete tc" name="" >修改</button>
              <button class="delete" value="<% %>" onclick="" >取消</button>
              </td>
              </tr>
              
           </table>
           </td>
        </tr>
		</table>
</div>
<br>
<!-- 购书申请  -->
<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="https://img3.doubanio.com/mpic/s29459533.jpg<% %>"/></a><br>

          
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<% %>外婆的道歉信》<span class="isbn"><% %>9787201116693</span></td>
              <td><p class="time">书币要求：<span class="coin"><% %>10&nbsp;&nbsp;</span></p></td>
              </tr>
              
              <tr>
              <td>
              <p class="comment">书主信息：<% %>沈蓓蓓&nbsp;&nbsp;<% %>15821911839&nbsp;&nbsp;<% %>上海闵行</p>
              </td>
              <td>
              <p class="time" title="" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis">卖家：<% %>sbb2017&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td colspan="2">
              <p class="comment">新旧程度：<% %>五成新&emsp;&emsp;&emsp;&emsp;送书方式：<% %>邮寄</p>
              <p class="comment">备注：<% %>请小心的对待这本书（没有备注则写无）</p>
              </td>
              </tr>
              
              <tr><td colspan="2"><hr class="fortr"></td></tr>
              <tr>
              <td>
              <p class="comment">收件人：<% %>洪晓雅&nbsp;&nbsp;<% %>15821123456</p>
              <p class="comment">收货地址：<% %>福建省厦门市翔安区新店镇新兴街610号</p>
              </td>
              <td class="deletebutton" style="vertical-align:bottom;">
              <p class="time"><span class="coin"><% %>购书&nbsp;&nbsp;</span></p>
              <button class="delete td" name="" >修改</button>
              <button class="delete" value="<% %>" onclick="" >取消</button>
              </td>
              </tr>
              
           </table>
           </td>
        </tr>
		</table>
</div>
<br>	
	
	
	
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
 						       <input class="reg_ownername" name="ownerName" type="text" value=<% %>> <!-- 从数据库取 -->
 						       <span class="tip ownername_hint"></span>
 						     </td>
 						     </tr>
						      <tr>
						        <td align="right" class="color555">联系方式：</td>
						        <td class="color555 td2" >
						        <input class="reg_ownerphone" name="ownerPhone" type="text" value=<% %>> <!-- 从数据库取 -->
						         <span class="tip ownerphone_hint"></span>
						        </td>
						      </tr>  						    
   						    <tr>
   						     <td align="right" class="color555">收货地址：</td>
   						     <td class="color555 td2"><div id="demo3">
  						                    <select name="province"></select>
  						                    <select name="city"></select>
 						                    </div></td>
 						     </tr> 						     
						      <tr>
  						      <td align="right" class="color555">&nbsp;</td>
  						      <td class="color555  td2">
  						      <input class="reg_address" name="address" type="text" value=<% %>>   <!-- 从数据库取 -->
  						      <span class="tip address_hint"></span></td>  
     
  						     </tr>
 						     <tr>
   						     <td align="right" class="color555">还书方式：</td>
   						     <td><div><p>
        						          <select name="sendway" class="reg_sendway">
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
 						       <input class="reg_ownername" name="ownerName" type="text" value=<% %>> <!-- 从数据库取 -->
 						       <span class="tip ownername_hint"></span>
 						     </td>
 						     </tr>
						      <tr>
						        <td align="right" class="color555">联系方式：</td>
						        <td class="color555 td2" >
						        <input class="reg_ownerphone" name="ownerPhone" type="text" value=<% %>> <!-- 从数据库取 -->
						         <span class="tip ownerphone_hint"></span>
						        </td>
						      </tr>  						    
   						    <tr>
   						     <td align="right" class="color555">收货地址：</td>
   						     <td class="color555 td2"><div id="demo3">
  						                    <select name="province"></select>
  						                    <select name="city"></select>
 						                    </div></td>
 						     </tr> 						     
						      <tr>
  						      <td align="right" class="color555">&nbsp;</td>
  						      <td class="color555  td2">
  						      <input class="reg_address" name="address" type="text" value=<% %>>   <!-- 从数据库取 -->
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














	<!-- 结束 -->
	<script src="../js/jquery-2.1.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

<script type="text/javascript">
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

</script>
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
        			province:'<% %>',
        			city:'<% %>',
        			
            /*这2个值应从数据库取*/
        			onChange:function(info){
        				townFormat(info);
        			}
        		},function(api){
        			var info = api.getInfo();
        			townFormat(info);
        		});

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
      		 
      			$.ajax({  
      		        type:"POST",  
      		        url:"",  
      		        async:false,
      		        data:{} ,
      		        
      		    });
      			
      			alert("修改成功");
      		}
      		else{
      			alert("请完善信息");
      		}
      	}  
      	function lendupdate(){
      		
      		if(lendreceiver_Boolean && lendaddress_Boolean && lendphone_Boolean){
      		 
      			$.ajax({  
      		        type:"POST",  
      		        url:"",  
      		        async:false,
      		        data:{} ,
      		        
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