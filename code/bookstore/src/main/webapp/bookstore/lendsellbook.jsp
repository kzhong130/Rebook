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
<title>Rebook</title>

<!-- Bootstrap -->

<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/register2.css">
<link rel="sytlesheet" href="css/lendsellbook.css">
<link rel="stylesheet" href="css/bootstrap_book.css">
<link rel="stylesheet" href="css/book_style.css">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.citys.js"></script>
<script src="js/bootstrap.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
      

    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>



<%
	Book book = new Book();
    if (request.getAttribute("book")!=null){
    	book = (Book)request.getAttribute("book");
    }
    //ArrayList<BookComment> bookComments = new ArrayList<BookComment>();
    //bookComments = (ArrayList<BookComment>)session.getAttribute("bookComment");
%>
<br>
<!-- 书籍封面&基本信息 -->
<div class="container">
    <div class="col-xs-4 col-sm-2">
      <div class="thumbnail thumbnail-margin"> <img src=<%=book.getImage() %> alt="Thumbnail Image 1" class="img-responsive">
      </div>
	    <div class="pc-hide">
	    <span class="thick dbScore-font-size">豆瓣评分：</span><span class="dbScore-score dbScore-font-size"><%=book.getDoubanRate() %></span><br>
        <span class="dbScoreNumber-font-size">（<%=book.getRaterNumber() %>人评）</span>
        </div>
	</div>
	<div class="col-xs-8 col-sm-4">
	  <div class="caption">
        <h3 class="h3-1"><%=book.getBookName() %></h3>
        	<span class="thick">作者：</span><%=book.getAuthor() %><br>
       	 	<span class="thick">出版社：</span><%=book.getPublisher() %><br>
       		<span class="thick">出版日期：</span><%=book.getPubdate() %><br>
        	<span class="thick">页数：</span><%=book.getPageNumber() %></br>
        	<span class="thick">定价：</span><%=book.getPrice()%><br>
   			<span class="thick">ISBN：</span><%=book.getISBN() %>
      </div>
	</div> 
	<div class="col-sm-3 mobile-hide">
	  <div class="caption">
	    <span class="thick">豆瓣评分：</span><span class="dbScore-score"><%=book.getDoubanRate() %></span><br>
        <span class="dbScoreNumber-font-size">（<%=book.getRaterNumber() %>人&nbsp;参与评价）</span>
      </div>
	</div>
</div>


