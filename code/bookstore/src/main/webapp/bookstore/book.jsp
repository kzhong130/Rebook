<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BookComment" %>
<%@ page import="model.BookIN" %>
<%@ page import="model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Product Page Template</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap_book.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/book_style.css">
<link rel="stylesheet" href="css/index_style.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<input id="longitude" style="display:none">
<input id="latitude" style="display:none">


<div id='MicrosoftTranslatorWidget' class='Dark' style='color:white;background-color:#555555'></div>
<script type='text/javascript'>setTimeout(function(){{var s=document.createElement('script');s.type='text/javascript';s.charset='UTF-8';s.src=((location && location.href && location.href.indexOf('https') == 0)?'https://ssl.microsofttranslator.com':'http://www.microsofttranslator.com')+'/ajax/v3/WidgetV3.ashx?siteData=ueOIGRSKkd965FeEGM5JtQ**&ctf=False&ui=true&settings=Manual&from=';var p=document.getElementsByTagName('head')[0]||document.documentElement;p.insertBefore(s,p.firstChild); }},0);</script>


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
        <li><a href="register.jsp">注册</a> </li>
        <li><a href="#" class="tc" >登录</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<div class="popup" id="popup">

	<div class="top_nav" id='top_nav'>
		<div align="center">
			<span>登录账号</span>
			<a class="guanbi"></a>
		</div>
	</div>
	
	<div class="min">
	
		<div class="tc_login">
		
			<div class="right">
				<form method="POST" name="form_login" target="_top" action="AccountAction!login">
					<div align="center">
						<i class="icon-mobile-phone"></i>
						<input type="text" name="userName" id="userName" required="required" placeholder="用户名" autocomplete="off" class="input_yh">
						<p style="font-size:5px;color:#fff;"> </p>
						<input type="password" name="password" id="password" required="required" placeholder="密码" autocomplete="off" class="input_mm">
						<!--  <input type="hidden" name="prePage" value="" > -->
					</div>
					<div align="right"><a href="forgetpassword/fp1.jsp">忘记密码</a></div>
					<div align="center" >
						<input type="submit" class="button" title="Sign In" value="登录">
					</div>
				</form> 
				<div align="right">
					<a href="register.jsp" target="_blank">立即注册</a>                                     <!-- 注册的页面 -->
				</div>  
			</div>
		
		</div>
	
	</div>

</div>

<%
	Book book = new Book();
    if (session.getAttribute("book")!=null){
    	book = (Book)session.getAttribute("book");
    }
    ArrayList<BookComment> bookComments = new ArrayList<BookComment>();
    bookComments = (ArrayList<BookComment>)session.getAttribute("bookComment");
    
    ArrayList<BookIN> bookINs = new ArrayList<BookIN>();
    bookINs = (ArrayList<BookIN>)session.getAttribute("bookIN");
    
    ArrayList<User> users = new ArrayList<User>();
    users = (ArrayList<User>)session.getAttribute("userByBookIN");
    
    System.out.println(bookComments.size());
    System.out.println(bookINs.size());
    System.out.println(users.size());
    
    ArrayList<BookIN> lendBookINs = new ArrayList<BookIN>();
    ArrayList<BookIN> sellBookINs = new ArrayList<BookIN>();
    for (int i=0; i<bookINs.size(); i++){
    	if(bookINs.get(i).getType().equals("sell")){
    		sellBookINs.add(bookINs.get(i));
    	}
    	if (bookINs.get(i).getType().equals("lend")){
    		lendBookINs.add(bookINs.get(i));
    	}
    }
%>
<br>
<!-- 书籍封面&基本信息 -->
<div class="container">
  <div class="row">
    <div class="col-sm-2">
      <div class="thumbnail"> <img src=<%=book.getImage() %> alt="Thumbnail Image 1" class="img-responsive">
        
      </div>
	</div>
	<div class="col-sm-4">
	  <div class="caption">
        <h3 class="h3-1"><%=book.getBookName() %></h3>
        <p>作者：<%=book.getAuthor() %></p>
        <p>出版社：<%=book.getPublisher() %></p>
        <p>出版日期：<%=book.getPubdate() %></p>
        <p>页数：<%=book.getPageNumber() %></p>
        <p>定价：<%=book.getPrice()%></p>
        <p>ISBN：<%=book.getISBN() %></p>

      </div>
	</div> 
	<div class="col-sm-3">
	  <div class="caption">
        <br><br><br><p>豆瓣评分：<span style="color:#efbb24"><font size="10"><%=book.getDoubanRate() %></font></span></p>
        <p>参评人数：<%=book.getRaterNumber() %></p>
        <hr>
        <!-- 如果没登录，跳出信息显示请先登录 -->
        <p><button class="btn btn-success" role="button" id="lend_sell">出借/卖书</button></p>
      </div>
	</div> 
  </div>
