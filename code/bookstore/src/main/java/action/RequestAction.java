package action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;


import model.Book;
import model.BookIN;
import model.CoinChangeRecord;
import model.RequestBook;
import model.User;
import net.sf.json.JSONObject;
import service.AppService;

public class RequestAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
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
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
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
	
	public String getProcessedRequest() throws Exception{
		userName=(String) request().getSession().getAttribute("loginUserName");
		List<RequestBook> requestBookList=appService.getProcessRequest(userName);
		request().setAttribute("requestBookList", requestBookList);
		List<BookIN> bookInList=null;
		List<Book> bookList=null;
		for(int i=0;i<requestBookList.size();i++){
			BookIN bookIN=appService.getBookINByBookRecordID(requestBookList.get(i).getRequestID());
			Book book=appService.getBookByISBN(bookIN.getISBN());
			bookInList.add(bookIN);
			bookList.add(book);
		}
		request().setAttribute("bookList", bookList);
		request().setAttribute("bookInList", bookInList);
		return "process";
	}
	
	public String addRequestBook() throws Exception{
		RequestBook requestBook = new RequestBook(bookRecordID,userName,city, province, address, receiverName,  requestStatus,  returnWay,  phone);
		appService.addRequestBook(requestBook);
		BookIN bookIN = appService.getBookINByBookRecordID(bookRecordID);
		User user = appService.getUserByUserName(userName);
		int oldBookCoin = user.getBookCoin();
		user.setBookCoin(oldBookCoin - bookIN.getCoinNumber());
		appService.updateUser(user);
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		
		if (returnWay == null){	//购书申请
			
			CoinChangeRecord coinChangeRecord = new CoinChangeRecord(userName,bookIN.getCoinNumber()*-1,nousedate,"buy");
			appService.addCoinChangeRecord(coinChangeRecord);
		}
		if (returnWay != null){	//借书申请
			CoinChangeRecord coinChangeRecord = new CoinChangeRecord(userName,bookIN.getCoinNumber()*-1,nousedate,"lendin");
			appService.addCoinChangeRecord(coinChangeRecord);
		}
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "add success";
	}
	
	public String updateRequestBook() throws Exception{
		RequestBook requestBook = appService.getRequestBookByRequestID(requestID);
		requestBook.setRequestStatus(requestStatus);
		appService.updateRequestBook(requestBook);
		List<RequestBook> requestBooks = appService.getAllRequestBooks();
		request().getSession().setAttribute("allRequestBooks", requestBooks);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		
		return "update success";
	}
	
	
	
}
