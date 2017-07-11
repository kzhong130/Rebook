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

<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/register2.css">
<link rel="sytlesheet" href="css/lendsellbook.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.citys.js"></script>   

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
      
      <ul class="nav navbar-nav navbar-right hidden-sm" id="personalInfo">
        <li><a href='MemberCenterAction!initialize'>个人中心</a></li>
        <li><a href='AccountAction!logout'>登出</a></li>
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
        <h3><%=book.getBookName() %></h3>
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
        <br><br><br><p>豆瓣评分：<%=book.getDoubanRate() %></p>
        <p>参评人数：<%=book.getRaterNumber() %></p>
      </div>
	</div> 
  </div>
</div>


<div class="container">
    <hr>    
    <div class="reg_div">
    <table>
    <tr style="position: top center;">
    <td width="570px" height="300px" >
    

    <h2 style="float:left;padding:0 0 0 75px;">书主信息</h2>
    <ul class="reg_ul">
      <li>
          <span>书主姓名：</span>
          <input type="text" name="" value="" placeholder="书主姓名" class="reg_ownername">
          <span class="tip ownername_hint"></span>
      </li>
      <li>
          <span>书主手机：</span>
          <input type="text" name="" value="" placeholder="书主手机" class="reg_ownerphone">
          <span class="tip ownerphone_hint"></span>
      </li>
      <li>
          <span>所在城市：</span>
          
            <div id="demo3" class="citys">
                <p>
                    <select name="province"></select>
                    <select name="city"></select>
                    <select name="area"></select>
                </p>
            </div>

      </li>
      </ul>
      
      <h2 style="float:left;padding:0 0 0 75px;">书籍信息</h2>
      <ul class="reg_ul">
      <li>
          <span>新旧程度：</span>
          <div class="citys"><p>
          <select name="recency" class="reg_recency">
            <option value ="20%">两成新</option>
            <option value ="50%">五成新</option>
            <option value ="80%">八成新</option>
            <option value ="100%">全新</option>
          </select></p></div>          
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
      </td>
      <td  width="570px" height="350px">
      <ul class="reg_ul">
      <li>
          <span>出借/卖书：</span>
          <button type="button" id="lend" style="padding:5px 20px;float:left;margin:0 0 0 8px;">我要出借</button>
          <button type="button" id="sell" style="padding:5px 20px;float:left;margin:0 0 0 8px;">我要卖书</button>
      </li>
      <li id="checksell1">
          <span>书币要求：</span>
          <input type="text" name="" value="" placeholder="书币要求" class="reg_sellcoinnumber">
          <span class="tip sellcoinnumber_hint"></span>
      </li>
      <li id="checksell2">
          <span>备注：</span>
          <input type="text" name="" value="" placeholder="选填" class="reg_sellnote">
          <span class="tip sellnote_hint"></span>
      </li>
      <li id="checksell3" style="margin:0 20px 0 0;">
          <button type="button" name="button" class="red_sellbutton" >确认卖书</button>
      </li>
      <li id="checklend4">          
          <span>书主详细地址：</span>
          <input type="text" name="detail" value="" placeholder="详细地址" class="reg_owneraddress">
          <span class="tip owneraddress_hint"></span>      
      </li>
      <li id="checklend2">
          <span>最长出借天数：</span>
          <input type="text" name="" value="" placeholder="最长出借天数" class="reg_lenddaynumber">
          <span class="tip lenddaynumber_hint"></span>
      </li>
      <li id="checklend1">
          <span>书币要求：</span>
          <input type="text" name="" value="" placeholder="书币要求" class="reg_lendcoinnumber">
          <span class="tip lendcoinnumber_hint"></span>
      </li>
      <li id="checklend3">
          <span>备注：</span>
          <input type="text" name="" value="" placeholder="选填" class="reg_lendnote">
          <span class="tip lendnote_hint"></span>
      </li>
      <li id="checklend5" style="margin:0 20px 0 0;">
          <button type="button" name="button" class="red_lendbutton" >确认出借</button>
      </li>
      </ul>
      </td></tr>
    </table>
    </div>
</div>
<hr>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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
    
    


