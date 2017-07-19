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
import model.CoinChangeRecord;
import model.RequestBook;
import model.User;
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
	private String town;
	
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
	
	public String getTown(){
		return town;
	}
	
	public void setTown(String town){
		this.town = town;
	}
	
	public String updateBookIN() throws Exception{	//管理员update
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
	
	public String update() throws Exception{	//用户update
		String userName = (String)request().getSession().getAttribute("loginUserName");
		if (inStatus.equals("yes")){	//不用取消RequestBook
			
			BookIN bookIN = appService.getBookINByBookRecordID(bookRecordID);
			bookIN.setProvince(province);
			bookIN.setCity(city);
			bookIN.setTown(town);
			bookIN.setOwnerName(ownerName);
			bookIN.setOwnerPhone(ownerPhone);
			bookIN.setLongestDuration(longestDuration);
			bookIN.setNote(note);
			bookIN.setOwnerAddress(ownerAddress);
			bookIN.setSendWay(sendWay);
			bookIN.setRecency(recency);
			bookIN.setInStatus(inStatus);
			appService.updateBookIN(bookIN);
			
		
		}
		if (inStatus.equals("no")){	//需要取消相关的requestBook
			
			BookIN bookIN = appService.getBookINByBookRecordID(bookRecordID);
			bookIN.setProvince(province);
			bookIN.setCity(city);
			bookIN.setTown(town);
			bookIN.setOwnerName(ownerName);
			bookIN.setOwnerPhone(ownerPhone);
			bookIN.setLongestDuration(longestDuration);
			bookIN.setNote(note);
			bookIN.setOwnerAddress(ownerAddress);
			bookIN.setSendWay(sendWay);
			bookIN.setRecency(recency);
			bookIN.setInStatus(inStatus);
			appService.updateBookIN(bookIN);
			List<RequestBook> requestBooks = appService.getAllRequestBooks();
			List<RequestBook> myRequestBooks = new ArrayList<RequestBook>();
			if (requestBooks.size() > 0){
				for (int i=0; i<requestBooks.size(); i++){
					if (requestBooks.get(i).getBookRecordID() == bookRecordID && requestBooks.get(i).getRequestStatus().equals("waiting")){
						myRequestBooks.add(requestBooks.get(i));
					}
				}
			}
			if (myRequestBooks.size() > 0){
				for (int i=0; i<myRequestBooks.size(); i++){
					int coinNumber = bookIN.getCoinNumber();
					User user = appService.getUserByUserName(myRequestBooks.get(i).getUserName());
					int oldBookCoin = user.getBookCoin();
					user.setBookCoin(oldBookCoin + coinNumber);
					appService.updateUser(user);
					CoinChangeRecord coinChangeRecord = new CoinChangeRecord();
					coinChangeRecord.setUserName(myRequestBooks.get(i).getUserName());
					coinChangeRecord.setNumber(coinNumber);
					coinChangeRecord.setReason("return");
					Date date = new Date();       
					Timestamp nousedate = new Timestamp(date.getTime());
					coinChangeRecord.setTime(nousedate);
					appService.addCoinChangeRecord(coinChangeRecord);
					RequestBook requestBook = myRequestBooks.get(i);
					requestBook.setRequestStatus("reject");
					appService.updateRequestBook(requestBook);
				}
			}
		}
		
		/*刷新数据*/
		List<BookIN> bookINs = appService.getBookINByUserName(userName);
		List<BookIN> lendBookINs = new ArrayList<BookIN>();
		List<BookIN> sellBookINs = new ArrayList<BookIN>();
		if (bookINs.size() > 0){
			for (int i=0; i<bookINs.size(); i++){
				if ("sell".equals(bookINs.get(i).getType())){
					sellBookINs.add(bookINs.get(i));
				}
				if ("lend".equals(bookINs.get(i).getType())){
					lendBookINs.add(bookINs.get(i));
				}
			}
		}
		List<Book> booksByLendBookINs = new ArrayList<Book>();
		List<Book> booksBySellBookINs = new ArrayList<Book>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				Book book = appService.getBookByISBN(lendBookINs.get(i).getISBN());
				booksByLendBookINs.add(book);
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				Book book = appService.getBookByISBN(sellBookINs.get(i).getISBN());
				booksBySellBookINs.add(book);
			}
		}
		List<RequestBook> allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> requestBooksByLendBookINs = new ArrayList<RequestBook>();
		List<RequestBook> requestBooksBySellBookINs = new ArrayList<RequestBook>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				int bookRecordID = lendBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksByLendBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				int bookRecordID = sellBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksBySellBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		request().getSession().setAttribute("lendBookINs", lendBookINs);
		request().getSession().setAttribute("sellBookINs", sellBookINs);
		request().getSession().setAttribute("booksByLendBookINs", booksByLendBookINs);
		request().getSession().setAttribute("booksBySellBookINs", booksBySellBookINs);
		request().getSession().setAttribute("requestBooksBySellBookINs", requestBooksBySellBookINs);
		request().getSession().setAttribute("requestBooksByLendBookINs", requestBooksByLendBookINs);
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		return SUCCESS;
	}
	
	public String deleteBookIN() throws Exception{
		BookIN bookIN = appService.getBookINByBookRecordID(bookRecordID);
		bookIN.setInStatus("delete");
		appService.updateBookIN(bookIN);
		/*拒绝其他等待中的请求*/
		List<RequestBook> allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> myRequestBook = new ArrayList<RequestBook>();
		if (allRequestBooks.size() > 0){
			for (int i=0; i<allRequestBooks.size(); i++){
				if (allRequestBooks.get(i).getBookRecordID() == bookIN.getBookRecordID() && allRequestBooks.get(i).getRequestStatus().equals("waiting")){
					myRequestBook.add(allRequestBooks.get(i));
				}
			}
			if (myRequestBook.size() > 0){
				for (int i=0; i<myRequestBook.size(); i++){
					myRequestBook.get(i).setRequestStatus("reject");
					appService.updateRequestBook(myRequestBook.get(i));
					User user = appService.getUserByUserName(myRequestBook.get(i).getUserName());
					int oldCoinNum = user.getBookCoin();
					user.setBookCoin(oldCoinNum + bookIN.getCoinNumber());
					appService.updateUser(user);
					CoinChangeRecord coinChangeRecord = new CoinChangeRecord();
					coinChangeRecord.setNumber(bookIN.getCoinNumber());
					coinChangeRecord.setReason("return");
					Date date = new Date();       
					Timestamp nousedate = new Timestamp(date.getTime());
					coinChangeRecord.setTime(nousedate);
					coinChangeRecord.setUserName(myRequestBook.get(i).getUserName());
					appService.addCoinChangeRecord(coinChangeRecord);
				}
			}
		}
		
		/*刷新数据*/
		List<BookIN> bookINs = appService.getBookINByUserName(userName);
		List<BookIN> lendBookINs = new ArrayList<BookIN>();
		List<BookIN> sellBookINs = new ArrayList<BookIN>();
		if (bookINs.size() > 0){
			for (int i=0; i<bookINs.size(); i++){
				if ("sell".equals(bookINs.get(i).getType())){
					sellBookINs.add(bookINs.get(i));
				}
				if ("lend".equals(bookINs.get(i).getType())){
					lendBookINs.add(bookINs.get(i));
				}
			}
		}
		List<Book> booksByLendBookINs = new ArrayList<Book>();
		List<Book> booksBySellBookINs = new ArrayList<Book>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				Book book = appService.getBookByISBN(lendBookINs.get(i).getISBN());
				booksByLendBookINs.add(book);
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				Book book = appService.getBookByISBN(sellBookINs.get(i).getISBN());
				booksBySellBookINs.add(book);
			}
		}
		allRequestBooks = appService.getAllRequestBooks();
		List<RequestBook> requestBooksByLendBookINs = new ArrayList<RequestBook>();
		List<RequestBook> requestBooksBySellBookINs = new ArrayList<RequestBook>();
		if (lendBookINs.size() > 0){
			for (int i=0; i<lendBookINs.size(); i++){
				int bookRecordID = lendBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksByLendBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				int bookRecordID = sellBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID && allRequestBooks.get(j).getRequestStatus().equals("waiting")){
						requestBooksBySellBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		request().getSession().setAttribute("lendBookINs", lendBookINs);
		request().getSession().setAttribute("sellBookINs", sellBookINs);
		request().getSession().setAttribute("booksByLendBookINs", booksByLendBookINs);
		request().getSession().setAttribute("booksBySellBookINs", booksBySellBookINs);
		request().getSession().setAttribute("requestBooksBySellBookINs", requestBooksBySellBookINs);
		request().getSession().setAttribute("requestBooksByLendBookINs", requestBooksByLendBookINs);
		
		/*传输数据回前台*/
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str=obj.toString();
		out.write(str);
		out.close();
		return SUCCESS;
		
	}
}
