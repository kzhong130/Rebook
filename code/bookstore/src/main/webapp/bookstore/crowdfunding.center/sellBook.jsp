<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="model.BookIN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
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
	ArrayList<BookIN> sellBookINs = (ArrayList<BookIN>)session.getAttribute("sellBookINs");
	ArrayList<Book> booksBySellBookINs = (ArrayList<Book>)session.getAttribute("booksBySellBookINs");
	ArrayList<RequestBook> requestBooksBySellBookINs = (ArrayList<RequestBook>)session.getAttribute("requestBooksBySellBookINs");
%>
<body>

	<!-- 开始 -->
	<div class="my_info_title">
		我卖的书
		<!--<span><button type="button" class="but">签到</button>
  <p>07月29日<br>
    漏签1天</p></span>-->
	</div>
	<hr>

	<!-- 每本书 -->
<%
	if (sellBookINs.size() > 0){
		for (int i=0; i<sellBookINs.size(); i++){
			Book book = booksBySellBookINs.get(i);
   			BookIN bookIN = sellBookINs.get(i);
   			String cityInfo ="";
   			if (bookIN.getCity() == ""){	//直辖市
   				cityInfo = bookIN.getProvince() + " " + bookIN.getTown();
   			}
   			if (bookIN.getCity() != ""){	//非直辖市
   				cityInfo = bookIN.getProvince() + " " + bookIN.getCity();
   			}
   			
   			String editValue = "";
   			if (bookIN.getCity() == ""){	//直辖市
   				editValue = bookIN.getProvince() + " " + bookIN.getTown();
   			}
   			if (bookIN.getCity() != ""){
   				editValue = bookIN.getProvince() + " " + bookIN.getCity() + " " + bookIN.getTown();
   			}
   			
   			String recency = "";
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
   			
   			String status = "";
   			if ("yes".equals(bookIN.getInStatus())){
   				status = "在架上";
   			}
   			if ("no".equals(bookIN.getInStatus())){
   				status = "已下架";
   			}
   			
   			String note = "无";
   			if (bookIN.getNote() != ""){
   				note = bookIN.getNote();
   			}
   			
   			ArrayList<RequestBook> myRequestBooks = new ArrayList<RequestBook>();
   			if (requestBooksBySellBookINs.size() > 0){
   				for (int j=0; j<requestBooksBySellBookINs.size(); j++){
   					if (requestBooksBySellBookINs.get(j).getBookRecordID() == bookIN.getBookRecordID()){
   						myRequestBooks.add(requestBooksBySellBookINs.get(j));
   					}
   				}
   			}
%>

<div class="commentbox">
     <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="<%=book.getImage()%>"/></a><br>         
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td class="bookname">《<%=book.getBookName() %>》<span class="isbn"><%=book.getISBN() %></span></td>
              <td style="vertical-align:top;">
              <button class="btn btn-link" value="<%=bookIN.getBookRecordID() %>" onclick="deleteBookIN(this)" style="padding:3px 10px 0 0;color:#efbb24;float:right;">删除</button>
              <button type="button" class="btn btn-link tc" style="padding:3px 5px 0 0;color:#efbb24;float:right;" id="<%=i%>" value="<%=editValue%>">编辑</button>
              </td>
              </tr>
                        
              <tr>
              <td>
              <p class="comment">书主信息：<%=bookIN.getOwnerName() %>&nbsp;&nbsp;<%=bookIN.getOwnerPhone() %>&nbsp;&nbsp;<%=cityInfo %></p>
              <p class="comment">新旧程度：<%=recency %>&emsp;&emsp;&emsp;&emsp;送书方式：<%=sendWay %></p>
              </td>
              
              <td>
              <p class="time">书币要求：<span class="coin"><%=bookIN.getCoinNumber() %>&nbsp;&nbsp;</span></p>
              <p class="time">状态：<%=status %>&nbsp;&nbsp;</p>
              </td>
              </tr>
              
              <tr>
              <td>
              <p class="comment">备注：<%=note %></p>
              <p class="comment">录入时间：<%=bookIN.getInTime().toString().substring(0, 19) %></p>
              </td>
              
              
              
              <td class="deletebutton" style="vertical-align:bottom;padding-left:10px;">

              <button class="delete" style="width:110px" id="application<%=bookIN.getBookRecordID() %>" >查看申请</button> 
              </td>
              </tr>
           </table>
           </td>
        </tr>
		</table>
</div>

<!-- 申请细节 -->	
<div id="appDetail<%=bookIN.getBookRecordID() %>" style="display:none;">
<!-- 每个申请细节 -->
<%
	if (myRequestBooks.size() > 0){
		for (int j=0; j<myRequestBooks.size(); j++){
			
%>	
<div class="commentbox" >
     <table  style="width:828px;">
        <tr>
              <td class="numberlist"><%=j+1 %></td>

              <td>
              <p class="comment">申请者：<%=myRequestBooks.get(j).getUserName() %><span><% %></span></p>
              <p class="comment">收货人：<%=myRequestBooks.get(j).getReceiverName() %>&nbsp;&nbsp;<%=myRequestBooks.get(j).getPhone() %>&nbsp;&nbsp;<%=myRequestBooks.get(j).getProvince()+myRequestBooks.get(j).getCity()+myRequestBooks.get(j).getTown()+myRequestBooks.get(j).getAddress() %></p>
              </td>

              <td class="deletebutton">
              <button class="pass" value="<%=myRequestBooks.get(j).getRequestID() %>" onclick="passRequest(this)">通过</button>
              <button class="reject" value="<%=myRequestBooks.get(j).getRequestID() %>" onclick="rejectRequest(this)">拒绝</button>
              </td>


        </tr>
		</table>
</div>

<%} %>
<%} %>

</div>
<br>	
	

<!-- 修改的按钮 -->
<div id="gray<%=i%>"></div>
<div class="popup" id="popup<%=i%>">

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
 						       <input class="reg_ownername" name="ownerName" type="text" value=<%=bookIN.getOwnerName() %>> <!-- 从数据库取 -->
 						       <span class="tip ownername_hint"></span>
 						     </td>
 						     </tr>
						      <tr>
						        <td align="right" class="color555">书主手机：</td>
						        <td class="color555 td2" >
						        <input class="reg_ownerphone" name="ownerPhone" type="text" value=<%=bookIN.getOwnerPhone() %>> <!-- 从数据库取 -->
						         <span class="tip ownerphone_hint"></span>
						        </td>
						      </tr>
  						    <tr>
    						    <td align="right" class="color555">备注：</td>
   						     <td class="color555 td2" >
   						     <input class="reg_sellnote" name="sellnote" type="text" value=<%=bookIN.getNote() %>>    <!-- 从数据库取 -->
    						    <span class="tip sellnote_hint"></span></td>
   						   </tr>
  						    
  						    
   						    <tr>
   						     <td align="right" class="color555">书主地址：</td>
   						     <td class="color555 td2"><div id="demo<%=i%>">
  						                    <select name="province"></select>
  						                    <select name="city"></select>
  						                    <select name="area" ></select>
 						                    </div></td>
 						     </tr>
 						     <tr>
   						     <td align="right" class="color555">送书方式：</td>
   						     <%
   						    	if ("mail".equals(bookIN.getSendWay())){
   						    %>
   						     <td><div><p>
        						          <select name="sendway" class="reg_sendway">
       						             <option value ="face">当面</option>
       						             <option value ="mail" selected = "selected">邮寄</option>
      						            </select></p></div> </td>
      						            <%} %>
      						 <%if("face".equals(bookIN.getSendWay())){ %>
      						 <td><div><p>
        						          <select name="sendway" class="reg_sendway" >
       						             <option value ="face" selected = "selected">当面</option>
       						             <option value ="mail" >邮寄</option>
      						            </select></p></div> </td>
      						            <%} %>
 						     </tr>
 						     <tr>
   						     <td align="right" class="color555">新旧程度：</td>
   						     <%if ("20%".equals(bookIN.getRecency())){ %>
   						     <td><div><p>
   						               <select name="recency" class="reg_recency" >
   						                 <option value ="20%" selected="selected">两成新</option>
   						                 <option value ="50%">五成新</option>
      						              <option value ="80%">八成新</option>
     						               <option value ="100%">全新</option>
     						             </select></p></div></td>
     						             <%} %>
     						  <%if ("50%".equals(bookIN.getRecency())){ %>
            				  <td><div><p>
   						               <select name="recency" class="reg_recency">
   						                 <option value ="20%" >两成新</option>
   						                 <option value ="50%" selected="selected">五成新</option>
      						              <option value ="80%">八成新</option>
     						               <option value ="100%">全新</option>
     						             </select></p></div></td>
     						             <%} %>
     						    <%if ("80%".equals(bookIN.getRecency())){ %>
            				  <td><div><p>
   						               <select name="recency" class="reg_recency">
   						                 <option value ="20%" >两成新</option>
   						                 <option value ="50%" >五成新</option>
      						              <option value ="80%" selected="selected">八成新</option>
     						               <option value ="100%">全新</option>
     						             </select></p></div></td>
     						             <%} %>
     						   <%if ("100%".equals(bookIN.getRecency())){ %>
            				  <td><div><p>
   						               <select name="recency" class="reg_recency">
   						                 <option value ="20%" >两成新</option>
   						                 <option value ="50%" >五成新</option>
      						              <option value ="80%" >八成新</option>
     						               <option value ="100%" selected="selected">全新</option>
     						             </select></p></div></td>
     						             <%} %>
 						     </tr>
 						     <tr>
     						   <td align="right" class="color555">上架状态：</td>
     						   <%if ("yes".equals(bookIN.getInStatus())){ %>
            				  <td><div><p>
   						               <select name="inStatus" class="reg_recency" >
   						                 <option value ="yes" selected="selected">已上架</option>
   						                 <option value ="no" >未上架</option>
     						             </select></p></div></td>
     						             <%} %>
     						     <%if ("no".equals(bookIN.getInStatus())){ %>
            				  <td><div><p>
   						               <select name="inStatus" class="reg_recency" >
   						                 <option value ="yes" >已上架</option>
   						                 <option value ="no" selected="selected">未上架</option>
     						             </select></p></div></td>
     						             <%} %>
 						     </tr>

  						    
  						   
  						    <tr>
  						      <td align="center" class="color555" colspan="2">
  						      <button class="my_info_content_care_table_submit" name="" type="onclick" onclick="update(this,<%=bookIN.getBookRecordID() %>)" value=<%=i %> >保    存</button></td>
   						     
  						    </tr>
  						  </tbody>
 						 </table>
					</div>

			</div>
		
		</div>
	
	</div>

</div>
 <%} %>
 <%} %>


















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
	var index = $(this).attr('id');
	var editValue = $(this).val();
	var cityInfo = editValue.split(" ");
	if (cityInfo.length == "2"){
		 $("#demo"+index).citys({
 			province:cityInfo[0],
 			city:'',
 			area:cityInfo[1],
 			

 			onChange:function(info){
 				townFormat(info);
 			}
 		},function(api){
 			var info = api.getInfo();
 			townFormat(info);
 		});
	}
	if(cityInfo.length == "3"){
		 $("#demo"+index).citys({
	 			province:cityInfo[0],
	 			city:cityInfo[1],
	 			area:cityInfo[2],
	 			

	 			onChange:function(info){
	 				townFormat(info);
	 			}
	 		},function(api){
	 			var info = api.getInfo();
	 			townFormat(info);
	 		});
	}
	$("#gray"+index).show();
	$("#popup"+index).show();//查找ID为popup的DIV show()显示#gray
	tc_center();
});