</div>
<!-- 标签页 -->
<div class="container">
<ul class="nav nav-tabs" style="text-align: center">
  <li class="active">
  	<a href="#bookGeneralContent" data-toggle="tab">内容概述</a>
  </li>
  <li><a href="#bookComment" data-toggle="tab">书籍评价</a>
  </li>
  <li><a href="#bookBorrowInfo" data-toggle="tab">有书借</a>
  </li>
  <li><a href="#bookBuyInfo" data-toggle="tab">有书买</a>
  </li>
  <li><a href="#recommendBooks" data-toggle="tab">买过这本书的用户也买了</a>
  </li>
</ul>
</div>

<div class="container">
  <div id="myTabContent" class="tab-content">
    <!-- 内容概述 -->
    <div class="tab-pane fade in active" id="bookGeneralContent">
    <hr>
	<p></p>
	<p><%=book.getSummary() %></p>
    </div>
    
  
    <!-- 书籍评论 -->
    <div class="tab-pane fade" id="bookComment">
    <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#addBookComment" style="margin: 5px 0 0 0;float:right;" id="commentButton">添加评论</button>
    	<br><br>
		<hr style="margin-top: 5px">
    	<%if(bookComments.size() <= 0){ %>
    	<p>无评论</p>
    	<%} %>
    	<%
    	if(bookComments.size() > 0){ 
    		for (int i=0;i<bookComments.size();i++){
    			
    	%>
    	
    	<p><%=bookComments.get(i).getUserName() %>    <%=bookComments.get(i).getCommentTime().toString().substring(0, 19) %></p>
    	<p><%=bookComments.get(i).getContent() %>
    	<hr>
    	<%} %>
    	<%} %>
    	
    	<!-- 模态框（Modal） -->
		<div class="modal fade" id="addBookComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" >
					添加评论
					</h4>
				</div>
				<form id="commentForm" class="STYLE-NAME" method="POST" action="BookCommentAction!addBookComment">
				<label>
				<textarea id="content" name="content" placeholder="请输入评论" style="height: 120px; width:580px;resize:none;margin: 10px"></textarea>
				</label>
				<input type="hidden" name="ISBN" value="<%=book.getISBN() %>" >
				<input type="hidden" name="userName" value="<%=session.getAttribute("loginUserName") %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitComment();" data-dismiss="modal">
					提交评论
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</div>
	<!-- 借书信息 -->
    <div class="tab-pane fade" id="bookBorrowInfo">
    <hr>
    <div>请输入您能接受的卖家据您的距离（不输入默认为无穷大）：<input id="lendDistance">千米&nbsp;&nbsp;<input type="button" value="查询" onclick="selectLend()"></div>
    <div class="row">
    <div class="table-responsive">
    <!-- class="table table-hover" -->
    <table class="table" background="images/index1_yellowbg.png" id="lendTable">
    	<thead>
    		<tr bgcolor="#efbb24">
    			<th style="text-align: center">书主</th>
    			<th style="text-align: center">信用</th>
				<th style="text-align: center">新旧程度</th>
   				<th style="text-align: center">送书方式</th>
   				<th style="text-align: center">所在城市</th>
   				<th style="text-align: center">最长借阅时间</th>
   				<th style="text-align: center">书币要求</th>
   				<th style="text-align: center">申请</th>
    		</tr>
    	</thead>
    	<tbody>
    		<%
    		if (lendBookINs.size() > 0){	
    		for (int i=0; i<lendBookINs.size(); i++){
    				User user = new User();
    				for (int j=0; j<users.size(); j++){
    					if (users.get(j).getUserName().equals(lendBookINs.get(i).getUserName())){
    						user = users.get(j);
    						break;
    					}
    				}
    				String recency = "";
    				if ("20%".equals(lendBookINs.get(i).getRecency())){
    					recency = "两成新";
    				}
    				if ("50%".equals(lendBookINs.get(i).getRecency())){
    					recency = "五成新";
    				}
    				if ("80%".equals(lendBookINs.get(i).getRecency())){
    					recency = "八成新";
    				}
    				if ("100%".equals(lendBookINs.get(i).getRecency())){
    					recency = "全新";
    				}
    				
    				String sendWay = "";
    				if ("mail".equals(lendBookINs.get(i).getSendWay())){
    					sendWay = "邮寄";
    				}
    				if ("face".equals(lendBookINs.get(i).getSendWay())){
    					sendWay = "当面";
    				}
    		%>
    		<tr class="text-center"> 
    			<td><%=user.getUserName() %></td>
				<%if (user.getCredit() >= 0 && user.getCredit() <= 20){ %>
				<td>♥</td>
				<%} %>
				<%if (user.getCredit() > 20 && user.getCredit() <= 40){ %>
				<td>♥♥</td>
				<%} %>
				<%if (user.getCredit() > 40 && user.getCredit() <= 60){ %>
				<td>♥♥♥</td>
				<%} %>
				<%if (user.getCredit() > 60 && user.getCredit() <= 80){ %>
				<td>♥♥♥♥</td>
				<%} %>
				<%if (user.getCredit() > 80 && user.getCredit() <= 100){ %>
				<td>♥♥♥♥♥</td>
				<%} %>
   				<td><%=recency %></td>
   				<td><%=sendWay %></td>
   				<td onclick="haha('<%=lendBookINs.get(i).getProvince()  + lendBookINs.get(i).getCity()+ lendBookINs.get(i).getTown() %>')"><%=lendBookINs.get(i).getProvince() + " " + lendBookINs.get(i).getCity() + " "+ lendBookINs.get(i).getTown() %></td>
   				<td><%=lendBookINs.get(i).getLongestDuration() + "天" %></td>
   				<td><%=lendBookINs.get(i).getCoinNumber() %></td>
   				<td><a class="btn btn-success btn-sm -sm" role="button" id="<%=lendBookINs.get(i).getBookRecordID()%>"  onclick="lendBook(this,<%=lendBookINs.get(i).getCoinNumber() %>,'<%=user.getUserName() %>')">借书</a></td>
    		</tr>
    		<%} %>
    		<%} %>
    	</tbody>
    </table>
    </div>
    </div>
	</div>
	
	<!-- 买书信息 -->
    <div class="tab-pane fade" id="bookBuyInfo" >
    <hr>
    <div>请输入您能接受的卖家据您的距离（不输入默认为无穷大）：<input id="buyDistance">千米&nbsp;&nbsp;<input type="button" value="查询" onclick="selectBuy()"></div>
    <div class="row">
    <div class="table-responsive">
    <!-- class="table table-hover" -->
    <table class="table" background="images/index1_yellowbg.png" id="buyTable">
    	<thead>
    		<tr bgcolor="#efbb24">
    			<th style="text-align: center">书主</th>
    			<th style="text-align: center">信用</th>
				<th style="text-align: center">新旧程度</th>
   				<th style="text-align: center">送书方式</th>
   				<th style="text-align: center">所在城市</th>
   				<th style="text-align: center">书币要求</th>
   				<th style="text-align: center">申请</th>
    		</tr>
    	</thead>
    	<tbody>
    	<%
    	if (sellBookINs.size() > 0){	
    	for (int i=0; i<sellBookINs.size(); i++){
    			User user = new User();
    			for (int j=0; j<users.size(); j++){
    				if (sellBookINs.get(i).getUserName().equals(users.get(j).getUserName())){
    					user = users.get(j);
    					break;
    				}
    			}
    			String recency = "";
    			if ("20%".equals(sellBookINs.get(i).getRecency())){
					recency = "两成新";
				}
				if ("50%".equals(sellBookINs.get(i).getRecency())){
					recency = "五成新";
				}
				if ("80%".equals(sellBookINs.get(i).getRecency())){
					recency = "八成新";
				}
				if ("100%".equals(sellBookINs.get(i).getRecency())){
					recency = "全新";
				}
				
				String sendWay = "";
				if ("mail".equals(sellBookINs.get(i).getSendWay())){
					sendWay = "邮寄";
				}
				if ("face".equals(sellBookINs.get(i).getSendWay())){
					sendWay = "当面";
				}
    		
    	%>
    		<tr class="text-center"> 
    			<td><%=user.getUserName() %></td>
				<%if (user.getCredit() >= 0 && user.getCredit() <= 20){ %>
				<td>♥</td>
				<%} %>
				<%if (user.getCredit() > 20 && user.getCredit() <= 40){ %>
				<td>♥♥</td>
				<%} %>
				<%if (user.getCredit() > 40 && user.getCredit() <= 60){ %>
				<td>♥♥♥</td>
				<%} %>
				<%if (user.getCredit() > 60 && user.getCredit() <= 80){ %>
				<td>♥♥♥♥</td>
				<%} %>
				<%if (user.getCredit() > 80 && user.getCredit() <= 100){ %>
				<td>♥♥♥♥♥</td>
				<%} %>
   				<td><%=recency %></td>
   				<td><%=sendWay %></td>
   				<td onclick='haha("<%=sellBookINs.get(i).getProvince()+sellBookINs.get(i).getCity()+sellBookINs.get(i).getTown()%>")'><%=sellBookINs.get(i).getProvince()+" "+sellBookINs.get(i).getCity()+" "+sellBookINs.get(i).getTown() %></td>
   				<td><%=sellBookINs.get(i).getCoinNumber() %></td>
   				<td><a class="btn btn-success btn-sm -sm" role="button" id="<%=sellBookINs.get(i).getBookRecordID()%>" onclick="buyBook(this,<%=sellBookINs.get(i).getCoinNumber()%>,'<%=user.getUserName()%>')" >买书</a></td>
    		</tr>
    		<%} %>
    		<%} %>
    	</tbody>
    </table>
    </div>
    </div>
	</div>
	
	<!-- 书籍推荐 -->
	<div class="tab-pane fade" id="recommendBooks">
	<hr>
	<%
		ArrayList<Book> recommendBooks = (ArrayList<Book>)session.getAttribute("recommendBooks");
	%>
	<%if (recommendBooks.size() <= 0){ %>
	<p>暂无用户购买/借阅本书</p>
	<%} %>
	<%if(recommendBooks.size() > 0){ %>
	<%for (int i=0;i<recommendBooks.size();i++){ %>
	<div class="background">
		<a href="bookAction!getBookInfo?ISBN=<%=recommendBooks.get(i).getISBN()%>">
			<img class='listbook' src="<%=recommendBooks.get(i).getImage() %>"/>
			<br>
			<br>
			<div title="<%=recommendBooks.get(i).getBookName() %>" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><%=recommendBooks.get(i).getBookName() %></div>
			<div title="<%=recommendBooks.get(i).getAuthor() %>" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><%=recommendBooks.get(i).getAuthor() %></div>
		</a>
	</div>
	<%} %>
	<%} %>
	</div>
  </div>
