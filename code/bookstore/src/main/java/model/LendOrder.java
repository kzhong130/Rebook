package model;

import java.sql.Timestamp;

public class LendOrder {
	private int lendID;
	private int bookRecordID;
	private int lenderID;
	private String returnWay;
	private String lendAddress;
	private String lendPhone;
	private String receiver;
	private Timestamp arrivalTime;
	private Timestamp returnTime;
	private String status;
	private int ownerID;
	
	public LendOrder(){
		
	}
	
	public LendOrder(int bookRecordID,int lenderID,String returnWay,String lendAddress,String lendPhone,String receiver,Timestamp arrivalTime,Timestamp returnTime,String status,int ownerID){
		this.bookRecordID = bookRecordID;
		this.lenderID = lenderID;
		this.returnWay = returnWay;
		this.lendAddress = lendAddress;
		this.lendPhone = lendPhone;
		this.receiver = receiver;
		this.arrivalTime = arrivalTime;
		this.returnTime = returnTime;
		this.status = status;
		this.ownerID = ownerID;
	}
	
	public int getLendID(){
		return lendID;
	}
	
	public void setLendID(int lendID){
		this.lendID = lendID;
	}
	
	public int getBookRecordID(){
		return bookRecordID;
	}
	
	public void setBookRecordID(int bookRecordID){
		this.bookRecordID = bookRecordID;
	}
	
	public int getLenderID(){
		return lenderID;
	}
	
	public void setLenderID(int lenderID){
		this.lenderID = lenderID;
	}
	
	public String getReturnWay(){
		return returnWay;
	}
	
	public void setReturnWay(String returnWay){
		this.returnWay = returnWay;
	}
	
	public String getLendAddress(){
		return lendAddress;
	}
	
	public void setLendAddress(String lendAddress){
		this.lendAddress = lendAddress;
	}
	
	public String getLendPhone(){
		return lendPhone;
	}
	
	public void setLendPhone(String lendPhone){
		this.lendPhone = lendPhone;
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
	
	public Timestamp getReturnTime(){
		return returnTime;
	}
	
	public void setReturnTime(Timestamp returnTime){
		this.returnTime = returnTime;
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
