package model;

import java.sql.Timestamp;

public class LendOrder {
	private int lendID;
	private int bookRecordID;
	private int requestID;
	private String lenderName;
	private String returnWay;
	private String lendAddress;
	private String lendPhone;
	private String receiver;
	private Timestamp arrivalTime;
	private Timestamp returnTime;
	private String status;
	private String ownerName;
	
	public LendOrder(){
		
	}
	
	public LendOrder(int bookRecordID,int requestID,String lenderName,String returnWay,String lendAddress,String lendPhone,String receiver,Timestamp arrivalTime,Timestamp returnTime,String status,String ownerName){
		this.bookRecordID = bookRecordID;
		this.requestID = requestID;
		this.lenderName = lenderName;
		this.returnWay = returnWay;
		this.lendAddress = lendAddress;
		this.lendPhone = lendPhone;
		this.receiver = receiver;
		this.arrivalTime = arrivalTime;
		this.returnTime = returnTime;
		this.status = status;
		this.ownerName = ownerName;
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
	
	public int getRequestID(){
		return requestID;
	}
	
	public void setRequestID(int requestID){
		this.requestID = requestID;
	}
	
	public String getLenderName(){
		return lenderName;
	}
	
	public void setLenderName(String lenderName){
		this.lenderName = lenderName;
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
	
	public String getOwnerName(){
		return ownerName;
	}
	
	public void setOwnerName(String ownerName){
		this.ownerName = ownerName;
	}
}
