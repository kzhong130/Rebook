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
<title>买入/借入</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap_book.css">
<link href="../css/crowdfunding.center/orderInOut.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript" src="../js/jquery.citys.js"></script>    
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%

%>
<body>

<div class="my_info_title">买入/借入 </div>
<br>
<div class="my_info_title_3">
  <ul>
    <li id="mybuyin" onClick="change(1)" style="border-bottom: 1px solid #d19826; color: #d19826;">
        <a href="#buyIN" data-toggle="tab" >我的买入</a>
    </li>
    <li id="mylendin" onClick="change(2)"><a href="#lendIN" data-toggle="tab" >我的借入</a></li>
  </ul>
</div>
<br>


<div>
  <div id="myTabContent" class="tab-content">
  
   <!-- 我的买入 -->
   <div class="tab-pane fade in active" id="buyIN">

	  <!-- 每个订单 -->
	  <div class="boxtitle">2017-7-18<% %>&emsp;&emsp;订单号：1<% %>&emsp;&emsp;&emsp;&emsp;hongxiaoya
      <button type="button" class="btn btn-link tc" data-target="#feedbackcontent<% %>" style="padding:3px 5px 0 0;color:#333333;float:right;" id="feedback<% %>">反馈</button>
      </div>
      <div class="commentbox">
      <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="https://img3.doubanio.com/mpic/s28332051.jpg<% %>"/></a><br>         
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td>
              <p class="bookname">《<% %>斯通纳》</p>
              <p class="comment" style="color:#b7b7b7">[美]约翰·威廉斯<% %></p>
              <p class="comment" style="font-size:1px;">&nbsp;</p>
              <p class="comment">书主信息：<% %>洪晓雅&nbsp;&nbsp;<% %>15821911839&nbsp;&nbsp;</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<% %>新疆维吾尔自治区克孜勒苏柯尔克孜自治州</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<% %>翔安区新店镇新兴街610号</p>
              <p class="comment">新旧程度：<% %>五成新&emsp;&emsp;&emsp;&emsp;送书方式：<% %>邮寄</p>
              <p class="comment">备注：<% %>请小心的对待这本书（没有备注则写无）</p>
              </td>

              
              <td style="vertical-align:top;height:181px;" >
              <p class="time">收货人：<% %>沈蓓蓓
              <img style="height:20px;width:20px;margin:0 -1px 3px -2px;" src="../images/person_info.png" title="沈蓓蓓   13918111111 上海市闵行区东川路800号上海交通大学<% %>">
              </p>
              <p class="time">还书时间：<% %>2017-09-01</p>
              <p class="time">还书方式：<% %>邮寄</p>
              <p class="time">书币：<span class="coin"><% %>30</span></p>
              <div class="deletebutton">
              <button class="delete" style="width:90px" id="application" >确认收货</button> 
              </div>
              </td>
              
              </tr>
              </table>
              
            </td>
            </tr>
		    </table>
		    
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="feedbackcontent<% %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" >
					反馈
					</h4>
				</div>
				<form id="commentForm" class="STYLE-NAME" method="POST" action="">
				
				<label>
				<textarea id="content" name="content" placeholder="请输入具体内容" style="height: 120px; width:580px;resize:none;margin: 10px"></textarea>
				</label>
				<input type="hidden" name="" value="<% %>" >
				<input type="hidden" name="" value="<% %>">
				</form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-success" onClick="submitComment();" data-dismiss="modal">
					提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		    </div><!-- /.modal -->
	     </div>
    </div>
        
        
  </div>
  <!-- buyINend -->    
  
  <!-- 我的借入 -->
  <div class="tab-pane fade" id="lendIN">

	  <!-- 每个订单 -->
	  <div class="boxtitle">2017-7-18<% %>&emsp;&emsp;订单号：1<% %>&emsp;&emsp;&emsp;&emsp;hongxiaoya
      <button type="button" class="btn btn-link tc" style="padding:3px 5px 0 0;color:#333333;float:right;">反馈</button>
      </div>
      <div class="commentbox">
      <table  style="width:828px;">
     
        <tr>

          <td class="bookimage" style="vertical-align:text-top;">
          <a href=<% %>><img class="listbook" src="https://img3.doubanio.com/mpic/s28332051.jpg<% %>"/></a><br>         
          </td>
          
          <td class="bookcontent" style="vertical-align:top;">
          <table class="allwidth" style="width:691px;">
              <tr>
              <td>
              <p class="bookname">《<% %>斯通纳》</p>
              <p class="comment" style="color:#b7b7b7">[美]约翰·威廉斯<% %></p>
              <p class="comment" style="font-size:1px;">&nbsp;</p>
              <p class="comment">书主信息：<% %>洪晓雅&nbsp;&nbsp;<% %>15821911839&nbsp;&nbsp;</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<% %>新疆维吾尔自治区克孜勒苏柯尔克孜自治州</p>
              <p class="comment">&emsp;&emsp;&emsp;&emsp;&emsp;<% %>翔安区新店镇新兴街610号</p>
              <p class="comment">新旧程度：<% %>五成新&emsp;&emsp;&emsp;&emsp;送书方式：<% %>邮寄</p>
              <p class="comment">备注：<% %>请小心的对待这本书（没有备注则写无）</p>
              </td>
              
              <td style="vertical-align:top;">
              <p class="comment">收货人信息：<% %>沈蓓蓓
              <img style="height:20px;width:30px;margin:0;" src="../images/person_info.png" title="沈蓓蓓   13918111111 上海市闵行区东川路800号上海交通大学<% %>">
              </p>
              <p class="comment" style="font-size:8px;">&nbsp;</p>
              <p class="comment">还书时间：<% %>2017-09-01</p>
              <p class="comment">还书方式：<% %>邮寄</p>
              </td>
              
              <td style="vertical-align:top;height:164px;" >
              <p class="time">30<% %>书币</p>
              <div class="deletebutton">
              <button class="delete" style="width:90px" id="application" >确认收货</button> 
              </div>
              </td>
              
              </tr>
              </table>
              
            </td>
            </tr>
		    </table>
        </div>
        
        
  </div>
  <!-- lendINend --> 




<br>	
</div>
</div>
















<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="../js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
<script type="text/javascript">
function change(value){
	if(value == 1){
		$("#mybuyin").attr("style","border-bottom: 1px solid #d19826; color: #d19826;");
		$("#mylendin").attr("style","");
	}
	if(value == 2){
		$("#mybuyin").attr("style","");
		$("#mylendin").attr("style","border-bottom: 1px solid #d19826; color: #d19826;");
	}
}

function submitComment(){
	var comment=document.getElementById("content").value;
	if (comment==""){
		alert("具体内容不能为空");
	}
	else{
		document.getElementById("commentForm").submit();
		location='#bookComment';
	}
	
}
</script>


</body>
</html>