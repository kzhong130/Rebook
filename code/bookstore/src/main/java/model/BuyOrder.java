package model;

import java.sql.Timestamp;

public class BuyOrder {
	private int buyID;
	private int bookRecordID;
	private int buyerID;
	private String buyAddress;
	private String buyPhone;
	private String receiver;
	private Timestamp arrivalTime;
	private String status;
	private int ownerID;
	
	public BuyOrder(){
		
	}
	
	public BuyOrder(int bookRecordID,int buyerID,String buyAddress,String buyPhone,String receiver,Timestamp arrivalTime,String status,int ownerID){
		this.bookRecordID = bookRecordID;
		this.buyerID = buyerID;
		this.buyAddress = buyAddress;
		this.buyPhone = buyPhone;
		this.receiver = receiver;
		this.arrivalTime = arrivalTime;
		this.status = status;
		this.ownerID = ownerID;
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
	
	public int getBuyerID(){
		return buyerID;
	}
	
	public void setBuyerID(int buyerID){
		this.buyerID = buyerID;
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
	
	public int getOwnerID(){
		return ownerID;
	}
	
	public void setOwnerID(int ownerID){
		this.ownerID = ownerID;
	}
}
