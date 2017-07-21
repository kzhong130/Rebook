package action;

import service.AppService;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.BuyOrderFeedback;
import model.User;
import net.sf.json.JSONObject;

public class BuyOrderFeedbackAction extends BaseAction{
	private int ID;
	private int buyID;
	private String topic;
	private String content;
	private Timestamp time;
	private String handleResult;
	private Integer adminID;
	private int userID;
	
	private AppService appService;
	
	public int getID(){
		return ID;
	}
	
	public void setID(int ID){
		this.ID = ID;
	}
	
	public int getBuyID(){
		return buyID;
	}
	
	public void setBuyID(int buyID){
		this.buyID = buyID;
	}
	
	public String getTopic(){
		return topic;
	}
	
	public void setTopic(String topic){
		this.topic = topic;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	public Timestamp getTime(){
		return time;
	}
	
	public void setTime(Timestamp time){
		this.time = time;
	}
	
	public String getHandleResult(){
		return handleResult;
	}
	
	public void setHandleResult(String handleResult){
		this.handleResult = handleResult;
	}
	
	public int getAdminID(){
		return adminID;
	}
	
	public void setAdminID(int adminID){
		this.adminID = adminID;
	}
	
	public int getUserID(){
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID = userID;
	}
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	private String adminName;
	
	public void setAdminName(String adminName){
		this.adminName=adminName;
	}
	
	public String getAdminName(){
		return adminName;
	}
	
	
	public String addBuyOrderFeedback() throws Exception{
		System.out.println("here");
		BuyOrderFeedback buyOrderFeedback = new BuyOrderFeedback();
		buyOrderFeedback.setBuyID(buyID);
		buyOrderFeedback.setContent(content);
		buyOrderFeedback.setTopic(topic);
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		buyOrderFeedback.setTime(nousedate);
		String userName = (String)request().getSession().getAttribute("loginUserName");
		User user = appService.getUserByUserName(userName);
		buyOrderFeedback.setUserID(user.getUserID());
		appService.addBuyOrderFeedback(buyOrderFeedback);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		return "add success";
	}
	
	public String viewDetail() throws Exception{
		BuyOrderFeedback bf=appService.getBuyOrderFeedbackByID(ID);
		User user=appService.getUserByUserID(bf.getUserID());
		request().setAttribute("feedback", bf);
		request().setAttribute("feedbackUser", user);
		return "view";
	}
	
	public String handle() throws Exception{
		BuyOrderFeedback bf=appService.getBuyOrderFeedbackByID(ID);
		bf.setHandleResult(handleResult);
		bf.setAdminID(appService.getAdminByAdminName(adminName).getAdminID());
		appService.updateBuyOrderFeedback(bf);
		
		return "handle";
	}
	
	public String initialize() throws Exception{
		List<BuyOrderFeedback> buyOrderFeedback=appService.getAllBuyOrderFeedback();
		request().setAttribute("allBuyOrderFeedback", buyOrderFeedback);
		List<String> userNames=new ArrayList<String>();
		List<String> adminNames=new ArrayList<String>();
		int size=buyOrderFeedback.size();
		for(int i=0;i<size;i++){
			userNames.add(appService.getUserByUserID(buyOrderFeedback.get(i).getUserID()).getUserName());
			Integer adminID=buyOrderFeedback.get(i).getAdminID();
			if(adminID==null) adminNames.add("无");
			else{
				adminNames.add(appService.getAdminByAdminID(adminID).getAdminName());
			}
		}
		request().setAttribute("FeedbackAdminNames", adminNames);
		request().setAttribute("FeedbackUserNames", userNames);
		return "initialize";
	}
}