//点击关闭按钮
<%for (int i=0; i<sellBookINs.size(); i++){%>
$("a.guanbi").click(function(){
	$("#gray"+<%=i%>).hide();
	$("#popup"+<%=i%>).hide();//查找ID为popup的DIV hide()隐藏

})
<%}%>

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
	
	<%for (int i=0; i<sellBookINs.size(); i++){ %>
	
	$("#"+"application"+<%=sellBookINs.get(i).getBookRecordID()%>).click(function(){
        $("#"+"appDetail"+<%=sellBookINs.get(i).getBookRecordID()%>).slideToggle("slow");
    });
<%}%>
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
               /* $('#demo3').citys({
        			province:'',
        			city:'',
        			

        			onChange:function(info){
        				townFormat(info);
        			}
        		},function(api){
        			var info = api.getInfo();
        			townFormat(info);
        		});*/

                var ownername_Boolean=true;
                var ownerphone_Boolean=true;
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
                
                     
    
                function update(ob,bookRecordID){
              		
              		if(ownername_Boolean && ownerphone_Boolean){
              			/* 以下为my_info.jsp中的函数，需要修改*/
              		  var bookRecordID = bookRecordID;
              		  var index = ob.value;
             		  index = parseInt(index);
              		  var select = document.getElementsByName("province")[index];
              		  var province=select.options[select.selectedIndex].text;
              		  //alert(document.getElementsByName("city")[0].value);
              		  if(document.getElementsByName("city")[index].value!=""){
              			  select=document.getElementsByName("city")[index];
              			  var city=select.options[select.selectedIndex].text;
              		  }
              		  else {
              			  var city="";
              			  //alert(2);
              		  }
              		  //alert(2333);
              		  //alert(city);
              		  if(document.getElementsByName("area")[index].value!=""){
              			  select=document.getElementsByName("area")[index];
              			  var town=select.options[select.selectedIndex].text;
              		  }
              		  else var town="";
              		  //alert(area);
              		  //alert(town);
              		  var ownerName = document.getElementsByName("ownerName")[index].value;
              		  var ownerPhone = document.getElementsByName("ownerPhone")[index].value;
              		  var note = document.getElementsByName("sellnote")[index].value;
              		  var sendWaySelect = document.getElementsByName("sendway")[index];
              		  var sendWay = sendWaySelect.options[sendWaySelect.selectedIndex].value;
              		  var recencySelect = document.getElementsByName("recency")[index];
              		  var recency = recencySelect.options[recencySelect.selectedIndex].value;
              		  var inStatusSelect = document.getElementsByName("inStatus")[index];
              		  var inStatus = inStatusSelect.options[inStatusSelect.selectedIndex].value;

              		 
              			$.ajax({  
              		        type:"POST",  
              		        url:"BookINAction!update",  
              		        async:false,
              		        data:{bookRecordID:bookRecordID,province:province,city:city,town:town,ownerName:ownerName,ownerPhone:ownerPhone,note:note,sendWay:sendWay,recency:recency,inStatus:inStatus},
              		      success:function(result){
                 				result=eval('('+result+')');
                 				if(result.success){
                 					location.reload();
                 					alert("修改成功");
                 				}
                 				else{
                 					alert("修改失败");
                 				}
                 			}
              		    });
              			
              		}
              		else{
              			alert("请完善信息");
              		}
              	}  
                
                
                function passRequest(ob){
              		var requestID = ob.value;
              		$.ajax({
              			type:'POST',
              			url:"RequestAction!passSellRequest",
              			async:false,
              			data:{requestID:requestID},
              			success:function(result){
              				result=eval('('+result+')');
              				if (result.success){
              					location.reload();
              					alert("已通过此请求，并成功下单，请至我的订单处查询详情（其他请求已被自动拒绝）");
              				}
              				else{
              					alert("操作失败");
              				}
              			}
              		})
              	}
                
                function deleteBookIN(ob){
              		var bookRecordID = ob.value;
              		$.ajax({
              			type:"POST",
              			url:"BookINAction!deleteBookIN",
              			async:false,
              			data:{bookRecordID:bookRecordID},
              			success:function(result){
              				result=eval('('+result+')');
              				if (result.success){
              					location.reload();
              					alert("已删除此申请，所有书籍请求已被自动拒绝");
              				}
              				else{
              					alert("操作失败");
              				}
              			}
              		})
              	}
                
                function rejectRequest(ob){
              		var requestID = ob.value;
              		$.ajax({
              			type:"POST",
              			url:"RequestAction!rejectSellRequest",
              			async:false,
              			data:{requestID:requestID},
              			success:function(result){
              				result=eval('('+result+')');
              				if (result.success){
              					location.reload();
              					alert("已拒绝此请求");
              				}
              				else{
              					alert("操作失败");
              				}
              			}
              		})
              	}
</script>

</body>
</html>