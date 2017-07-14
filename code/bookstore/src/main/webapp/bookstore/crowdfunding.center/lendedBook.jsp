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
<title>我卖的书</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/crowdfunding.center/sell_book.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.citys.js"></script>          
 

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
		出借的书
		<!--<span><button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p></span>-->
	</div>
	<hr>

	<!-- 每本书 -->


<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="https://img3.doubanio.com/mpic/s28332051.jpg<% %>"/></a><br>
          <p style="font-size:3px;"></p>
          <button class="delete" style="width:100px" id="application" >查看申请</button>         
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<% %>斯通纳》<span class="isbn"><% %>9787208130500</span></td>
              <td><p class="time">书币要求：<span class="coin"><% %>10&nbsp;&nbsp;</span></p></td>
              </tr>
              
              
              <tr>
              <td>
              <p class="comment">书主信息：<% %>洪晓雅&nbsp;&nbsp;<% %>15821911839&nbsp;&nbsp;<% %>福建厦门</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<% %>福建省厦门市翔安区新店镇新兴街610号</p>
              </td>
              <td>
              <p class="time">可借天数：<% %>27&nbsp;&nbsp;</p>
              <p class="time">状态：<% %>在架上&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td>
              <p class="comment">新旧程度：<% %>五成新&emsp;&emsp;&emsp;&emsp;送书方式：<% %>邮寄</p>
              <p class="comment">备注：<% %>请小心的对待这本书（没有备注则写无）</p>
              <p class="comment">录入时间：<% %>2017.7.11 13:52:12</p>
              </td>
              
              
              
              <td class="deletebutton" style="vertical-align:bottom;">
              
              <button class="delete tc" name="" >修改</button>
              <button class="delete" value="<% %>" onclick="" >删 除</button>
              </td>
              </tr>
           </table>
           </td>
        </tr>
        

		</table>




</div>
<!-- 每个申请细节 -->	
<div class="commentbox" id="appDetail" style="display:none;">
     <table  style="width:828px;">
        <tr>
              <td class="numberlist">1<% %></td>

              <td>
              <p class="comment">申请者：<% %><span><% %></span>&emsp;&emsp;&emsp;&emsp;送书方式：<% %>邮寄</p>
              <p class="comment">书主信息：<% %>洪晓雅&nbsp;&nbsp;<% %>15821911839&nbsp;&nbsp;<% %>福建省厦门市翔安区新店镇新兴街610号</p>
              </td>

              <td class="deletebutton" style="vertical-align:bottom;">
              <button class="delete" value="<% %>" onclick="">通过</button><br>
              <button class="delete" value="<% %>" onclick="">拒绝</button>
              </td>


        </tr>
		</table>
</div>
<br>

	
<!-- 修改的按钮 -->
<div id="gray"></div>
<div class="popup" id="popup">

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
 						       <td align="right" class="color555">书主姓名：</td>
						        <td class="color555 td2" >
 						       <input class="reg_ownername" name="ownerName" type="text" value=<% %>> <!-- 从数据库取 -->
 						       <span class="tip ownername_hint"></span>
 						     </td>
 						     </tr>
						      <tr>
						        <td align="right" class="color555">书主手机：</td>
						        <td class="color555 td2" >
						        <input class="reg_ownerphone" name="ownerPhone" type="text" value=<% %>> <!-- 从数据库取 -->
						         <span class="tip ownerphone_hint"></span>
						        </td>
						      </tr>
 						    <tr>
    						    <td align="right" class="color555">所需书币：</td>
   						     <td class="color555 td2" >
   						     <input class="reg_sellcoinnumber" name="sellcoinnumber" type="text" value=<% %>>    <!-- 从数据库取 -->
    						    <span class="tip sellcoinnumber_hint"></span></td>
   						   </tr>
   						   <tr>
    						    <td align="right" class="color555">可借天数：</td>
   						     <td class="color555 td2" >
   						     <input class="reg_selldaynumber" name="selldaynumber" type="text" value=<% %>>    <!-- 从数据库取 -->
    						    <span class="tip selldaynumber_hint"></span></td>
   						   </tr>
  						    <tr>
    						    <td align="right" class="color555">备注：</td>
   						     <td class="color555 td2" >
   						     <input class="reg_sellnote" name="sellnote" type="text" value=<% %>>    <!-- 从数据库取 -->
    						    <span class="tip sellnote_hint"></span></td>
   						   </tr>
  						    
  						    
   						    <tr>
   						     <td align="right" class="color555">书主地址：</td>
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
   						     <td align="right" class="color555">送书方式：</td>
   						     <td><div><p>
        						          <select name="sendway" class="reg_sendway">
       						             <option value ="face">当面</option>
       						             <option value ="mail">邮寄</option>
      						            </select></p></div> </td>
 						     </tr>
 						     <tr>
   						     <td align="right" class="color555">新旧程度：</td>
   						     <td><div><p>
   						               <select name="recency" class="reg_recency">
   						                 <option value ="20%">两成新</option>
   						                 <option value ="50%">五成新</option>
      						              <option value ="80%">八成新</option>
     						               <option value ="100%">全新</option>
     						             </select></p></div></td>
            
 						     </tr>
 						     
  						    
  						   
  						    <tr>
  						      <td align="center" class="color555" colspan="2">
  						      <button class="my_info_content_care_table_submit" name="" type="onclick" onclick="update()" >保    存</button></td>
   						     
  						    </tr>
  						  </tbody>
 						 </table>
					</div>

			</div>
		
		</div>
	
	</div>

