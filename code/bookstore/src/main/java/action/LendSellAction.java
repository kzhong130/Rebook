package action;

import java.sql.Timestamp;
import java.util.Date;

import model.Book;
import model.BookIN;
import service.AppService;

public class LendSellAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private String ISBN;
	
	public void setISBN(String ISBN){
		this.ISBN=ISBN;
	}
	
	public String getISBN(String ISBN){
		return ISBN;
	}
	
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
	}
	
	public String searchBook() throws Exception{
		Book book = new Book();
		book = appService.readBookByISBN(ISBN);
		if (book.getISBN() == null){
			request().getSession().setAttribute("search", "fail");
			return "search fail";
		}
		request().setAttribute("book",book);
		return "search";
	}
	
	private String recency;
	
	public String getRecency(){
		return recency;
	}
	
	public void setRecency(String recency){
		this.recency=recency;
	}
	
	private int coinNumber;
	
	public void setCoinNumber(int coinNumber){
		this.coinNumber=coinNumber;
	}
	
	public int getCoinNumber(){
		return coinNumber;
	}
	
	private String ownerName;
	
	public String getOwnerName(){
		return ownerName;
	}
	
	public void setOwnerName(String ownerName){
		this.ownerName=ownerName;
	}
	
	private String sendWay;
	
	public void setSendWay(String sendWay){
		this.sendWay=sendWay;
	}
	
	public String getSendWay(){
		return sendWay;
	}
	
	private String city;
	
	public void setCity(String city){
		this.city=city;
	}
	
	public String getCity(){
		return city;
	}
	
	private Integer longestDuration;
	
	public Integer getLongestDuration(){
		return longestDuration;
	}
	
	public void setLongestDuration(Integer longestDuration){
		this.longestDuration=longestDuration;
	}
	
	private String ownerPhone;
	
	public String getOwnerPhone(){
		return ownerPhone;
	}
	
	public void setOwnerPhone(String ownerPhone){
		this.ownerPhone=ownerPhone;
	}

	private String ownerAddress;
	
	public String getOwnerAddress(){
		return ownerAddress;
	}
	
	public void setOwnerAddress(String ownerAddress){
		this.ownerAddress=ownerAddress;
	}
	
	private String note;
	
	public String getNote(){
		return note;
	}
	
	public void setNote(String note){
		this.note=note;
	}
	
	private String province;
	
	public String getProvince(){
		return province;
	}
	
	public void setProvince(String province){
		this.province=province;
	}
	
	public String sellInfo() throws Exception{
		BookIN bookIn=new BookIN();
		bookIn.setProvince(province);
		bookIn.setCity(city);
		bookIn.setRecency(recency);
		bookIn.setNote(note);
		bookIn.setOwnerName(ownerName);
		bookIn.setCoinNumber(coinNumber);
		bookIn.setOwnerPhone(ownerPhone);
		bookIn.setISBN(ISBN);
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		bookIn.setInTime(nousedate);
		bookIn.setSendWay(sendWay);
		bookIn.setType("sell");
		bookIn.setUserName((String) request().getSession().getAttribute("loginUserName"));
		bookIn.setInStatus("yes");
		appService.addBookIN(bookIn);
		return "sell";
	}
	
	public String lendInfo() throws Exception{
		BookIN bookIn=new BookIN();
		bookIn.setProvince(province);
		bookIn.setCity(city);
		bookIn.setRecency(recency);
		bookIn.setNote(note);
		bookIn.setOwnerName(ownerName);
		bookIn.setCoinNumber(coinNumber);
		bookIn.setOwnerPhone(ownerPhone);
		bookIn.setISBN(ISBN);
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		bookIn.setInTime(nousedate);
		bookIn.setSendWay(sendWay);
		bookIn.setType("lend");
		bookIn.setUserName((String) request().getSession().getAttribute("loginUserName"));
		bookIn.setLongestDuration(longestDuration);
		bookIn.setOwnerAddress(ownerAddress);
		bookIn.setInStatus("yes");
		appService.addBookIN(bookIn);
		return "lend";
	}
}

