package action;

import service.AppService;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.Book;
import model.BookComment;
import model.User;
import model.CoinChangeRecord;
import model.CreditChangeRecord;

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
		
		return "initialize success";
	}
	

}
