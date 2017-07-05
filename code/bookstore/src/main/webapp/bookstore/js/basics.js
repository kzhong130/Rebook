// JavaScript Document
$(document).ready(function(){
	/**
	*
	*
	*/
	//初始化返回顶部标签的是否显示
	$("#back_top_jt").fadeOut(0);  
	//滚动条大于100后显示返回顶部
	$(window).scroll(function(){  
		if ($(window).scrollTop()>200){  
			$("#back_top_jt").fadeIn(200); 
		}  
		else  
		{  
			$("#back_top_jt").fadeOut(200); 
		}  
	}); 
	//点击返回顶部按钮动态返回顶部
	$("#back_top_jt").click(function(){  
		//var path_name = window.location.pathname;
		//var page_name = path_name.substring(path_name.lastIndexOf('/')+1,path_name.length);
		$("index,html").animate({scrollTop:0},1000);  
		return false;  
	});
	
	/**
	$("select").selectOrDie({
        customClass: 'myselect'
    });
	*/
	$("#cfh_banner_search_select_ul").hide();
	
	
	$("#back_top_jt").mouseover(function(){
		$("#back_top_jt").attr("src","img/index/back_top_jt_move.png");
	});
	$("#back_top_jt").mouseout(function(){
		$("#back_top_jt").attr("src","img/index/back_top_jt.png");
	});
	
	$("#back_top_wx").mouseover(function(){
		$("#back_top_wx").attr("src","img/index/back_top_wx_move.png");
	});
	$("#back_top_wx").mouseout(function(){
		$("#back_top_wx").attr("src","img/index/back_top_wx.png");
	});
	
	$("#back_top_qq").mouseover(function(){
		$("#back_top_qq").attr("src","img/index/back_top_qq_move.png");
	});
	$("#back_top_qq").mouseout(function(){
		$("#back_top_qq").attr("src","img/index/back_top_qq.png");
	});
	
	$("#back_top_call").mouseover(function(){
		$("#back_top_call").attr("src","img/index/back_top_call_move.png");
	});
	$("#back_top_call").mouseout(function(){
		$("#back_top_call").attr("src","img/index/back_top_call.png");
	});
});

function float_call_me(value){
	if(value == 1){
		$(".back_top_call_span").css("display","block");
	}
	if(value == 2){
		$(".back_top_call_span").css("display","none");
	}
	if(value == 3){
		$(".back_top_qq_span").css("display","block");
	}
	if(value == 4){
		$(".back_top_qq_span").css("display","none");
	}
	if(value == 5){
		$(".back_top_wx_span").css("display","block");
	}
	if(value == 6){
		$(".back_top_wx_span").css("display","none");
	}
	if(value == 7){
		$(".back_top_jt_span").css("display","block");
	}
	if(value == 8){
		$(".back_top_jt_span").css("display","none");
	}
}
/**
 * top模块登录/注册按钮背景切换方法
 * @method login_but_bg
 * @for 无
 * @param {var} value 状态区别
 * @return {无} 无
 */
function login_but_bg(value){
	if(value == 1){
		$("#register").css({'background-image':'url(img/index/top_but_bg.png)','background-repeat':'no-repeat','background-position':'center'});
	}
	if(value == 2){
		$("#register").css({'background-image':'url()','background-repeat':'no-repeat','background-position':'center'});
	}
	if(value == 3){
		$("#login").css({'background-image':'url(img/index/top_but_bg.png)','background-repeat':'no-repeat','background-position':'center'});
	}
	if(value == 4){
		$("#login").css({'background-image':'url()','background-repeat':'no-repeat','background-position':'center'});
	}
}
/**
 * banner模块类别选择“请选择”单击事件
 * @method cfh_banner_search_select
 * @for 无
 * @param {var} value 状态区别
 * @return {无} 无
 */
var cfh_banner_search_select_TAG = 0;
function cfh_banner_search_select(value){
	if(value == cfh_banner_search_select_TAG){
		$("#cfh_banner_search_select_ul").show();
	}else{
		cfh_banner_search_select_TAG = 0;
	}
}
/**
 * banner模块类别下拉菜单单击事件
 * @method cfh_banner_search_select
 * @for 无
 * @param {var} value 状态区别
 * @return {无} 无
 */
function cfh_banner_search_select1(value){
	if(value == "项目"){
		$("#cfh_banner_search_select_ul").hide();
		$("#cfh_banner_search_select_hideinput").attr("value","项目");
		$("#cfh_banner_search_select_span").text("项目");
	}
	if(value == "投资人"){
		$("#cfh_banner_search_select_ul").hide();
		$("#cfh_banner_search_select_hideinput").attr("value","投资人");
		$("#cfh_banner_search_select_span").text("投资人");
	}
	if(value == "平台公示"){
		$("#cfh_banner_search_select_ul").hide();
		$("#cfh_banner_search_select_hideinput").attr("value","平台公示");
		$("#cfh_banner_search_select_span").text("平台公示");
	}
	if(value == "指南"){
		$("#cfh_banner_search_select_ul").hide();
		$("#cfh_banner_search_select_hideinput").attr("value","指南");
		$("#cfh_banner_search_select_span").text("指南");
	}
	cfh_banner_search_select_TAG = -1;
}