package model;

import java.sql.Timestamp;

public class CreditChangeRecord {
	private int ID;
	private int userID;
	private int number;
	private Timestamp time;
	private String reason;
	
	public CreditChangeRecord(){
		
	}
	
	public CreditChangeRecord(int userID, int number,Timestamp time,String reason){
		this.userID = userID;
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
	
	public int getUserID(){
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID = userID;
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