</div>















	<!-- 结束 -->
	<!-- 
	<script src="../js/jquery-2.1.1.min.js"></script>
	<script src="../js/jquery-1.11.3.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	-->

<script type="text/javascript">
//窗口效果
//点击登录class为tc 显示
$(".tc").click(function(){
	$("#gray").show();
	$("#popup").show();//查找ID为popup的DIV show()显示#gray
	tc_center();
});

//点击关闭按钮
$("a.guanbi").click(function(){
	$("#gray").hide();
	$("#popup").hide();//查找ID为popup的DIV hide()隐藏

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
	
	$(".application").click(function(){
        $(".appDetail").slideToggle("slow");
    });
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

                var ownername_Boolean=true;
                var ownerphone_Boolean=true;
                var lendcoinnumber_Boolean=true;
                var lenddaynumber_Boolean=true;
                var owneraddress_Boolean=true;
                

              //sellcoinnumber
              $('.reg_sellcoinnumber').blur(function(){
                if ($(".reg_sellcoinnumber").val()>= 0){
                  $('.sellcoinnumber_hint').html("✔").css("color","green");
                  sellcoinnumber_Boolean = true;
                }else {
                  $('.sellcoinnumber_hint').html("×").css("color","red");
                  sellcoinnumber_Boolean = false;
                }
      
              });
       
             // ownerphone
                $('.reg_ownerphone').blur(function(){
                  if ((/^1[34578]\d{9}$/).test($(".reg_ownerphone").val())){
                    $('.ownerphone_hint').html("✔").css("color","green");
                    ownerphone_Boolean = true;
                  }else {
                    $('.ownerphone_hint').html("×").css("color","red");
                    ownerphone_Boolean = false;
                  }
                });

                //ownername
                $('.reg_ownername').blur(function(){
                  if ((/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/).test($(".reg_ownername").val())){
                    $('.ownername_hint').html("✔").css("color","green");
                    ownername_Boolean = true;
                  }else {
                    $('.ownername_hint').html("×").css("color","red");
                    ownername_Boolean = false;
                  }
                });
                
              //selldaynumber
                $('.reg_selldaynumber').blur(function(){
                  if ($(".reg_selldaynumber").val()>= 0){
                    $('.selldaynumber_hint').html("✔").css("color","green");
                    selldaynumber_Boolean = true;
                  }else {
                    $('.selldaynumber_hint').html("×").css("color","red");
                    selldaynumber_Boolean = false;
                  }
        
                }); 
              
              //owneraddress
                $('.reg_owneraddress').blur(function(){
                  if ($(".reg_owneraddress").val()!= ""){
                    $('.owneraddress_hint').html("✔").css("color","green");
                    owneraddress_Boolean = true;
                  }else {
                    $('.owneraddress_hint').html("×").css("color","red");
                    owneraddress_Boolean = false;
                  }
        
                }); 
    
      	function update(){
      		
      		if(ownername_Boolean && ownername_Boolean && sellcoinnumber_Boolean && owneraddress_Boolean && selldaynumber_Boolean){
      			/* 以下为my_info.jsp中的函数，需要修改*/
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

<script type="text/javascript"> 
     /*$(document).ready(function(){
    	    $(".appDetail").hide();
            $(".application").click(function(){
                  $(".appDetail").slideToggle("slow");
            });
     });*/
</script>
</body>
</html>