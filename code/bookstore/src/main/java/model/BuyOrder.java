package model;

import java.sql.Timestamp;

public class BuyOrder {
	private int buyID;
	private int bookRecordID;
	private int requestID;
	private String buyerName;
	private String buyAddress;
	private String buyPhone;
	private String receiver;
	private Timestamp arrivalTime;
	private String status;
	private String ownerName;
	
	public BuyOrder(){
		
	}
	
	public BuyOrder(int bookRecordID,int requestID,String buyerName,String buyAddress,String buyPhone,String receiver,Timestamp arrivalTime,String status,String ownerName){
		this.bookRecordID = bookRecordID;
		this.requestID = requestID;
		this.buyerName = buyerName;
		this.buyAddress = buyAddress;
		this.buyPhone = buyPhone;
		this.receiver = receiver;
		this.arrivalTime = arrivalTime;
		this.status = status;
		this.ownerName = ownerName;
	}
	
	public int getBuyID(){
		return buyID;
	}
	
	public void setBuyID(int buyID){
		this.buyID = buyID;
	}
	
	public int getBookRecordID(){
		return bookRecordID;
	}
	
	public void setBookRecordID(int bookRecordID){
		this.bookRecordID = bookRecordID;
	}
	
	public int getRequestID(){
		return requestID;
	}
	
	public void setRequestID(int requestID){
		this.requestID = requestID;
	}
	
	public String getBuyerName(){
		return buyerName;
	}
	
	public void setBuyerName(String buyerName){
		this.buyerName = buyerName;
	}
	
	public String getBuyAddress(){
		return buyAddress;
	}
	
	public void setBuyAddress(String buyAddress){
		this.buyAddress = buyAddress;
	}
	
	public String getBuyPhone(){
		return buyPhone;
	}
	
	public void setBuyPhone(String buyPhone){
		this.buyPhone = buyPhone;
	}
	
	public String getReceiver(){
		return receiver;
	}
	
	public void setReceiver(String receiver){
		this.receiver = receiver;
	}
	
	public Timestamp getArrivalTime(){
		return arrivalTime;
	}
	
	public void setArrivalTime(Timestamp arrivalTime){
		this.arrivalTime = arrivalTime;
	}
	
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	
	public String getOwnerName(){
		return ownerName;
	}
	
	public void setOwnerName(String ownerName){
		this.ownerName = ownerName;
	}
}
