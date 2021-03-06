package model;

import java.sql.Timestamp;

public class BookIN {
	private int bookRecordID;
	private String userName;
	private String ISBN;
	private String recency;
	private Timestamp inTime;
	private int coinNumber;
	private String ownerName;
	private String type;
	private String sendWay;
	private String city;
	private Integer longestDuration;
	private String ownerPhone;
	private String ownerAddress;
	private String inStatus;
	private String note;
	private String province;
	private String town;
	
	public BookIN(){
		
	}
	
	public BookIN(String userName, String ISBN,String recency,Timestamp inTime,int coinNumber,String ownerName,String type,String sendWay,String city,Integer longestDuration,String ownerPhone,String ownerAddress,String inStatus,String note,String province,String town){
		this.userName = userName;
		this.ISBN = ISBN;
		this.recency = recency;
		this.inTime = inTime;
		this.coinNumber = coinNumber;
		this.ownerName = ownerName;
		this.type = type;
		this.sendWay = sendWay;
		this.city = city;
		this.longestDuration = longestDuration;
		this.ownerPhone = ownerPhone;
		this.ownerAddress = ownerAddress;
		this.inStatus = inStatus;
		this.note = note;
		this.province = province;
		this.town=town;
	}
	
	public String getTown(){
		return town;
	}
	
	public void setTown(String town){
		this.town=town;
	}
	
	public int getBookRecordID(){
		return bookRecordID;
	}
	
	public void setBookRecordID(int bookRecordID){
		this.bookRecordID = bookRecordID;
	}
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
	}
	
	public String getISBN(){
		return ISBN;
	}
	
	public void setISBN(String ISBN){
		this.ISBN = ISBN;
	}
	
	public String getRecency(){
		return recency;
	}
	
	public void setRecency(String recency){
		this.recency = recency;
	}
	
	public Timestamp getInTime(){
		return inTime;
	}
	
	public void setInTime(Timestamp inTime){
		this.inTime = inTime;
	}
	
	public int getCoinNumber(){
		return coinNumber;
	}
	
	public void setCoinNumber(int coinNumber){
		this.coinNumber = coinNumber;
	}
	
	public String getOwnerName(){
		return ownerName;
	}
	
	public void setOwnerName(String ownerName){
		this.ownerName = ownerName;
	}
	
	public String getType(){
		return type;
	}
	
	public void setType(String type){
		this.type = type;
	}
	
	public String getSendWay(){
		return sendWay;
	}
	
	public void setSendWay(String sendWay){
		this.sendWay = sendWay;
	}
	
	public String getCity(){
		return city;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public Integer getLongestDuration(){
		return longestDuration;
	}
	
	public void setLongestDuration(Integer longestDuration){
		this.longestDuration = longestDuration;
	}
	
	public String getOwnerPhone(){
		return ownerPhone;
	}
	
	public void setOwnerPhone(String ownerPhone){
		this.ownerPhone = ownerPhone;
	}
	
	public String getOwnerAddress(){
		return ownerAddress;
	}
	
	public void setOwnerAddress(String ownerAddress){
		this.ownerAddress = ownerAddress;
	}
	
	public String getInStatus(){
		return inStatus;
	}
	
	public void setInStatus(String inStatus){
		this.inStatus = inStatus;
	}
	
	public String getNote(){
		return note;
	}
	
	public void setNote(String note){
		this.note = note;
	}
	
	public String getProvince(){
		return province;
	}
	
	public void setProvince(String province){
		this.province = province;
	}
}
