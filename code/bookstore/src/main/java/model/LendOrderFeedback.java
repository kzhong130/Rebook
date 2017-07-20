package model;

import java.sql.Timestamp;

public class LendOrderFeedback {
	private int ID;
	private int lendID;
	private String topic;
	private String content;
	private Timestamp time;
	private String handleResult;
	private Integer adminID;
	private int userID;
	
	public LendOrderFeedback(){
		
	}
	
	public LendOrderFeedback(int lendID,String topic,String content,Timestamp time,String handleResult,Integer adminID,int userID){
		this.lendID = lendID;
		this.topic = topic;
		this.content = content;
		this.time = time;
		this.handleResult = handleResult;
		this.adminID = adminID;
		this.userID = userID;
	}
	
	public int getID(){
		return ID;
	}
	
	public void setID(int ID){
		this.ID = ID;
	}
	
	public int getLendID(){
		return lendID;
	}
	
	public void setLendID(int lendID){
		this.lendID = lendID;
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
	
	public Integer getAdminID(){
		return adminID;
	}
	
	public void setAdminID(Integer adminID){
		this.adminID = adminID;
	}
	
	public int getUserID(){
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID = userID;
	}
}
