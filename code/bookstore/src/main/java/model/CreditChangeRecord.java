package model;

import java.sql.Timestamp;

public class CreditChangeRecord {
	private int ID;
	private String userName;
	private int number;
	private Timestamp time;
	private String reason;
	
	public CreditChangeRecord(){
		
	}
	
	public CreditChangeRecord(String userName, int number,Timestamp time,String reason){
		this.userName = userName;
		this.number = number;
		this.time = time;
		this.reason = reason;
	}
	
	public int getID(){
		return ID;
	}
	
	public void setID(int ID){
		this.ID = ID;
	}
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
	}
	
	public int getNumber(){
		return number;
	}
	
	public void setNumber(int number){
		this.number = number;
	}
	
	public Timestamp getTime(){
		return time;
	}
	
	public void setTime(Timestamp time){
		this.time = time;
	}
	
	public String getReason(){
		return reason;
	}
	
	public void setReason(String reason){
		this.reason = reason;
	}
}
