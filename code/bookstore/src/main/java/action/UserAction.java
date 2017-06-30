package action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import model.User;
import service.AppService;

public class UserAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
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
	
	public void setAppService(AppService appService){
		this.appService = appService;
	}
	
	public String allUsers() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String role = (String)session.getAttribute("role");
		int userid = (Integer)session.getAttribute("userid");
		List<User> users = new ArrayList<User>();
		if ("admin".equals(role)){
			users = appService.getAllUsers();
			request().setAttribute("users", users);
		}
		if ("user".equals(role)){
			User user = appService.getUserByUserID(userid);
			users.add(user);
			request().setAttribute("users",users);
		}
		
		
		return SUCCESS;
	}
	
	public String addUser() throws Exception{
		User user = new User(userName,password,realName,sex,phone,email,address,registerDate,validationProblem,validationAnswer,credit,bookCoin);
		appService.addUser(user);
		
		return SUCCESS;
	}
	
	public String deleteUser() throws Exception{
		User user = appService.getUserByUserID(userID);
		appService.deleteUser(user);
		
		return SUCCESS;
	}
	
	public String updateUser() throws Exception{
		User user = appService.getUserByUserID(userID);
		user.setUserName(userName);
		user.setPassword(password);
		user.setRealName(realName);
		user.setSex(sex);
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setRegisterDate(registerDate);
		user.setValidationProblem(validationProblem);
		user.setValidationAnswer(validationAnswer);
		user.setCredit(credit);
		user.setBookCoin(bookCoin);
		appService.updateUser(user);
		
		return SUCCESS;
	}
	
	public String userLogin() throws Exception{
		User user = appService.getUserByUserName(userName);
		if (user==null) return "login fail";
		if (user.getPassword().equals(password)) {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("username",userName);
			session.setAttribute("userid", user.getUserID());
			//session.setAttribute("role", user.getRole());
			return "login success";
		}
		else return "login fail";
	}
	
	public String userLogout() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.removeAttribute("userid");
		session.removeAttribute("role");
		return "logout success";
	}
}