<div class="container">
    <hr>
    <div class="col-xs-12 col-md-5 form-group" style="padding-left:0;padding-right:0;">
    <h3 class="col-xs-12 col-md-12" style="float:left;padding:0 0 0 15px;">书主信息</h3>
      	<div class="form-group">
      	<label for="firstname" class="col-xs-3 col-md-3 control-label">书主姓名</label>
      	<div class="col-xs-9 col-md-9">
      	<input type="text" name="" value="" placeholder="书主姓名" class="form-control">
      	<br>
      	</div>
      	</div>
      	<div class="form-group">
      	<label for="firstname" class="col-xs-3 col-md-3 control-label">书主手机</label>
        <div class="col-xs-9 col-md-9">
        <input type="text" name="" value="" placeholder="书主手机" class="form-control">
        <span class="tip ownerphone_hint"></span>
        <br>
        </div>
        </div>
          <label for="firstname" class="col-xs-3 col-md-3 control-label">所在城市</label>
          
            <div id="demo3" class="form-group citys" style="margin-left:-20px;margin-right:15px;">
                <p>
                    <select name="province" class="form-control"></select>
                    <select name="city" class="form-control"></select>
                    <select name="area" class="form-control"></select>
                </p>
            </div>

      
      <h3 class="col-xs-12 col-md-12" style="float:left;padding:0 0 0 15px;">书籍信息</h3>
      <div class="col-xs-12 col-md-12 form-group" style="padding-left:0;padding-right:0;">
      
          <label for="firstname" class="col-xs-3 col-md-3 control-label">新旧程度</label>
          <div class="form-group col-xs-9 col-md-9">
          <select name="recency" class="form-control">
            <option value ="20%">两成新</option>
            <option value ="50%">五成新</option>
            <option value ="80%">八成新</option>
            <option value ="100%">全新</option>
          </select></div>          
      
      
          <label for="firstname" class="col-xs-3 col-md-3 control-label">送书方式</label>
          <div class="form-group col-xs-9 col-md-9"><p>
          <select name="sendway" class="form-control">
            <option value ="face">当面</option>
            <option value ="mail">邮寄</option>
          </select></p></div>          
      
      </div>
      </div>
      <div class="col-md-2"></div>
      <div class="col-xs-12 col-md-5">
      <ul class="reg_ul">
      <li>
          <button type="button" id="lend" class="btn btn-success" style="padding:5px 20px;float:left;margin:0 0 0 8px;">我要出借</button>
          <button type="button" id="sell" class="btn btn-success" style="padding:5px 20px;float:left;margin:0 0 0 8px;">我要卖书</button>
      </li>
      <li id="checksell1">
          <span>书币要求：</span>
          <input type="text" name="" value="" placeholder="要求为正整值" class="reg_sellcoinnumber">
          <span class="tip sellcoinnumber_hint"></span>
      </li>
      <li id="checksell2">
          <span>备注：</span>
          <input type="text" name="" value="" placeholder="选填" class="reg_sellnote">
          <span class="tip sellnote_hint"></span>
      </li>
      <li id="checksell3" style="margin:0 20px 0 0;">
          <button type="button" onclick="sell()" class="btn btn-success" name="button" class="red_sellbutton" >确认卖书</button>
      </li>
      <li id="checklend4">          
          <span>书主详细地址：</span>
          <input type="text" name="detail" value="" placeholder="详细地址" class="reg_owneraddress">
          <span class="tip owneraddress_hint"></span>      
      </li>
      <li id="checklend2">
          <span>最长出借天数：</span>
          <input type="text" name="" value="" placeholder="最低天数为10" class="reg_lenddaynumber">
          <span class="tip lenddaynumber_hint"></span>
      </li>
      <li id="checklend1">
          <span>书币要求：</span>
          <input type="text" name="" value="" placeholder="要求为正整值" class="reg_lendcoinnumber">
          <span class="tip lendcoinnumber_hint"></span>
      </li>
      <li id="checklend3">
          <span>备注：</span>
          <input type="text" name="" value="" placeholder="选填" class="reg_lendnote">
          <span class="tip lendnote_hint"></span>
      </li>
      <li id="checklend5" style="margin:0 20px 0 0;">
          <button type="button" onclick="borrow()" class="btn btn-success" name="button" class="red_lendbutton" >确认出借</button>
      </li>
      </ul>
      </div>
</div>
<hr>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<!--<script src="js/jquery-1.11.3.min.js"></script> -->
<!-- Include all compiled plugins (below), or include individual files as needed --> 