</div>
<hr>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=YW0cDwFXMyVq69FVGoOzgDCc8tjmi7ap"></script>
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



var geolocation = new BMap.Geolocation();
geolocation.getCurrentPosition(function(r){
	if(this.getStatus() == BMAP_STATUS_SUCCESS){
		document.getElementById("latitude").value = r.point.lat;
		document.getElementById("longitude").value = r.point.lng;
	}
},{enableHighAccuracy: true})



function selectLend(){
	var lendTable = document.getElementById("lendTable");
	var requiredDistance = document.getElementById("lendDistance").value;
	if (lendTable.rows.length > 1){	//表格内有内容
		for (var i=1; i<lendTable.rows.length; i++){
			if (document.getElementById("longitude").value == "" || document.getElementById("latitude").value == ""){
				alert("您尚未开启定位或正在定位中，请稍后重试");
				break;
			}
			var keyword = lendTable.rows[i].cells[4].innerText;
			haha(keyword,requiredDistance,1,i);
		}
	}
}



function selectBuy(){
	var buyTable = document.getElementById("buyTable");
	var requiredDistance = document.getElementById("buyDistance").value;
	if (buyTable.rows.length > 1){	//表格内有内容
		for (var i=1; i<buyTable.rows.length; i++){
			if (document.getElementById("longitude").value == "" || document.getElementById("latitude").value == ""){
				alert("您尚未开启定位或正在定位中，请稍后重试");
				break;
			}
			var keyword = buyTable.rows[i].cells[4].innerText;
			haha(keyword,requiredDistance,0,i);
		}
	}
}

