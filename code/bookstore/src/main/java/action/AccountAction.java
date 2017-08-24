package action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import model.Admin;
import model.Book;
import model.BookComment;
import model.BookIN;
import model.User;
import model.CreditChangeRecord;
import model.CoinChangeRecord;
import net.sf.json.JSONObject;
import service.AppService;


public class AccountAction extends BaseAction{
	
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
	private String prePage;
	
	

	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
	}
	
	
	
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
	
	public String getPrePage(){
		return prePage;
	}
	
	public void setPrePage(String prePage){
		this.prePage = prePage;
	}
	
	private String verification;
	
	public void setVerification(String verification){
		this.verification = verification;
	}
	
	public String getVerification(){
		return verification;
	}
	
	
	public String register() throws Exception{
		System.out.println("aaa");
		System.out.println(verification);
		String temp = (String) request().getSession().getAttribute("verification");
		System.out.println(temp);
		//System.out.println(verification);
		if(temp == null || !temp.equals(verification)) {
			JSONObject obj = new JSONObject(); 
			obj.put("success",false);
			return "success";
		}
		
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		User user=new User(userName,password,realName,sex,phone,email,address,nousedate,validationProblem,validationAnswer,50,50,province,city,area,town);
		int result=appService.addUser(user);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject(); 
			
		System.out.println(result);
		if(result>=0){
			obj.put("success",true);
		}
		else {
			obj.put("success",false);	
		}
		String str = obj.toString();  
        System.out.println(str);
		out.write(str);
		out.close();
		System.out.println("reach");
		return "success";
		
		
	}
	
	
	public String login() throws Exception{
		User user = appService.getUserByUserName(userName);
		if (user == null){	//是管理员
			Admin admin = appService.getAdminByAdminName(userName);
			if (admin == null){		//根据名字查不到此人是用户或管理员
				request().getSession().setAttribute("login","nobody");
				return "login fail";
			}
			if (admin.getPassword().equals(password)){		//管理员密码正确
				request().getSession().setAttribute("loginUserName", userName);
				request().getSession().removeAttribute("login");
				request().getSession().setAttribute("admin", "admin");
				return "adminlogin success";
			}	
			else{		//管理员密码错误
				request().getSession().setAttribute("login", "error");
				return "login fail";
			}
		}
		//非管理员
		else{
			if (user.getPassword().equals(password)){		//用户密码正确
				request().getSession().setAttribute("loginUserName", userName);
				request().getSession().setAttribute("loginUserBookCoin",user.getBookCoin());
				request().getSession().removeAttribute("login");
				return "userlogin success";
			}
			else{		//用户密码错误
				request().getSession().setAttribute("login", "error");
				return "login fail";
			}
		}
		
		
	}
	
	public String logout() throws Exception{
		if (request().getSession().getAttribute("admin") == null){
			request().getSession().removeAttribute("loginUserName");
			request().getSession().removeAttribute("loginUserBookCoin");
			return "logout success";
		}
		else{
			request().getSession().removeAttribute("loginUserName");
			request().getSession().removeAttribute("admin");
			return "admin logout success";
		}
		
		
	}
	
	public String resetPassword() throws Exception{
		User user = appService.getUserByUserID(userID);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		user.setPassword("111111");
		appService.updateUser(user);
		obj.put("success", true);
		String str = obj.toString();
		out.write(str);
		out.close();
		
		return "reset success";
	}
	
	public String deleteAccount() throws Exception{
		User user = appService.getUserByUserID(userID);
		appService.deleteUser(user);
		List<User> users = appService.getAllUsers();
		request().getSession().setAttribute("allUsers",users);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str = obj.toString();
		out.write(str);
		out.close();
		
		return "delete success";
	}
	
	public String updateAccount() throws Exception{
		User user = appService.getUserByUserID(userID);
		int oldcredit = user.getCredit();
		int oldbookcoin = user.getBookCoin();
		String userName = user.getUserName();
		user.setCredit(credit);
		user.setBookCoin(bookCoin);
		appService.updateUser(user);
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		if (oldcredit != credit){
			CreditChangeRecord creditChangeRecord = new CreditChangeRecord(userName,credit-oldcredit,nousedate,"other");
			appService.addCreditChangeRecord(creditChangeRecord);
		}
		if (oldbookcoin != bookCoin){
			CoinChangeRecord coinChangeRecord = new CoinChangeRecord(userName,bookCoin-oldbookcoin,nousedate,"other");
			appService.addCoinChangeRecord(coinChangeRecord);
		}
		List<User> users = appService.getAllUsers();
		request().getSession().setAttribute("allUsers",users);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		String str = obj.toString();
		out.write(str);
		out.close();
		
		return "update success";
	}
	
	public String checkUserName() throws Exception{
		User user=appService.getUserByUserName(userName);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject();
		if(user==null) {
			obj.put("success", true);
		}
		else{
			obj.put("success", false);
		}
		String str = obj.toString();
		out.write(str);
		out.close();
		
		return SUCCESS;
	}
	
}
