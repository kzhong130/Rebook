
var user_Boolean = false;
var password_Boolean = false;
var varconfirm_Boolean = false;
var email_Boolean = false;
var Mobile_Boolean = false;

var realname_Boolean = false;
var validationProblem_Boolean = false;
var validationAnswer_Boolean = false;
var address_Boolean = false;

//user
$('.reg_user').blur(function(){
  if ((/^[a-z0-9_-]{6,12}$/).test($(".reg_user").val())){
    $('.user_hint').html("✔").css("color","green");
    user_Boolean = true;
  }else {
    $('.user_hint').html("×").css("color","red");
    user_Boolean = false;
  }
});
// password
$('.reg_password').blur(function(){
  if ((/^[a-z0-9_-]{6,16}$/).test($(".reg_password").val())){
    $('.password_hint').html("✔").css("color","green");
    password_Boolean = true;
  }else {
    $('.password_hint').html("×").css("color","red");
    password_Boolean = false;
  }
});


// password_confirm
$('.reg_confirm').blur(function(){
  if (($(".reg_password").val())==($(".reg_confirm").val())){
    $('.confirm_hint').html("✔").css("color","green");
    varconfirm_Boolean = true;
  }else {
    $('.confirm_hint').html("×").css("color","red");
    varconfirm_Boolean = false;
  }
});


// Email
$('.reg_email').blur(function(){
  if ((/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/).test($(".reg_email").val())){
    $('.email_hint').html("✔").css("color","green");
    email_Boolean = true;
  }else {
    $('.email_hint').html("×").css("color","red");
    email_Boolean = false;
  }
});


// Mobile
$('.reg_mobile').blur(function(){
  if ((/^1[34578]\d{9}$/).test($(".reg_mobile").val())){
    $('.mobile_hint').html("✔").css("color","green");
    Mobile_Boolean = true;
  }else {
    $('.mobile_hint').html("×").css("color","red");
    Mobile_Boolean = false;
  }
});

//Realname
$('.reg_realname').blur(function(){
  if ((/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/).test($(".reg_realname").val())){
    $('.realname_hint').html("✔").css("color","green");
    realname_Boolean = true;
  }else {
    $('.realname_hint').html("×").css("color","red");
    realname_Boolean = false;
  }
});

//validationProblem
$('.reg_validationProblem').blur(function(){
  if ($(".reg_validationProblem").val()!=""){
    $('.validationProblem_hint').html("✔").css("color","green");
    validationProblem_Boolean = true;
  }else {
    $('.validationProblem_hint').html("×").css("color","red");
    validationProblem_Boolean = false;
  }
});

//validationAnswer
$('.reg_validationAnswer').blur(function(){
  if ($(".reg_validationAnswer").val()!=""){
    $('.validationAnswer_hint').html("✔").css("color","green");
    validationAnswer_Boolean = true;
  }else {
    $('.validationAnswer_hint').html("×").css("color","red");
    validationAnswer_Boolean = false;
  }
});

//address
$('.reg_address').blur(function(){
  if ($(".reg_address").val()!=""){
    $('.address_hint').html("✔").css("color","green");
    address_Boolean = true;
  }else {
    $('.address_hint').html("×").css("color","red");
    address_Boolean = false;
  }
});



// click
$('.red_button').click(function(){
  if(user_Boolean && password_Boolean && varconfirm_Boolean && email_Boolean && Mobile_Boolean && validationAnswer_Boolean && validationProblem_Boolean &&  realname_Boolean &&  address_Boolean == true){
	//alter(document.getElementsByName("province"));
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
	  //alert(detail);
	  var maddress=province+city+area+town+detail;

	  var b1= document.getElementsByName('sex');
	  var sex;

	  for (var i = 0; i < b1.length; i++) {

	  if (b1[i].checked == true) {//如果选中，下面的alert就会弹出选中的值

		  //alert(b1[i].value);
		  sex=b1[i].value;
	  }

	  }
	
  	$.ajax({  
        type:"POST",  
        url:"AccountAction!register",  
        async:false,
        data:{province:province,city:city,area:area,town:town,userName:$(".reg_user").val(),password:$(".reg_password").val(),realName:$(".reg_realname").val(),sex:sex,phone:$(".reg_mobile").val(),email:$(".reg_email").val(),address:detail,validationProblem:$(".reg_validationProblem").val(),validationAnswer:$(".reg_validationAnswer").val()} ,
        success:function(result){
        	try{
        		result=eval('('+result+')');
        		alert("regiser success");
				window.location.replace("test.jsp");	
        	}
        	catch(err){
        		alert("用户已存在，请更换用户名");
        	}
        },
        error:function(){
        	alert("用户已存在，请更换用户名");
        }
    });
		/*$.post("AccountAction!register",{userName:$(".reg_user").val(),password:$(".reg_password").val(),realName:$(".reg_realname").val(),sex:$(".reg_sex").val(),phone:$(".reg_mobile").val(),email:$(".reg_email").val(),address:maddress,validationProblem:$(".reg_validationProblem").val(),validationAnswer:$(".reg_validationAnswer").val()},function(result){
			if (result.success){
				alert(result.success);
				window.location.replace("test.jsp");	
				
			} else {
				alert("result.success");
				alert("user exist");
			}
		},'json');
		alert("user exist");
		*/
	  
  }else {
	  
    alert("请完善信息");
  }
});