<script type="text/javascript">
	
	var Mobile_Boolean=false;

	$('.reg_ownerphone').blur(function(){
	  if ((/^1[34578]\d{9}$/).test($(".reg_ownerphone").val())){
	    $('.ownerphone_hint').html("✔").css("color","green");
	    Mobile_Boolean = true;
	  }else {
	    $('.ownerphone_hint').html("×").css("color","red");
	    Mobile_Boolean = false;
	  }
	});

	var user_Boolean=false;
	
	$('.reg_ownername').blur(function(){
		  if ((/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/).test($(".reg_ownername").val())){
		    $('.ownername_hint').html("✔").css("color","green");
		    user_Boolean = true;
		  }else {
		    $('.ownername_hint').html("×").css("color","red");
		    user_Boolean = false;
		  }
	});

	var sellcoin_Boolean=false;
	
	$('.reg_sellcoinnumber').blur(function(){
		  if ((/^[0-9]*[1-9][0-9]*$/).test($(".reg_sellcoinnumber").val())){
		    $('.sellcoinnumber_hint').html("✔").css("color","green");
		    sellcoin_Boolean = true;
		  }else {
		    $('.sellcoinnumber_hint').html("×").css("color","red");
		    sellcoin_Boolean = false;
		  }
	});
	
	var lendcoin_Boolean=false;
	
	$('.reg_lendcoinnumber').blur(function(){
		  if ((/^[0-9]*[1-9][0-9]*$/).test($(".reg_lendcoinnumber").val())){
		    $('.lendcoinnumber_hint').html("✔").css("color","green");
		    lendcoin_Boolean = true;
		  }else {
		    $('.lendcoinnumber_hint').html("×").css("color","red");
		    lendcoin_Boolean = false;
		  }
	});
	
	
	var address_Boolean=false;
	$('.reg_owneraddress').blur(function(){
		  if ($(".reg_owneraddress").val()!=""){
		    $('.owneraddress_hint').html("✔").css("color","green");
		    address_Boolean = true;
		  }else {
		    $('.owneraddress_hint').html("×").css("color","red");
		    address_Boolean = false;
		  }
	});
	
	var lendday_Boolean=false;
	
	$('.reg_lenddaynumber').blur(function(){
		  if ((/^[0-9]*[1-9][0-9]*$/).test($(".reg_lenddaynumber").val())&&($(".reg_lenddaynumber").val()>= 10)){
		    $('.lenddaynumber_hint').html("✔").css("color","green");
		    lendday_Boolean = true;
		  }else {
		    $('.lenddaynumber_hint').html("×").css("color","red");
		    lendday_Boolean = false;
		  }
	});
	
	function sell(){
		if(Mobile_Boolean&&user_Boolean&&sellcoin_Boolean){
			var select = document.getElementsByName("province")[0];
		 	var province=select.options[select.selectedIndex].text;
		 	if(document.getElementsByName("city")[0].value!=""){
				  select=document.getElementsByName("city")[0];
				  var city=select.options[select.selectedIndex].text;
			}
			else {
				 var city="";
			}
		 	select=document.getElementsByName("area")[0];
			var town=select.options[select.selectedIndex].text;
		  	$.ajax({  
		        type:"POST",  
		        url:"LendSellAction!sellInfo",  
		        async:false,
				data:{town:town,ISBN:<%=book.getISBN()%>,province:province,city:city,ownerName:$(".reg_ownername").val(),ownerPhone:$(".reg_ownerphone").val(),coinNumber:$(".reg_sellcoinnumber").val(),note:$(".reg_sellnote").val(),recency:document.getElementsByName("recency")[0].value,sendWay:document.getElementsByName("sendway")[0].value},
		        
		    });
		  	window.location.assign("MemberCenterAction!initialize");

		}
		else{
			alert("请完善信息");
		}
	};
	
	function borrow(){
		if(Mobile_Boolean&&user_Boolean&&lendcoin_Boolean&&lendday_Boolean&&address_Boolean){
			var select = document.getElementsByName("province")[0];
		 	var province=select.options[select.selectedIndex].text;
		 	if(document.getElementsByName("city")[0].value!=""){
				  select=document.getElementsByName("city")[0];
				  var city=select.options[select.selectedIndex].text;
			}
			else {
				 select=document.getElementsByName("area")[0];
				  var city="";
			}
		 	select=document.getElementsByName("area")[0];
			var town=select.options[select.selectedIndex].text;
		  	$.ajax({  
		        type:"POST",  
		        url:"LendSellAction!lendInfo",  
		        async:false,
				data:{town:town,ownerAddress:$(".reg_owneraddress").val(),longestDuration:$(".reg_lenddaynumber").val(),ISBN:<%=book.getISBN()%>,province:province,city:city,ownerName:$(".reg_ownername").val(),ownerPhone:$(".reg_ownerphone").val(),coinNumber:$(".reg_lendcoinnumber").val(),note:$(".reg_lendnote").val(),recency:document.getElementsByName("recency")[0].value,sendWay:document.getElementsByName("sendway")[0].value},
		        
		    });
		  	
		  	window.location.assign("MemberCenterAction!initialize");
		}
		else{
			alert("请完善信息");
		}
	};

	
	


</script>

<script type="text/javascript">
      $('#demo2').citys({
        required:false,
        nodata:'disabled'
        });
      $('#demo3').citys({
			province:'福建',
			city:'厦门',
			area:'思明',
			onChange:function(info){
				townFormat(info);
			}
		},function(api){
			var info = api.getInfo();
			townFormat(info);
		});
</script>
<script type="text/javascript">
$(document).ready(function(){
    $("#checklend5").hide();
    $("#checklend1").hide();
    $("#checklend2").hide();
    $("#checklend3").hide();
    $("#checklend4").hide();
    $("#checksell1").hide();
    $("#checksell2").hide();
    $("#checksell3").hide();
  $("#sell").click(function(){
    $("#checksell1").show();
    $("#checksell2").show();
    $("#checksell3").show();
    $("#checklend1").hide();
    $("#checklend2").hide();
    $("#checklend3").hide();
    $("#checklend4").hide();
    $("#checklend5").hide();
  });
  $("#lend").click(function(){
    $("#checklend1").show();
    $("#checklend2").show();
    $("#checklend3").show();
    $("#checklend4").show();
    $("#checklend5").show();
    $("#checksell1").hide();
    $("#checksell2").hide();
    $("#checksell3").hide();
  });
});

</script>
</body>
</html>
    
    


