package action;

import service.AppService;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.Book;
import model.BookIN;
import net.sf.json.JSONObject;

public class BookINAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
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
	
	private AppService appService;
	
	
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
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	public String updateBookIN() throws Exception{
		BookIN bookIN = appService.getBookINByBookRecordID(bookRecordID);
		bookIN.setInStatus(inStatus);
		appService.updateBookIN(bookIN);
		List<BookIN> bookINs = appService.getAllBookINs();
		request().getSession().setAttribute("allBookINs", bookINs);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "update success";
	}
}
