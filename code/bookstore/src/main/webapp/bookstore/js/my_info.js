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
var win = window.opener; // 表示打开本window的那个页面的window 
function listClick(value){
	if(value == 1){
		$("#crowdfunding_iframe", window.parent.document).attr("src","crowdfunding.center/my_info.html");
		$("#crowdfunding_iframe", window.parent.document).attr("height",1045);
		$("#listClick1", window.parent.document).attr("class","menu_list_on");
		$("#listClick3", window.parent.document).attr("class","");
		$("#listClick4", window.parent.document).attr("class","");
	}
	if(value == 3){
		$("#crowdfunding_iframe", window.parent.document).attr("src","crowdfunding.center/identity_prove.html");
		$("#crowdfunding_iframe", window.parent.document).attr("height",1045);
		$("#listClick1", window.parent.document).attr("class","");
		$("#listClick3", window.parent.document).attr("class","menu_list_on");
		$("#listClick4", window.parent.document).attr("class","");
	}
	if(value == 4){
		$("#crowdfunding_iframe", window.parent.document).attr("src","crowdfunding.center/make_password.html");
		$("#crowdfunding_iframe", window.parent.document).attr("height",1045);
		$("#listClick1", window.parent.document).attr("class","");
		$("#listClick3", window.parent.document).attr("class","");
		$("#listClick4", window.parent.document).attr("class","menu_list_on");
	}
	if(value == 11){
		$("#crowdfunding_iframe", window.parent.document).attr("src","crowdfunding.center/grade_integration.html");
		$("#crowdfunding_iframe", window.parent.document).attr("height",2000);
		$("#vertical_navigation", window.parent.document).css("height","2005px");
		$("#listClick11", window.parent.document).attr("class","menu_list_on");
		$("#listClick12", window.parent.document).attr("class","");
		$("#listClick13", window.parent.document).attr("class","");
	}
	if(value == 12){
		$("#crowdfunding_iframe", window.parent.document).attr("src","crowdfunding.center/integration_record.html");
		$("#crowdfunding_iframe", window.parent.document).attr("height",1045);
		$("#listClick11", window.parent.document).attr("class","");
		$("#listClick12", window.parent.document).attr("class","menu_list_on");
		$("#listClick13", window.parent.document).attr("class","");
	}
	if(value == 13){
		$("#crowdfunding_iframe", window.parent.document).attr("src","crowdfunding.center/integration_rule.html");
		$("#crowdfunding_iframe", window.parent.document).attr("height",1045);
		$("#listClick11", window.parent.document).attr("class","");
		$("#listClick12", window.parent.document).attr("class","");
		$("#listClick13", window.parent.document).attr("class","menu_list_on");
	}
}