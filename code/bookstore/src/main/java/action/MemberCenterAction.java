package action;

import service.AppService;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.Book;
import model.BookComment;
import model.BookIN;
import model.User;
import net.sf.json.JSONObject;
import model.CoinChangeRecord;
import model.CreditChangeRecord;
import model.RequestBook;

public class MemberCenterAction extends BaseAction{
	private int userID;
	private String userName;
	private String password;
	private String realName;
	private String sex;
	private String phone;
	private String email;
	private String address;
	private Timestamp registerDate;
	private String validationProblem;
	private String validationAnswer;
	private int credit;
	private int bookCoin;
	private String province;
	private String city;
	private String area;
	private String town;
	private String oldpassword;
	
	public void setOldpassword(String oldpassword){
		this.oldpassword=oldpassword;
	}
	
	public String getOldpassword(){
		return oldpassword;
	}
	
	
	private AppService appService;
	
	public int getUserID(){
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID = userID;
	}
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getRealName(){
		return realName;
	}
	
	public void setRealName(String realName){
		this.realName = realName;
	}
	
	public String getSex(){
		return sex;
	}
	
	public void setSex(String sex){
		this.sex = sex;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public Timestamp getRegisterDate(){
		return registerDate;
	}
	
	public void setRegisterDate(Timestamp registerDate){
		this.registerDate = registerDate;
	}
	
	public String getValidationProblem(){
		return validationProblem;
	}
	
	public void setValidationProblem(String validationProblem){
		this.validationProblem = validationProblem;
	}
	
	public String getValidationAnswer(){
		return validationAnswer;
	}
	
	public void setValidationAnswer(String validationAnswer){
		this.validationAnswer = validationAnswer;
	}
	
	public int getCredit(){
		return credit;
	}
	
	public void setCredit(int credit){
		this.credit = credit;
	}
	
	public int getBookCoin(){
		return bookCoin;
	}
	
	public void setBookCoin(int bookCoin){
		this.bookCoin = bookCoin;
	}
	
	public String getProvince(){
		return province;
	}
	
	public void setProvince(String province){
		this.province = province;
	}
	
	public String getCity(){
		return city;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public String getArea(){
		return area;
	}
	
	public void setArea(String area){
		this.area = area;
	}
	
	public String getTown(){
		return town;
	}
	
	public void setTown(String town){
		this.town = town;
	}
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	public String initialize() throws Exception{
		
		String userName = (String)request().getSession().getAttribute("loginUserName");
		User user = appService.getUserByUserName(userName);
		request().getSession().setAttribute("user", user);
		
		List<CreditChangeRecord> creditChangeRecords = appService.getCreditChangeRecordByUserName(userName);
		request().getSession().setAttribute("creditChangeRecord", creditChangeRecords);
		
		List<CoinChangeRecord> coinChangeRecords = appService.getCoinChangeRecordByUserName(userName);
		request().getSession().setAttribute("coinChangeRecord", coinChangeRecords);
		
		List<BookComment> bookComments = appService.getBookCommentsByUserName(userName);
		request().getSession().setAttribute("bookComment", bookComments);
		
		List<Book> books = appService.getBookByBookComment(bookComments);
		request().getSession().setAttribute("bookByBookComment", books);
		
		List<RequestBook> requestBookList=appService.getProcessRequest(userName);
		request().getSession().setAttribute("requestBookList", requestBookList);
		List<BookIN> bookInList=new ArrayList<BookIN>();
		List<Book> bookList=new ArrayList<Book>();
		for(int i=0;i<requestBookList.size();i++){
			BookIN bookIN=appService.getBookINByBookRecordID(requestBookList.get(i).getBookRecordID());
			Book book=appService.getBookByISBN(bookIN.getISBN());
			bookInList.add(bookIN);
			bookList.add(book);
		}
		List<RequestBook> UnrequestBookList=appService.getUnprocessRequest(userName);
		request().getSession().setAttribute("UnrequestBookList", UnrequestBookList);
		List<BookIN> UnbookInList=new ArrayList<BookIN>();
		List<Book> UnbookList=new ArrayList<Book>();
		for(int i=0;i<UnrequestBookList.size();i++){
			BookIN bookIN=appService.getBookINByBookRecordID(UnrequestBookList.get(i).getBookRecordID());
			Book book=appService.getBookByISBN(bookIN.getISBN());
			UnbookInList.add(bookIN);
			UnbookList.add(book);
		}
		request().getSession().setAttribute("bookList", bookList);
		request().getSession().setAttribute("bookInList", bookInList);
		request().getSession().setAttribute("UnbookList", UnbookList);
		request().getSession().setAttribute("UnbookInList", UnbookInList);
		
		/*
		 * 我的书架部分
		 */
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
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID){
						requestBooksByLendBookINs.add(allRequestBooks.get(j));
					}
				}
			}
		}
		if (sellBookINs.size() > 0){
			for (int i=0; i<sellBookINs.size(); i++){
				int bookRecordID = lendBookINs.get(i).getBookRecordID();
				for (int j=0; j<allRequestBooks.size(); j++){
					if (allRequestBooks.get(j).getBookRecordID() == bookRecordID){
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
		
		return "initialize success";
	}
	
	public String changePassword() throws Exception{
		User user=(User) request().getSession().getAttribute("user");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject(); 
		System.out.println(2333);
		if(!oldpassword.equals(user.getPassword())){
			obj.put("success",false); 
		}
		else{
			user.setPassword(password);
			appService.updateUser(user);
			obj.put("success", true);

		}
		String str=obj.toString();
		System.out.println(str);
		out.write(str);
		out.close();
		
		return "success";
	}
	
	public String update() throws Exception{
		User user=(User) request().getSession().getAttribute("user");
		user.setAddress(address);
		user.setPhone(phone);
		user.setProvince(province);
		user.setCity(city);
		user.setArea(area);
		user.setRealName(realName);
		user.setTown(town);
		user.setEmail(email);
		appService.updateUser(user);
		return "success";
	}
	
}
