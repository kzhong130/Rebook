
var ownername_Boolean = false;
var ownerphone_Boolean = false;
var sellcoinnumber_Boolean = false;
var lendcoinnumber_Boolean = false;
var lenddaynumber_Boolean = false;
var owneraddress_Boolean = false;


// Owner phone
$('.reg_ownerphone').blur(function(){
  if ((/^1[34578]\d{9}$/).test($(".reg_mobile").val())){
    $('.ownerphone_hint').html("✔").css("color","green");
    ownerphone_Boolean = true;
  }else {
    $('.ownerphone_hint').html("×").css("color","red");
    ownerphone_Boolean = false;
  }
});

//Owner name
$('.reg_ownername').blur(function(){
  if ((/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/).test($(".reg_realname").val())){
    $('.ownername_hint').html("✔").css("color","green");
    ownername_Boolean = true;
  }else {
    $('.ownername_hint').html("×").css("color","red");
    ownername_Boolean = false;
  }
});



//sell coin number
$('.reg_sellcoinnumber').blur(function(){
  if ($(".reg_sellcoinnumber").val()>= 0){
    $('.sellcoinnumber_hint').html("✔").css("color","green");
    sellcoinnumber_Boolean = true;
  }else {
    $('.sellcoinnumber_hint').html("×").css("color","red");
    sellcoinnumber_Boolean = false;
  }
});


//lend coin number
$('.reg_lendcoinnumber').blur(function(){
if ($(".reg_lendcoinnumber").val()>= 0){
  $('.lendcoinnumber_hint').html("✔").css("color","green");
  lendcoinnumber_Boolean = true;
}else {
  $('.lendcoinnumber_hint').html("×").css("color","red");
  lendcoinnumber_Boolean = false;
}
});


//lend day number
$('.reg_lenddaynumber').blur(function(){
if ($(".reg_lenddaynumber").val()>= 0){
  $('.lenddaynumber_hint').html("✔").css("color","green");
  lenddaynumber_Boolean = true;
}else {
  $('.lenddaynumber_hint').html("×").css("color","red");
  lenddaynumber_Boolean = false;
}
});

//Owner address
$('.reg_owneraddress').blur(function(){
  if ($(".reg_owneraddress").val()!=""){
    $('.owneraddress_hint').html("✔").css("color","green");
    owneraddress_Boolean = true;
  }else {
    $('.owneraddress_hint').html("×").css("color","red");
    owneraddress_Boolean = false;
  }
});



// lend click
$('.red_lendbutton').click(function(){
  if(ownername_Boolean && ownerphone_Boolean && lendcoinnumber_Boolean && lenddaynumber_Boolean &&  owneraddress_Boolean == true){
	  var select = document.getElementsByName("province")[0];
	  var province=select.options[select.selectedIndex].text;
	  if(document.getElementsByName("city")[0].value!=""){
		  select=document.getElementsByName("city")[0];
		  var city=select.options[select.selectedIndex].text;
	  }
	  else {
		  var city="";
	  }
	  if(document.getElementsByName("area")[0].value!=""){
		  select=document.getElementsByName("area")[0];
		  var area=select.options[select.selectedIndex].text;
	  }
	  else var area="";
	  if(document.getElementsByName("town")[0].value!=""){
		  select=document.getElementsByName("town")[0];
		  var town=select.options[select.selectedIndex].text;
	  }
	  else var town="";
	  var detail=$(".reg_address").val();
	  var maddress=province+city+area+town+detail;

	  var b1= document.getElementsByName('sex');
	  var sex;

	  for (var i = 0; i < b1.length; i++) {

	  if (b1[i].checked == true) {//如果选中，下面的alert就会弹出选中的值

		  sex=b1[i].value;
	  }

	  }
	
  	$.ajax({  
        type:"POST",  
        url:"",/*这里我就不会写了，前面也是照搬的*/  
        
  	
  	});

	  
  }else {
	  
    alert("请完善信息");
  }
});

//sell click
$('.red_sellbutton').click(function(){
  if(ownername_Boolean && ownerphone_Boolean && sellcoinnumber_Boolean  == true){
	  var select = document.getElementsByName("province")[0];
	  var province=select.options[select.selectedIndex].text;
	  if(document.getElementsByName("city")[0].value!=""){
		  select=document.getElementsByName("city")[0];
		  var city=select.options[select.selectedIndex].text;
	  }
	  else {
		  var city="";
	  }
	  if(document.getElementsByName("area")[0].value!=""){
		  select=document.getElementsByName("area")[0];
		  var area=select.options[select.selectedIndex].text;
	  }
	  else var area="";
	  if(document.getElementsByName("town")[0].value!=""){
		  select=document.getElementsByName("town")[0];
		  var town=select.options[select.selectedIndex].text;
	  }
	  else var town="";
	  var detail=$(".reg_address").val();
	  var maddress=province+city+area+town+detail;

	  var b1= document.getElementsByName('sex');
	  var sex;

	  for (var i = 0; i < b1.length; i++) {

	  if (b1[i].checked == true) {//如果选中，下面的alert就会弹出选中的值

		  sex=b1[i].value;
	  }

	  }
	
  	$.ajax({  
        type:"POST",  
        url:"",/*这里我就不会写了，前面也是照搬的*/  
        
  	
  	});

	  
  }else {
	  
    alert("请完善信息");
  }
});