//keyword:关键词
//requiredDistance:用户需求的距离
//symbol:标志量（0是买表，1是借表）
//col:该表的第col行（第一行从1开始）
function haha(keyword,requiredDistance,symbol,col){
	var map = new BMap.Map();
	var local = new BMap.LocalSearch(map,{onSearchComplete:myFun});
    local.search(keyword);

	function myFun(results){
	    var cityPoint = results.getPoi(0).point;
	    var nowPoint = new BMap.Point(document.getElementById("longitude").value, document.getElementById("latitude").value);
	    if (symbol == 0){ //是买表
	    	var buyTable = document.getElementById("buyTable");
	    	var distance = map.getDistance(cityPoint,nowPoint)/1000;
	    	if (distance > requiredDistance){
	    		buyTable.rows[col].style.display="none";
	    	}
	    	else{
	    		buyTable.rows[col].style.display="";
	    	}
	    }
	    if (symbol == 1){	//是借表
	    	var lendTable = document.getElementById("lendTable");
	    	var distance = map.getDistance(cityPoint,nowPoint)/1000;
	    	if (distance > requiredDistance){
	    		lendTable.rows[col].style.display="none";
	    	}
	    	else{
	    		lendTable.rows[col].style.display="";
	    	}
	    }
	}
}





function tc_center(){
	var _top=($(window).height()-$(".popup").height())/2;
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

/*jQuery(document).ready(function($){  
        $("form#login").submit(function(form)  
            {  
  
                $.ajax({  
                    url: "LoginAction",  
                    method: 'POST',  
                    dataType: 'text',  
                    data: {   
                        userName: $("form#login").find('#userName').val(),  
                        password: $(form).find('#password').val()  
                    },  
                    success: function (json) {  
                        var obj = $.parseJSON(json);  //使用这个方法解析json  
                        var state_value = obj.result;  //result是和action中定义的result变量的get方法对应的   
                        if(state_value=="true"){  
                            alert("true");  
                        }else{  
                            alert("false");  
                        }  
                    },  
                    error: function (json) { 
                        alert("json=" + json);  
                        return false;  
                    }  
                });  
  
            }) 
        }) */

var login_status='<%=session.getAttribute("login")%>';
if (login_status=='error'){
	alert("登录失败");
	<% session.removeAttribute("login"); %>
}

var userName = '<%=session.getAttribute("loginUserName")%>'
	var admin = '<%=session.getAttribute("admin")%>'

	if (userName != "null"){
		if (admin == "null"){
			var str = "<li><a href='MemberCenterAction!initialize'>个人中心</a>"
			str+="<li><a href='AccountAction!logout'>登出</a>"
			$('#personalInfo').html(str);
		}
		else{
			var str ="<li><a href='AdminCenterAction!initialize'>管理中心</a>";
			str+="<li><A href='AccountAction!logout'>登出</a>";
			$('#personalInfo').html(str);
		}
}

$("#lend_sell").click(function(){
		if (userName=="null"){
			alert("请先登录！");
		}
		else{
		    window.location.href="LendSellAction!searchBook?ISBN="+"<%=book.getISBN() %>";
		}
	})

$("#commentButton").click(function(){
	if (userName=="null"){
		alert("请先登录！");
		$(this).attr("data-target","");
	}
})

function submitComment(){
	var comment=document.getElementById("content").value;
	if (comment==""){
		alert("评论不能为空");
	}
	else{
		document.getElementById("commentForm").submit();
		location='#bookComment';
		alert("评论成功");
	}
	
}
/*
function buyBook(ob){
	var ID = ob.id;
	if (userName =="null"){
		alert("请先登录");
	}
	else{
		window.location.href="order_buy.jsp?ID="+ID;
	}
}*/

function lendBook(ob,coinNumber,bookOwnerName){
	var ID = ob.id;
	coinNumber = parseInt(coinNumber);
	var name = String(bookOwnerName);
	if (userName =="null"){
		alert("请先登录");
	}
	else if( userName == name){
		alert("不能借自己的书");
	}
	else{
		var myCoinNumber = "<%=session.getAttribute("loginUserBookCoin")%>";
		myCoinNumber = parseInt(myCoinNumber);
		if (myCoinNumber < coinNumber){
			alert("您的书币不足");
		}
		else{
			window.location.href="order_lend.jsp?ID="+ID;
		}
	}
}

function buyBook(ob,coinNumber,bookOwnerName){
	var ID = ob.id;
	coinNumber = parseInt(coinNumber);
	var name = String(bookOwnerName);
	if (userName =="null"){
		alert("请先登录");
	}
	else if( userName == name){
			alert("不能买自己的书");
	}
	else{
		var myCoinNumber = "<%=session.getAttribute("loginUserBookCoin")%>";
		myCoinNumber = parseInt(myCoinNumber);
		if (myCoinNumber < coinNumber){
			alert("您的书币不足");
		}
		else{
			window.location.href="order_buy.jsp?ID="+ID;
		}
	}
}

</script>
</body>
</html>
