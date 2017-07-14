package model;

public class RequestBook {
	private int requestID;
	private int bookRecordID;
	private String userName;
	private String city;
	private String province;
	private String address;
	private String receiverName;
	private String requestStatus;
	private String returnWay;
	private String phone;
	
	public RequestBook(){
		
	}
	
	public RequestBook(int bookRecordID, String userName,String city, String province, String address, String receiverName, String requestStatus, String returnWay, String phone){
		this.bookRecordID = bookRecordID;
		this.userName = userName;
		this.city = city;
		this.province = province;
		this.address = address;
		this.receiverName = receiverName;
		this.requestStatus = requestStatus;
		this.returnWay = returnWay;
		this.phone = phone;
	}
	
	public int getRequestID(){
		return requestID;
	}
	
	public void setRequestID(int requestID){
		this.requestID = requestID;
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
	
	public String getCity(){
		return city;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public String getProvince(){
		return province;
	}
	
	public void setProvince(String province){
		this.province = province;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public String getReceiverName(){
		return receiverName;
	}
	
	public void setReceiverName(String receiverName){
		this.receiverName = receiverName;
	}
	
	public String getRequestStatus(){
		return requestStatus;
	}
	
	public void setRequestStatus(String requestStatus){
		this.requestStatus = requestStatus;
	}
	
	public String getReturnWay(){
		return returnWay;
	}
	
	public void setReturnWay(String returnWay){
		this.returnWay = returnWay;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
}
