/*!
 * jRaiser 2 Javascript Library
 * Yaolongfei - v1.0.0 (2015-07-28T17:30:00+0800)
 */

$(document).ready(function(){
 
});
/**
 * 用于众筹个人中心左侧竖型菜单的动态样式切换
 * @method listClick
 * @for 无
 * @param {int} value 标记所点击的菜单
 * @return {null} 无
 */
function listClick(value){
	if(value == 1){
		$("#listClick_1").css("border-bottom","1px solid #efbb24");
		$("#listClick_1").css("color","#efbb24");
		$("#listClick_3").css("border-bottom","1px solid #CCC");
		$("#listClick_3").css("color","#666");
		$("#listClick_4").css("border-bottom","1px solid #CCC");
		$("#listClick_4").css("color","#666");
		
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/my_info.jsp");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","menu_list_on");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 2){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/make_head.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","menu_list_on");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 3){
		$("#listClick_1").css("border-bottom","1px solid #CCC");
		$("#listClick_1").css("color","#666");
		$("#listClick_3").css("border-bottom","1px solid #efbb24");
		$("#listClick_3").css("color","#efbb24");
		$("#listClick_4").css("border-bottom","1px solid #CCC");
		$("#listClick_4").css("color","#666");
		
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/identity_prove.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","menu_list_on");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 4){
		$("#listClick_1").css("border-bottom","1px solid #CCC");
		$("#listClick_1").css("color","#666");
		$("#listClick_3").css("border-bottom","1px solid #CCC");
		$("#listClick_3").css("color","#666");
		$("#listClick_4").css("border-bottom","1px solid #efbb24");
		$("#listClick_4").css("color","#efbb24");
		
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/make_password.jsp");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","menu_list_on");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 5){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/apply_lingtou.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","menu_list_on");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 6){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/project_manage.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","menu_list_on");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 7){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/touhou_manage.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","menu_list_on");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 8){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/my_account.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","menu_list_on");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 9){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/investment_inquiry.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","menu_list_on");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 10){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/apply_refund.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","menu_list_on");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 11){
		
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/grade_integration.html");
		$("#crowdfunding_iframe").attr("height","2000");
		$("#vertical_navigation").css("height","2005px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","menu_list_on");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 12){
		$("#listClick_11").css("border-bottom","1px solid #CCC");
		$("#listClick_11").css("color","#666");
		$("#listClick_12").css("border-bottom","1px solid #efbb24");
		$("#listClick_12").css("color","#efbb24");
		$("#listClick_13").css("border-bottom","1px solid #CCC");
		$("#listClick_13").css("color","#666");
		
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/creditRecord.jsp");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","menu_list_on");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 13){
		$("#listClick_11").css("border-bottom","1px solid #CCC");
		$("#listClick_11").css("color","#666");
		$("#listClick_12").css("border-bottom","1px solid #CCC");
		$("#listClick_12").css("color","#666");
		$("#listClick_13").css("border-bottom","1px solid #efbb24");
		$("#listClick_13").css("color","#efbb24");
		
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/bookcoinRecord.jsp");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","menu_list_on");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 14){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/messages.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","menu_list_on");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","");
	}
	if(value == 15){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/inbox.html");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","menu_list_on");
		$("#listClick16").attr("class","");
	}
	if(value == 16){
		$("#crowdfunding_iframe").attr("src","crowdfunding.center/myComment.jsp");
		$("#crowdfunding_iframe").attr("height","1045");
		$("#vertical_navigation").css("height","1050px");
		
		$("#listClick1").attr("class","");
		$("#listClick2").attr("class","");
		$("#listClick3").attr("class","");
		$("#listClick4").attr("class","");
		$("#listClick5").attr("class","");
		$("#listClick6").attr("class","");
		$("#listClick7").attr("class","");
		$("#listClick8").attr("class","");
		$("#listClick9").attr("class","");
		$("#listClick10").attr("class","");
		$("#listClick11").attr("class","");
		$("#listClick12").attr("class","");
		$("#listClick13").attr("class","");
		$("#listClick14").attr("class","");
		$("#listClick15").attr("class","");
		$("#listClick16").attr("class","menu_list_on");
	}
}